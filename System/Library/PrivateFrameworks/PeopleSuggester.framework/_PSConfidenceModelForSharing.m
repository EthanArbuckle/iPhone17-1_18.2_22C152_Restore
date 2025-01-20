@interface _PSConfidenceModelForSharing
- (BOOL)_PSConfidenceModelInUse;
- (BOOL)addEventForModel:(id)a3 event:(id)a4;
- (BOOL)findObjectWithID:(id)a3 inArray:(id)a4;
- (_PSConfidenceModelDriver)confidenceModelDriver;
- (_PSConfidenceModelForSharing)init;
- (_PSConfidenceModelForSharing)initWithConfig:(id)a3;
- (double)getConfidenceForModel:(id)a3;
- (id)getConfidenceRankedModelKeysGivenKeysToSort:(id)a3;
- (void)setConfidenceModelDriver:(id)a3;
- (void)set_PSConfidenceModelInUse:(BOOL)a3;
@end

@implementation _PSConfidenceModelForSharing

- (_PSConfidenceModelForSharing)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PSConfidenceModelForSharing;
  v2 = [(_PSConfidenceModelForSharing *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_PSConfidenceModelDriver);
    [(_PSConfidenceModelForSharing *)v2 setConfidenceModelDriver:v3];
  }
  return v2;
}

- (_PSConfidenceModelForSharing)initWithConfig:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PSConfidenceModelForSharing;
  return [(_PSConfidenceModelForSharing *)&v4 init];
}

- (BOOL)addEventForModel:(id)a3 event:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
  char v9 = [v8 addEventForModel:v6 forUseCaseKey:@"sharesheet" event:v7];

  if (v9)
  {
    char v10 = 1;
  }
  else
  {
    v11 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
    [v11 registerModelKey:v6 forUseCaseKey:@"sharesheet" confidenceWindowSize:10 minimumInstanceCount:3];

    v12 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
    char v10 = [v12 addEventForModel:v6 forUseCaseKey:@"sharesheet" event:v7];
  }
  return v10;
}

- (double)getConfidenceForModel:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
  [v5 getConfidenceForModel:v4 forUseCaseKey:@"sharesheet"];
  double v7 = v6;

  return v7;
}

- (BOOL)findObjectWithID:(id)a3 inArray:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isEqualToString:", v5, (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)getConfidenceRankedModelKeysGivenKeysToSort:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
  id v6 = [v5 confidenceModelDictionary];

  v28 = v6;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"sharesheet"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if ([(_PSConfidenceModelForSharing *)self findObjectWithID:v12 inArray:v4])
        {
          long long v13 = [scoredModel alloc];
          long long v14 = [(_PSConfidenceModelForSharing *)self confidenceModelDriver];
          [v14 getConfidenceForModel:v12 forUseCaseKey:@"sharesheet"];
          v15 = -[scoredModel initWithModelKey:score:](v13, "initWithModelKey:score:", v12);

          [v29 addObject:v15];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:0 selector:sel_compare_];
  v39 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
  v18 = [v29 sortedArrayUsingDescriptors:v17];

  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = [*(id *)(*((void *)&v30 + 1) + 8 * j) modelKey];
        [v19 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v22);
  }

  v26 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[_PSConfidenceModelForSharing getConfidenceRankedModelKeysGivenKeysToSort:]((uint64_t)v20, v26);
  }

  return v19;
}

- (_PSConfidenceModelDriver)confidenceModelDriver
{
  return self->_confidenceModelDriver;
}

- (void)setConfidenceModelDriver:(id)a3
{
}

- (BOOL)_PSConfidenceModelInUse
{
  return self->__PSConfidenceModelInUse;
}

- (void)set_PSConfidenceModelInUse:(BOOL)a3
{
  self->__PSConfidenceModelInUse = a3;
}

- (void).cxx_destruct
{
}

- (void)getConfidenceRankedModelKeysGivenKeysToSort:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "sortedScoredModelArray: %@", (uint8_t *)&v2, 0xCu);
}

@end