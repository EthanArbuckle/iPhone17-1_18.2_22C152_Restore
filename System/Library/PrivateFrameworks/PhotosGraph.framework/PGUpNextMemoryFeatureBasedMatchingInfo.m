@interface PGUpNextMemoryFeatureBasedMatchingInfo
+ (id)matchingInfosWithMemoryNodes:(id)a3;
+ (id)representativeSceneNodesForMemoryFeatureNodes:(id)a3;
- (BOOL)isTripMemory;
- (CLLocation)representativeLocation;
- (NSDate)representativeDate;
- (NSString)debugInfo;
- (PGGraphFeatureNodeCollection)memoryFeatureNodes;
- (PGGraphMeaningNodeCollection)meaningNodes;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphSceneNodeCollection)sceneNodes;
- (PGUpNextMemoryFeatureBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3;
- (unint64_t)nodeIdentifier;
@end

@implementation PGUpNextMemoryFeatureBasedMatchingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_memoryFeatureNodes, 0);
  objc_storeStrong((id *)&self->_memoryNodeAsCollection, 0);
}

- (NSString)debugInfo
{
  v2 = NSString;
  v3 = [(PGGraphMemoryNodeCollection *)self->_memoryNodeAsCollection uniqueMemoryIdentifiers];
  v4 = [v3 anyObject];
  v5 = [v2 stringWithFormat:@"Memory Feature Matching Info With Memory id: %@", v4];

  return (NSString *)v5;
}

- (NSDate)representativeDate
{
  return 0;
}

- (CLLocation)representativeLocation
{
  return 0;
}

- (BOOL)isTripMemory
{
  if (!self->_isTripMemoryIsResolved)
  {
    v3 = [(MANodeCollection *)self->_memoryNodeAsCollection labels];
    v4 = +[PGGraphBuilder memoryLabelForCategory:19];
    self->_isTripMemory = [v3 containsObject:v4];

    self->_isTripMemoryIsResolved = 1;
  }
  return self->_isTripMemory;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  return 0;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  sceneNodes = self->_sceneNodes;
  if (!sceneNodes)
  {
    v4 = objc_opt_class();
    v5 = [(PGUpNextMemoryFeatureBasedMatchingInfo *)self memoryFeatureNodes];
    v6 = [v4 representativeSceneNodesForMemoryFeatureNodes:v5];
    v7 = self->_sceneNodes;
    self->_sceneNodes = v6;

    sceneNodes = self->_sceneNodes;
  }
  return sceneNodes;
}

- (PGGraphPersonNodeCollection)personNodes
{
  v2 = [(PGUpNextMemoryFeatureBasedMatchingInfo *)self memoryFeatureNodes];
  v3 = +[PGGraphNodeCollection subsetInCollection:v2];

  return (PGGraphPersonNodeCollection *)v3;
}

- (PGGraphFeatureNodeCollection)memoryFeatureNodes
{
  memoryFeatureNodes = self->_memoryFeatureNodes;
  if (!memoryFeatureNodes)
  {
    v4 = [(PGGraphMemoryNodeCollection *)self->_memoryNodeAsCollection featureNodes];
    v5 = self->_memoryFeatureNodes;
    self->_memoryFeatureNodes = v4;

    memoryFeatureNodes = self->_memoryFeatureNodes;
  }
  return memoryFeatureNodes;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return 0;
}

- (unint64_t)nodeIdentifier
{
  v2 = [(MAElementCollection *)self->_memoryNodeAsCollection elementIdentifiers];
  unint64_t v3 = [v2 firstElement];

  return v3;
}

- (PGUpNextMemoryFeatureBasedMatchingInfo)initWithMemoryNodeAsCollection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGUpNextMemoryFeatureBasedMatchingInfo;
  v6 = [(PGUpNextMemoryFeatureBasedMatchingInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_memoryNodeAsCollection, a3);
  }

  return v7;
}

+ (id)matchingInfosWithMemoryNodes:(id)a3
{
  unint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PGUpNextMemoryFeatureBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke;
  v8[3] = &unk_1E68EFBB0;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateIdentifiersAsCollectionsWithBlock:v8];

  return v6;
}

void __71__PGUpNextMemoryFeatureBasedMatchingInfo_matchingInfosWithMemoryNodes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [[PGUpNextMemoryFeatureBasedMatchingInfo alloc] initWithMemoryNodeAsCollection:v4];

  [*(id *)(a1 + 32) addObject:v5];
}

+ (id)representativeSceneNodesForMemoryFeatureNodes:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = +[PGGraphNodeCollection subsetInCollection:a3];
  id v4 = [v3 graph];
  if ([v3 count])
  {
    v20 = v4;
    id v5 = [v3 labels];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = +[PGTrendsMemoryGenerator trendsConfigurations];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v13 = [v12 featureLabel];
          int v14 = [v5 containsObject:v13];

          if (v14)
          {
            v15 = [v12 positiveScenes];
            [v6 addObjectsFromArray:v15];

            v16 = [v12 positiveDominantScenes];
            [v6 addObjectsFromArray:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v4 = v20;
    if ([v6 count])
    {
      v17 = +[PGGraphSceneNodeCollection sceneNodesForSceneNames:v6 inGraph:v20];
    }
    else
    {
      v17 = [(MAElementCollection *)[PGGraphSceneNodeCollection alloc] initWithGraph:v20];
    }
    v18 = v17;
  }
  else
  {
    v18 = [(MAElementCollection *)[PGGraphSceneNodeCollection alloc] initWithGraph:v4];
  }

  return v18;
}

@end