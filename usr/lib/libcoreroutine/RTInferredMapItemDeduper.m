@interface RTInferredMapItemDeduper
- (BOOL)inferredMapItem:(id)a3 dedupesToInferredMapItem:(id)a4 error:(id *)a5;
- (RTInferredMapItemDeduper)init;
- (RTInferredMapItemDeduper)initWithDeduperFunction:(id)a3;
- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 error:(id *)a4;
- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5;
- (id)dedupeInferredMapItems:(id)a3 error:(id *)a4;
- (id)dedupeInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5;
- (id)deduperFunction;
- (id)ingestInferredMapItem:(id)a3 state:(id)a4 error:(id *)a5;
- (id)ingestInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5;
@end

@implementation RTInferredMapItemDeduper

- (RTInferredMapItemDeduper)init
{
  return [(RTInferredMapItemDeduper *)self initWithDeduperFunction:&__block_literal_global_2];
}

uint64_t __32__RTInferredMapItemDeduper_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 mapItem];
  v6 = [v4 mapItem];

  uint64_t v7 = [v5 isEqualToMapItem:v6];
  return v7;
}

- (RTInferredMapItemDeduper)initWithDeduperFunction:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTInferredMapItemDeduper;
    v5 = [(RTInferredMapItemDeduper *)&v11 init];
    if (v5)
    {
      uint64_t v6 = MEMORY[0x1E016DB00](v4);
      id deduperFunction = v5->_deduperFunction;
      v5->_id deduperFunction = (id)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deduperFunction", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)inferredMapItem:(id)a3 dedupesToInferredMapItem:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem1", buf, 2u);
    }

    if (a5)
    {
      v13 = @"inferredMapItem1";
LABEL_12:
      _RTErrorInvalidParameterCreate((uint64_t)v13);
      char v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }
  if (!v9)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem2", v16, 2u);
    }

    if (a5)
    {
      v13 = @"inferredMapItem2";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  char v11 = (*((uint64_t (**)(void))self->_deduperFunction + 2))();
LABEL_14:

  return v11;
}

- (id)ingestInferredMapItem:(id)a3 state:(id)a4 error:(id *)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    if (a5)
    {
      v17 = @"inferredMapItem";
LABEL_13:
      _RTErrorInvalidParameterCreate((uint64_t)v17);
      id v19 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_14:
    id v19 = 0;
    goto LABEL_26;
  }
  if (!v9)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v17 = @"state";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  char v11 = [v9 uniqueInferredMapItems];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __62__RTInferredMapItemDeduper_ingestInferredMapItem_state_error___block_invoke;
  v31[3] = &unk_1E6B9C978;
  v31[4] = self;
  id v12 = v8;
  id v32 = v12;
  uint64_t v13 = [v11 indexOfObjectPassingTest:v31];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = [v12 mapItem];
    v15 = [v14 identifier];
  }
  else
  {
    v14 = [v10 uniqueInferredMapItems];
    v20 = [v14 objectAtIndexedSubscript:v13];
    v21 = [v20 mapItem];
    v15 = [v21 identifier];
  }
  v22 = (void *)[objc_alloc(MEMORY[0x1E4F5CE58]) initWithFirstObject:v12 secondObject:v15];
  if (!v22)
  {
    id v24 = [NSString stringWithFormat:@"intermediateInferredMapitem was nil for inferredMapItem, %@", v12];
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = v24;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v28 = [v25 errorWithDomain:v26 code:0 userInfo:v27];

    if (a5) {
      *a5 = v28;
    }

LABEL_23:
    id v19 = 0;
    goto LABEL_25;
  }
  id v30 = 0;
  [v10 ingestInferredMapItemWithIntermediateUUID:v22 error:&v30];
  id v23 = v30;
  id v24 = v23;
  if (!v23)
  {
    id v19 = v22;
    goto LABEL_25;
  }
  if (!a5) {
    goto LABEL_23;
  }
  id v24 = v23;
  id v19 = 0;
  *a5 = v24;
LABEL_25:

LABEL_26:

  return v19;
}

uint64_t __62__RTInferredMapItemDeduper_ingestInferredMapItem_state_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) inferredMapItem:*(void *)(a1 + 40) dedupesToInferredMapItem:a2 error:0];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (id)ingestInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v22 = @"inferredMapItems";
LABEL_24:
      _RTErrorInvalidParameterCreate((uint64_t)v22);
      id v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_25:
    id v20 = 0;
    goto LABEL_26;
  }
  if (!v9)
  {
    id v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v22 = @"state";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  uint64_t v26 = a5;
  char v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v27 = 0;
        v18 = [(RTInferredMapItemDeduper *)self ingestInferredMapItem:v17 state:v10 error:&v27];
        id v19 = v27;
        if (v19)
        {
          id v23 = v19;
          if (v26) {
            *uint64_t v26 = v19;
          }

          id v20 = 0;
          goto LABEL_19;
        }
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v20 = v11;
LABEL_19:

LABEL_26:

  return v20;
}

