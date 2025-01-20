@interface NTKUpNextRichFace
+ (id)_complicationSlotDescriptors;
+ (id)_leftSlotDescriptorTypes;
+ (id)_richComplicationSlotsForDevice:(id)a3;
@end

@implementation NTKUpNextRichFace

+ (id)_leftSlotDescriptorTypes
{
  v2 = objc_opt_new();
  v3 = NTKAllSignatureCircularTypes();
  [v2 addIndexes:v3];

  [v2 addIndex:29];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndexSet:v2];

  return v4;
}

+ (id)_complicationSlotDescriptors
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 _leftSlotDescriptorTypes];
  v3 = NTKAllUtilitySmallFlatComplicationTypes();
  v11 = &unk_1F16E0E58;
  v12[0] = @"top-left";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v5 = NTKComplicationTypeRankedListWithDefaultTypes(v4);
  v6 = NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1F16E9778, (uint64_t)v2, (uint64_t)v5);
  v13[0] = v6;
  v12[1] = @"top-right";
  v7 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16E9790);
  v8 = NTKComplicationSlotDescriptor(6, v3, v7);
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v9;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"top-left";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end