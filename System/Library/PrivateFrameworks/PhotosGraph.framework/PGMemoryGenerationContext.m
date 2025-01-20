@interface PGMemoryGenerationContext
- (CLSServiceManager)serviceManager;
- (OS_os_log)loggingConnection;
- (PGGraphLocationHelper)locationHelper;
- (PGMemoryGenerationContext)initWithPhotoLibrary:(id)a3 userFeedbackCalculator:(id)a4 graph:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7;
- (PGMemoryGenerationContext)initWithProcessedScenesAndFacesCache:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4 locationHelper:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7;
- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache;
- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache;
- (double)averageContentScoreForMomentNodes:(id)a3;
- (id)_yearNodesInGraph:(id)a3;
- (id)interestingForMemoriesSubsetFromMomentNodes:(id)a3;
- (id)interestingWithAlternateJunkingSubsetFromMomentNodes:(id)a3;
- (id)momentNodesAtSensitiveLocationsInGraph:(id)a3;
- (id)yearNodesByMomentNodeInGraph:(id)a3;
- (id)yearNodesForMomentNodes:(id)a3;
- (id)yearsForYearNodes:(id)a3;
- (unint64_t)numberOfAssetsInExtendedCurationForMomentNodes:(id)a3;
@end

@implementation PGMemoryGenerationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
  objc_storeStrong((id *)&self->_momentNodesWithBlockedFeatureCache, 0);
  objc_storeStrong((id *)&self->_processedScenesAndFacesCache, 0);
  objc_storeStrong((id *)&self->_yearNodes, 0);
  objc_storeStrong((id *)&self->_yearByYearNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_yearNodesByMomentNode, 0);
  objc_storeStrong((id *)&self->_contentScoreByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_momentNodesInterestingForMemories, 0);
  objc_storeStrong((id *)&self->_momentNodesInterestingWithAlternateJunking, 0);
  objc_storeStrong((id *)&self->_momentNodesAtSensitiveLocations, 0);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (CLSServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (PGGraphLocationHelper)locationHelper
{
  return self->_locationHelper;
}

- (PGMemoryMomentNodesWithBlockedFeatureCache)momentNodesWithBlockedFeatureCache
{
  return self->_momentNodesWithBlockedFeatureCache;
}

- (PGMemoryProcessedScenesAndFacesCache)processedScenesAndFacesCache
{
  return self->_processedScenesAndFacesCache;
}

- (id)_yearNodesInGraph:(id)a3
{
  yearNodes = self->_yearNodes;
  if (!yearNodes)
  {
    v5 = +[PGGraphNodeCollection nodesInGraph:a3];
    v6 = self->_yearNodes;
    self->_yearNodes = v5;

    yearNodes = self->_yearNodes;
  }
  return yearNodes;
}

- (id)yearsForYearNodes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_yearByYearNodeIdentifier)
  {
    v6 = [v4 graph];
    v7 = [(PGMemoryGenerationContext *)self _yearNodesInGraph:v6];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __47__PGMemoryGenerationContext_yearsForYearNodes___block_invoke;
    v25[3] = &unk_1E68ED578;
    v9 = (NSDictionary *)v8;
    v26 = v9;
    [v7 enumerateYearsUsingBlock:v25];
    yearByYearNodeIdentifier = self->_yearByYearNodeIdentifier;
    self->_yearByYearNodeIdentifier = v9;
    v11 = v9;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = objc_msgSend(v5, "elementIdentifiers", 0);
  v14 = [v13 indexArray];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = [(NSDictionary *)self->_yearByYearNodeIdentifier objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        [v12 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v16);
  }

  return v12;
}

void __47__PGMemoryGenerationContext_yearsForYearNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (id)yearNodesForMomentNodes:(id)a3
{
  id v4 = a3;
  v5 = [v4 graph];
  id v6 = [(PGMemoryGenerationContext *)self yearNodesByMomentNodeInGraph:v5];
  v7 = [v6 targetsForSources:v4];

  return v7;
}

- (id)yearNodesByMomentNodeInGraph:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  yearNodesByMomentNode = self->_yearNodesByMomentNode;
  if (!yearNodesByMomentNode)
  {
    v5 = [(PGMemoryGenerationContext *)self _yearNodesInGraph:a3];
    id v6 = (void *)MEMORY[0x1E4F71F18];
    v7 = +[PGGraphYearNodeCollection dateOfYear];
    v15[0] = v7;
    id v8 = +[PGGraphDateNode momentOfDate];
    v15[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v10 = [v6 chain:v9];

    v11 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v5 relation:v10 targetsClass:objc_opt_class()];
    id v12 = [v11 transposed];
    v13 = self->_yearNodesByMomentNode;
    self->_yearNodesByMomentNode = v12;

    yearNodesByMomentNode = self->_yearNodesByMomentNode;
  }
  return yearNodesByMomentNode;
}

- (double)averageContentScoreForMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (!self->_contentScoreByMomentNodeIdentifier)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = [v4 graph];
      v7 = +[PGGraphNodeCollection nodesInGraph:v6];

      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke;
      v19[3] = &unk_1E68E9A60;
      id v8 = (NSDictionary *)v5;
      v20 = v8;
      [v7 enumerateContentScoresUsingBlock:v19];
      contentScoreByMomentNodeIdentifier = self->_contentScoreByMomentNodeIdentifier;
      self->_contentScoreByMomentNodeIdentifier = v8;
      v10 = v8;
    }
    uint64_t v15 = 0;
    uint64_t v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke_2;
    v14[3] = &unk_1E68EF7D8;
    v14[4] = self;
    v14[5] = &v15;
    [v4 enumerateIdentifiersAsCollectionsWithBlock:v14];
    double v11 = v16[3];
    double v12 = v11 / (double)(unint64_t)[v4 count];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