- (id)dedupeInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    uint64_t v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a5)
    {
      v16 = @"inferredMapItems";
LABEL_14:
      _RTErrorInvalidParameterCreate((uint64_t)v16);
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_15:
    id v14 = 0;
    goto LABEL_31;
  }
  if (!v9)
  {
    uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      v16 = @"state";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v35 = 0;
  char v11 = [(RTInferredMapItemDeduper *)self ingestInferredMapItems:v8 state:v9 error:&v35];
  id v12 = v35;
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = 0;
    if (a5) {
      *a5 = v12;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v11 count]];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v29 = v11;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v30 = 0;
          v25 = [v10 inferredMapItemFromInferredMapItemWithIntermediateUUID:v24 error:&v30];
          id v26 = v30;
          if (v26)
          {
            id v27 = v26;
            if (a5) {
              *a5 = v26;
            }

            id v14 = 0;
            goto LABEL_29;
          }
          [v18 addObject:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v14 = v18;
LABEL_29:
    uint64_t v13 = 0;
    char v11 = v29;
  }
LABEL_31:

  return v14;
}

- (id)dedupeInferredMapItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4)
    {
      uint64_t v7 = objc_alloc_init(RTInferredMapItemDeduperState);
      id v8 = [(RTInferredMapItemDeduper *)self dedupeInferredMapItems:v6 state:v7 error:a4];

      goto LABEL_12;
    }
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v12, 2u);
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"inferredMapItems");
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 state:(id)a4 error:(id *)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    long long v34 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: doubleArrayOfInferredMapItems", buf, 2u);
    }

    if (a5)
    {
      id v35 = @"doubleArrayOfInferredMapItems";
LABEL_38:
      _RTErrorInvalidParameterCreate((uint64_t)v35);
      id v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
LABEL_39:
    id v33 = 0;
    goto LABEL_45;
  }
  if (!v9)
  {
    v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: state", buf, 2u);
    }

    if (a5)
    {
      id v35 = @"state";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v44 = a5;
  char v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v8 count]];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v45 = v8;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v57;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v57 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v56 + 1) + 8 * i);
        id v55 = 0;
        v18 = [(RTInferredMapItemDeduper *)self ingestInferredMapItems:v17 state:v10 error:&v55];
        id v19 = v55;
        if (v19)
        {
          v36 = v19;
          if (a5) {
            *a5 = v19;
          }

LABEL_43:
          id v33 = 0;
          goto LABEL_44;
        }
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v11 count]];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v20 = v11;
  uint64_t v41 = [v20 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v41)
  {
    uint64_t v21 = *(void *)v52;
    v43 = v20;
    uint64_t v40 = *(void *)v52;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v20);
        }
        uint64_t v42 = v22;
        id v23 = *(void **)(*((void *)&v51 + 1) + 8 * v22);
        uint64_t v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v23 count]];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v25 = v23;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v48;
          while (2)
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v48 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              id v46 = 0;
              long long v31 = [v10 inferredMapItemFromInferredMapItemWithIntermediateUUID:v30 error:&v46];
              id v32 = v46;
              if (v32)
              {
                uint64_t v38 = v32;
                if (v44) {
                  id *v44 = v32;
                }

                goto LABEL_43;
              }
              [v24 addObject:v31];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v61 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        [v12 addObject:v24];
        uint64_t v22 = v42 + 1;
        id v20 = v43;
        uint64_t v21 = v40;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [v43 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v41);
  }

  id v33 = v12;
LABEL_44:
  id v8 = v45;

LABEL_45:

  return v33;
}

- (id)dedupeDoubleArrayOfInferredMapItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    if (a4)
    {
      uint64_t v7 = objc_alloc_init(RTInferredMapItemDeduperState);
      id v8 = [(RTInferredMapItemDeduper *)self dedupeDoubleArrayOfInferredMapItems:v6 state:v7 error:a4];

      goto LABEL_12;
    }
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outError", v12, 2u);
    }
  }
  else
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: doubleArrayOfInferredMapItems", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"doubleArrayOfInferredMapItems");
      id v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (id)deduperFunction
{
  return self->_deduperFunction;
}

- (void).cxx_destruct
{
}

@end