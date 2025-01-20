@interface NTKCKaleidoscopeFacesGalleryCollection
+ (id)_fall2021DefaultFacesForDevice:(id)a3;
+ (id)_legacyDefaultFacesForDevice:(id)a3;
+ (id)_spring2020DefaultFacesForDevice:(id)a3;
+ (id)_spring2023DefaultFacesForDevice:(id)a3;
+ (id)complicationTypesBySlot;
+ (id)defaultFaceForDevice:(id)a3;
+ (id)spring2020ComplicationTypesBySlot;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKCKaleidoscopeFacesGalleryCollection

- (id)title
{
  return NTKClockFaceLocalizedString(@"FACE_STYLE_23_IN_TITLE_CASE", @"Kaleidoscope");
}

- (id)facesForDevice:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"4CC676F2-E761-4AA8-AE40-1A40F3868BDE"];
  int v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() _spring2023DefaultFacesForDevice:v3];
  }
  else
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A19F7B33-B4B5-4859-8FDD-DEDA6FD71895"];
    int v8 = [v3 supportsCapability:v7];

    if (v8)
    {
      uint64_t v6 = [(id)objc_opt_class() _fall2021DefaultFacesForDevice:v3];
    }
    else
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2CE80E5D-FA17-4BD4-A48C-DFC3A79FB8ED"];
      int v10 = [v3 supportsCapability:v9];

      v11 = objc_opt_class();
      if (v10) {
        [v11 _spring2020DefaultFacesForDevice:v3];
      }
      else {
      uint64_t v6 = [v11 _legacyDefaultFacesForDevice:v3];
      }
    }
  }
  v12 = (void *)v6;

  return v12;
}

+ (id)defaultFaceForDevice:(id)a3
{
  id v3 = a3;
  if (NTKShowBlueRidgeUI(v3)) {
    uint64_t v4 = 223;
  }
  else {
    uint64_t v4 = 23;
  }
  int v5 = +[NTKFace defaultFaceOfStyle:v4 forDevice:v3];

  return v5;
}

+ (id)_spring2023DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  if ([&unk_1F16EA690 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [a1 defaultFaceForDevice:v4];
      int v8 = [&unk_1F16EA690 objectAtIndex:v6];
      uint64_t v9 = [v8 unsignedIntegerValue];

      int v10 = +[NTKKaleidoscopeAssetOption optionWithAsset:v9 forDevice:v4];
      [v7 selectOption:v10 forCustomEditMode:12 slot:0];

      if ([v4 deviceCategory] == 1)
      {
        v11 = +[NTKKaleidoscopeStyleOption optionWithStyle:0 forDevice:v4];
        [v7 selectOption:v11 forCustomEditMode:15 slot:0];
        v12 = +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot];
        [v7 _setFaceGalleryComplicationTypesForSlots:v12];
      }
      else
      {
        v11 = +[NTKKaleidoscopeStyleOption optionWithStyle:3 forDevice:v4];
        [v7 selectOption:v11 forCustomEditMode:15 slot:0];
      }

      [v5 addObject:v7];
      ++v6;
    }
    while (v6 < [&unk_1F16EA690 count]);
  }

  return v5;
}

+ (id)_fall2021DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  if ([&unk_1F16EA6A8 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [a1 defaultFaceForDevice:v4];
      int v8 = [&unk_1F16EA6A8 objectAtIndex:v6];
      uint64_t v9 = [v8 unsignedIntegerValue];

      int v10 = +[NTKKaleidoscopeAssetOption optionWithAsset:v9 forDevice:v4];
      [v7 selectOption:v10 forCustomEditMode:12 slot:0];

      if ([v4 deviceCategory] == 1)
      {
        v11 = +[NTKKaleidoscopeStyleOption optionWithStyle:0 forDevice:v4];
        [v7 selectOption:v11 forCustomEditMode:15 slot:0];
        v12 = +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot];
        [v7 _setFaceGalleryComplicationTypesForSlots:v12];
      }
      else
      {
        v11 = +[NTKKaleidoscopeStyleOption optionWithStyle:3 forDevice:v4];
        [v7 selectOption:v11 forCustomEditMode:15 slot:0];
      }

      [v5 addObject:v7];
      ++v6;
    }
    while (v6 < [&unk_1F16EA6A8 count]);
  }

  return v5;
}

+ (id)_spring2020DefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:v4];
  unint64_t v6 = objc_opt_new();
  if ([&unk_1F16EA6C0 count])
  {
    unint64_t v7 = 0;
    do
    {
      int v8 = [a1 defaultFaceForDevice:v4];
      uint64_t v9 = [&unk_1F16EA6C0 objectAtIndex:v7];
      uint64_t v10 = [v9 unsignedIntegerValue];

      v11 = +[NTKKaleidoscopeAssetOption optionWithAsset:v10 forDevice:v4];
      [v8 selectOption:v11 forCustomEditMode:12 slot:0];

      v12 = +[NTKEnumeratedEditOption optionAtIndex:v7 % v5 forDevice:v4];
      [v8 selectOption:v12 forCustomEditMode:15 slot:0];
      v13 = +[NTKCKaleidoscopeFacesGalleryCollection spring2020ComplicationTypesBySlot];
      [v8 _setFaceGalleryComplicationTypesForSlots:v13];

      [v6 addObject:v8];
      ++v7;
    }
    while (v7 < [&unk_1F16EA6C0 count]);
  }

  return v6;
}

+ (id)_legacyDefaultFacesForDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  if (+[NTKEnumeratedEditOption numberOfOptionsForDevice:v4])
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = [a1 defaultFaceForDevice:v4];
      int v8 = +[NTKKaleidoscopeAssetOption optionWithAsset:0 forDevice:v4];
      [v7 selectOption:v8 forCustomEditMode:12 slot:0];

      uint64_t v9 = +[NTKEnumeratedEditOption optionAtIndex:v6 forDevice:v4];
      [v7 selectOption:v9 forCustomEditMode:15 slot:0];
      uint64_t v10 = +[NTKCKaleidoscopeFacesGalleryCollection complicationTypesBySlot];
      [v7 _setFaceGalleryComplicationTypesForSlots:v10];

      [v5 addObject:v7];
      ++v6;
    }
    while (+[NTKEnumeratedEditOption numberOfOptionsForDevice:v4] > v6);
  }

  return v5;
}

+ (id)complicationTypesBySlot
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v5[0] = &unk_1F16EA6D8;
  v5[1] = &unk_1F16EA6F0;
  v4[2] = @"bottom-center";
  v5[2] = &unk_1F16EA708;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

+ (id)spring2020ComplicationTypesBySlot
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v5[0] = &unk_1F16EA720;
  v5[1] = &unk_1F16EA738;
  v4[2] = @"bottom-center";
  v5[2] = &unk_1F16EA750;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end