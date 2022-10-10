# Local Manifests #
Just grab the manifest and sync to get device sources
### LineageOS R ###

```bash

# Grab Local Manifest
# Lava
curl -o .repo/local_manifests/local_manifests.xml https://raw.githubusercontent.com/Arafattex/Local_manifest_mt6768/Lancelot/13.xml --create-dirs
# Merlin
curl -o .repo/local_manifests/local_manifests.xml https://raw.githubusercontent.com/Arafattex/Local_manifest_mt6768/Merlin/13.xml --create-dirs

# Sync
repo sync -j$(nproc --all) --force-sync
```
### LineageOS S ###

Required patches for IMS: https://gerrit.pixelexperience.org/q/topic:%22mediatek-ims%22+(status:open%20OR%20status:merged)

```bash

# Grab Local Manifest
curl -o .repo/local_manifests/local_manifests.xml https://raw.githubusercontent.com/Redmi-MT6768/local_manifests/master/twelve.xml --create-dirs

# Sync
repo sync -j$(nproc --all) --force-sync
```
