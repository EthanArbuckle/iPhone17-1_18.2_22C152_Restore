@interface PGTextFeatureGenerator
+ (id)_knowledgeOptionsByDomain;
+ (id)_naturalLanguageOptionsByDomain;
- (BOOL)boundTextFeaturesPerEvent;
- (NSCountedSet)areaNodes;
- (NSCountedSet)businessCategoryNodes;
- (NSCountedSet)businessNodes;
- (NSCountedSet)cityNodes;
- (NSCountedSet)countryNodes;
- (NSCountedSet)districtNodes;
- (NSCountedSet)holidayNodes;
- (NSCountedSet)meaningNodes;
- (NSCountedSet)personNodes;
- (NSCountedSet)poiNodes;
- (NSCountedSet)publicEventCategoryNodes;
- (NSCountedSet)publicEventNodes;
- (NSCountedSet)publicEventPerformerNodes;
- (NSCountedSet)roiNodes;
- (NSCountedSet)sceneNodes;
- (NSCountedSet)stateNodes;
- (NSDictionary)optionsByDomain;
- (NSMapTable)numberOfAssetsBySceneNode;
- (NSMutableSet)momentIdentifiers;
- (NSSet)momentNodes;
- (PGTextFeatureGenerator)initWithMomentNodes:(id)a3 graph:(id)a4;
- (id)_sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:(id)a3;
- (id)_textFeaturesForNode:(id)a3 type:(unint64_t)a4 weight:(double)a5;
- (id)_textFeaturesForNodes:(id)a3 type:(unint64_t)a4;
- (id)_textFeaturesForPersonNodes:(id)a3;
- (id)bestTextFeaturesFromTextFeatures:(id)a3;
- (id)generateTextFeatures;
- (id)knowledgeFeatures;
- (id)naturalLanguageFeatures;
- (unint64_t)maximumNumberOfTextFeaturesPerEvent;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfMoments;
- (void)_resetProperties;
- (void)analyzeMomentNodes;
- (void)setAreaNodes:(id)a3;
- (void)setBusinessCategoryNodes:(id)a3;
- (void)setBusinessNodes:(id)a3;
- (void)setCityNodes:(id)a3;
- (void)setCountryNodes:(id)a3;
- (void)setDistrictNodes:(id)a3;
- (void)setHolidayNodes:(id)a3;
- (void)setMeaningNodes:(id)a3;
- (void)setMomentIdentifiers:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setNumberOfAssets:(unint64_t)a3;
- (void)setNumberOfAssetsBySceneNode:(id)a3;
- (void)setNumberOfMoments:(unint64_t)a3;
- (void)setOptionsByDomain:(id)a3;
- (void)setPersonNodes:(id)a3;
- (void)setPoiNodes:(id)a3;
- (void)setPublicEventCategoryNodes:(id)a3;
- (void)setPublicEventNodes:(id)a3;
- (void)setPublicEventPerformerNodes:(id)a3;
- (void)setRoiNodes:(id)a3;
- (void)setSceneNodes:(id)a3;
- (void)setStateNodes:(id)a3;
@end

