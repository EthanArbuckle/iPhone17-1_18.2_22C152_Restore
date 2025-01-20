@interface FCLocalAreasMapping
+ (BOOL)supportsSecureCoding;
- (FCLocalAreasMapping)init;
- (FCLocalAreasMapping)initWithCoder:(id)a3;
- (FCLocalAreasMapping)initWithData:(id)a3;
- (NSArray)areas;
- (NSData)data;
- (NSDictionary)regionMap;
- (id)areasForLocation:(id)a3;
- (id)autoFavoriteTagIDsForLocation:(id)a3;
- (id)autoFavoriteTagIDsForLocation:(id)a3 searchOption:(unint64_t)a4;
- (id)filterOuterRegions:(id)a3;
- (id)regionsForLocation:(id)a3;
- (id)tagIDsForLocation:(id)a3 searchOption:(unint64_t)a4;
- (unint64_t)count;
- (void)encodeWithCoder:(id)a3;
- (void)setAreas:(id)a3;
- (void)setData:(id)a3;
- (void)setRegionMap:(id)a3;
@end

@implementation FCLocalAreasMapping

- (FCLocalAreasMapping)initWithData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FCLocalAreasMapping;
  v5 = [(FCLocalAreasMapping *)&v42 init];
  v6 = v5;
  if (v4 && v5)
  {
    id v30 = v4;
    v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:0];
    v8 = FCAppConfigurationArrayValueWithDefaultValue(v7, @"regions", 0);
    v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_132);

    v10 = (void *)MEMORY[0x1E4F1C9E8];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __36__FCLocalAreasMapping_initWithData___block_invoke_2;
    v40[3] = &unk_1E5B4BF78;
    id v28 = v9;
    id v41 = v28;
    uint64_t v11 = objc_msgSend(v10, "fc_dictionary:", v40);
    regionMap = v6->_regionMap;
    v6->_regionMap = (NSDictionary *)v11;

    v29 = v7;
    v13 = FCAppConfigurationArrayValueWithDefaultValue(v7, @"areas", 0);
    uint64_t v14 = objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_12);
    areas = v6->_areas;
    v6->_areas = (NSArray *)v14;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obj = v6->_areas;
    uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v21 = [v20 regionIds];
          uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v43 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v33;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v33 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = [(NSDictionary *)v6->_regionMap objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * v25)];
                [v26 addLocalArea:v20];

                ++v25;
              }
              while (v23 != v25);
              uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v43 count:16];
            }
            while (v23);
          }

          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v17);
    }

    id v4 = v30;
  }

  return v6;
}

FCLocalRegion *__36__FCLocalAreasMapping_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCLocalRegion alloc] initWithDictionary:v2];

  return v3;
}

void __36__FCLocalAreasMapping_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
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
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "identifier", (void)v11);
        [v3 setValue:v9 forKey:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

FCLocalArea *__36__FCLocalAreasMapping_initWithData___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[FCLocalArea alloc] initWithDictionary:v2];

  return v3;
}

- (FCLocalAreasMapping)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCLocalAreasMapping init]";
    __int16 v9 = 2080;
    v10 = "FCLocalAreasMapping.m";
    __int16 v11 = 1024;
    int v12 = 67;
    __int16 v13 = 2114;
    long long v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCLocalAreasMapping init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (unint64_t)count
{
  id v3 = [(FCLocalAreasMapping *)self regionMap];
  uint64_t v4 = [v3 allValues];
  uint64_t v5 = [v4 count];
  id v6 = [(FCLocalAreasMapping *)self areas];
  unint64_t v7 = [v6 count] + v5;

  return v7;
}

- (id)regionsForLocation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(FCLocalAreasMapping *)self areas];
    uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v9 = 0;
        uint64_t v23 = v7;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
          if ([v10 containsLocation:v4])
          {
            id v11 = v4;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            int v12 = [v10 regionIds];
            uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v26;
              do
              {
                for (uint64_t i = 0; i != v14; ++i)
                {
                  if (*(void *)v26 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
                  uint64_t v18 = [(FCLocalAreasMapping *)self regionMap];
                  uint64_t v19 = [v18 objectForKeyedSubscript:v17];
                  [v5 addObject:v19];
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v14);
            }

            id v4 = v11;
            uint64_t v8 = v22;
            uint64_t v7 = v23;
          }
          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }
  }
  v20 = [v5 array];

  return v20;
}

- (id)areasForLocation:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(FCLocalAreasMapping *)self areas];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 containsLocation:v4]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  int v12 = [v5 array];

  return v12;
}

- (id)autoFavoriteTagIDsForLocation:(id)a3
{
  return [(FCLocalAreasMapping *)self autoFavoriteTagIDsForLocation:a3 searchOption:1];
}

