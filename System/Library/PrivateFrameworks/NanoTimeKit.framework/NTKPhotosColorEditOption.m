@interface NTKPhotosColorEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)originalColorName;
+ (id)pigmentFaceDomain;
- (id)_valueToFaceBundleStringDict;
- (id)pigmentEditOption;
@end

@implementation NTKPhotosColorEditOption

+ (id)pigmentFaceDomain
{
  return @"photos";
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1443);
  id WeakRetained = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1444);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&_orderedValuesForDevice____cachedDevice_1444);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&_orderedValuesForDevice____cachedDevice_1444, v4);
    _orderedValuesForDevice____previousCLKDeviceVersion_1445 = [v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)_orderedValuesForDevice____colors_1442;
    _orderedValuesForDevice____colors_1442 = v11;

    goto LABEL_6;
  }
  uint64_t v8 = [v4 version];
  uint64_t v9 = _orderedValuesForDevice____previousCLKDeviceVersion_1445;

  if (v8 != v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_orderedValuesForDevice____lock_1443);
  id v13 = (id)_orderedValuesForDevice____colors_1442;

  return v13;
}

void __52__NTKPhotosColorEditOption__orderedValuesForDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  v3 = (void *)_orderedValuesForDevice____colors_1442;
  _orderedValuesForDevice____colors_1442 = v2;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___NTKPhotosColorEditOption;
  v6 = objc_msgSendSuper2(&v13, sel___orderedValuesForDevice_, v4);
  [v5 addObjectsFromArray:v6];

  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___NTKPhotosColorEditOption;
  id v7 = objc_msgSendSuper2(&v12, sel__thirdPartyValues);
  [v5 removeObjectsInArray:v7];

  [v5 insertObject:&unk_1F16E3D08 atIndex:0];
  uint64_t v8 = [v5 count];
  while ((int)v8 >= 1)
  {
    uint64_t v9 = [v5 objectAtIndex:--v8];
    int v10 = [v9 isEqual:&unk_1F16E3918];

    if (v10) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_6:
  [v5 insertObject:&unk_1F16E3D20 atIndex:v8];
  [v5 insertObject:&unk_1F16E3D38 atIndex:v8];
  [v5 insertObject:&unk_1F16E3D50 atIndex:v8];
  [v5 insertObject:&unk_1F16E3D68 atIndex:v8];
  [v5 insertObject:&unk_1F16E3D80 atIndex:v8];
  [v5 insertObject:&unk_1F16E3D98 atIndex:v8];
  [v5 insertObject:&unk_1F16E3DB0 atIndex:v8];
  [v5 insertObject:&unk_1F16E3DC8 atIndex:v8];
  [v5 insertObject:&unk_1F16E3DE0 atIndex:v8];
  [v5 insertObject:&unk_1F16E3DF8 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E10 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E28 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E40 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E58 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E70 atIndex:v8];
  [v5 insertObject:&unk_1F16E3E88 atIndex:v8];
  [v5 insertObject:&unk_1F16E3EA0 atIndex:v8];
  [v5 insertObject:&unk_1F16E3EB8 atIndex:v8];
  [v5 insertObject:&unk_1F16E3ED0 atIndex:v8];
  [v5 insertObject:&unk_1F16E3EE8 atIndex:v8];

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  unint64_t v7 = a3 - 3000;
  uint64_t v8 = @"dual-tone-01";
  switch(v7)
  {
    case 0uLL:
      uint64_t v9 = [a1 originalColorName];
      goto LABEL_4;
    case 1uLL:
      break;
    case 2uLL:
      uint64_t v8 = @"dual-tone-02";
      break;
    case 3uLL:
      uint64_t v8 = @"dual-tone-03";
      break;
    case 4uLL:
      uint64_t v8 = @"dual-tone-04";
      break;
    case 5uLL:
      uint64_t v8 = @"dual-tone-05";
      break;
    case 6uLL:
      uint64_t v8 = @"dual-tone-06";
      break;
    case 7uLL:
      uint64_t v8 = @"dual-tone-07";
      break;
    case 8uLL:
      uint64_t v8 = @"dual-tone-08";
      break;
    case 9uLL:
      uint64_t v8 = @"dual-tone-09";
      break;
    case 0xAuLL:
      uint64_t v8 = @"dual-tone-10";
      break;
    case 0xBuLL:
      uint64_t v8 = @"dual-tone-11";
      break;
    case 0xCuLL:
      uint64_t v8 = @"dual-tone-12";
      break;
    case 0xDuLL:
      uint64_t v8 = @"dual-tone-13";
      break;
    case 0xEuLL:
      uint64_t v8 = @"dual-tone-14";
      break;
    case 0xFuLL:
      uint64_t v8 = @"dual-tone-15";
      break;
    case 0x10uLL:
      uint64_t v8 = @"dual-tone-16";
      break;
    case 0x11uLL:
      uint64_t v8 = @"dual-tone-17";
      break;
    case 0x12uLL:
      uint64_t v8 = @"dual-tone-18";
      break;
    case 0x13uLL:
      uint64_t v8 = @"dual-tone-19";
      break;
    case 0x14uLL:
      uint64_t v8 = @"dual-tone-20";
      break;
    default:
      uint64_t v9 = +[NTKFaceColorEditOption _snapshotKeyForValue:@"dual-tone-01" forDevice:v6];
LABEL_4:
      uint64_t v8 = (__CFString *)v9;
      break;
  }

  return v8;
}

