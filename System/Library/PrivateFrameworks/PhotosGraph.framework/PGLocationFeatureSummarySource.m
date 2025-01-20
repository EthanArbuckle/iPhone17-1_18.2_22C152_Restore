@interface PGLocationFeatureSummarySource
- (PGLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5;
- (id)summarizedAreaNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4;
- (id)summarizedCityOrCountyNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4;
- (id)summarizedDistrictNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4 momentCityNodes:(id)a5;
- (id)summarizedFeaturesForMomentNodes:(id)a3;
- (id)summarizedHomeWorkNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4;
@end

@implementation PGLocationFeatureSummarySource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supersetCityNodes, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (id)summarizedCityOrCountyNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v34 = self;
  uint64_t v8 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
  v9 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:v7 locationHelper:v8];
  v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  v29 = v9;
  v30 = (void *)v8;
  v31 = v7;
  v10 = +[PGLocationTitleUtility commonCityTitleComponentsFromMomentNodes:addressNodes:incompleteLocationResolver:locationHelper:](PGLocationTitleUtility, "commonCityTitleComponentsFromMomentNodes:addressNodes:incompleteLocationResolver:locationHelper:");
  v32 = v6;
  v35 = [v6 collection];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v16 = [v15 addressNodes];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          v18 = [PGGraphAddressNodeCollection alloc];
          v19 = [v15 addressNodes];
          v20 = [(MAElementCollection *)v18 initWithSet:v19 graph:v34->_graph];

          v21 = +[PGGraphEdgeCollection edgesFromNodes:v35 toNodes:v20];
          v22 = [v15 node];
          uint64_t v23 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:v22];
          v24 = [PGLocationSummarizedFeature alloc];
          v25 = [v21 universalDateIntervals];
          v26 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v24, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v23, v25, [v21 numberOfAssets], 1, v22);

          [v36 addObject:v26];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v12);
  }

  return v36;
}

- (id)summarizedDistrictNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4 momentCityNodes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
  if ([v10 count] == 1
    && [(MAElementCollection *)self->_supersetCityNodes containsCollection:v10])
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    id v12 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke;
    v25[3] = &unk_1E68E53D8;
    id v13 = v11;
    id v26 = v13;
    v28 = &v29;
    id v14 = v12;
    id v27 = v14;
    [v9 enumerateIdentifiersAsCollectionsWithBlock:v25];
    if (*((unsigned char *)v30 + 24))
    {
      v15 = [(MAElementCollection *)[PGGraphLocationDistrictNodeCollection alloc] initWithGraph:self->_graph elementIdentifiers:v14];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke_2;
      v21[3] = &unk_1E68E5400;
      id v22 = v13;
      id v23 = v8;
      id v17 = v16;
      id v24 = v17;
      [(MAElementCollection *)v15 enumerateIdentifiersAsCollectionsWithBlock:v21];
      v18 = v24;
      id v19 = v17;
    }
    else
    {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
    }

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = (void *)a1[4];
  id v7 = [a3 anyNode];
  id v10 = [v6 districtNodeFromAddressNode:v7];

  if ([v10 count])
  {
    id v8 = (void *)a1[5];
    id v9 = [v10 elementIdentifiers];
    [v8 unionWithIdentifierSet:v9];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __106__PGLocationFeatureSummarySource_summarizedDistrictNodesForMomentNode_momentAddressNodes_momentCityNodes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v12 = [v4 addressNodesFromLocationNodes:v5];
  id v6 = +[PGGraphEdgeCollection edgesFromNodes:*(void *)(a1 + 40) toNodes:v12];
  id v7 = [v5 anyNode];

  uint64_t v8 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:v7];
  id v9 = [PGLocationSummarizedFeature alloc];
  id v10 = [v6 universalDateIntervals];
  uint64_t v11 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v9, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v8, v10, [v6 numberOfAssets], 1, v7);

  [*(id *)(a1 + 48) addObject:v11];
}

- (id)summarizedAreaNodesForMomentNode:(id)a3 momentAddressNodesAsSet:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  BOOL v9 = +[PGLocationTitleUtility containsAmusementParkPOIFromMomentNodes:v8];
  v33 = self;
  id v10 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
  uint64_t v29 = (void *)v8;
  v30 = v7;
  uint64_t v11 = +[PGLocationTitleUtility commonAOIComponentsForMomentNodes:v8 addressNodes:v7 aoiDisplayType:3 containsAmusementParkPOI:v9 locationHelper:v10];

  uint64_t v31 = v6;
  v34 = [v6 collection];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v17 = [v16 addressNodes];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          id v19 = [PGGraphAddressNodeCollection alloc];
          v20 = [v16 addressNodes];
          v21 = [(MAElementCollection *)v19 initWithSet:v20 graph:v33->_graph];

          id v22 = +[PGGraphEdgeCollection edgesFromNodes:v34 toNodes:v21];
          id v23 = [v16 node];
          uint64_t v24 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:v23];
          v25 = [PGLocationSummarizedFeature alloc];
          id v26 = [v22 universalDateIntervals];
          id v27 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:](v25, "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:", v24, v26, [v22 numberOfAssets], 1, v23);

          [v35 addObject:v27];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v13);
  }

  return v35;
}