@implementation PGTextFeatureGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsByDomain, 0);
  objc_storeStrong((id *)&self->_publicEventCategoryNodes, 0);
  objc_storeStrong((id *)&self->_publicEventPerformerNodes, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_holidayNodes, 0);
  objc_storeStrong((id *)&self->_businessCategoryNodes, 0);
  objc_storeStrong((id *)&self->_businessNodes, 0);
  objc_storeStrong((id *)&self->_areaNodes, 0);
  objc_storeStrong((id *)&self->_countryNodes, 0);
  objc_storeStrong((id *)&self->_stateNodes, 0);
  objc_storeStrong((id *)&self->_cityNodes, 0);
  objc_storeStrong((id *)&self->_districtNodes, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_sceneNodes, 0);
  objc_storeStrong((id *)&self->_numberOfAssetsBySceneNode, 0);
  objc_storeStrong((id *)&self->_momentIdentifiers, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

- (void)setOptionsByDomain:(id)a3
{
}

- (NSDictionary)optionsByDomain
{
  return self->_optionsByDomain;
}

- (void)setPublicEventCategoryNodes:(id)a3
{
}

- (NSCountedSet)publicEventCategoryNodes
{
  return self->_publicEventCategoryNodes;
}

- (void)setPublicEventPerformerNodes:(id)a3
{
}

- (NSCountedSet)publicEventPerformerNodes
{
  return self->_publicEventPerformerNodes;
}

- (void)setPublicEventNodes:(id)a3
{
}

- (NSCountedSet)publicEventNodes
{
  return self->_publicEventNodes;
}

- (void)setHolidayNodes:(id)a3
{
}

- (NSCountedSet)holidayNodes
{
  return self->_holidayNodes;
}

- (void)setBusinessCategoryNodes:(id)a3
{
}

- (NSCountedSet)businessCategoryNodes
{
  return self->_businessCategoryNodes;
}

- (void)setBusinessNodes:(id)a3
{
}

- (NSCountedSet)businessNodes
{
  return self->_businessNodes;
}

- (void)setAreaNodes:(id)a3
{
}

- (NSCountedSet)areaNodes
{
  return self->_areaNodes;
}

- (void)setCountryNodes:(id)a3
{
}

- (NSCountedSet)countryNodes
{
  return self->_countryNodes;
}

- (void)setStateNodes:(id)a3
{
}

- (NSCountedSet)stateNodes
{
  return self->_stateNodes;
}

- (void)setCityNodes:(id)a3
{
}

- (NSCountedSet)cityNodes
{
  return self->_cityNodes;
}

- (void)setDistrictNodes:(id)a3
{
}

- (NSCountedSet)districtNodes
{
  return self->_districtNodes;
}

- (void)setMeaningNodes:(id)a3
{
}

- (NSCountedSet)meaningNodes
{
  return self->_meaningNodes;
}

- (void)setPoiNodes:(id)a3
{
}

- (NSCountedSet)poiNodes
{
  return self->_poiNodes;
}

- (void)setRoiNodes:(id)a3
{
}

- (NSCountedSet)roiNodes
{
  return self->_roiNodes;
}

- (void)setPersonNodes:(id)a3
{
}

- (NSCountedSet)personNodes
{
  return self->_personNodes;
}

- (void)setSceneNodes:(id)a3
{
}

- (NSCountedSet)sceneNodes
{
  return self->_sceneNodes;
}

- (void)setNumberOfAssetsBySceneNode:(id)a3
{
}

- (NSMapTable)numberOfAssetsBySceneNode
{
  return self->_numberOfAssetsBySceneNode;
}

- (void)setNumberOfAssets:(unint64_t)a3
{
  self->_numberOfAssets = a3;
}

- (unint64_t)numberOfAssets
{
  return self->_numberOfAssets;
}

- (void)setNumberOfMoments:(unint64_t)a3
{
  self->_numberOfMoments = a3;
}

- (unint64_t)numberOfMoments
{
  return self->_numberOfMoments;
}

- (void)setMomentIdentifiers:(id)a3
{
}

- (NSMutableSet)momentIdentifiers
{
  return self->_momentIdentifiers;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (id)_sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v7 = +[PGTextFeature vipTextFeatureTypes];
  v27 = [v6 setWithArray:v7];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v13 origin] != 1
          || (objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "type")),
              v14 = objc_claimAutoreleasedReturnValue(),
              char v15 = [v27 containsObject:v14],
              v14,
              v16 = v4,
              (v15 & 1) == 0))
        {
          v16 = v5;
        }
        [v16 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v10);
  }

  v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"weight" ascending:0];
  v33[0] = v17;
  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"string" ascending:1];
  v33[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  v20 = [v4 sortedArrayUsingDescriptors:v19];

  v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"weight" ascending:0];
  v32[0] = v21;
  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"string" ascending:1];
  v32[1] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v24 = [v5 sortedArrayUsingDescriptors:v23];

  v25 = [v20 arrayByAddingObjectsFromArray:v24];

  return v25;
}

