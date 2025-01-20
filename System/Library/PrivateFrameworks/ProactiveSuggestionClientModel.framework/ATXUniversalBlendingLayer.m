@interface ATXUniversalBlendingLayer
+ (id)validConsumerSubTypesForLayoutGeneration;
+ (void)logLongDescriptionForBlendingLayerString:(id)a3 prefix:(id)a4 shouldUseDefaultLogLevel:(BOOL)a5 limit:(unint64_t)a6;
- (ATXUniversalBlendingFeedbackWriter)feedbackWriter;
- (ATXUniversalBlendingLayer)initWithSuggestionPreprocessor:(id)a3 delegate:(id)a4 layoutSelectorsForConsumerSubTypes:(id)a5 blendingSessionLogger:(id)a6 hyperParameters:(id)a7;
- (BOOL)updateCachedLayout:(id)a3 uiConsumer:(unsigned __int8)a4 clientModelSuggestions:(id)a5;
- (BOOL)updateSuggestionsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4 clientModelSuggestions:(id)a5;
- (id)rerankedSuggestions:(id)a3;
- (id)rerankedValidSuggestionsFromClientModelSuggestions:(id)a3;
- (id)selectedLayoutForUIConsumer:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (void)promoteSuggestionsFromClientModelWithIdentifier:(id)a3;
- (void)updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:(id)a3;
- (void)updateSuggestionsForConsumerSubTypes:(id)a3 clientModelSuggestions:(id)a4;
@end

@implementation ATXUniversalBlendingLayer

- (ATXUniversalBlendingLayer)initWithSuggestionPreprocessor:(id)a3 delegate:(id)a4 layoutSelectorsForConsumerSubTypes:(id)a5 blendingSessionLogger:(id)a6 hyperParameters:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)ATXUniversalBlendingLayer;
  v18 = [(ATXUniversalBlendingLayer *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_suggestionPreprocessor, a3);
    id v20 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v21 = (void *)[v20 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    uint64_t v22 = [v21 stringForKey:@"BlendingLayerPromotedClientModel"];
    promotedClientModelId = v19->_promotedClientModelId;
    v19->_promotedClientModelId = (NSString *)v22;

    objc_storeStrong((id *)&v19->_delegate, a4);
    uint64_t v24 = [v15 copy];
    layoutSelectorsForConsumerSubTypes = v19->_layoutSelectorsForConsumerSubTypes;
    v19->_layoutSelectorsForConsumerSubTypes = (NSDictionary *)v24;

    objc_storeStrong((id *)&v19->_blendingSessionLogger, a6);
    objc_storeStrong((id *)&v19->_hyperParameters, a7);
    uint64_t v26 = objc_opt_new();
    feedbackWriter = v19->_feedbackWriter;
    v19->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v26;
  }
  return v19;
}

+ (id)validConsumerSubTypesForLayoutGeneration
{
  return &unk_1F0628080;
}

- (void)updateSuggestionsForAllConsumerSubTypesWithClientModelSuggestions:(id)a3
{
  id v4 = a3;
  v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer asked to update suggestions for all consumer subtypes. [BLENDING REFRESH START]", buf, 2u);
  }

  v6 = [(id)objc_opt_class() validConsumerSubTypesForLayoutGeneration];
  [(ATXUniversalBlendingLayer *)self updateSuggestionsForConsumerSubTypes:v6 clientModelSuggestions:v4];

  v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AE67F000, v7, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer finished updating suggestions for all consumer subtypes. [BLENDING REFRESH END]", v8, 2u);
  }
}

