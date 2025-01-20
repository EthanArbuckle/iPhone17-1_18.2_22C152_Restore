@interface PGMoodSourceGraphContext
+ (id)_plistName;
- (double)weight;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
@end

@implementation PGMoodSourceGraphContext

+ (id)_plistName
{
  return @"MoodSourceGraphContext";
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  id v4 = a3;
  v5 = [(PGMoodSource *)self enrichedMemory];

  if (v5)
  {
    v6 = [(PGMoodSource *)self enrichedMemory];
    v7 = [v6 memoryMomentNodes];
    uint64_t v8 = [(PGMoodSource *)self options];
    v9 = +[PGMoodUtilities moodGraphContextIdentifiersForMomentNodes:v7 inGraph:v4 moodOptions:v8];

    id v4 = (id)v8;
  }
  else
  {
    v6 = [(PGMoodSource *)self assetCollection];
    v7 = [(PGMoodSource *)self options];
    v9 = +[PGMoodUtilities moodGraphContextIdentifiersForAssetCollection:v6 withGraph:v4 moodOptions:v7];
  }

  return v9;
}

- (double)weight
{
  return 1.0;
}

@end