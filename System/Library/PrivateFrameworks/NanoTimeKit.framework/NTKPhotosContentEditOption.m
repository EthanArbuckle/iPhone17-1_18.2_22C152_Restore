@interface NTKPhotosContentEditOption
+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
@end

@implementation NTKPhotosContentEditOption

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1579);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1580);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1580);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1580, v3);
    _orderedValuesForDevice____previousCLKDeviceVersion_1581 = [v3 version];

    __54__NTKPhotosContentEditOption__orderedValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _orderedValuesForDevice____previousCLKDeviceVersion_1581;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1579);
  id v11 = (id)_orderedValuesForDevice__contents;

  return v11;
}

void __54__NTKPhotosContentEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 nrDeviceUUID];
  int HasPhotosFaceMemoryCapability = NTKPhotosDeviceHasPhotosFaceMemoryCapability((uint64_t)v2);

  v4 = &unk_1F16EA4C8;
  v5 = (void *)_orderedValuesForDevice__contents;
  if (HasPhotosFaceMemoryCapability) {
    v4 = &unk_1F16EA4B0;
  }
  _orderedValuesForDevice__contents = (uint64_t)v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7EF0[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E62C7F08[a3];
  }
}

+ (id)_localizedNameForActionForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 == 1)
  {
    id v6 = @"EDIT_OPTION_LABEL_PHOTOS_CUSTOM_ACTION_COMPANION";
    uint64_t v7 = @"Choose Photos…";
    goto LABEL_5;
  }
  if (!a3)
  {
    id v6 = @"EDIT_OPTION_LABEL_PHOTOS_SYNCED_ALBUM_ACTION_COMPANION";
    uint64_t v7 = @"Choose Album…";
LABEL_5:
    uint64_t v8 = NTKCompanionClockFaceLocalizedString(v6, v7);
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)_valueToFaceBundleStringDict
{
  if (_valueToFaceBundleStringDict_onceToken_1621 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1621, &__block_literal_global_1623);
  }
  v2 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1620;
  return v2;
}

void __58__NTKPhotosContentEditOption__valueToFaceBundleStringDict__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F16E3AF8;
  v2[1] = &unk_1F16E3498;
  v3[0] = @"synced";
  v3[1] = @"custom";
  v2[2] = &unk_1F16E39F0;
  v3[2] = @"memory";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1620;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1620 = v0;
}

@end