- (id)_textFeaturesForPersonNodes:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", a3);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_personNodes;
  uint64_t v6 = [(NSCountedSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v11 = (double)-[NSCountedSet countForObject:](self->_personNodes, "countForObject:", v10, (void)v16)
            / (double)self->_numberOfMoments;
        v12 = [(PGTextFeatureGenerator *)self _textFeaturesForNode:v10 type:3 weight:v11];
        [v4 unionSet:v12];
        v13 = [v10 localIdentifier];
        if ([v13 length])
        {
          v14 = +[PGTextFeature textFeaturesFromString:v13 type:3 weight:0 options:v11];
          [v4 unionSet:v14];
        }
      }
      uint64_t v7 = [(NSCountedSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_textFeaturesForNode:(id)a3 type:(unint64_t)a4 weight:(double)a5
{
  optionsByDomain = self->_optionsByDomain;
  uint64_t v9 = NSNumber;
  id v10 = a3;
  double v11 = [v9 numberWithUnsignedInteger:a4];
  v12 = [(NSDictionary *)optionsByDomain objectForKeyedSubscript:v11];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = +[PGTextFeature textFeaturesFromNode:v10 type:a4 weight:v13 options:self->_locationHelper locationHelper:a5];

  return v14;
}

- (id)_textFeaturesForNodes:(id)a3 type:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", *(void *)(*((void *)&v15 + 1) + 8 * i), a4, (float)((float)(unint64_t)objc_msgSend(v8, "countForObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15)/ (float)self->_numberOfMoments));
        [v7 unionSet:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)bestTextFeaturesFromTextFeatures:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v12 = [v11 string];
        uint64_t v13 = [v4 objectForKeyedSubscript:v12];
        if (v13)
        {
          v14 = (void *)v13;
          [v5 addObject:v12];
          [v14 addObject:v11];
        }
        else
        {
          v14 = [MEMORY[0x1E4F1CA80] setWithObject:v11];
          [v4 setObject:v14 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v8);
  }

  long long v15 = [MEMORY[0x1E4F1CA80] setWithSet:v6];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * j)];
        v22 = +[PGTextFeature mergedTextFeatureFromTextFeatures:v21];
        [v15 minusSet:v21];
        if (v22) {
          [v15 addObject:v22];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  uint64_t v23 = [v15 count];
  unint64_t v24 = [(PGTextFeatureGenerator *)self maximumNumberOfTextFeaturesPerEvent];
  BOOL v41 = [(PGTextFeatureGenerator *)self boundTextFeaturesPerEvent];
  unint64_t v42 = v24;
  v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v24];
  v26 = [(PGTextFeatureGenerator *)self _sortedTextFeaturesUsingWeightAndTypeFromTextFeatures:v15];
  if (v23)
  {
    uint64_t v28 = v23;
    unint64_t v29 = 0;
    *(void *)&long long v27 = 138412290;
    long long v38 = v27;
    v40 = v25;
    while (1)
    {
      long long v30 = objc_msgSend(v26, "objectAtIndexedSubscript:", v29, v38);
      long long v31 = v30;
      if (v29 < v42) {
        break;
      }
      if (!v41)
      {
        [v30 markAsStrippedOut];
        uint64_t v32 = objc_msgSend(MEMORY[0x1E4F39320], "pg_textFeatureForFeature:", v31);
        if (v32)
        {
LABEL_28:
          uint64_t v35 = (void *)v32;
          [v25 addObject:v32];
LABEL_31:

          goto LABEL_32;
        }
        v36 = +[PGLogging sharedLogging];
        v34 = [v36 loggingConnection];

        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
LABEL_30:

          uint64_t v35 = 0;
          v25 = v40;
          goto LABEL_31;
        }
LABEL_34:
        *(_DWORD *)buf = v38;
        v52 = v31;
        _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "Failure generating PHTextFeature from PGTextFeature %@", buf, 0xCu);
        goto LABEL_30;
      }
LABEL_32:

      if (v28 == ++v29) {
        goto LABEL_35;
      }
    }
    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F39320], "pg_textFeatureForFeature:", v30);
    if (v32) {
      goto LABEL_28;
    }
    v33 = +[PGLogging sharedLogging];
    v34 = [v33 loggingConnection];

    if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      goto LABEL_30;
    }
    goto LABEL_34;
  }
LABEL_35:

  return v25;
}

