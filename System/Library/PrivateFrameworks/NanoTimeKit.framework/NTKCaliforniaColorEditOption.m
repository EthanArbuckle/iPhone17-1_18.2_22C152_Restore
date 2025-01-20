@interface NTKCaliforniaColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_curatedColorValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesRestrictedByDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColor:(unint64_t)a3;
+ (id)pigmentFaceDomain;
- (BOOL)isPrideOption;
- (BOOL)optionExistsInDevice:(id)a3;
- (id)_valueToFaceBundleStringDict;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKCaliforniaColorEditOption

- (int64_t)swatchStyle
{
  return 0;
}

- (BOOL)isPrideOption
{
  return [(NTKCaliforniaColorEditOption *)self californiaColor] == 3009;
}

- (BOOL)optionExistsInDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v5] && !NTKGizmoOrCompanionAreRussian(v4))
  {
  }
  else
  {
    unint64_t v6 = [(NTKCaliforniaColorEditOption *)self californiaColor];

    if (v6 == 3009) {
      goto LABEL_21;
    }
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  if ([v4 supportsCapability:v7])
  {
  }
  else
  {
    if (_NTKNewToHunterCaliforniaColors_onceToken != -1) {
      dispatch_once(&_NTKNewToHunterCaliforniaColors_onceToken, &__block_literal_global_1915);
    }
    id v8 = (id)_NTKNewToHunterCaliforniaColors_colors;
    char v9 = objc_msgSend(v8, "containsIndex:", -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor"));

    if (v9) {
      goto LABEL_21;
    }
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) == 0
    && ([v4 collectionType] != 9
     && [(NTKCaliforniaColorEditOption *)self californiaColor] == 3005
     || [v4 collectionType] != 10
     && [(NTKCaliforniaColorEditOption *)self californiaColor] == 3006
     || [v4 collectionType] != 7
     && [(NTKCaliforniaColorEditOption *)self californiaColor] == 3007
     || [v4 collectionType] != 8
     && [(NTKCaliforniaColorEditOption *)self californiaColor] == 3008))
  {
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_22;
  }
  BOOL v10 = 1;
LABEL_22:

  return v10;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1756);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1757);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  unint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1757);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1757, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1758 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_1755;
    _orderedValuesForDevice____colors_1755 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1758;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1756);
  id v13 = (id)_orderedValuesForDevice____colors_1755;

  return v13;
}

void __56__NTKCaliforniaColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_1755;
  _orderedValuesForDevice____colors_1755 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  unint64_t v6 = [a1 _orderedValuesRestrictedByDevice:v4];
  [v5 addObjectsFromArray:v6];

  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || [v4 collectionType] == 10
    || NTKShowHardwareSpecificFaces())
  {
    [v5 addObject:&unk_1F16E3E70];
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || [v4 collectionType] == 9
    || NTKShowHardwareSpecificFaces())
  {
    [v5 addObject:&unk_1F16E3E88];
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || [v4 collectionType] == 7
    || NTKShowHardwareSpecificFaces())
  {
    [v5 addObject:&unk_1F16E3E58];
  }
  if ((NTKDeviceSupportsFaceColorMappingAndDistinctFaceColorValues(v4) & 1) != 0
    || [v4 collectionType] == 8
    || NTKShowHardwareSpecificFaces())
  {
    [v5 addObject:&unk_1F16E3E40];
  }
  id v7 = [a1 _curatedColorValuesForDevice:v4];
  [v5 addObjectsFromArray:v7];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"D0D02931-2190-4E71-B843-C73C4ADB3F27"];
  if ([v4 supportsCapability:v8])
  {
    char v9 = NTKGizmoOrCompanionAreRussian(v4);

    if ((v9 & 1) == 0) {
      [v5 addObject:&unk_1F16E3E28];
    }
  }
  else
  {
  }
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaColorEditOption;
  id v10 = objc_msgSendSuper2(&v13, sel___orderedValuesForDevice_, v4);
  uint64_t v11 = (void *)[v10 mutableCopy];

  [v11 removeObjectsInArray:v5];
  [v11 removeObject:&unk_1F16E3918];
  [v11 removeObject:&unk_1F16E3C18];
  [v5 addObjectsFromArray:v11];

  return v5;
}

+ (id)_curatedColorValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_curatedColorValuesForDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_curatedColorValuesForDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&_curatedColorValuesForDevice____cachedDevice);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&_curatedColorValuesForDevice____cachedDevice, v3);
    _curatedColorValuesForDevice____previousCLKDeviceVersion = [v3 version];

    __61__NTKCaliforniaColorEditOption__curatedColorValuesForDevice___block_invoke(v10, v3);
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = _curatedColorValuesForDevice____previousCLKDeviceVersion;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_curatedColorValuesForDevice____lock);
  id v11 = (id)_curatedColorValuesForDevice____colors;

  return v11;
}

