@interface PPNamedEntityFilter
- (BOOL)isAcceptableRecord:(id)a3;
- (PPNamedEntityFilter)init;
- (PPNamedEntityFilter)initWithModel:(id)a3;
- (id)_filterNamedEntities:(uint64_t)a1;
- (id)filterNamedEntityRecords:(id)a3;
- (id)filterScoredNamedEntities:(id)a3;
@end

@implementation PPNamedEntityFilter

- (void).cxx_destruct
{
}

- (BOOL)isAcceptableRecord:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1CB79D060]();
  v6 = [v4 entity];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  v8 = -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v7);
  LOBYTE(self) = [v8 count] == 1;

  return (char)self;
}

- (id)_filterNamedEntities:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
    v5 = v4;
    if (*(void *)(a1 + 8))
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      void v10[2] = __44__PPNamedEntityFilter__filterNamedEntities___block_invoke;
      v10[3] = &unk_1E65D8508;
      v10[4] = a1;
      id v6 = v4;
      id v11 = v6;
      [v3 enumerateObjectsUsingBlock:v10];
      v7 = v11;
      v8 = v6;
    }
    else
    {
      v8 = pp_default_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: no model available to perform filtering.", buf, 2u);
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __44__PPNamedEntityFilter__filterNamedEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 name];
  int IsWellFormed = PPStringIsWellFormed();

  if (IsWellFormed)
  {
    v8 = *(void **)(*(void *)(a1 + 32) + 8);
    id v34 = 0;
    v9 = [v8 predictionFromFeatures:v5 error:&v34];
    id v10 = v34;
    if (v9)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = v9;
      v13 = v12;
      if (v11)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = [v12 featureNames];
        uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
          id v31 = v10;
          v32 = v9;
          uint64_t v29 = a3;
          uint64_t v30 = a1;
          while (2)
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(obj);
              }
              v18 = *(void **)(*((void *)&v35 + 1) + 8 * v17);
              v19 = (void *)MEMORY[0x1CB79D060]();
              v20 = v13;
              v21 = [v13 featureValueForName:v18];
              v22 = [v21 multiArrayValue];

              if ([v18 isEqualToString:@"computed_filterScore"])
              {
                v28 = pp_default_log_handle();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: encountered a stale model for filtering.", buf, 2u);
                }
LABEL_26:
                id v10 = v31;
                v9 = v32;
                a3 = v29;

                goto LABEL_27;
              }
              if ([v18 hasPrefix:@"computed_"] && objc_msgSend(v22, "count") >= 1)
              {
                uint64_t v23 = 0;
                while (1)
                {
                  v24 = objc_msgSend(v22, "objectAtIndexedSubscript:", v23, v29);
                  [v24 doubleValue];
                  double v26 = v25;

                  if (v26 > 0.00999999978) {
                    break;
                  }
                  if (++v23 >= [v22 count]) {
                    goto LABEL_15;
                  }
                }
                v28 = pp_entities_log_handle();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v40 = v18;
                  _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPNamedEntityFilter: filtering based on output of feature %@", buf, 0xCu);
                }
                goto LABEL_26;
              }
LABEL_15:

              ++v17;
              v13 = v20;
            }
            while (v17 != v15);
            uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
            id v10 = v31;
            v9 = v32;
            if (v15) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
        uint64_t v30 = a1;

LABEL_27:
        objc_msgSend(*(id *)(v30 + 40), "removeIndex:", a3, v29);
      }
    }
    else
    {
      v27 = pp_entities_log_handle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v41 = 138412290;
        id v42 = v10;
        _os_log_error_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_ERROR, "PPNamedEntityFilter: encountered error in filtering %@", v41, 0xCu);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 40) removeIndex:a3];
  }
}

- (id)filterNamedEntityRecords:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_15_15640);
  id v6 = -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v5);

  unint64_t v7 = [v6 count];
  if (v7 >= [v4 count])
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [v4 objectsAtIndexes:v6];
  }
  v9 = v8;

  return v9;
}

uint64_t __48__PPNamedEntityFilter_filterNamedEntityRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 entity];
}

- (id)filterScoredNamedEntities:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_15643);
  id v6 = -[PPNamedEntityFilter _filterNamedEntities:]((uint64_t)self, v5);

  unint64_t v7 = [v6 count];
  if (v7 >= [v4 count])
  {
    id v8 = v4;
  }
  else
  {
    id v8 = [v4 objectsAtIndexes:v6];
  }
  v9 = v8;

  return v9;
}

uint64_t __49__PPNamedEntityFilter_filterScoredNamedEntities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 item];
}

- (PPNamedEntityFilter)init
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[PPTrialWrapper sharedInstance];
  id v13 = 0;
  id v4 = [v3 mlModelForModelName:@"PPModel_NE_Filtering.mlmodelc" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES" error:&v13];
  id v5 = v13;

  if (!v4) {
    goto LABEL_3;
  }
  id v6 = [v4 modelDescription];
  unint64_t v7 = [v6 outputDescriptionsByName];
  id v8 = [v7 allKeys];
  int v9 = [v8 containsObject:@"computed_filterScore"];

  if (v9)
  {
LABEL_3:
    id v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_fault_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_FAULT, "PPNamedEntityFilter: unable to initialize correct model from Trial: %@", buf, 0xCu);
    }
  }
  uint64_t v11 = [(PPNamedEntityFilter *)self initWithModel:v4];

  return v11;
}

- (PPNamedEntityFilter)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPNamedEntityFilter;
  id v6 = [(PPNamedEntityFilter *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

@end