- (id)generateTextFeatures
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (self->_numberOfAssets)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v4 = self->_numberOfAssetsBySceneNode;
    uint64_t v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v62 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v10 = [(NSMapTable *)self->_numberOfAssetsBySceneNode objectForKey:v9];
          uint64_t v11 = -[PGTextFeatureGenerator _textFeaturesForNode:type:weight:](self, "_textFeaturesForNode:type:weight:", v9, 18, (double)(unint64_t)[v10 unsignedIntegerValue] / (double)self->_numberOfAssets);
          [v3 unionSet:v11];
        }
        uint64_t v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v6);
    }

    uint64_t v52 = [(PGTextFeatureGenerator *)self _textFeaturesForPersonNodes:self->_personNodes];
    objc_msgSend(v3, "unionSet:");
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v12 = self->_roiNodes;
    uint64_t v13 = [(NSCountedSet *)v12 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v58 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          uint64_t v18 = [v17 label];
          char v19 = [v18 isEqualToString:@"Urban"];

          if ((v19 & 1) == 0)
          {
            uint64_t v20 = [(PGTextFeatureGenerator *)self _textFeaturesForNode:v17 type:9 weight:(float)((float)[(NSCountedSet *)self->_roiNodes countForObject:v17]/ (float)self->_numberOfMoments)];
            [v3 unionSet:v20];
          }
        }
        uint64_t v14 = [(NSCountedSet *)v12 countByEnumeratingWithState:&v57 objects:v68 count:16];
      }
      while (v14);
    }

    v51 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_poiNodes type:10];
    objc_msgSend(v3, "unionSet:");
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v21 = self->_meaningNodes;
    uint64_t v22 = [(NSCountedSet *)v21 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v54;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v53 + 1) + 8 * k);
          unint64_t v27 = [(NSCountedSet *)self->_meaningNodes countForObject:v26];
          char v28 = [v26 isVeryMeaningful];
          float v29 = 1.0;
          if ((v28 & 1) == 0) {
            float v29 = (float)v27 / (float)self->_numberOfMoments;
          }
          long long v30 = [(PGTextFeatureGenerator *)self _textFeaturesForNode:v26 type:13 weight:v29];
          [v3 unionSet:v30];
        }
        uint64_t v23 = [(NSCountedSet *)v21 countByEnumeratingWithState:&v53 objects:v67 count:16];
      }
      while (v23);
    }

    long long v50 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_districtNodes type:19];
    objc_msgSend(v3, "unionSet:");
    long long v49 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_cityNodes type:4];
    objc_msgSend(v3, "unionSet:");
    long long v31 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_stateNodes type:5];
    [v3 unionSet:v31];
    uint64_t v32 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_countryNodes type:6];
    [v3 unionSet:v32];
    v33 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_areaNodes type:20];
    [v3 unionSet:v33];
    v34 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_businessNodes type:17];
    [v3 unionSet:v34];
    if ((unint64_t)[(NSCountedSet *)self->_businessCategoryNodes count] > 3)
    {
      long long v38 = +[PGLogging sharedLogging];
      uint64_t v35 = [v38 loggingConnection];

      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        businessCategoryNodes = self->_businessCategoryNodes;
        *(_DWORD *)buf = 138412290;
        v66 = businessCategoryNodes;
        _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring business categories (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v35 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_businessCategoryNodes type:24];
      [v3 unionSet:v35];
    }

    v40 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_holidayNodes type:15];
    [v3 unionSet:v40];
    BOOL v41 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_publicEventNodes type:21];
    [v3 unionSet:v41];
    if ((unint64_t)[(NSCountedSet *)self->_publicEventPerformerNodes count] > 3)
    {
      long long v43 = +[PGLogging sharedLogging];
      unint64_t v42 = [v43 loggingConnection];

      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        publicEventPerformerNodes = self->_publicEventPerformerNodes;
        *(_DWORD *)buf = 138412290;
        v66 = publicEventPerformerNodes;
        _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring performers (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      unint64_t v42 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_publicEventPerformerNodes type:26];
      [v3 unionSet:v42];
    }

    if ((unint64_t)[(NSCountedSet *)self->_publicEventCategoryNodes count] > 3)
    {
      long long v46 = +[PGLogging sharedLogging];
      long long v45 = [v46 loggingConnection];

      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        publicEventCategoryNodes = self->_publicEventCategoryNodes;
        *(_DWORD *)buf = 138412290;
        v66 = publicEventCategoryNodes;
        _os_log_impl(&dword_1D1805000, v45, OS_LOG_TYPE_INFO, "PHSuggestion text features generation: ignoring public event categories (too many) : %@", buf, 0xCu);
      }
    }
    else
    {
      long long v45 = [(PGTextFeatureGenerator *)self _textFeaturesForNodes:self->_publicEventCategoryNodes type:25];
      [v3 unionSet:v45];
    }

    v37 = v52;
  }
  else
  {
    v36 = +[PGLogging sharedLogging];
    v37 = [v36 loggingConnection];

    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v37, OS_LOG_TYPE_ERROR, "Can't generate text features from no assets", buf, 2u);
    }
  }

  return v3;
}

