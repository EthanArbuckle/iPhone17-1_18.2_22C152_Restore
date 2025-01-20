@interface NTKUpNextFace
+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3;
+ (id)_complicationSlotDescriptors;
+ (id)_orderedComplicationSlots;
+ (id)pigmentFaceDomain;
- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (int64_t)_customEditModeForUniqueConfiguration;
- (int64_t)timeStyle;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKUpNextFace

- (int64_t)timeStyle
{
  return 1;
}

+ (id)_complicationSlotDescriptors
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllSmallComplicationTypes();
  v4 = (void *)[v3 mutableCopy];

  [v4 addIndex:29];
  v5 = [MEMORY[0x1E4F19A30] currentDevice];
  int v6 = [v5 isRunningGraceOrLater];
  v7 = &unk_1F16E0E70;
  if (v6) {
    v7 = &unk_1F16E0E58;
  }
  id v8 = v7;

  id v16 = v8;
  v17[0] = @"top-left";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v10 = NTKComplicationTypeRankedListWithDefaultTypes(v9);
  v11 = NTKComplicationSlotDescriptor(0, v4, v10);
  v18[0] = v11;
  v17[1] = @"top-right";
  v12 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E9730);
  v13 = NTKComplicationSlotDescriptor(6, v2, v12);
  v18[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v14;
}

+ (id)_orderedComplicationSlots
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_customEditModes
{
  v2 = [(NTKFace *)self device];
  unsigned int v3 = [v2 nrDeviceVersion];

  if (v3 >= 0x50000) {
    return &unk_1F16E9760;
  }
  else {
    return &unk_1F16E9748;
  }
}

- (int64_t)_customEditModeForUniqueConfiguration
{
  v2 = [(NTKFace *)self device];
  unsigned int v3 = [v2 nrDeviceVersion];

  if (v3 >= 0x50000) {
    return 10;
  }
  else {
    return 0;
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 10)
  {
    v4 = [(NTKFace *)self device];
    +[NTKFaceColorEditOption optionWithFaceColor:201 forDevice:v4];
  }
  else
  {
    v4 = [(NTKFace *)self device];
    +[NTKUpNextDisabledDataSourcesEditOption optionWithDisabledDataSourceIdentifiers:0 forDevice:v4];
  v5 = };

  return v5;
}

- (BOOL)_hasOptionsForCustomEditMode:(int64_t)a3
{
  if (a3 == 16) {
    return 1;
  }
  if (a3 != 10) {
    return 0;
  }
  unsigned int v3 = [(NTKFace *)self device];
  BOOL v4 = [v3 nrDeviceVersion] >> 16 > 4;

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 != 10) {
    return 0;
  }
  BOOL v4 = [(NTKFace *)self device];
  unint64_t v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:v4];

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 10)
  {
    int v6 = [(NTKFace *)self device];
    v7 = +[NTKEnumeratedEditOption optionAtIndex:a3 forDevice:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 != 10) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = a3;
  v7 = [(NTKFace *)self device];
  unint64_t v8 = +[NTKEnumeratedEditOption indexOfOption:v6 forDevice:v7];

  return v8;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 16 || a3 == 10)
  {
    BOOL v4 = objc_opt_class();
  }
  else
  {
    BOOL v4 = 0;
  }
  return (Class)v4;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"siri";
}

+ (Class)_faceClassOfFaceWithRichComplicationSlotsForDevice:(id)a3
{
  return (Class)objc_opt_class();
}

@end