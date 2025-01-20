@interface VIACacheHitContext
+ (VIACacheHitContext)contextWithDictionary:(id)a3 error:(id *)a4;
- (NSString)applicationIdentifier;
- (NSString)engagementSuggestionType;
- (VIACacheHitContext)initWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 applicationIdentifier:(id)a5 engagementSuggestionType:(id)a6;
- (unint64_t)cachedResultQueryID;
- (unint64_t)queryID;
@end

@implementation VIACacheHitContext

- (VIACacheHitContext)initWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 applicationIdentifier:(id)a5 engagementSuggestionType:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VIACacheHitContext;
  v12 = [(VIACacheHitContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_queryID = a3;
    v12->_cachedResultQueryID = a4;
    uint64_t v14 = [v10 copy];
    applicationIdentifier = v13->_applicationIdentifier;
    v13->_applicationIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v13->_engagementSuggestionType, a6);
  }

  return v13;
}

+ (VIACacheHitContext)contextWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v45[0] = @"com.apple.argos.cache_hit_context_key.query_id";
  v6 = objc_alloc_init(VIACacheHitContextQueryIDMapper);
  v46 = (__CFString *)v6;
  v45[1] = @"com.apple.argos.cache_hit_context_key.cached_result_query_id";
  v7 = objc_alloc_init(VIACacheHitContextCachedResultQueryIDMapper);
  v47 = (__CFString *)v7;
  v45[2] = @"com.apple.argos.cache_hit_context_key.application_id";
  v8 = objc_alloc_init(VIACacheHitContextApplicationIdentifierMapper);
  v48 = (__CFString *)v8;
  v45[3] = @"com.apple.argos.cache_hit_context_key.engagement_suggestion_type";
  v9 = objc_alloc_init(VIACacheHitContextEngagementSuggestionTypeMapper);
  v49 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:v45 count:4];

  id v11 = objc_alloc_init(VIACacheHitContextBuilder);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v46 = @"com.apple.argos.cache_hit_context_key.query_id";
  v47 = @"com.apple.argos.cache_hit_context_key.cached_result_query_id";
  v48 = @"com.apple.argos.cache_hit_context_key.application_id";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:3];
  id v14 = [v12 setWithArray:v13];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        v20 = [v5 objectForKeyedSubscript:v19];

        if (!v20)
        {
          if (a4)
          {
            VIACacheHitContextMapperMissingValueError(v19);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_27:

          v29 = 0;
          goto LABEL_28;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v16);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = v5;
  uint64_t v21 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (!v21) {
    goto LABEL_18;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v34;
  while (2)
  {
    for (uint64_t j = 0; j != v22; ++j)
    {
      if (*(void *)v34 != v23) {
        objc_enumerationMutation(v14);
      }
      uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * j);
      v26 = [v10 objectForKeyedSubscript:v25];

      if (!v26)
      {
        if (!a4) {
          goto LABEL_27;
        }
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v30 = [NSString stringWithFormat:@"Unrecognized key: %@", v25];
        v42 = v30;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];

        id v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.argos.cache_hit_context.error_domain" code:1 userInfo:v28];
        goto LABEL_25;
      }
      v27 = [v10 objectForKeyedSubscript:v25];
      v28 = [v27 updateBuilder:v11 withDictionary:v14];

      if (v28)
      {
        if (!a4)
        {
LABEL_26:

          goto LABEL_27;
        }
        id v31 = v28;
LABEL_25:
        *a4 = v31;
        goto LABEL_26;
      }
    }
    uint64_t v22 = [v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_18:

  v29 = [(VIACacheHitContextBuilder *)v11 build];
LABEL_28:

  return (VIACacheHitContext *)v29;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (unint64_t)cachedResultQueryID
{
  return self->_cachedResultQueryID;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)engagementSuggestionType
{
  return self->_engagementSuggestionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementSuggestionType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end