- (void)analyzeMomentNodes
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = self->_momentNodes;
  uint64_t v27 = [(NSSet *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v47;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(obj);
        }
        v4 = *(void **)(*((void *)&v46 + 1) + 8 * v3);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke;
        v45[3] = &unk_1E68EF0C0;
        v45[4] = self;
        [v4 enumerateSceneEdgesAndNodesUsingBlock:v45];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_2;
        v44[3] = &unk_1E68EF528;
        v44[4] = self;
        [v4 enumeratePersonNodesUsingBlock:v44];
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_3;
        v43[3] = &unk_1E68ED8D0;
        v43[4] = self;
        [v4 enumerateROINodesUsingBlock:v43];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_4;
        v42[3] = &unk_1E68ED8A8;
        v42[4] = self;
        [v4 enumeratePOINodesUsingBlock:v42];
        uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Entertainment", @"Activity", 0);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_5;
        v39[3] = &unk_1E68E9AB0;
        id v40 = v6;
        id v41 = v5;
        id v28 = v5;
        id v29 = v6;
        [v4 enumerateReliableMeaningNodesUsingBlock:v39];
        uint64_t v7 = [(PGTextFeatureGenerator *)self meaningNodes];
        [v7 unionSet:v28];

        uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
        v12 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v13 = [v4 collection];
        uint64_t v14 = [v13 addressNodes];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        void v33[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_6;
        v33[3] = &unk_1E68E8288;
        id v34 = v8;
        id v35 = v9;
        id v36 = v10;
        id v37 = v11;
        id v38 = v12;
        id v15 = v12;
        id v16 = v11;
        id v17 = v10;
        id v18 = v9;
        id v19 = v8;
        [v14 enumerateIdentifiersAsCollectionsWithBlock:v33];

        uint64_t v20 = [(PGTextFeatureGenerator *)self districtNodes];
        [v20 unionSet:v19];

        uint64_t v21 = [(PGTextFeatureGenerator *)self cityNodes];
        [v21 unionSet:v18];

        uint64_t v22 = [(PGTextFeatureGenerator *)self stateNodes];
        [v22 unionSet:v17];

        uint64_t v23 = [(PGTextFeatureGenerator *)self countryNodes];
        [v23 unionSet:v16];

        uint64_t v24 = [(PGTextFeatureGenerator *)self areaNodes];
        [v24 unionSet:v15];

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        void v32[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_7;
        v32[3] = &unk_1E68ED8F8;
        v32[4] = self;
        [v4 enumerateBusinessNodesUsingBlock:v32];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_9;
        v31[3] = &unk_1E68ED880;
        v31[4] = self;
        [v4 enumerateDateNodesUsingBlock:v31];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_11;
        v30[3] = &unk_1E68ED920;
        v30[4] = self;
        [v4 enumeratePublicEventNodesUsingBlock:v30];

        ++v3;
      }
      while (v27 != v3);
      uint64_t v27 = [(NSSet *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v27);
  }
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v5 isIndexed]
    && [v5 isSuitableForSuggestions]
    && [v12 isReliable])
  {
    uint64_t v6 = [v12 numberOfAssets];
    uint64_t v7 = [*(id *)(a1 + 32) numberOfAssetsBySceneNode];
    uint64_t v8 = [v7 objectForKey:v5];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "unsignedIntegerValue") + v6);
    }
    else
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:v6];
    }
    uint64_t v10 = [*(id *)(a1 + 32) numberOfAssetsBySceneNode];
    [v10 setObject:v9 forKey:v5];

    uint64_t v11 = [*(id *)(a1 + 32) sceneNodes];
    [v11 addObject:v5];
  }
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isMeNode] & 1) == 0)
  {
    uint64_t v3 = [v6 name];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) personNodes];
      [v5 addObject:v6];
    }
  }
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 roiNodes];
  [v4 addObject:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 poiNodes];
  [v4 addObject:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  id v5 = [v3 label];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v10];
  }
  id v6 = [v10 parentMeaningNode];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v6 label];
    LOBYTE(v8) = [v8 containsObject:v9];

    if ((v8 & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_6(id *a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  id v4 = [v14 districtNodes];
  id v5 = [v4 anyNode];

  if (v5) {
    [a1[4] addObject:v5];
  }
  id v6 = [v14 cityNodes];
  uint64_t v7 = [v6 anyNode];

  if (v7) {
    [a1[5] addObject:v7];
  }
  uint64_t v8 = [v14 stateNodes];
  uint64_t v9 = [v8 anyNode];

  if (v9) {
    [a1[6] addObject:v9];
  }
  id v10 = [v14 countryNodes];
  uint64_t v11 = [v10 anyNode];

  if (v11) {
    [a1[7] addObject:v11];
  }
  id v12 = [v14 areaNodes];
  uint64_t v13 = [v12 temporarySet];

  [a1[8] unionSet:v13];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 businessNodes];
  [v5 addObject:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_8;
  v6[3] = &unk_1E68E9F80;
  v6[4] = *(void *)(a1 + 32);
  [v4 enumerateBusinessCategoryNodesUsingBlock:v6];
}

uint64_t __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_9(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_10;
  v3[3] = &unk_1E68EF038;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateHolidayNodesUsingBlock:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 publicEventNodes];
  [v5 addObject:v4];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_12;
  v7[3] = &unk_1E68ED410;
  v7[4] = *(void *)(a1 + 32);
  [v4 enumeratePublicEventCategoryNodesUsingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_13;
  v6[3] = &unk_1E68E82B0;
  v6[4] = *(void *)(a1 + 32);
  [v4 enumeratePerformerNodesUsingBlock:v6];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_12(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 publicEventCategoryNodes];
  [v4 addObject:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_13(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 publicEventPerformerNodes];
  [v4 addObject:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_10(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 holidayNodes];
  [v4 addObject:v3];
}

void __44__PGTextFeatureGenerator_analyzeMomentNodes__block_invoke_8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 businessCategoryNodes];
  [v4 addObject:v3];
}

- (id)naturalLanguageFeatures
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _naturalLanguageOptionsByDomain];
  [(PGTextFeatureGenerator *)self setOptionsByDomain:v3];

  if (!self->_numberOfMoments)
  {
    id v12 = +[PGLogging sharedLogging];
    id v4 = [v12 loggingConnection];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1D1805000, v4, OS_LOG_TYPE_ERROR, "Cannot generate natural language features with no moment nodes", (uint8_t *)&v17, 2u);
    }
    goto LABEL_11;
  }
  [(PGTextFeatureGenerator *)self analyzeMomentNodes];
  id v4 = [(PGTextFeatureGenerator *)self generateTextFeatures];
  uint64_t v5 = [v4 count];
  if (!v5)
  {
    uint64_t v13 = +[PGLogging sharedLogging];
    id v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      momentNodes = self->_momentNodes;
      int v17 = 138477827;
      uint64_t v18 = (uint64_t)momentNodes;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "No text features were generated from moments %{private}@", (uint8_t *)&v17, 0xCu);
    }