- (void)updateSuggestionsForConsumerSubTypes:(id)a3 clientModelSuggestions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  sel_getName(a2);
  uint64_t v22 = (void *)os_transaction_create();
  v9 = __atxlog_handle_blending();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v9, OS_LOG_TYPE_DEFAULT, "Blending: Considering executing Blending Layer session logging before executing Blending Layer refresh.", buf, 2u);
  }

  [(ATXBlendingLayerSessionLoggerProtocol *)self->_blendingSessionLogger logCurrentSessionIfPossible];
  v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Done executing Blending Layer session logging before executing Blending Layer refresh.", buf, 2u);
  }

  v11 = [(ATXUniversalBlendingLayer *)self rerankedValidSuggestionsFromClientModelSuggestions:v8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned __int8 v18 = [v17 integerValue];
        v19 = [(id)objc_opt_class() validConsumerSubTypesForLayoutGeneration];
        LOBYTE(v17) = [v19 containsObject:v17];

        if (v17)
        {
          [(ATXUniversalBlendingLayer *)self updateSuggestionsForConsumerSubType:v18 rankedSuggestions:v11 clientModelSuggestions:v8];
        }
        else
        {
          id v20 = __atxlog_handle_blending();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v18];
            *(_DWORD *)buf = 138412290;
            v28 = v21;
            _os_log_impl(&dword_1AE67F000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring UI Consumer because it's not allowed. UI Consumer: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v14);
  }
}

- (BOOL)updateSuggestionsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4 clientModelSuggestions:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [MEMORY[0x1E4F4B680] safeStringForConsumerSubtype:v6];
    int v17 = 138412290;
    unsigned __int8 v18 = v11;
    _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, ">>> Blending: Blending Layer asked to update suggestions for consumer subtype %@", (uint8_t *)&v17, 0xCu);
  }
  if (![v8 count])
  {
    id v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXUniversalBlendingLayer updateSuggestionsForConsumerSubType:rankedSuggestions:clientModelSuggestions:](v12);
    }
  }
  [(ATXBlendingLayerDelegateProtocol *)self->_delegate blendingLayerRerankedSuggestions:v8 consumerSubType:v6];
  uint64_t v13 = [(ATXUniversalBlendingLayer *)self selectedLayoutForUIConsumer:v6 rankedSuggestions:v8];
  BOOL v14 = [(ATXUniversalBlendingLayer *)self updateCachedLayout:v13 uiConsumer:v6 clientModelSuggestions:v9];

  delegate = self->_delegate;
  if (delegate) {
    [(ATXBlendingLayerDelegateProtocol *)delegate blendingLayerUpdatedUICache:v13 consumerSubType:v6];
  }

  return v14;
}

- (id)rerankedValidSuggestionsFromClientModelSuggestions:(id)a3
{
  id v4 = [(ATXUniversalBlendingLayer *)self rerankedSuggestions:a3];
  v5 = [(ATXSuggestionPreprocessorProtocol *)self->_suggestionPreprocessor suggestionsWithInvalidSuggestionsRemoved:v4];

  return v5;
}

- (id)rerankedSuggestions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_blending();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1AE67F000, v5, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is reranking suggestions.", (uint8_t *)&v20, 2u);
  }

  uint64_t v6 = [[ATXSuggestionReranker alloc] initWithClientModelSuggestions:v4 promoteSuggestionsFromClientModel:self->_promotedClientModelId hyperParameters:self->_hyperParameters];
  id v7 = [(ATXSuggestionReranker *)v6 rerankedSuggestions];
  id v8 = (void *)MEMORY[0x1B3E6F520]();
  id v9 = __atxlog_handle_blending();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl(&dword_1AE67F000, v9, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer finished reranking suggestions.", (uint8_t *)&v20, 2u);
  }

  v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 count];
    if (v11)
    {
      id v12 = [v7 objectAtIndexedSubscript:0];
    }
    else
    {
      id v12 = @"None";
    }
    int v20 = 138412290;
    v21 = v12;
    _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "Blending: 1st highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v11) {
  }
    }
  uint64_t v13 = __atxlog_handle_blending();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v14 = [v7 count];
    if (v14 < 2)
    {
      uint64_t v15 = @"None";
    }
    else
    {
      uint64_t v15 = [v7 objectAtIndexedSubscript:1];
    }
    int v20 = 138412290;
    v21 = v15;
    _os_log_impl(&dword_1AE67F000, v13, OS_LOG_TYPE_DEFAULT, "Blending: 2nd highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v14 >= 2) {
  }
    }
  id v16 = __atxlog_handle_blending();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v17 = [v7 count];
    if (v17 < 3)
    {
      unsigned __int8 v18 = @"None";
    }
    else
    {
      unsigned __int8 v18 = [v7 objectAtIndexedSubscript:2];
    }
    int v20 = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1AE67F000, v16, OS_LOG_TYPE_DEFAULT, "Blending: 3rd highest ranked suggestion: %@", (uint8_t *)&v20, 0xCu);
    if (v17 >= 3) {
  }
    }

  return v7;
}

