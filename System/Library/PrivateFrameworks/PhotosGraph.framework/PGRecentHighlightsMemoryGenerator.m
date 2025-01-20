@interface PGRecentHighlightsMemoryGenerator
- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4;
- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8;
@end

@implementation PGRecentHighlightsMemoryGenerator

- (id)titleGeneratorForTriggeredMemory:(id)a3 withKeyAsset:(id)a4 curatedAssets:(id)a5 extendedCuratedAssets:(id)a6 titleGenerationContext:(id)a7 inGraph:(id)a8
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v9 = a7;
  v10 = [a3 memoryMomentNodes];
  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"universalStartDate" ascending:1];
  v12 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v11);
  v23[1] = v12;
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v23[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  v15 = [v10 sortedArrayUsingDescriptors:v14];

  v16 = [PGBestOfTimeMemoryTitleGenerator alloc];
  v17 = [v15 firstObject];
  v18 = [v17 universalStartDate];
  v19 = [v15 lastObject];
  v20 = [v19 universalEndDate];
  v21 = [(PGBestOfTimeMemoryTitleGenerator *)v16 initWithStartDate:v18 endDate:v20 titleGenerationContext:v9];

  return v21;
}

- (id)keyAssetCurationOptionsWithTriggeredMemory:(id)a3 inGraph:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PGRecentHighlightsMemoryGenerator;
  v4 = [(PGMemoryGenerator *)&v6 keyAssetCurationOptionsWithTriggeredMemory:a3 inGraph:a4];
  [v4 setPrefilterAssetsWithFacesThreshold:2.22507386e-308];
  return v4;
}

@end