LABEL_11:
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(PGTextFeatureGenerator *)self bestTextFeaturesFromTextFeatures:v4];
  uint64_t v8 = +[PGLogging sharedLogging];
  uint64_t v9 = [v8 loggingConnection];

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v7 count];
    uint64_t v11 = self->_momentNodes;
    int v17 = 134218498;
    uint64_t v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v6;
    __int16 v21 = 2112;
    uint64_t v22 = v11;
    _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "%lu out of %lu text teatures are saved for moments %@", (uint8_t *)&v17, 0x20u);
  }

  [(PGTextFeatureGenerator *)self _resetProperties];
LABEL_12:

  return v7;
}

- (id)knowledgeFeatures
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _knowledgeOptionsByDomain];
  [(PGTextFeatureGenerator *)self setOptionsByDomain:v3];

  if (!self->_numberOfMoments)
  {
    uint64_t v11 = +[PGLogging sharedLogging];
    id v4 = [v11 loggingConnection];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v4, OS_LOG_TYPE_ERROR, "Cannot generate text features with no moment nodes", buf, 2u);
    }
    goto LABEL_18;
  }
  [(PGTextFeatureGenerator *)self analyzeMomentNodes];
  id v4 = [(PGTextFeatureGenerator *)self generateTextFeatures];
  if (![v4 count])
  {
    id v12 = +[PGLogging sharedLogging];
    uint64_t v13 = [v12 loggingConnection];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      momentNodes = self->_momentNodes;
      *(_DWORD *)buf = 138477827;
      uint64_t v22 = momentNodes;
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "No text features were generated from moments %{private}@", buf, 0xCu);
    }

