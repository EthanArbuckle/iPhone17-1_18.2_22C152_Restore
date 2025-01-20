@interface ATXSuggestionReranker
- (ATXSuggestionReranker)initWithClientModelSuggestions:(id)a3 promoteSuggestionsFromClientModel:(id)a4 hyperParameters:(id)a5;
- (ATXSuggestionReranker)initWithProactiveSuggestions:(id)a3 hyperParameters:(id)a4;
- (id)clientModelPriorityOrder;
- (id)constructConfidenceCategoryDictionaryForClientModelSuggestions;
- (id)convertConfidenceCategoryDictionaryToArray:(id)a3;
- (id)initializeConfidenceCategoryToSuggestionsDictionary;
- (id)rerankedSuggestions;
@end

@implementation ATXSuggestionReranker

- (ATXSuggestionReranker)initWithProactiveSuggestions:(id)a3 hyperParameters:(id)a4
{
  v31 = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  v6 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1B3E6F520]();
        v14 = [v12 clientModelSpecification];
        v15 = [v14 clientModelId];

        v16 = [v6 objectForKeyedSubscript:v15];

        if (!v16)
        {
          v17 = objc_opt_new();
          [v6 setObject:v17 forKeyedSubscript:v15];
        }
        v18 = objc_msgSend(v6, "objectForKeyedSubscript:", v15, v31);
        [v18 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  v19 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * v24);
        v26 = [ATXClientModelCacheUpdate alloc];
        v27 = [v20 objectForKeyedSubscript:v25];
        v28 = [(ATXClientModelCacheUpdate *)v26 initWithClientModelId:v25 suggestions:v27 feedbackMetadata:0 responseForRealTimeRequest:0];

        [v19 setObject:v28 forKeyedSubscript:v25];
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v22);
  }

  v29 = [(ATXSuggestionReranker *)v31 initWithClientModelSuggestions:v19 promoteSuggestionsFromClientModel:0 hyperParameters:v32];
  return v29;
}

- (ATXSuggestionReranker)initWithClientModelSuggestions:(id)a3 promoteSuggestionsFromClientModel:(id)a4 hyperParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXSuggestionReranker;
  v12 = [(ATXSuggestionReranker *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_clientModelSuggestions, a3);
    uint64_t v14 = [v10 copy];
    promotedClientModelId = v13->_promotedClientModelId;
    v13->_promotedClientModelId = (NSString *)v14;

    objc_storeStrong((id *)&v13->_blendingLayerHyperParameters, a5);
  }

  return v13;
}

- (id)clientModelPriorityOrder
{
  return (id)[(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_blendingLayerHyperParameters clientModelPriorityOrder];
}

- (id)rerankedSuggestions
{
  v3 = [(ATXSuggestionReranker *)self constructConfidenceCategoryDictionaryForClientModelSuggestions];
  v4 = [(ATXSuggestionReranker *)self convertConfidenceCategoryDictionaryToArray:v3];

  return v4;
}

- (id)constructConfidenceCategoryDictionaryForClientModelSuggestions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXSuggestionReranker *)self initializeConfidenceCategoryToSuggestionsDictionary];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(ATXSuggestionReranker *)self clientModelPriorityOrder];
  uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        v6 = [(NSDictionary *)self->_clientModelSuggestions objectForKeyedSubscript:v5];
        id v7 = [v6 suggestions];

        id v23 = v7;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v23);
              }
              v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (self->_promotedClientModelId && objc_msgSend(v5, "isEqualToString:"))
              {
                v13 = [v12 scoreSpecification];
                [v13 setSuggestedConfidenceCategory:4];
              }
              uint64_t v14 = NSNumber;
              v15 = [v12 scoreSpecification];
              v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "suggestedConfidenceCategory"));
              objc_super v17 = [v3 objectForKeyedSubscript:v16];
              [v17 addObject:v12];
            }
            uint64_t v9 = [v23 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }

        uint64_t v4 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v21);
  }

  return v3;
}

- (id)initializeConfidenceCategoryToSuggestionsDictionary
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  [v2 setObject:v3 forKeyedSubscript:&unk_1F0627F88];

  uint64_t v4 = objc_opt_new();
  [v2 setObject:v4 forKeyedSubscript:&unk_1F0627FA0];

  id v5 = objc_opt_new();
  [v2 setObject:v5 forKeyedSubscript:&unk_1F0627FB8];

  v6 = objc_opt_new();
  [v2 setObject:v6 forKeyedSubscript:&unk_1F0627FD0];

  return v2;
}

- (id)convertConfidenceCategoryDictionaryToArray:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  uint64_t v6 = 4;
  do
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unint64_t v22 = v6;
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:");
    uint64_t v8 = [v21 objectForKeyedSubscript:v7];

    id obj = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          promotedClientModelId = self->_promotedClientModelId;
          v15 = [v13 clientModelSpecification];
          v16 = [v15 clientModelId];
          LODWORD(promotedClientModelId) = [(NSString *)promotedClientModelId isEqualToString:v16];

          if (promotedClientModelId) {
            objc_super v17 = v4;
          }
          else {
            objc_super v17 = v5;
          }
          [v17 addObject:v13];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    uint64_t v6 = v22 - 1;
  }
  while (v22 > 1);
  if (objc_msgSend(v4, "count", v6))
  {
    id v18 = [v4 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    id v18 = v5;
  }
  v19 = v18;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingLayerHyperParameters, 0);
  objc_storeStrong((id *)&self->_promotedClientModelId, 0);
  objc_storeStrong((id *)&self->_clientModelSuggestions, 0);
}

@end