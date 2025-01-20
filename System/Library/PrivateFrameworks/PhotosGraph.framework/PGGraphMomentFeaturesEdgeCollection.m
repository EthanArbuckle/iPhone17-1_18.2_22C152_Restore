@interface PGGraphMomentFeaturesEdgeCollection
+ (Class)edgeClass;
+ (id)momentFeaturesEdgesFromMomentNodes:(id)a3 toFeatureNodes:(id)a4;
- (NSSet)allRelevantAssetLocalIdentifiers;
- (NSSet)allRelevantAssetUUIDs;
- (unint64_t)numberOfRelevantAssets;
@end

@implementation PGGraphMomentFeaturesEdgeCollection

- (NSSet)allRelevantAssetLocalIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(PGGraphMomentFeaturesEdgeCollection *)self allRelevantAssetUUIDs];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(MEMORY[0x1E4F38EB8], "localIdentifierWithUUID:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allRelevantAssetUUIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PGGraphMomentFeaturesEdgeCollection_allRelevantAssetUUIDs__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MAEdgeCollection *)self enumerateStringPropertyValuesForKey:@"rlvaids" withBlock:v6];

  return (NSSet *)v4;
}

void __60__PGGraphMomentFeaturesEdgeCollection_allRelevantAssetUUIDs__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  +[PGGraphMomentFeaturesEdge relevantAssetUUIDsFromAllAssetUUIDs:](PGGraphMomentFeaturesEdge, "relevantAssetUUIDsFromAllAssetUUIDs:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObjectsFromArray:v2];
}

- (unint64_t)numberOfRelevantAssets
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__PGGraphMomentFeaturesEdgeCollection_numberOfRelevantAssets__block_invoke;
  v4[3] = &unk_1E68EFAB8;
  v4[4] = &v5;
  [(MAEdgeCollection *)self enumerateUnsignedIntegerPropertyValuesForKey:@"rlvacnt" withBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __61__PGGraphMomentFeaturesEdgeCollection_numberOfRelevantAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

+ (id)momentFeaturesEdgesFromMomentNodes:(id)a3 toFeatureNodes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PGGraphMomentFeaturesEdge filter];
  uint64_t v8 = +[MAEdgeCollection edgesOfType:2 betweenNodes:v6 andNodes:v5 matchingFilter:v7];

  return v8;
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end