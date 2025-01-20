@interface RTInferredMapItemDeduperState
- (BOOL)canIngest;
- (BOOL)enumerateDedupedUUIDToMapItemMapUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)finalizeState:(id *)a3;
- (BOOL)ingestInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4;
- (NSDictionary)dedupedUUIDToMapItemMap;
- (NSDictionary)intermediateUUIDToInferredMapItemMap;
- (NSMutableArray)uniqueInferredMapItems;
- (NSMutableDictionary)intermediateUUIDToInferredMapItemsMap;
- (RTInferredMapItemDeduperState)init;
- (id)allDedupedUUIDsWithError:(id *)a3;
- (id)allUniqueMapItemsWithError:(id *)a3;
- (id)combinedInferredMapItemFromInferredMapItems:(id)a3 error:(id *)a4;
- (id)inferredMapItemFromInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4;
- (id)mapItemForDedupedUUID:(id)a3 error:(id *)a4;
- (id)mapItemForIntermediateUUID:(id)a3 error:(id *)a4;
- (void)resetState;
- (void)setCanIngest:(BOOL)a3;
- (void)setDedupedUUIDToMapItemMap:(id)a3;
- (void)setIntermediateUUIDToInferredMapItemMap:(id)a3;
- (void)setIntermediateUUIDToInferredMapItemsMap:(id)a3;
- (void)setUniqueInferredMapItems:(id)a3;
@end

@implementation RTInferredMapItemDeduperState

- (RTInferredMapItemDeduperState)init
{
  v11.receiver = self;
  v11.super_class = (Class)RTInferredMapItemDeduperState;
  v2 = [(RTInferredMapItemDeduperState *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_canIngest = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uniqueInferredMapItems = v3->_uniqueInferredMapItems;
    v3->_uniqueInferredMapItems = (NSMutableArray *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    intermediateUUIDToInferredMapItemsMap = v3->_intermediateUUIDToInferredMapItemsMap;
    v3->_intermediateUUIDToInferredMapItemsMap = (NSMutableDictionary *)v6;

    intermediateUUIDToInferredMapItemMap = v3->_intermediateUUIDToInferredMapItemMap;
    v3->_intermediateUUIDToInferredMapItemMap = 0;

    dedupedUUIDToMapItemMap = v3->_dedupedUUIDToMapItemMap;
    v3->_dedupedUUIDToMapItemMap = 0;
  }
  return v3;
}

- (void)resetState
{
  obj = self;
  objc_sync_enter(obj);
  obj->_canIngest = 1;
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  uniqueInferredMapItems = obj->_uniqueInferredMapItems;
  obj->_uniqueInferredMapItems = (NSMutableArray *)v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  intermediateUUIDToInferredMapItemsMap = obj->_intermediateUUIDToInferredMapItemsMap;
  obj->_intermediateUUIDToInferredMapItemsMap = (NSMutableDictionary *)v4;

  intermediateUUIDToInferredMapItemMap = obj->_intermediateUUIDToInferredMapItemMap;
  obj->_intermediateUUIDToInferredMapItemMap = 0;

  dedupedUUIDToMapItemMap = obj->_dedupedUUIDToMapItemMap;
  obj->_dedupedUUIDToMapItemMap = 0;

  objc_sync_exit(obj);
}

- (BOOL)ingestInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    BOOL canIngest = v7->_canIngest;
    if (v7->_canIngest)
    {
      intermediateUUIDToInferredMapItemsMap = v7->_intermediateUUIDToInferredMapItemsMap;
      v10 = [v6 secondObject];
      objc_super v11 = [(NSMutableDictionary *)intermediateUUIDToInferredMapItemsMap objectForKeyedSubscript:v10];

      if (v11)
      {
        v12 = v7->_intermediateUUIDToInferredMapItemsMap;
        v13 = [v6 secondObject];
        v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];
        v15 = [v6 firstObject];
        [v14 addObject:v15];
      }
      else
      {
        uniqueInferredMapItems = v7->_uniqueInferredMapItems;
        v21 = [v6 firstObject];
        [(NSMutableArray *)uniqueInferredMapItems addObject:v21];

        v22 = (void *)MEMORY[0x1E4F1CA48];
        v13 = [v6 firstObject];
        v14 = [v22 arrayWithObject:v13];
        v23 = v7->_intermediateUUIDToInferredMapItemsMap;
        v15 = [v6 secondObject];
        [(NSMutableDictionary *)v23 setObject:v14 forKeyedSubscript:v15];
      }
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      v27[0] = @"cannot ingest more inferredMapItems since the state is finalized";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:5 userInfo:v18];

      if (a4) {
        *a4 = v19;
      }
    }
    objc_sync_exit(v7);
  }
  else
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemWithIntermediateUUID", v25, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"inferredMapItemWithIntermediateUUID");
      BOOL canIngest = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL canIngest = 0;
    }
  }

  return canIngest;
}

