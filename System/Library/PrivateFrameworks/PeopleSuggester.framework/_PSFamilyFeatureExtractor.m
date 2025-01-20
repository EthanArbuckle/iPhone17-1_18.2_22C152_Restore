@interface _PSFamilyFeatureExtractor
- (NSSet)featureSet;
- (_CDCloudFamilyDataCollectionTask)task;
- (_PSFamilyFeatureExtractor)init;
- (_PSFamilyFeatureExtractor)initWith:(id)a3 featureSet:(id)a4;
- (_PSFamilyFeatureExtractor)initWithActivity:(id)a3;
- (id)_featureInputForContact:(id)a3;
- (id)featureInputForContact:(id)a3;
- (id)featureInputsForContacts:(id)a3;
@end

@implementation _PSFamilyFeatureExtractor

- (_PSFamilyFeatureExtractor)initWithActivity:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F5B398];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithActivity:v5];

  v7 = +[_PSFamilyUtilities featureSet];
  v8 = [(_PSFamilyFeatureExtractor *)self initWith:v6 featureSet:v7];

  return v8;
}

- (_PSFamilyFeatureExtractor)init
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F5B398]) initWithActivity:0];
  v4 = +[_PSFamilyUtilities featureSet];
  id v5 = [(_PSFamilyFeatureExtractor *)self initWith:v3 featureSet:v4];

  return v5;
}

- (_PSFamilyFeatureExtractor)initWith:(id)a3 featureSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PSFamilyFeatureExtractor;
  v9 = [(_PSFamilyFeatureExtractor *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_task, a3);
    objc_storeStrong((id *)&v10->_featureSet, a4);
    id v11 = objc_alloc(MEMORY[0x1E4F93B68]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49___PSFamilyFeatureExtractor_initWith_featureSet___block_invoke;
    v15[3] = &unk_1E5ADF6C0;
    id v16 = v7;
    uint64_t v12 = [v11 initWithBlock:v15];
    reusableEventDictsState = v10->_reusableEventDictsState;
    v10->_reusableEventDictsState = (_PASLazyResult *)v12;
  }
  return v10;
}

- (id)_featureInputForContact:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PASLazyResult *)self->_reusableEventDictsState result];
  v6 = [(_PSFamilyFeatureExtractor *)self task];
  id v7 = [v6 eventDictForContact:v4 usingState:v5];

  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = [(_PSFamilyFeatureExtractor *)self featureSet];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v18 = v5;
      id v19 = v4;
      id v11 = 0;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v15 = objc_msgSend(v7, "objectForKeyedSubscript:", v14, v18, v19);

          if (!v15)
          {
            id v16 = +[_PSLogging familyRecommenderChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v25 = v14;
              _os_log_debug_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEBUG, "feature %{public}@ not found in feature set", buf, 0xCu);
            }

            if (!v11) {
              id v11 = (void *)[v7 mutableCopy];
            }
            [v11 setObject:&unk_1EF674F28 forKeyedSubscript:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v10);

      if (!v11)
      {
        id v5 = v18;
        id v4 = v19;
        goto LABEL_20;
      }
      id v8 = v7;
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v11];
      id v5 = v18;
      id v4 = v19;
    }
    else
    {
      id v11 = 0;
    }

LABEL_20:
    id v7 = v7;
  }

  return v7;
}

- (id)featureInputForContact:(id)a3
{
  v3 = [(_PSFamilyFeatureExtractor *)self _featureInputForContact:a3];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v3;

  return v5;
}

- (id)featureInputsForContacts:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1A6243860](v7);
        v13 = -[_PSFamilyFeatureExtractor _featureInputForContact:](self, "_featureInputForContact:", v11, (void)v17);
        uint64_t v14 = [v11 identifier];
        [v5 setObject:v13 forKeyedSubscript:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  v15 = (void *)[v5 copy];

  return v15;
}

- (_CDCloudFamilyDataCollectionTask)task
{
  return self->_task;
}

- (NSSet)featureSet
{
  return self->_featureSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_reusableEventDictsState, 0);
}

@end