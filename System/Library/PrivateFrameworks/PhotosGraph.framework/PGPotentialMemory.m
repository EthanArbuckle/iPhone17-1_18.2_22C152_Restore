@interface PGPotentialMemory
- (BOOL)generatedWithFallbackRequirements;
- (CLLocation)location;
- (NSDate)localDate;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDate)universalEndDate;
- (NSDate)universalStartDate;
- (NSDictionary)numberOfAssetsByMomentIDs;
- (NSSet)features;
- (NSSet)momentIDs;
- (NSSet)momentNodes;
- (NSSet)peopleUUIDs;
- (NSString)eventName;
- (PGGraphMomentNode)momentNode;
- (PGGraphMomentNodeCollection)memoryMomentNodes;
- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4;
- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNode:(id)a5;
- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNodes:(id)a5 sourceType:(int64_t)a6;
- (PHAssetCollection)assetCollection;
- (double)computeContentScore;
- (double)contentScore;
- (double)score;
- (id)buildAssetCollectionUsingMemoryController:(id)a3 withMinimumNumberOfAssets:(unint64_t)a4;
- (id)memoryFeatureNodesInGraph:(id)a3;
- (int64_t)sourceType;
- (unint64_t)category;
- (unint64_t)memoryCategory;
- (unint64_t)memoryCategorySubcategory;
- (unint64_t)subcategory;
- (void)_prepareForOverlapCheck;
- (void)_resetOverlapCheck;
- (void)setAssetCollection:(id)a3;
- (void)setCategory:(unint64_t)a3;
- (void)setContentScore:(double)a3;
- (void)setEventName:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setLocalDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMomentNode:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setPeopleUUIDs:(id)a3;
- (void)setScore:(double)a3;
- (void)setSourceType:(int64_t)a3;
- (void)setSubcategory:(unint64_t)a3;
@end

@implementation PGPotentialMemory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfAssetsByMomentIDs, 0);
  objc_storeStrong((id *)&self->_momentIDs, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_universalEndDate, 0);
  objc_storeStrong((id *)&self->_universalStartDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_peopleUUIDs, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_localDate, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_momentNode, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (NSDictionary)numberOfAssetsByMomentIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (NSSet)momentIDs
{
  return (NSSet *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)generatedWithFallbackRequirements
{
  return self->_generatedWithFallbackRequirements;
}

- (unint64_t)memoryCategorySubcategory
{
  return self->_memoryCategorySubcategory;
}

- (void)setFeatures:(id)a3
{
}

- (NSSet)features
{
  return self->_features;
}

- (void)setContentScore:(double)a3
{
  self->_contentScore = a3;
}

- (double)contentScore
{
  return self->_contentScore;
}

- (void)setEventName:(id)a3
{
}

- (NSString)eventName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPeopleUUIDs:(id)a3
{
}

- (NSSet)peopleUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocalDate:(id)a3
{
}

- (NSDate)localDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setSubcategory:(unint64_t)a3
{
  self->_subcategory = a3;
}

- (unint64_t)subcategory
{
  return self->_subcategory;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setSourceType:(int64_t)a3
{
  self->_sourceType = a3;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (void)setMomentNode:(id)a3
{
}

- (PGGraphMomentNode)momentNode
{
  return (PGGraphMomentNode *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAssetCollection:(id)a3
{
}

- (PHAssetCollection)assetCollection
{
  return (PHAssetCollection *)objc_getProperty(self, a2, 16, 1);
}

- (PGGraphMomentNodeCollection)memoryMomentNodes
{
  if ([(PGPotentialMemory *)self sourceType] == 1 && self->_momentNode)
  {
    v3 = [(PGPotentialMemory *)self momentNode];
    v4 = [v3 collection];
  }
  else
  {
    v5 = [PGGraphMomentNodeCollection alloc];
    momentNodes = self->_momentNodes;
    v3 = [(NSSet *)momentNodes anyObject];
    v7 = [v3 graph];
    v4 = [(MAElementCollection *)v5 initWithSet:momentNodes graph:v7];
  }
  return v4;
}

- (id)memoryFeatureNodesInGraph:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = NSStringFromSelector(a2);
  v11 = [v7 stringWithFormat:@"%@ must implement %@", v9, v10];
  v12 = (void *)[v5 initWithName:v6 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (unint64_t)memoryCategory
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA00]);
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSString;
  uint64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [v5 stringWithFormat:@"%@ must implement %@", v7, v8];
  v10 = (void *)[v3 initWithName:v4 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)buildAssetCollectionUsingMemoryController:(id)a3 withMinimumNumberOfAssets:(unint64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 photoLibrary];
  if (!a4)
  {
    v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v7];
    assetCollection = self->_assetCollection;
    self->_assetCollection = v11;

    v10 = self->_assetCollection;
    goto LABEL_41;
  }
  v8 = self->_momentNode;
  if (!v8)
  {
    momentNodes = self->_momentNodes;
    if (!momentNodes) {
      goto LABEL_31;
    }
    uint64_t v14 = [(NSSet *)momentNodes count];
    v15 = self->_momentNodes;
    if (v14 == 1)
    {
      v8 = [(NSSet *)v15 anyObject];
      if (v8) {
        goto LABEL_3;
      }
      v15 = self->_momentNodes;
    }
    if (v15)
    {
      unint64_t v36 = a4;
      v39 = v7;
      uint64_t v37 = MEMORY[0x1D25FED50]();
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v17 = [v6 curationManager];
      v45 = [v17 defaultAssetFetchOptionsForMemoriesWithoutPrefetch];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v38 = self;
      obuint64_t j = self->_momentNodes;
      uint64_t v44 = [(NSSet *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v44)
      {
        id v42 = v6;
        uint64_t v43 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v20 = (void *)MEMORY[0x1D25FED50]();
            v21 = [v19 uuid];
            uint64_t v22 = [v6 momentForMomentID:v21];
            if (!v22)
            {
              v34 = [v6 loggingConnection];
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1D1805000, v34, OS_LOG_TYPE_ERROR, "Memory Creation: Nil asset collection for momentNode, graph is out-of-sync with the photo library.", buf, 2u);
              }

              self = v38;
              v7 = v39;
              v30 = (void *)v37;

              goto LABEL_37;
            }
            v23 = (void *)v22;
            v24 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v22 options:v45];
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v48;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v48 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = [*(id *)(*((void *)&v47 + 1) + 8 * j) localIdentifier];
                  [v16 addObject:v29];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v55 count:16];
              }
              while (v26);
            }

            id v6 = v42;
          }
          uint64_t v44 = [(NSSet *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
          if (v44) {
            continue;
          }
          break;
        }
      }

      v30 = (void *)v37;
      self = v38;
      v7 = v39;
      if ([v16 count] >= v36)
      {
        uint64_t v31 = [v6 assetCollectionWithAssetLocalIdentifiers:v16];
        obja = v38->_assetCollection;
        v38->_assetCollection = (PHAssetCollection *)v31;
      }
LABEL_37:
    }
    else
    {
LABEL_31:
      v33 = [v6 loggingConnection];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1805000, v33, OS_LOG_TYPE_ERROR, "Memory Creation: buildAssetCollection called with no momentNode set.", buf, 2u);
      }
    }
    v8 = 0;