- (id)_valueToFaceBundleStringDict
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NTKPhotosColorEditOption__valueToFaceBundleStringDict__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (_valueToFaceBundleStringDict_onceToken_1551 != -1) {
    dispatch_once(&_valueToFaceBundleStringDict_onceToken_1551, block);
  }
  return (id)_valueToFaceBundleStringDict_valueToFaceBundleString_1550;
}

void __56__NTKPhotosColorEditOption__valueToFaceBundleStringDict__block_invoke(uint64_t a1)
{
  v67[1] = *MEMORY[0x1E4F143B8];
  v25.receiver = *(id *)(a1 + 32);
  v25.super_class = (Class)NTKPhotosColorEditOption;
  v1 = objc_msgSendSuper2(&v25, sel__valueToFaceBundleStringDict);
  uint64_t v2 = (void *)[v1 mutableCopy];

  v66 = &unk_1F16E3D08;
  v67[0] = @"none";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:&v66 count:1];
  [v2 addEntriesFromDictionary:v3];

  v64 = &unk_1F16E3EE8;
  v65 = @"dual tone 1";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  [v2 addEntriesFromDictionary:v4];

  v62 = &unk_1F16E3ED0;
  v63 = @"dual tone 2";
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  [v2 addEntriesFromDictionary:v5];

  v60 = &unk_1F16E3EB8;
  v61 = @"dual tone 3";
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  [v2 addEntriesFromDictionary:v6];

  v58 = &unk_1F16E3EA0;
  v59 = @"dual tone 4";
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  [v2 addEntriesFromDictionary:v7];

  v56 = &unk_1F16E3E88;
  v57 = @"dual tone 5";
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  [v2 addEntriesFromDictionary:v8];

  v54 = &unk_1F16E3E70;
  v55 = @"dual tone 6";
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  [v2 addEntriesFromDictionary:v9];

  v52 = &unk_1F16E3E58;
  v53 = @"dual tone 7";
  int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  [v2 addEntriesFromDictionary:v10];

  v50 = &unk_1F16E3E40;
  v51 = @"dual tone 8";
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  [v2 addEntriesFromDictionary:v11];

  v48 = &unk_1F16E3E28;
  v49 = @"dual tone 9";
  objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  [v2 addEntriesFromDictionary:v12];

  v46 = &unk_1F16E3E10;
  v47 = @"dual tone 10";
  objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  [v2 addEntriesFromDictionary:v13];

  v44 = &unk_1F16E3DF8;
  v45 = @"dual tone 11";
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  [v2 addEntriesFromDictionary:v14];

  v42 = &unk_1F16E3DE0;
  v43 = @"dual tone 12";
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  [v2 addEntriesFromDictionary:v15];

  v40 = &unk_1F16E3DC8;
  v41 = @"dual tone 13";
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  [v2 addEntriesFromDictionary:v16];

  v38 = &unk_1F16E3DB0;
  v39 = @"dual tone 14";
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  [v2 addEntriesFromDictionary:v17];

  v36 = &unk_1F16E3D98;
  v37 = @"dual tone 15";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  [v2 addEntriesFromDictionary:v18];

  v34 = &unk_1F16E3D80;
  v35 = @"dual tone 16";
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  [v2 addEntriesFromDictionary:v19];

  v32 = &unk_1F16E3D68;
  v33 = @"dual tone 17";
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  [v2 addEntriesFromDictionary:v20];

  v30 = &unk_1F16E3D50;
  v31 = @"dual tone 18";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  [v2 addEntriesFromDictionary:v21];

  v28 = &unk_1F16E3D38;
  v29 = @"dual tone 19";
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v2 addEntriesFromDictionary:v22];

  v26 = &unk_1F16E3D20;
  v27 = @"dual tone 20";
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v2 addEntriesFromDictionary:v23];

  v24 = (void *)_valueToFaceBundleStringDict_valueToFaceBundleString_1550;
  _valueToFaceBundleStringDict_valueToFaceBundleString_1550 = (uint64_t)v2;
}

