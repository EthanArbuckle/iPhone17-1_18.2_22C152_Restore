@interface NTKAnalogVideoFace
+ (id)_complicationSlotDescriptors;
+ (id)_orderedComplicationSlots;
- (Class)_optionClassForCustomEditMode:(int64_t)a3;
- (id)_customEditModes;
- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4;
@end

@implementation NTKAnalogVideoFace

+ (id)_complicationSlotDescriptors
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllUtilitySmallComplicationTypes(a1, a2);
  v3 = NTKAllUtilityLargeComplicationTypes();
  v12[0] = @"top-left";
  v4 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA000);
  v5 = NTKComplicationSlotDescriptor(4, v2, v4);
  v13[0] = v5;
  v12[1] = @"top-right";
  v6 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA018);
  v7 = NTKComplicationSlotDescriptor(4, v2, v6);
  v13[1] = v7;
  v12[2] = @"bottom-center";
  v8 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA030);
  v9 = NTKComplicationSlotDescriptor(3, v3, v8);
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_orderedComplicationSlots
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"top-left";
  v4[1] = @"top-right";
  v4[2] = @"bottom-center";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (id)_customEditModes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)_defaultOptionForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 0;
}

- (unint64_t)_indexOfOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v7 = a3;
  v8 = [(NTKAnalogVideoFace *)self _optionClassForCustomEditMode:a4];
  v9 = [(NTKFace *)self device];
  unint64_t v10 = [(objc_class *)v8 indexOfOption:v7 forDevice:v9];

  return v10;
}

- (unint64_t)_numberOfOptionsForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  v5 = -[NTKAnalogVideoFace _optionClassForCustomEditMode:](self, "_optionClassForCustomEditMode:", a3, a4);
  v6 = [(NTKFace *)self device];
  unint64_t v7 = [(objc_class *)v5 numberOfOptionsForDevice:v6];

  return v7;
}

- (id)_optionAtIndex:(unint64_t)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  unint64_t v7 = [(NTKAnalogVideoFace *)self _optionClassForCustomEditMode:a4];
  v8 = [(NTKFace *)self device];
  v9 = [(objc_class *)v7 optionAtIndex:a3 forDevice:v8];

  return v9;
}

- (Class)_optionClassForCustomEditMode:(int64_t)a3
{
  return 0;
}

@end