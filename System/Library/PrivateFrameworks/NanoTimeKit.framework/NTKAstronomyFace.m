@interface NTKAstronomyFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_complicationSlotDescriptors;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_faceDescriptionForLibrary;
- (id)_localizedNameForComplicationSlot:(id)a3;
- (id)_migratedFaceBundleIdentifier;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)_orderedComplicationSlots;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAstronomyFace

+ (id)_complicationSlotDescriptors
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = @"top-right";
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA108);
  v5 = NTKComplicationSlotDescriptor(6, v2, v4);
  v11[0] = v5;
  v10[1] = @"bottom";
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA120);
  v7 = NTKComplicationSlotDescriptor(104, v3, v6);
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (id)_complicationSlotDescriptors
{
  v3 = [(NTKFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (v4 >= 0x50000)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKAstronomyFace;
    v5 = [(NTKFace *)&v7 _complicationSlotDescriptors];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  if ([a3 nrDeviceVersion] >= 0x50000) {
    v3 = @"top-right";
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)_orderedComplicationSlots
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-right";
  v4[1] = @"bottom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_orderedComplicationSlots
{
  v3 = [(NTKFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (v4 >= 0x50000)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKAstronomyFace;
    v5 = [(NTKFace *)&v7 _orderedComplicationSlots];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v4 = a3;
  v5 = [(NTKFace *)self device];
  unsigned int v6 = [v5 nrDeviceVersion];

  if (v6 >= 0x50000)
  {
    if ([v4 isEqualToString:@"top-right"])
    {
      v8 = @"TOP";
    }
    else
    {
      int v9 = [v4 isEqualToString:@"bottom"];
      v8 = @"BOTTOM";
      if (!v9) {
        v8 = 0;
      }
    }
    v10 = [NSString stringWithFormat:@"SLOT_LABEL_%@", v8];
    NTKClockFaceLocalizedString(v10, @"slot name");
    objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v7 = &stru_1F1635E90;
  }

  return v7;
}

- (id)_customEditModes
{
  v2 = [(NTKFace *)self device];
  unsigned int v3 = [v2 nrDeviceVersion];

  if (v3 >= 0x50000) {
    return &unk_1F16EA138;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = [(NTKFace *)self device];
  unsigned int v6 = [v5 nrDeviceVersion];

  if (v6 >= 0x50000)
  {
    v8 = [(NTKFace *)self device];
    objc_super v7 = +[NTKAstronomyVistaEditOption optionWithAstronomyVista:0 forDevice:v8];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 12)
  {
    if ([a4 nrDeviceVersion] >= 0x50000)
    {
      v5 = [@"EDIT_MODE_LABEL_ASTRONOMY_CONTENT" stringByAppendingString:@"_COMPANION"];
      NTKCompanionClockFaceLocalizedString(v5, @"Vista");
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = &stru_1F1635E90;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v4 = [(NTKFace *)self device];
  unint64_t v5 = +[NTKEnumeratedEditOption numberOfOptionsForDevice:v4];

  return v5;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unsigned int v6 = [(NTKFace *)self device];
  objc_super v7 = +[NTKEnumeratedEditOption optionAtIndex:a3 forDevice:v6];

  return v7;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v6 = a3;
  objc_super v7 = [(NTKFace *)self device];
  unint64_t v8 = +[NTKEnumeratedEditOption indexOfOption:v6 forDevice:v7];

  return v8;
}

- (BOOL)_snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKAstronomyFace;
  if (!-[NTKFace _snapshotContext:isStaleRelativeToContext:](&v11, sel__snapshotContext_isStaleRelativeToContext_, v6, v7)&& [v6 calendarDateMatchesContext:v7]&& objc_msgSend(v6, "localeMatchesContext:", v7))
  {
    [v6 distanceInKilometersFromContext:v7];
    BOOL v9 = v8 > 500.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 12)
  {
    id v4 = objc_opt_class();
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (id)_faceDescriptionForLibrary
{
  uint64_t v3 = [(NTKFace *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (HIWORD(v4) > 4u)
  {
    unint64_t v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKAstronomyFace;
    unint64_t v5 = [(NTKFace *)&v7 _faceDescriptionForLibrary];
  }

  return v5;
}

- (id)_migratedFaceBundleIdentifier
{
  return @"com.apple.NTKAegirFaceBundle";
}

@end