@interface NTKBlackcombFace
+ (id)_complicationSlotDescriptors;
+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3;
+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4;
+ (id)_orderedComplicationSlots;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)pigmentFaceDomain;
- (BOOL)requiresPigmentEditOption;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKBlackcombFace

+ (id)_complicationSlotDescriptors
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllSignatureCircularTypes();
  v13 = NTKAllExtendedSignatureCircularTypes();
  v3 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8BC0);
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8BD8);
  v5 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8BF0);
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E8C08);
  v14[0] = @"subdial-top";
  v7 = NTKComplicationSlotDescriptor(10, v13, v3);
  v15[0] = v7;
  v14[1] = @"subdial-left";
  v8 = NTKComplicationSlotDescriptor(10, v2, v4);
  v15[1] = v8;
  v14[2] = @"subdial-right";
  v9 = NTKComplicationSlotDescriptor(10, v2, v5);
  v15[2] = v9;
  v14[3] = @"subdial-bottom";
  v10 = NTKComplicationSlotDescriptor(10, v2, v6);
  v15[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v11;
}

+ (id)_defaultSelectedComplicationSlotForDevice:(id)a3
{
  return @"subdial-top";
}

+ (id)_orderedComplicationSlots
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"subdial-top";
  v4[1] = @"subdial-left";
  v4[2] = @"subdial-right";
  v4[3] = @"subdial-bottom";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)_customEditModes
{
  return &unk_1F16E8C20;
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 10)
  {
    v9 = [(NTKFace *)self device];
    uint64_t v10 = NTKDefaultFaceColorForDeviceCollection(v9, 200);

    v7 = [(NTKFace *)self device];
    uint64_t v8 = +[NTKFaceColorEditOption optionWithFaceColor:v10 forDevice:v7];
    goto LABEL_5;
  }
  if (a3 == 15)
  {
    v7 = [(NTKFace *)self device];
    uint64_t v8 = +[NTKBlackcombDialColorEditOption optionWithBlackcombDialColor:0 forDevice:v7];
LABEL_5:
    v11 = (void *)v8;

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKBlackcombFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  id v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKBlackcombFace *)self _optionClassForCustomEditMode:a4];
  uint64_t v8 = [(NTKFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [(NTKBlackcombFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  if (a3 == 15 || a3 == 10)
  {
    v4 = objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  return (Class)v4;
}

+ (id)_localizedNameOverrideForCustomEditMode:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
  {
    v4 = objc_msgSend(@"EDIT_MODE_BLACKCOMB_LABEL_STYLE", "stringByAppendingString:", @"_COMPANION", a4);
    v5 = NTKCompanionClockFaceLocalizedString(v4, @"edit mode");
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___NTKBlackcombFace;
    v5 = objc_msgSendSuper2(&v7, sel__localizedNameOverrideForCustomEditMode_forDevice_, a3, a4);
  }
  return v5;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"subdial-top";
  v5[1] = @"subdial-left";
  v5[2] = @"subdial-right";
  v5[3] = @"subdial-bottom";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  return v3;
}

- (id)allowedComplicationsForSlot:(id)a3 includingComplication:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NTKBlackcombFace;
  objc_super v7 = [(NTKFace *)&v27 allowedComplicationsForSlot:v6 includingComplication:a4];
  if (([v6 isEqualToString:@"subdial-top"] & 1) == 0)
  {
    id v18 = v7;
    goto LABEL_19;
  }
  v21 = v7;
  id v22 = v6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v9)
  {
LABEL_13:

LABEL_17:
    id v18 = v8;
    goto LABEL_18;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v24;
LABEL_4:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v24 != v11) {
      objc_enumerationMutation(v8);
    }
    v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
    if (objc_msgSend(v13, "complicationType", v21, v22, (void)v23) != 48) {
      goto LABEL_11;
    }
    id v14 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v14 complication];
      v16 = [v15 bundleIdentifier];
      char v17 = [v16 isEqualToString:@"com.apple.NanoTimeKit.DigitalTime"];

      if (v17) {
        break;
      }
    }

LABEL_11:
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  if (!v14) {
    goto LABEL_17;
  }
  v19 = (void *)[v8 mutableCopy];
  [v19 removeObject:v14];
  id v18 = (id)[v19 copy];

LABEL_18:
  objc_super v7 = v21;
  id v6 = v22;
LABEL_19:

  return v18;
}

- (BOOL)requiresPigmentEditOption
{
  return 0;
}

+ (id)pigmentFaceDomain
{
  return @"meridian";
}

@end