- (id)autoFavoriteTagIDsForLocation:(id)a3 searchOption:(unint64_t)a4
{
  uint64_t v6 = [(FCLocalAreasMapping *)self regionsForLocation:a3];
  uint64_t v7 = [(FCLocalAreasMapping *)self filterOuterRegions:v6];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__FCLocalAreasMapping_autoFavoriteTagIDsForLocation_searchOption___block_invoke;
  v13[3] = &__block_descriptor_40_e30___NSSet_16__0__FCLocalRegion_8l;
  v13[4] = a4;
  uint64_t v8 = objc_msgSend(v7, "fc_setByCollectingObjectsWithBlock:", v13);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v11 = v10;

  return v11;
}

id __66__FCLocalAreasMapping_autoFavoriteTagIDsForLocation_searchOption___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = [v3 localVersionedTagIDs];
  objc_msgSend(v4, "fc_safelyAddObjects:", v5);

  if (*(void *)(a1 + 32) == 1)
  {
    uint64_t v6 = [v3 autoFavoriteTagIDs];
    objc_msgSend(v4, "fc_safelyAddObjects:", v6);
  }
  return v4;
}

- (id)filterOuterRegions:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __42__FCLocalAreasMapping_filterOuterRegions___block_invoke;
    int v12 = &unk_1E5B505B0;
    id v13 = v3;
    id v5 = v3;
    id v4 = v5;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__FCLocalAreasMapping_filterOuterRegions___block_invoke_2;
    v7[3] = &unk_1E5B58A00;
    id v8 = v3;
    id v4 = objc_msgSend(v3, "fc_arrayOfObjectsPassingTest:", v7);
    id v5 = v8;
  }

  return v4;
}

id __42__FCLocalAreasMapping_filterOuterRegions___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __42__FCLocalAreasMapping_filterOuterRegions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 rectForEntireRegion];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(id *)(*((void *)&v24 + 1) + 8 * v16);
        if (v17 != v3)
        {
          objc_msgSend(v17, "rectForEntireRegion", (void)v24);
          v31.origin.x = v18;
          v31.origin.y = v19;
          v31.size.width = v20;
          v31.size.height = v21;
          v30.origin.x = v5;
          v30.origin.y = v7;
          v30.size.width = v9;
          v30.size.height = v11;
          if (CGRectContainsRect(v30, v31))
          {
            uint64_t v22 = 0;
            goto LABEL_12;
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v22 = 1;
LABEL_12:

  return v22;
}

- (id)tagIDsForLocation:(id)a3 searchOption:(unint64_t)a4
{
  id v6 = a3;
  CGFloat v7 = [(FCLocalAreasMapping *)self regionMap];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke;
  v19[3] = &unk_1E5B58A28;
  id v20 = v6;
  id v8 = v6;
  CGFloat v9 = objc_msgSend(v7, "fc_dictionaryByTransformingValuesWithBlock:", v19);

  double v10 = [v9 keysSortedByValueUsingComparator:&__block_literal_global_34_0];
  CGFloat v11 = (void *)MEMORY[0x1E4F1CA48];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_3;
  v15[3] = &unk_1E5B58A70;
  id v17 = self;
  unint64_t v18 = a4;
  id v16 = v10;
  id v12 = v10;
  uint64_t v13 = objc_msgSend(v11, "fc_array:", v15);

  return v13;
}

id __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke(uint64_t a1, void *a2)
{
  [a2 centerLocationCoordinateForEntireRegion];
  id v3 = NSNumber;
  double v4 = *(void **)(a1 + 32);
  CGFloat v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v5 longitude:v6];
  [v4 distanceFromLocation:v7];
  id v8 = objc_msgSend(v3, "numberWithDouble:");

  return v8;
}

uint64_t __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_4;
        v23[3] = &unk_1E5B58A70;
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        v23[5] = v8;
        v23[6] = v9;
        v23[4] = v10;
        CGFloat v11 = objc_msgSend(MEMORY[0x1E4F1C978], "fc_array:", v23);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v19 + 1) + 8 * j);
              if (([v4 containsObject:v16] & 1) == 0)
              {
                [v4 addObject:v16];
                [v3 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

void __54__FCLocalAreasMapping_tagIDsForLocation_searchOption___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 1)
  {
    id v12 = v3;
    uint64_t v8 = [*(id *)(a1 + 32) regionMap];
    uint64_t v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v10 = [v9 localVersionedTagIDs];
    [v12 addObjectsFromArray:v10];

    uint64_t v5 = [*(id *)(a1 + 32) regionMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = [v6 autoFavoriteTagIDs];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    id v12 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) regionMap];
    uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
    uint64_t v7 = [v6 localVersionedTagIDs];
  }
  CGFloat v11 = (void *)v7;
  [v12 addObjectsFromArray:v7];

  id v3 = v12;
LABEL_6:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCLocalAreasMapping)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localAreasMapping"];

  uint64_t v6 = [(FCLocalAreasMapping *)self initWithData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  if (data) {
    [a3 encodeObject:data forKey:@"localAreasMapping"];
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSDictionary)regionMap
{
  return self->_regionMap;
}

- (void)setRegionMap:(id)a3
{
}

- (NSArray)areas
{
  return self->_areas;
}

- (void)setAreas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_areas, 0);
  objc_storeStrong((id *)&self->_regionMap, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end