void __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __63__PGMemoryGenerationContext_averageContentScoreForMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 40);
  id v6 = [NSNumber numberWithUnsignedInteger:a2];
  id v4 = [v3 objectForKeyedSubscript:v6];
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
}

- (unint64_t)numberOfAssetsInExtendedCurationForMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (!self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = [v4 graph];
      v7 = +[PGGraphNodeCollection nodesInGraph:v6];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke;
      v18[3] = &unk_1E68EA838;
      id v8 = (NSDictionary *)v5;
      v19 = v8;
      [v7 enumerateNumberOfAssetsInExtendedCurationUsingBlock:v18];
      numberOfAssetsInExtendedCurationByMomentNodeIdentifier = self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier;
      self->_numberOfAssetsInExtendedCurationByMomentNodeIdentifier = v8;
      v10 = v8;
    }
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke_2;
    v13[3] = &unk_1E68EF7D8;
    v13[4] = self;
    v13[5] = &v14;
    [v4 enumerateIdentifiersAsCollectionsWithBlock:v13];
    unint64_t v11 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

void __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

void __76__PGMemoryGenerationContext_numberOfAssetsInExtendedCurationForMomentNodes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v4 = [v3 objectForKeyedSubscript:v5];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v4 unsignedIntegerValue];
}

- (id)interestingForMemoriesSubsetFromMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    momentNodesInterestingForMemories = self->_momentNodesInterestingForMemories;
    if (!momentNodesInterestingForMemories)
    {
      id v6 = [v4 graph];
      v7 = +[PGGraphMomentNodeCollection momentNodesInterestingForMemoriesInGraph:v6];
      id v8 = self->_momentNodesInterestingForMemories;
      self->_momentNodesInterestingForMemories = v7;

      momentNodesInterestingForMemories = self->_momentNodesInterestingForMemories;
    }
    v9 = [v4 collectionByIntersecting:momentNodesInterestingForMemories];
  }
  else
  {
    v10 = [PGGraphMomentNodeCollection alloc];
    unint64_t v11 = [v4 graph];
    v9 = [(MAElementCollection *)v10 initWithGraph:v11];
  }
  return v9;
}

- (id)interestingWithAlternateJunkingSubsetFromMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    momentNodesInterestingWithAlternateJunking = self->_momentNodesInterestingWithAlternateJunking;
    if (!momentNodesInterestingWithAlternateJunking)
    {
      id v6 = [v4 graph];
      v7 = +[PGGraphMomentNodeCollection momentNodesInterestingWithAlternateJunkingInGraph:v6];
      id v8 = self->_momentNodesInterestingWithAlternateJunking;
      self->_momentNodesInterestingWithAlternateJunking = v7;

      momentNodesInterestingWithAlternateJunking = self->_momentNodesInterestingWithAlternateJunking;
    }
    v9 = [v4 collectionByIntersecting:momentNodesInterestingWithAlternateJunking];
  }
  else
  {
    v10 = [PGGraphMomentNodeCollection alloc];
    unint64_t v11 = [v4 graph];
    v9 = [(MAElementCollection *)v10 initWithGraph:v11];
  }
  return v9;
}

- (id)momentNodesAtSensitiveLocationsInGraph:(id)a3
{
  momentNodesAtSensitiveLocations = self->_momentNodesAtSensitiveLocations;
  if (!momentNodesAtSensitiveLocations)
  {
    id v5 = a3;
    id v6 = +[PGGraphMomentNodeCollection momentNodesHappeningAtSensitiveLocationInGraph:v5];
    v7 = +[PGMemoryGeneratorUtils momentNodesAtHomeOrWorkOrFrequentLocationInGraph:v5];

    id v8 = [v6 collectionBySubtracting:v7];
    v9 = self->_momentNodesAtSensitiveLocations;
    self->_momentNodesAtSensitiveLocations = v8;

    momentNodesAtSensitiveLocations = self->_momentNodesAtSensitiveLocations;
  }
  return momentNodesAtSensitiveLocations;
}

- (PGMemoryGenerationContext)initWithProcessedScenesAndFacesCache:(id)a3 momentNodesWithBlockedFeatureCache:(id)a4 locationHelper:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PGMemoryGenerationContext;
  uint64_t v17 = [(PGMemoryGenerationContext *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processedScenesAndFacesCache, a3);
    objc_storeStrong((id *)&v18->_momentNodesWithBlockedFeatureCache, a4);
    objc_storeStrong((id *)&v18->_locationHelper, a5);
    objc_storeStrong((id *)&v18->_serviceManager, a6);
    objc_storeStrong((id *)&v18->_loggingConnection, a7);
  }

  return v18;
}

- (PGMemoryGenerationContext)initWithPhotoLibrary:(id)a3 userFeedbackCalculator:(id)a4 graph:(id)a5 serviceManager:(id)a6 loggingConnection:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [[PGMemoryProcessedScenesAndFacesCache alloc] initWithPhotoLibrary:v16];

  uint64_t v18 = [[PGMemoryMomentNodesWithBlockedFeatureCache alloc] initWithUserFeedbackCalculator:v15 loggingConnection:v12];
  v19 = [[PGGraphLocationHelper alloc] initWithGraph:v14];

  id v20 = [(PGMemoryGenerationContext *)self initWithProcessedScenesAndFacesCache:v17 momentNodesWithBlockedFeatureCache:v18 locationHelper:v19 serviceManager:v13 loggingConnection:v12];
  return v20;
}

@end