- (id)selectedLayoutForUIConsumer:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 count];
  id v8 = __atxlog_handle_blending();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is selecting a layout for the suggestions.", (uint8_t *)&v18, 2u);
    }

    id v8 = [(ATXSuggestionPreprocessorProtocol *)self->_suggestionPreprocessor suggestionsByPreprocessingRankedSuggestions:v6 forConsumerSubType:v4];
    layoutSelectorsForConsumerSubTypes = self->_layoutSelectorsForConsumerSubTypes;
    uint64_t v11 = [NSNumber numberWithUnsignedChar:v4];
    id v12 = [(NSDictionary *)layoutSelectorsForConsumerSubTypes objectForKeyedSubscript:v11];

    if (v12)
    {
      uint64_t v13 = [v12 selectedLayoutForConsumerSubType:v4 rankedSuggestions:v8];
      unint64_t v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v13 compactDescription];
        id v16 = [MEMORY[0x1E4F4B680] safeStringForConsumerSubtype:v4];
        int v18 = 138412546;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        v21 = v16;
        _os_log_impl(&dword_1AE67F000, v14, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer selected the following layout: %@ for consumerSubType: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    else
    {
      unint64_t v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ATXUniversalBlendingLayer selectedLayoutForUIConsumer:rankedSuggestions:](v4);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1AE67F000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer asked to select a layout when there were no suggestions available.", (uint8_t *)&v18, 2u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)updateCachedLayout:(id)a3 uiConsumer:(unsigned __int8)a4 clientModelSuggestions:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
    *(_DWORD *)buf = 138412290;
    objc_super v29 = v11;
    _os_log_impl(&dword_1AE67F000, v10, OS_LOG_TYPE_DEFAULT, "Blending: Blending Layer is persisting the cached suggestion layout for consumer: %@", buf, 0xCu);
  }
  if (_PASIsInternalDevice())
  {
    id v12 = (void *)MEMORY[0x1B3E6F520]();
    uint64_t v13 = objc_opt_class();
    id v14 = [NSString alloc];
    uint64_t v15 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
    id v16 = (void *)[v14 initWithFormat:@"Consumer subtype %@ cache: %@", v15, v8];
    unint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p> ", self);
    [v13 logLongDescriptionForBlendingLayerString:v16 prefix:v17 shouldUseDefaultLogLevel:1 limit:60];
  }
  int v18 = [[ATXBlendingModelUICacheUpdate alloc] initWithUICache:v8 consumerSubType:v6 clientModelCacheUpdates:v9];
  [(ATXUniversalBlendingFeedbackWriter *)self->_feedbackWriter donateBlendingModelUICacheUpdate:v18 uiConsumer:v6];
  uint64_t v19 = objc_opt_new();
  int v20 = [v19 updateCachedLayout:v8 consumerSubType:v6];
  if (v20)
  {
    v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
      *(_DWORD *)buf = 138412290;
      objc_super v29 = v22;
      _os_log_impl(&dword_1AE67F000, v21, OS_LOG_TYPE_DEFAULT, "Blending: Successfully updated the cache for %@", buf, 0xCu);
    }
    long long v23 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      long long v24 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
      long long v25 = [(ATXBlendingModelUICacheUpdate *)v18 uuid];
      *(_DWORD *)buf = 138412546;
      objc_super v29 = v24;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1AE67F000, v23, OS_LOG_TYPE_DEFAULT, "Blending: Sucesssfully updated the cache for consumer %@ with blending cache UUID: %@", buf, 0x16u);

