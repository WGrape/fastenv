#!/bin/sh

# cd base dir of project.
# the process is in the same shell as the starting shell.
cd $SPARROW_BASE_PATH

# define this service.
service_name="nacos"

cd $service_name/
if ! docker build \
  --build-arg FROM_PLATFORM=${FROM_PLATFORM} \
  --build-arg IMAGE_OFFICIAL_NACOS_NAME=${IMAGE_OFFICIAL_NACOS_NAME} \
  --build-arg IMAGE_OFFICIAL_NACOS_VERSION=${IMAGE_OFFICIAL_NACOS_VERSION} \
  \
  -f ./make_basic_image/Dockerfile \
  -t sparrow-basic-$service_name:${IMAGE_BASIC_NACOS_VERSION} . ; then
    print_error "build image failed"
    exit 1
fi

cd ../