- (id)combinedInferredMapItemFromInferredMapItems:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a4)
    {
      v37 = @"inferredMapItems";
LABEL_36:
      _RTErrorInvalidParameterCreate((uint64_t)v37);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
LABEL_37:
    v9 = 0;
    goto LABEL_40;
  }
  if (![v5 count])
  {
    v38 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v38, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems.count > 0", buf, 2u);
    }

    if (a4)
    {
      v37 = @"inferredMapItems.count > 0";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v43 = v6;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (!v7)
  {
    v9 = 0;
    uint64_t v19 = 0;
    goto LABEL_39;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v46;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
      if (!v9)
      {
        id v16 = v12;
LABEL_22:
        v33 = [v12 mapItem:v43];
        v34 = [v33 extendedAttributes];
        uint64_t v19 = [v34 wifiFingerprintLabelType];

        v9 = v12;
        goto LABEL_23;
      }
      v13 = [v9 mapItem];
      v14 = [v13 extendedAttributes];
      if ([v14 wifiFingerprintLabelType]) {
        v15 = v9;
      }
      else {
        v15 = v12;
      }
      v17 = [v15 mapItem:v43];
      v18 = [v17 extendedAttributes];
      uint64_t v19 = [v18 wifiFingerprintLabelType];

      v20 = [v9 mapItem];
      if ([v20 validMUID])
      {
        v21 = [v12 mapItem];
        int v22 = [v21 validMUID];

        if (!v22) {
          goto LABEL_23;
        }
      }
      else
      {
      }
      v23 = [v9 mapItem];
      if ([v23 validMUID])
      {

LABEL_20:
        [v12 confidence];
        double v27 = v26;
        [v9 confidence];
        if (v27 <= v28) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      v24 = [v12 mapItem];
      int v25 = [v24 validMUID];

      if (!v25) {
        goto LABEL_20;
      }
LABEL_21:
      id v29 = v12;

      v30 = [v29 mapItem];
      v31 = [v30 extendedAttributes];
      uint64_t v32 = [v31 wifiFingerprintLabelType];

      if (v32) {
        goto LABEL_22;
      }
      v9 = v29;
LABEL_23:
      ++v11;
    }
    while (v8 != v11);
    uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    uint64_t v8 = v35;
  }
  while (v35);
LABEL_39:

  v39 = [v9 mapItem];
  v40 = [v39 extendedAttributes];
  v41 = [NSNumber numberWithInteger:v19];
  [v40 setValue:v41 forKey:@"wifiFingerprintLabelType"];

  id v6 = v43;
LABEL_40:

  return v9;
}

- (BOOL)finalizeState:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_canIngest)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:-[NSMutableDictionary count](v4->_intermediateUUIDToInferredMapItemsMap, "count")];
    int v25 = a3;
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:-[NSMutableDictionary count](v4->_intermediateUUIDToInferredMapItemsMap, "count")];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v7 = v4->_intermediateUUIDToInferredMapItemsMap;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      id obj = v7;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
        v12 = [(NSMutableDictionary *)v4->_intermediateUUIDToInferredMapItemsMap objectForKeyedSubscript:v11];
        id v27 = 0;
        v13 = [(RTInferredMapItemDeduperState *)v4 combinedInferredMapItemFromInferredMapItems:v12 error:&v27];
        id v14 = v27;

        if (v14) {
          break;
        }
        if (!v13)
        {
          v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v33 = @"combinedInferredMapItem was nil";
          int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:0 userInfo:v22];

          if (v25) {
            *int v25 = v23;
          }

          v13 = 0;