void __61__NTKCaliforniaColorEditOption__curatedColorValuesForDevice___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:@"AE03A48B-6794-4978-96CC-425A7F6443DA"];
  int v5 = [v3 supportsCapability:v4];

  id v6 = &unk_1F16EA510;
  if (v5)
  {
    id v6 = [&unk_1F16EA510 arrayByAddingObjectsFromArray:&unk_1F16EA528];
  }
  uint64_t v7 = (void *)_curatedColorValuesForDevice____colors;
  _curatedColorValuesForDevice____colors = (uint64_t)v6;
}

+ (id)_orderedValuesRestrictedByDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1769);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1770);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesRestrictedByDevice____cachedDevice_1770);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesRestrictedByDevice____cachedDevice_1770, v4);
    _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1771 = [v4 version];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke;
    v13[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
    v13[4] = a1;
    __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke((uint64_t)v13, (uint64_t)v4);
    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesRestrictedByDevice____previousCLKDeviceVersion_1771;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesRestrictedByDevice____lock_1769);
  id v11 = (id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1768;

  return v11;
}

uint64_t __65__NTKCaliforniaColorEditOption__orderedValuesRestrictedByDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaColorEditOption;
  uint64_t v2 = objc_msgSendSuper2(&v6, sel__orderedValuesRestrictedByDevice_, a2);
  uint64_t v3 = [v2 mutableCopy];
  id v4 = (void *)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1768;
  _orderedValuesRestrictedByDevice__hardwareSpecificValues_1768 = v3;

  [(id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1768 removeObject:&unk_1F16E33D8];
  return [(id)_orderedValuesRestrictedByDevice__hardwareSpecificValues_1768 removeObject:&unk_1F16E3408];
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (a3 - 3000 >= 0xF)
  {
    objc_super v6 = +[NTKFaceColorEditOption _snapshotKeyForValue:a3 forDevice:v5];
  }
  else
  {
    objc_super v6 = off_1E62C7F50[a3 - 3000];
  }

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NTKCaliforniaColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1813 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1813, block);
  }
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1812;
}

void __60__NTKCaliforniaColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  void v13[5] = *MEMORY[0x1E4F143B8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)NTKCaliforniaColorEditOption;
  v1 = objc_msgSendSuper2(&v7, sel__valueToFaceBundleStringDict);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v12[0] = &unk_1F16E3EA0;
  v12[1] = &unk_1F16E3EE8;
  v13[0] = @"style 1";
  v13[1] = @"style 2";
  v12[2] = &unk_1F16E3EB8;
  v12[3] = &unk_1F16E3D08;
  v13[2] = @"style 3";
  v13[3] = @"style 4";
  v12[4] = &unk_1F16E3ED0;
  v13[4] = @"style 5";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];
  [v2 addEntriesFromDictionary:v3];

  v10[0] = &unk_1F16E3E88;
  v10[1] = &unk_1F16E3E70;
  v11[0] = @"style 6";
  v11[1] = @"style 7";
  v10[2] = &unk_1F16E3E58;
  v10[3] = &unk_1F16E3E40;
  v11[2] = @"style 8";
  v11[3] = @"style 9";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];
  [v2 addEntriesFromDictionary:v4];

  [v2 setObject:@"style 10" forKey:&unk_1F16E3E28];
  v8[0] = &unk_1F16E3E10;
  v8[1] = &unk_1F16E3DF8;
  v9[0] = @"style 11";
  v9[1] = @"style 12";
  v8[2] = &unk_1F16E3DE0;
  v8[3] = &unk_1F16E3DC8;
  v9[2] = @"style 13";
  v9[3] = @"style 14";
  v8[4] = &unk_1F16E3DB0;
  v9[4] = @"style 15";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  [v2 addEntriesFromDictionary:v5];

  objc_super v6 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1812;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1812 = (uint64_t)v2;
}

+ (id)colorNameForColor:(unint64_t)a3
{
  if (a3 - 3000 > 0xE) {
    return 0;
  }
  else {
    return off_1E62C7FC8[a3 - 3000];
  }
}

+ (id)pigmentFaceDomain
{
  return @"california";
}

- (id)pigmentEditOption
{
  objc_msgSend((id)objc_opt_class(), "colorNameForColor:", -[NTKCaliforniaColorEditOption californiaColor](self, "californiaColor"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = @"evergreen";
  if ([(NTKCaliforniaColorEditOption *)self californiaColor] == 3009)
  {
    id v5 = +[NTKPigmentEditOption pigmentNamed:@"special.rainbow"];
  }
  else
  {
    if (!v3)
    {
      uint64_t v9 = v4;
      id v10 = 0;
      NTKFaceColorNameAndCollection([(NTKCaliforniaColorEditOption *)self californiaColor], &v10, &v9);
      id v3 = v10;
      objc_super v6 = v9;

      id v4 = v6;
    }
    id v5 = [[NTKPigmentEditOption alloc] initWithOptionName:v3 collectionName:v4];
  }
  objc_super v7 = v5;

  return v7;
}

@end