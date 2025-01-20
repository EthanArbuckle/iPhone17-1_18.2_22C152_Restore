@interface NTKKaleidoscopeRichFace
+ (id)_complicationSlotDescriptors;
+ (id)_richComplicationSlotsForDevice:(id)a3;
+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4;
@end

@implementation NTKKaleidoscopeRichFace

+ (id)_complicationSlotDescriptors
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = NTKAllSignatureCornerTypes();
  v12[0] = @"top-left";
  v3 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA600);
  v4 = NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1F16EA5E8, (uint64_t)v2, (uint64_t)v3);
  v13[0] = v4;
  v12[1] = @"top-right";
  v5 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA618);
  v6 = NTKMultiFamilyComplicationSlotDescriptor((uint64_t)&unk_1F16EA5E8, (uint64_t)v2, (uint64_t)v5);
  v13[1] = v6;
  v12[2] = @"bottom-center";
  v7 = NTKAllUtilityLargeComplicationTypes();
  v8 = NTKComplicationTypeRankedListWithDefaultTypes(&unk_1F16EA630);
  v9 = NTKComplicationSlotDescriptor(3, v7, v8);
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

+ (id)_richComplicationSlotsForDevice:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"top-left";
  v5[1] = @"top-right";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

+ (id)sortableFaceWithAssets:(id)a3 forDevice:(id)a4
{
  return (id)[a1 _sortableFaceOfStyle:223 withAssets:a3];
}

@end