LABEL_18:

          BOOL v20 = 0;
          p_super = &obj->super;
          goto LABEL_19;
        }
        [v5 setObject:v13 forKeyedSubscript:v11];
        v15 = [v13 mapItem];
        id v16 = [v13 mapItem];
        v17 = [v16 identifier];
        [v6 setObject:v15 forKeyedSubscript:v17];

        if (v8 == ++v10)
        {
          uint64_t v7 = obj;
          uint64_t v8 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      if (v25) {
        *int v25 = v14;
      }
      goto LABEL_18;
    }
LABEL_11:

    v4->_BOOL canIngest = 0;
    objc_storeStrong((id *)&v4->_intermediateUUIDToInferredMapItemMap, v5);
    v18 = v6;
    p_super = v4->_dedupedUUIDToMapItemMap;
    v4->_dedupedUUIDToMapItemMap = v18;
    BOOL v20 = 1;
LABEL_19:
  }
  else
  {
    BOOL v20 = 1;
  }
  objc_sync_exit(v4);

  return v20;
}

- (id)mapItemForIntermediateUUID:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    intermediateUUIDToInferredMapItemMap = v7->_intermediateUUIDToInferredMapItemMap;
    if (!intermediateUUIDToInferredMapItemMap)
    {
      id v20 = 0;
      BOOL v9 = [(RTInferredMapItemDeduperState *)v7 finalizeState:&v20];
      id v10 = v20;
      id v11 = v10;
      if (!v9)
      {
        if (a4)
        {
          id v11 = v10;
          v13 = 0;
          *a4 = v11;
          goto LABEL_18;
        }
        goto LABEL_14;
      }

      intermediateUUIDToInferredMapItemMap = v7->_intermediateUUIDToInferredMapItemMap;
    }
    v12 = [(NSDictionary *)intermediateUUIDToInferredMapItemMap objectForKeyedSubscript:v6];
    id v11 = v12;
    if (v12)
    {
      v13 = [v12 mapItem];
LABEL_18:

      objc_sync_exit(v7);
      goto LABEL_19;
    }
    v15 = [NSString stringWithFormat:@"intermediateUUID, %@, not in table", v6];
    id v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = v15;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v18 = [v16 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v17];

    if (a4) {
      *a4 = v18;
    }

    id v11 = 0;
LABEL_14:
    v13 = 0;
    goto LABEL_18;
  }
  id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: intermediateUUID", buf, 2u);
  }

  if (a4)
  {
    _RTErrorInvalidParameterCreate(@"intermediateUUID");
    v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
LABEL_19:

  return v13;
}

- (id)inferredMapItemFromInferredMapItemWithIntermediateUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 secondObject];
    id v19 = 0;
    BOOL v9 = [(RTInferredMapItemDeduperState *)self mapItemForIntermediateUUID:v8 error:&v19];
    id v10 = v19;

    if (v10)
    {
      id v11 = 0;
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x1E4F5CDF8]);
      id v14 = [v7 firstObject];
      [v14 confidence];
      double v16 = v15;
      v17 = [v7 firstObject];
      id v11 = [v13 initWithMapItem:v9 confidence:[v17 source] source:v16];
    }
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItemWithIntermediateUUID", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"inferredMapItemWithIntermediateUUID");
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }

  return v11;
}

- (id)mapItemForDedupedUUID:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dedupedUUID", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"dedupedUUID");
      id v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (!a4)
  {
    double v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

LABEL_15:
    id v13 = 0;
    goto LABEL_19;
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap) {
    goto LABEL_6;
  }
  id v22 = 0;
  BOOL v9 = [(RTInferredMapItemDeduperState *)v7 finalizeState:&v22];
  id v10 = v22;
  if (v9)
  {

    dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
LABEL_6:
    id v11 = [(NSDictionary *)dedupedUUIDToMapItemMap objectForKeyedSubscript:v6];
    if (v11)
    {
      id v12 = v11;
      id v13 = v12;
    }
    else
    {
      double v16 = [NSString stringWithFormat:@"dedupedUUID, %@, not in table", v6];
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      v25[0] = v16;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      id v19 = [v17 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v18];

      id v20 = v19;
      *a4 = v20;

      id v12 = 0;
      id v13 = 0;
    }
    goto LABEL_18;
  }
  id v12 = v10;
  id v13 = 0;
  *a4 = v12;
