@interface NTKBasePhotoFace
+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4;
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
- (BOOL)_allowsEditing;
- (id)_localizedNameForComplicationSlot:(id)a3;
@end

@implementation NTKBasePhotoFace

+ (BOOL)_customEditModeIsRows:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

+ (id)_complicationSlotDescriptors
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallFlatComplicationTypes();
  v3 = NTKAllUtilityLargeNarrowComplicationTypes();
  v10[0] = @"top";
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8B78);
  v5 = NTKComplicationSlotDescriptor(6, v2, v4);
  v11[0] = v5;
  v10[1] = @"bottom";
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8B90);
  v7 = NTKComplicationSlotDescriptor(104, v3, v6);
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return @"top";
}

+ (id)_orderedComplicationSlots
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top";
  v4[1] = @"bottom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)_localizedNameForComplicationSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top"])
  {
    v4 = @"ABOVE_TIME";
  }
  else
  {
    int v5 = [v3 isEqualToString:@"bottom"];
    v4 = @"BELOW_TIME";
    if (!v5) {
      v4 = 0;
    }
  }
  v6 = [NSString stringWithFormat:@"SLOT_LABEL_%@", v4];
  v7 = NTKClockFaceLocalizedString(v6, @"slot name");

  return v7;
}

- (BOOL)_allowsEditing
{
  v2 = [(NTKFace *)self resourceDirectory];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 14)
  {
    int v5 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_PHOTO_POSITION_COMPANION", @"Time Position");
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

@end