@interface PGMoodSourceGraphNode
+ (id)_plistName;
- (double)weight;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
- (unint64_t)_sourceInputCount;
@end

@implementation PGMoodSourceGraphNode

- (unint64_t)_sourceInputCount
{
  v3 = [(PGMoodSource *)self options];
  v4 = [v3 momentIDs];
  unint64_t v5 = [v4 count];

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PGMoodSourceGraphNode;
    return [(PGMoodSource *)&v7 _sourceInputCount];
  }
  return v5;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PGMoodSource *)self enrichedMemory];

  if (v5)
  {
    v6 = [(PGMoodSource *)self enrichedMemory];
    objc_super v7 = [v6 memoryMomentNodes];
    +[PGMoodUtilities moodGraphNodeIdentifiersForMomentNodes:v7];
  }
  else
  {
    v6 = [(PGMoodSource *)self assetCollection];
    objc_super v7 = [(PGMoodSource *)self options];
    +[PGMoodUtilities moodGraphNodeIdentifiersForAssetCollection:v6 withGraph:v4 moodOptions:v7];
  v8 = };

  return v8;
}

- (double)weight
{
  return 0.5;
}

+ (id)_plistName
{
  return @"MoodSourceGraphNode";
}

@end