LABEL_39:
    v10 = self->_assetCollection;
    goto LABEL_40;
  }
LABEL_3:
  v9 = [(PGGraphMomentNode *)v8 uuid];
  if ([(PGGraphMomentNode *)v8 numberOfAssets] >= a4)
  {
    v32 = [v6 momentForMomentID:v9];
    if ([v32 estimatedAssetCount] >= a4) {
      objc_storeStrong((id *)&self->_assetCollection, v32);
    }

    goto LABEL_39;
  }

  v10 = 0;
LABEL_40:

LABEL_41:
  return v10;
}

- (double)computeContentScore
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  momentNode = self->_momentNode;
  if (momentNode)
  {
    [(PGGraphMomentNode *)momentNode contentScore];
LABEL_16:
    self->_contentScore = result;
    return result;
  }
  momentNodes = self->_momentNodes;
  if (momentNodes)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = momentNodes;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      double v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) contentScore];
          double v10 = v10 + v12;
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    else
    {
      double v10 = 0.0;
    }

    double result = v10 / (double)[(NSSet *)self->_momentNodes count];
    goto LABEL_16;
  }
  self->_contentScore = 0.0;
  BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  double result = 0.0;
  if (v13)
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Memory Creation: computeContentScore called with no momentNode set.", v14, 2u);
    return self->_contentScore;
  }
  return result;
}

- (void)_resetOverlapCheck
{
  momentIDs = self->_momentIDs;
  self->_momentIDs = 0;

  numberOfAssetsByMomentIDs = self->_numberOfAssetsByMomentIDs;
  self->_numberOfAssetsByMomentIDs = 0;
}

- (void)_prepareForOverlapCheck
{
  v34[2] = *MEMORY[0x1E4F143B8];
  momentNode = self->_momentNode;
  if (!momentNode)
  {
    NSUInteger v12 = [(NSSet *)self->_momentNodes count];
    BOOL v13 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v12];
    uint64_t v14 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v12];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v27 = self;
    long long v15 = self->_momentNodes;
    uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v22 = [v21 uuid];
          if (v22)
          {
            [(NSSet *)v13 addObject:v22];
            uint64_t v23 = [v21 numberOfAssets];
            v24 = [NSNumber numberWithUnsignedInteger:v23];
            [(NSDictionary *)v14 setObject:v24 forKeyedSubscript:v22];

            v18 += v23;
          }
        }
        uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v18 = 0;
    }

    uint64_t v25 = [NSNumber numberWithUnsignedInteger:v18];
    [(NSDictionary *)v14 setObject:v25 forKeyedSubscript:@"totalNumberOfAssets"];

    momentIDs = v27->_momentIDs;
    v27->_momentIDs = v13;
    uint64_t v4 = v13;

    numberOfAssetsByMomentIDs = v27->_numberOfAssetsByMomentIDs;
    v27->_numberOfAssetsByMomentIDs = v14;
    goto LABEL_16;
  }
  uint64_t v4 = [(PGGraphMomentNode *)momentNode uuid];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    id v6 = self->_momentIDs;
    self->_momentIDs = v5;

    unint64_t v7 = [(PGGraphMomentNode *)self->_momentNode numberOfAssets];
    v33[0] = v4;
    numberOfAssetsByMomentIDs = [NSNumber numberWithUnsignedInteger:v7];
    v33[1] = @"totalNumberOfAssets";
    v34[0] = numberOfAssetsByMomentIDs;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:v7];
    v34[1] = v9;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    v11 = self->_numberOfAssetsByMomentIDs;
    self->_numberOfAssetsByMomentIDs = v10;