LABEL_18:
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  uint64_t v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39320], "pg_textFeatureForFeature:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(PGTextFeatureGenerator *)self _resetProperties];
LABEL_19:

  return v5;
}

- (BOOL)boundTextFeaturesPerEvent
{
  return +[PGUserDefaults boundTextFeaturesPerEvent];
}

- (unint64_t)maximumNumberOfTextFeaturesPerEvent
{
  return +[PGUserDefaults maximumNumberOfTextFeaturesPerEvent];
}

- (void)_resetProperties
{
  id v3 = (NSMapTable *)objc_alloc_init(MEMORY[0x1E4F28E10]);
  numberOfAssetsBySceneNode = self->_numberOfAssetsBySceneNode;
  self->_numberOfAssetsBySceneNode = v3;

  uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
  sceneNodes = self->_sceneNodes;
  self->_sceneNodes = v5;

  uint64_t v7 = [MEMORY[0x1E4F28BD0] set];
  personNodes = self->_personNodes;
  self->_personNodes = v7;

  uint64_t v9 = [MEMORY[0x1E4F28BD0] set];
  roiNodes = self->_roiNodes;
  self->_roiNodes = v9;

  uint64_t v11 = [MEMORY[0x1E4F28BD0] set];
  poiNodes = self->_poiNodes;
  self->_poiNodes = v11;

  uint64_t v13 = [MEMORY[0x1E4F28BD0] set];
  meaningNodes = self->_meaningNodes;
  self->_meaningNodes = v13;

  id v15 = [MEMORY[0x1E4F28BD0] set];
  districtNodes = self->_districtNodes;
  self->_districtNodes = v15;

  long long v17 = [MEMORY[0x1E4F28BD0] set];
  cityNodes = self->_cityNodes;
  self->_cityNodes = v17;

  long long v19 = [MEMORY[0x1E4F28BD0] set];
  stateNodes = self->_stateNodes;
  self->_stateNodes = v19;

  __int16 v21 = [MEMORY[0x1E4F28BD0] set];
  countryNodes = self->_countryNodes;
  self->_countryNodes = v21;

  uint64_t v23 = [MEMORY[0x1E4F28BD0] set];
  areaNodes = self->_areaNodes;
  self->_areaNodes = v23;

  v25 = [MEMORY[0x1E4F28BD0] set];
  businessNodes = self->_businessNodes;
  self->_businessNodes = v25;

  uint64_t v27 = [MEMORY[0x1E4F28BD0] set];
  businessCategoryNodes = self->_businessCategoryNodes;
  self->_businessCategoryNodes = v27;

  id v29 = [MEMORY[0x1E4F28BD0] set];
  holidayNodes = self->_holidayNodes;
  self->_holidayNodes = v29;

  long long v31 = [MEMORY[0x1E4F28BD0] set];
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v31;

  v33 = [MEMORY[0x1E4F28BD0] set];
  publicEventPerformerNodes = self->_publicEventPerformerNodes;
  self->_publicEventPerformerNodes = v33;

  id v35 = [MEMORY[0x1E4F28BD0] set];
  publicEventCategoryNodes = self->_publicEventCategoryNodes;
  self->_publicEventCategoryNodes = v35;
}

