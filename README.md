# docker-android-sdk-tools

This [repository](https://github.com/paldom/docker-android-sdk-tools) contains the Dockerfile of the [paldom/docker-android-sdk-tools](https://hub.docker.com/r/dpal/docker-android-sdk-tools/) image. Dockerfile is an extension of [bitriseio/docker-android-alpha:latest](https://hub.docker.com/r/bitriseio/docker-android-alpha/) with the following tools:

 * python 2.7 environment for  ```systrace```
 * ```avd``` system images and predefined emulator (named ```testdevice```)

## Usage

### Pull image

**From Docker Hub:**

```sh
docker pull dpal/docker-android-sdk-tools:latest
```

**Or build from GitHub:**

```sh
docker build -t dpal/docker-android-sdk-tools github.com/paldom/docker-android-sdk-tools
```

### Run docker image

Run docker image with docker-composer:

```sh
docker-compose run --rm app bash
```

This command will also bind your current working directory into ```/var/android```.

### Android SDK tools

This is a short guide how to use android tools.

### Emulator

Here's an example how to run emulator inside container:

```sh
echo "no" | emulator64-arm -avd testdevice -noaudio -no-window -gpu off -verbose -qemu -usbdevice tablet
```

If you build with this image, don't forget to set sdk location in local.properties

```
sdk.dir=/opt/android-sdk-linux
```

### Build

Example how to build APK, build test APK and intall them on emulator:

```sh
./gradlew :app:assembleDebug :app:assembleDebugAndroidTest :app:installDebug :app:installDebugAndroidTest
```

### Performance test

Run systrace with the following command:

```sh
python $ANDROID_HOME/platform-tools/systrace/systrace.py --time=10 -o ./trace.html gfx view res
```

More about android automated performance tests: https://codelabs.developers.google.com/codelabs/android-perf-testing/index.html?index=..%2F..%2Findex#0