- (id)pigmentEditOption
{
  v3 = @"photos";
  if ([(NTKPhotosColorEditOption *)self color] == 3000)
  {
    uint64_t v4 = +[NTKPhotosColorEditOption originalColorName];
  }
  else
  {
    if ([(NTKPhotosColorEditOption *)self color] < 0xBB9)
    {
LABEL_6:
      unint64_t v7 = 0;
      goto LABEL_33;
    }
    switch([(NTKPhotosColorEditOption *)self color])
    {
      case 3001uLL:
        uint64_t v5 = 45;
        uint64_t v6 = 12;
        break;
      case 3002uLL:
        uint64_t v5 = 61;
        uint64_t v6 = 65;
        break;
      case 3003uLL:
        uint64_t v5 = 65;
        uint64_t v6 = 64;
        break;
      case 3004uLL:
        uint64_t v5 = 61;
        uint64_t v6 = 62;
        break;
      case 3005uLL:
        uint64_t v5 = 4;
        uint64_t v6 = 9;
        break;
      case 3006uLL:
        uint64_t v5 = 39;
        uint64_t v6 = 25;
        break;
      case 3007uLL:
        uint64_t v5 = 8;
        uint64_t v6 = 47;
        break;
      case 3008uLL:
        uint64_t v5 = 35;
        uint64_t v6 = 0;
        break;
      case 3009uLL:
        uint64_t v5 = 72;
        goto LABEL_17;
      case 3010uLL:
        uint64_t v5 = 3;
        uint64_t v6 = 70;
        break;
      case 3011uLL:
        uint64_t v5 = 8;
LABEL_17:
        uint64_t v6 = 73;
        break;
      case 3012uLL:
        uint64_t v5 = 5;
        uint64_t v6 = 69;
        break;
      case 3013uLL:
        uint64_t v5 = 78;
        uint64_t v6 = 79;
        break;
      case 3014uLL:
        uint64_t v5 = 76;
        uint64_t v6 = 75;
        break;
      case 3015uLL:
        uint64_t v5 = 74;
        uint64_t v6 = 78;
        break;
      case 3016uLL:
        uint64_t v5 = 0;
        uint64_t v6 = 87;
        break;
      case 3017uLL:
        uint64_t v5 = 82;
        uint64_t v6 = 85;
        break;
      case 3018uLL:
        uint64_t v5 = 87;
        uint64_t v6 = 86;
        break;
      case 3019uLL:
        uint64_t v5 = 49;
        uint64_t v6 = 81;
        break;
      case 3020uLL:
        uint64_t v5 = 87;
        uint64_t v6 = 71;
        break;
      default:
        goto LABEL_6;
    }
    uint64_t v4 = NTKFaceColorNameForDuotones(v5, v6);
  }
  unint64_t v7 = (void *)v4;
  if (v4) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = [[NTKPigmentEditOption alloc] initWithOptionName:v4 collectionName:v3];
    goto LABEL_34;
  }
LABEL_33:
  v12.receiver = self;
  v12.super_class = (Class)NTKPhotosColorEditOption;
  uint64_t v9 = [(NTKFaceColorEditOption *)&v12 pigmentEditOption];
LABEL_34:
  int v10 = v9;

  return v10;
}

+ (id)originalColorName
{
  return @"original";
}

@end