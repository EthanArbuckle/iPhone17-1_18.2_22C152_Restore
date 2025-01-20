@interface ATXLayoutSelector
- (ATXLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4;
- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters;
- (ATXUniversalSuggestionDeduplicatorProtocol)deduplicator;
- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (id)validLayoutsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
@end

@implementation ATXLayoutSelector

- (ATXLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXLayoutSelector;
  v9 = [(ATXLayoutSelector *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deduplicator, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    int v18 = 138543618;
    v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = [v6 count];
    _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector asked to provide the highest ranking, selected layout for %{public}@ and %lu rankedSuggestions", (uint8_t *)&v18, 0x16u);
  }
  v9 = [(ATXLayoutSelector *)self validLayoutsForConsumerSubType:v4 rankedSuggestions:v6];
  uint64_t v10 = [v9 count];
  v11 = __atxlog_handle_blending();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = [v9 firstObject];
      v14 = +[ATXSuggestionLayout stringFromUILayoutType:](ATXSuggestionLayout, "stringFromUILayoutType:", [v13 layoutType]);
      int v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_1AE67F000, v11, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector's selected layout type: %@", (uint8_t *)&v18, 0xCu);
    }
    v15 = [v9 firstObject];
  }
  else
  {
    if (v12)
    {
      v16 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
      int v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_1AE67F000, v11, OS_LOG_TYPE_DEFAULT, "Blending: There is no selected layout for consumerSubType: %@", (uint8_t *)&v18, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)validLayoutsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Layout Selector asked to provide validLayouts.", buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__ATXLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke;
  v20[3] = &unk_1E5F018C8;
  v20[4] = self;
  char v21 = v4;
  id v8 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v20);

  v9 = [ATXLayoutGenerator alloc];
  uint64_t v10 = [(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_hyperParameters layoutsToConsiderForConsumerSubType:v4];
  v11 = [(ATXLayoutGenerator *)v9 initWithRankedSuggestions:v8 layoutsToConsider:v10 hyperParameters:self->_hyperParameters suggestionDeduplicator:self->_deduplicator];

  BOOL v12 = __atxlog_handle_blending();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
    uint64_t v14 = [v8 count];
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v14;
    _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "Generating layouts for non-homescreen consumerSubType %{public}@ with %lu ranked and filtered suggestions", buf, 0x16u);
  }
  v15 = [(ATXLayoutGenerator *)v11 generateValidLayouts];
  if ([v15 count])
  {
    id v16 = v15;
  }
  else
  {
    v17 = __atxlog_handle_blending();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v4];
      *(_DWORD *)buf = 138412290;
      v23 = v18;
      _os_log_impl(&dword_1AE67F000, v17, OS_LOG_TYPE_DEFAULT, "Blending: Unable to generate any valid layouts for consumerSubType: %@.", buf, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

uint64_t __70__ATXLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) uiSupportsSuggestion:a2 consumerSubType:*(unsigned __int8 *)(a1 + 40)];
}

- (ATXUniversalSuggestionDeduplicatorProtocol)deduplicator
{
  return self->_deduplicator;
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_deduplicator, 0);
}

@end