LABEL_15:
    }
  }
  else
  {
    long long v26 = __atxlog_handle_blending();
    long long v23 = v26;
    if (v8)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[ATXUniversalBlendingLayer updateCachedLayout:uiConsumer:clientModelSuggestions:](v6);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      long long v24 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
      *(_DWORD *)buf = 138412290;
      objc_super v29 = v24;
      _os_log_impl(&dword_1AE67F000, v23, OS_LOG_TYPE_DEFAULT, "Blending: Couldn't generate a valid layout. Not writing a cache for %@.", buf, 0xCu);
      goto LABEL_15;
    }
  }

  return v20;
}

- (void)promoteSuggestionsFromClientModelWithIdentifier:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  promotedClientModelId = self->_promotedClientModelId;
  self->_promotedClientModelId = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v7 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  [v7 setObject:self->_promotedClientModelId forKey:@"BlendingLayerPromotedClientModel"];
}

+ (void)logLongDescriptionForBlendingLayerString:(id)a3 prefix:(id)a4 shouldUseDefaultLogLevel:(BOOL)a5 limit:(unint64_t)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  long long v24 = v9;
  id v12 = [v9 componentsSeparatedByCharactersInSet:v11];

  unint64_t v13 = [v12 count];
  if (v13 >= a6) {
    unint64_t v14 = a6;
  }
  else {
    unint64_t v14 = v13;
  }
  if (v14)
  {
    for (unint64_t i = 0; i < v21; ++i)
    {
      id v16 = __atxlog_handle_blending_internal_cache();
      unint64_t v17 = v16;
      if (v7)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v12 count];
          uint64_t v19 = [v12 objectAtIndexedSubscript:i];
          *(_DWORD *)buf = 134218754;
          unint64_t v26 = i + 1;
          __int16 v27 = 2048;
          uint64_t v28 = v18;
          __int16 v29 = 2112;
          id v30 = v10;
          __int16 v31 = 2112;
          uint64_t v32 = v19;
          _os_log_impl(&dword_1AE67F000, v17, OS_LOG_TYPE_DEFAULT, "[%lu of %lu] %@ %@", buf, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v22 = [v12 count];
        long long v23 = [v12 objectAtIndexedSubscript:i];
        *(_DWORD *)buf = 134218754;
        unint64_t v26 = i + 1;
        __int16 v27 = 2048;
        uint64_t v28 = v22;
        __int16 v29 = 2112;
        id v30 = v10;
        __int16 v31 = 2112;
        uint64_t v32 = v23;
        _os_log_debug_impl(&dword_1AE67F000, v17, OS_LOG_TYPE_DEBUG, "[%lu of %lu] %@ %@", buf, 0x2Au);
      }
      unint64_t v20 = [v12 count];
      if (v20 >= a6) {
        unint64_t v21 = a6;
      }
      else {
        unint64_t v21 = v20;
      }
    }
  }
}

- (ATXUniversalBlendingFeedbackWriter)feedbackWriter
{
  return self->_feedbackWriter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_blendingSessionLogger, 0);
  objc_storeStrong((id *)&self->_layoutSelectorsForConsumerSubTypes, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_suggestionPreprocessor, 0);
  objc_storeStrong((id *)&self->_promotedClientModelId, 0);
}

- (void)updateSuggestionsForConsumerSubType:(os_log_t)log rankedSuggestions:clientModelSuggestions:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE67F000, log, OS_LOG_TYPE_ERROR, "Encountered empty list of rerankedValidSuggestions.", v1, 2u);
}

- (void)selectedLayoutForUIConsumer:(unsigned __int8)a1 rankedSuggestions:.cold.1(unsigned __int8 a1)
{
  v1 = [MEMORY[0x1E4F4B680] safeStringForConsumerSubtype:a1];
  OUTLINED_FUNCTION_0_2(&dword_1AE67F000, v2, v3, "Unable to generate layout for consumerSubType %@ because no layout selector was provided.", v4, v5, v6, v7, 2u);
}

- (void)updateCachedLayout:(unsigned __int8)a1 uiConsumer:clientModelSuggestions:.cold.1(unsigned __int8 a1)
{
  v1 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a1];
  OUTLINED_FUNCTION_0_2(&dword_1AE67F000, v2, v3, "Blending: Failed to update the cache for %@", v4, v5, v6, v7, 2u);
}

@end