- (PGTextFeatureGenerator)initWithMomentNodes:(id)a3 graph:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PGTextFeatureGenerator;
  uint64_t v9 = [(PGTextFeatureGenerator *)&v29 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_momentNodes, a3);
    uint64_t v11 = [[PGGraphLocationHelper alloc] initWithGraph:v8];
    locationHelper = v10->_locationHelper;
    v10->_locationHelper = v11;

    uint64_t v13 = [v7 count];
    v10->_numberOfMoments = v13;
    uint64_t v14 = [MEMORY[0x1E4F1CA80] setWithCapacity:v13];
    momentIdentifiers = v10->_momentIdentifiers;
    v10->_momentIdentifiers = (NSMutableSet *)v14;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          __int16 v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v10->_numberOfAssets += objc_msgSend(v21, "numberOfAssets", (void)v25);
          uint64_t v22 = v10->_momentIdentifiers;
          uint64_t v23 = [v21 localIdentifier];
          [(NSMutableSet *)v22 addObject:v23];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v18);
    }

    [(PGTextFeatureGenerator *)v10 _resetProperties];
  }

  return v10;
}

+ (id)_knowledgeOptionsByDomain
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F28D1938;
  v4[1] = &unk_1F28D1968;
  v5[0] = &unk_1F28D1AE8;
  v5[1] = &unk_1F28D1AE8;
  v4[2] = &unk_1F28D1998;
  v4[3] = &unk_1F28D19B0;
  v5[2] = &unk_1F28D1AE8;
  v5[3] = &unk_1F28D1AE8;
  v4[4] = &unk_1F28D19C8;
  v4[5] = &unk_1F28D19E0;
  v5[4] = &unk_1F28D1AE8;
  v5[5] = &unk_1F28D1AE8;
  v4[6] = &unk_1F28D1980;
  v4[7] = &unk_1F28D1A10;
  v5[6] = &unk_1F28D1AE8;
  v5[7] = &unk_1F28D1AE8;
  v4[8] = &unk_1F28D1A28;
  v4[9] = &unk_1F28D1A40;
  v5[8] = &unk_1F28D1AE8;
  v5[9] = &unk_1F28D1AE8;
  v4[10] = &unk_1F28D1A58;
  v4[11] = &unk_1F28D1A70;
  v5[10] = &unk_1F28D1AE8;
  v5[11] = &unk_1F28D1AE8;
  v4[12] = &unk_1F28D1A88;
  v4[13] = &unk_1F28D1AA0;
  v5[12] = &unk_1F28D1AE8;
  v5[13] = &unk_1F28D1AE8;
  v4[14] = &unk_1F28D1AB8;
  v4[15] = &unk_1F28D1AD0;
  v5[14] = &unk_1F28D1AE8;
  v5[15] = &unk_1F28D1AE8;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

+ (id)_naturalLanguageOptionsByDomain
{
  v5[16] = *MEMORY[0x1E4F143B8];
  v4[0] = &unk_1F28D1938;
  v4[1] = &unk_1F28D1968;
  v5[0] = &unk_1F28D1950;
  v5[1] = &unk_1F28D1980;
  v4[2] = &unk_1F28D1998;
  v4[3] = &unk_1F28D19B0;
  v5[2] = &unk_1F28D1950;
  v5[3] = &unk_1F28D1950;
  v4[4] = &unk_1F28D19C8;
  v4[5] = &unk_1F28D19E0;
  v5[4] = &unk_1F28D1950;
  v5[5] = &unk_1F28D19F8;
  v4[6] = &unk_1F28D1980;
  v4[7] = &unk_1F28D1A10;
  v5[6] = &unk_1F28D19F8;
  v5[7] = &unk_1F28D19F8;
  v4[8] = &unk_1F28D1A28;
  v4[9] = &unk_1F28D1A40;
  v5[8] = &unk_1F28D19F8;
  v5[9] = &unk_1F28D19F8;
  v4[10] = &unk_1F28D1A58;
  v4[11] = &unk_1F28D1A70;
  v5[10] = &unk_1F28D19F8;
  v5[11] = &unk_1F28D1A70;
  v4[12] = &unk_1F28D1A88;
  v4[13] = &unk_1F28D1AA0;
  v5[12] = &unk_1F28D19F8;
  v5[13] = &unk_1F28D19F8;
  v4[14] = &unk_1F28D1AB8;
  v4[15] = &unk_1F28D1AD0;
  v5[14] = &unk_1F28D19F8;
  v5[15] = &unk_1F28D1A70;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:16];
  return v2;
}

@end