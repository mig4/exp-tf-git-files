version: "2.1"

orbs:
  architect: ${architect_orb}

jobs:
  build:
    docker:
      - image: "${alpine_image_tag}"
    steps:
      - run:
          name: "The first step"
          command: "echo 'Hello WOrld'"
      %{~ for item in a_list ~}
      - run:
          name: "The ${item} step"
          command: "echo '- ${item}: ${a_map.k1}'"
      %{~ endfor ~}