LABEL_18:

  objc_sync_exit(v7);
LABEL_19:

  return v13;
}

- (id)allDedupedUUIDsWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap) {
    goto LABEL_4;
  }
  id v12 = 0;
  BOOL v6 = [(RTInferredMapItemDeduperState *)v4 finalizeState:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v6)
  {

    dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
LABEL_4:
    BOOL v9 = (void *)MEMORY[0x1E4F1CAD0];
    id v8 = [(NSDictionary *)dedupedUUIDToMapItemMap allKeys];
    id v10 = [v9 setWithArray:v8];
    goto LABEL_5;
  }
  if (a3)
  {
    id v8 = v7;
    id v10 = 0;
    *a3 = v8;
  }
  else
  {
    id v10 = 0;
  }
LABEL_5:

  objc_sync_exit(v4);

  return v10;
}

- (BOOL)enumerateDedupedUUIDToMapItemMapUsingBlock:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(id, void, void *, uint8_t *))a3;
  if (!v6)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"block");
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_23:
    BOOL v17 = 0;
    goto LABEL_24;
  }
  if (!a4)
  {
    id v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", buf, 2u);
    }

    goto LABEL_23;
  }
  id v7 = self;
  objc_sync_enter(v7);
  dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap)
  {
LABEL_6:
    buf[0] = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = dedupedUUIDToMapItemMap;
    uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
LABEL_8:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * v14);
        double v16 = -[NSDictionary objectForKeyedSubscript:](v7->_dedupedUUIDToMapItemMap, "objectForKeyedSubscript:", v15, (void)v22);
        v6[2](v6, v15, v16, buf);

        if (buf[0]) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSDictionary *)v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v12) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    BOOL v17 = 1;
    goto LABEL_15;
  }
  id v26 = 0;
  BOOL v9 = [(RTInferredMapItemDeduperState *)v7 finalizeState:&v26];
  id v10 = v26;
  if (v9)
  {

    dedupedUUIDToMapItemMap = v7->_dedupedUUIDToMapItemMap;
    goto LABEL_6;
  }
  id v21 = v10;
  *a4 = v21;

  BOOL v17 = 0;
LABEL_15:
  objc_sync_exit(v7);

LABEL_24:
  return v17;
}

- (id)allUniqueMapItemsWithError:(id *)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
  if (dedupedUUIDToMapItemMap) {
    goto LABEL_4;
  }
  id v11 = 0;
  BOOL v6 = [(RTInferredMapItemDeduperState *)v4 finalizeState:&v11];
  id v7 = v11;
  id v8 = v7;
  if (v6)
  {

    dedupedUUIDToMapItemMap = v4->_dedupedUUIDToMapItemMap;
LABEL_4:
    BOOL v9 = [(NSDictionary *)dedupedUUIDToMapItemMap allValues];
    goto LABEL_5;
  }
  if (a3) {
    *a3 = v7;
  }

  BOOL v9 = 0;
LABEL_5:
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)canIngest
{
  return self->_canIngest;
}

- (void)setCanIngest:(BOOL)a3
{
  self->_BOOL canIngest = a3;
}

- (NSMutableArray)uniqueInferredMapItems
{
  return self->_uniqueInferredMapItems;
}

- (void)setUniqueInferredMapItems:(id)a3
{
}

- (NSMutableDictionary)intermediateUUIDToInferredMapItemsMap
{
  return self->_intermediateUUIDToInferredMapItemsMap;
}

- (void)setIntermediateUUIDToInferredMapItemsMap:(id)a3
{
}

- (NSDictionary)intermediateUUIDToInferredMapItemMap
{
  return self->_intermediateUUIDToInferredMapItemMap;
}

- (void)setIntermediateUUIDToInferredMapItemMap:(id)a3
{
}

- (NSDictionary)dedupedUUIDToMapItemMap
{
  return self->_dedupedUUIDToMapItemMap;
}

- (void)setDedupedUUIDToMapItemMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedupedUUIDToMapItemMap, 0);
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemMap, 0);
  objc_storeStrong((id *)&self->_intermediateUUIDToInferredMapItemsMap, 0);

  objc_storeStrong((id *)&self->_uniqueInferredMapItems, 0);
}

@end