- (id)summarizedHomeWorkNodesForMomentNode:(id)a3 momentAddressNodes:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  v30 = self;
  id v7 = [(PGTitleGenerationContext *)self->_titleGenerationContext serviceManager];
  v28 = v6;
  uint64_t v8 = +[PGLocationTitleUtility peopleLocationTitleComponentsFromAddressNodes:v6 peopleDisplayType:1 serviceManager:v7];

  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    uint64_t v29 = *(void *)v36;
    do
    {
      uint64_t v12 = 0;
      uint64_t v33 = v10;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
        uint64_t v14 = [v13 addressNodes];
        uint64_t v15 = [v14 count];

        if (v15 == 1)
        {
          id v16 = [v13 node];
          id v17 = [v13 addressNodes];
          uint64_t v18 = [v17 anyObject];

          id v19 = [v18 collection];
          v20 = +[PGGraphEdgeCollection edgesFromNodes:v32 toNodes:v19];

          v21 = [v20 universalDateIntervals];
          uint64_t v22 = +[PGLocationSummarizedFeature summarizedFeatureSubtypeForLocationNode:v18];
          id v23 = [v13 edge];
          uint64_t v24 = [(PGTitleGenerationContext *)v30->_titleGenerationContext serviceManager];
          v25 = +[PGPeopleTitleUtility beautifiedLocationStringWithPersonNode:v16 peopleAddressEdge:v23 titleComponent:v13 insertLineBreak:0 allowFamilyHome:0 serviceManager:v24];

          id v26 = -[PGLocationSummarizedFeature initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:]([PGLocationSummarizedFeature alloc], "initWithSubtype:intervalsPresent:numberOfAssets:isMandatoryForKeyAsset:locationNode:personNode:locationName:", v22, v21, [v20 numberOfAssets], 1, v18, v16, v25);
          [v31 addObject:v26];

          uint64_t v11 = v29;
          uint64_t v10 = v33;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v10);
  }

  return v31;
}

- (id)summarizedFeaturesForMomentNodes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
    id v6 = [v5 addressNodesByMomentNode];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__PGLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke;
    v14[3] = &unk_1E68E53B0;
    id v15 = v6;
    id v16 = self;
    id v8 = v7;
    id v17 = v8;
    uint64_t v18 = v5;
    id v9 = v5;
    id v10 = v6;
    [v4 enumerateIdentifiersAsCollectionsWithBlock:v14];
    uint64_t v11 = v18;
    id v12 = v8;
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

void __67__PGLocationFeatureSummarySource_summarizedFeaturesForMomentNodes___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 anyNode];
  if (v5)
  {
    id v6 = [a1[4] targetsForSources:v4];
    if ([v6 count])
    {
      id v7 = [a1[5] summarizedHomeWorkNodesForMomentNode:v4 momentAddressNodes:v6];
      if ([v7 count])
      {
        [a1[6] addObjectsFromArray:v7];
      }
      else
      {
        id v8 = [v6 set];
        id v9 = [a1[5] summarizedAreaNodesForMomentNode:v5 momentAddressNodesAsSet:v8];
        if ([v9 count])
        {
          [a1[6] addObjectsFromArray:v9];
        }
        else
        {
          id v10 = [a1[7] cityNodesFromAddressNodes:v6];
          uint64_t v11 = [a1[5] summarizedDistrictNodesForMomentNode:v4 momentAddressNodes:v6 momentCityNodes:v10];
          if ([v11 count])
          {
            [a1[6] addObjectsFromArray:v11];
          }
          else
          {
            id v12 = [a1[5] summarizedCityOrCountyNodesForMomentNode:v5 momentAddressNodesAsSet:v8];
            if ([v12 count])
            {
              [a1[6] addObjectsFromArray:v12];
            }
            else if ([v6 count])
            {
              uint64_t v13 = *((void *)a1[5] + 1);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                uint64_t v14 = v13;
                id v15 = [v5 localIdentifier];
                *(_DWORD *)buf = 138412290;
                id v17 = v15;
                _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[PGLocationFeatureSummarySource] No summarized location features found from momentNode %@", buf, 0xCu);
              }
            }
          }
        }
      }
    }
  }
}

- (PGLocationFeatureSummarySource)initWithLoggingConnection:(id)a3 titleGenerationContext:(id)a4 graph:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PGLocationFeatureSummarySource;
  id v12 = [(PGLocationFeatureSummarySource *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_loggingConnection, a3);
    objc_storeStrong((id *)&v13->_titleGenerationContext, a4);
    objc_storeStrong((id *)&v13->_graph, a5);
    uint64_t v14 = [(PGGraph *)v13->_graph supersetCityNodes];
    supersetCityNodes = v13->_supersetCityNodes;
    v13->_supersetCityNodes = (PGGraphLocationCityNodeCollection *)v14;
  }
  return v13;
}

@end