LABEL_16:
  }
}

- (NSDate)universalEndDate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_universalEndDate = (id *)&self->_universalEndDate;
  if (!self->_universalEndDate)
  {
    if (self->_momentNode)
    {
      uint64_t v3 = [(PGGraphMomentNode *)self->_momentNode universalEndDate];
      id v4 = *p_universalEndDate;
      id *p_universalEndDate = (id)v3;
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = self->_momentNodes;
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "universalEndDate", (void)v15);
            v11 = v10;
            if (!*p_universalEndDate || (objc_msgSend(v10, "timeIntervalSinceDate:"), v12 > 0.0)) {
              objc_storeStrong(p_universalEndDate, v11);
            }

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
    }
  }
  id v13 = *p_universalEndDate;
  return (NSDate *)v13;
}

- (NSDate)universalStartDate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_universalStartDate = (id *)&self->_universalStartDate;
  if (!self->_universalStartDate)
  {
    if (self->_momentNode)
    {
      uint64_t v3 = [(PGGraphMomentNode *)self->_momentNode universalStartDate];
      id v4 = *p_universalStartDate;
      id *p_universalStartDate = (id)v3;
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = self->_momentNodes;
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v9), "universalStartDate", (void)v15);
            v11 = v10;
            if (!*p_universalStartDate || (objc_msgSend(v10, "timeIntervalSinceDate:"), v12 < 0.0)) {
              objc_storeStrong(p_universalStartDate, v11);
            }

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
    }
  }
  id v13 = *p_universalStartDate;
  return (NSDate *)v13;
}

- (NSDate)localEndDate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_localEndDate = (id *)&self->_localEndDate;
  if (!self->_localEndDate)
  {
    if (self->_momentNode)
    {
      uint64_t v3 = [(PGGraphMomentNode *)self->_momentNode localEndDate];
      id v4 = *p_localEndDate;
      id *p_localEndDate = (id)v3;
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = self->_momentNodes;
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "localEndDate", (void)v13);
            if (!*p_localEndDate
              || [MEMORY[0x1E4F76C68] compareDate:v10 toDate:*p_localEndDate toUnitGranularity:16] == 1)
            {
              objc_storeStrong(p_localEndDate, v10);
            }
          }
          uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
  id v11 = *p_localEndDate;
  return (NSDate *)v11;
}

- (NSDate)localStartDate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_localStartDate = (id *)&self->_localStartDate;
  if (!self->_localStartDate)
  {
    if (self->_momentNode)
    {
      uint64_t v3 = [(PGGraphMomentNode *)self->_momentNode localStartDate];
      id v4 = *p_localStartDate;
      id *p_localStartDate = (id)v3;
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = self->_momentNodes;
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "localStartDate", (void)v13);
            if (!*p_localStartDate
              || [MEMORY[0x1E4F76C68] compareDate:v10 toDate:*p_localStartDate toUnitGranularity:16] == -1)
            {
              objc_storeStrong(p_localStartDate, v10);
            }
          }
          uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
  id v11 = *p_localStartDate;
  return (NSDate *)v11;
}

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNodes:(id)a5 sourceType:(int64_t)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGPotentialMemory;
  double v12 = [(PGPotentialMemory *)&v15 init];
  long long v13 = v12;
  if (v12)
  {
    v12->_category = a3;
    v12->_subcategory = a4;
    v12->_sourceType = a6;
    objc_storeStrong((id *)&v12->_momentNodes, a5);
    v13->_score = -1.0;
    v13->_contentScore = -1.0;
  }

  return v13;
}

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4 momentNode:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PGPotentialMemory;
  double v10 = [(PGPotentialMemory *)&v13 init];
  id v11 = v10;
  if (v10)
  {
    v10->_category = a3;
    v10->_subcategory = a4;
    v10->_sourceType = 1;
    objc_storeStrong((id *)&v10->_momentNode, a5);
    v11->_score = -1.0;
    v11->_contentScore = -1.0;
  }

  return v11;
}

- (PGPotentialMemory)initWithCategory:(unint64_t)a3 subcategory:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PGPotentialMemory;
  double result = [(PGPotentialMemory *)&v7 init];
  if (result)
  {
    result->_category = a3;
    result->_subcategory = a4;
    result->_score = -1.0;
    result->_contentScore = -1.0;
  }
  return result;
}

@end