@interface ATXProactiveSuggestionUIFeedbackPublisher
- (ATXProactiveSuggestionUIFeedbackPublisher)initWithClientModelPublisher:(id)a3 blendingModelPublisher:(id)a4 uiPublisher:(id)a5 contextPublisher:(id)a6 validUICacheConsumerSubType:(unsigned __int8)a7 validClientModelIds:(id)a8 hyperParameters:(id)a9;
- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters;
- (BMBookmarkablePublisher)blendingModelPublisher;
- (BMBookmarkablePublisher)clientModelPublisher;
- (BMBookmarkablePublisher)contextPublisher;
- (BMBookmarkablePublisher)uiPublisher;
- (NSSet)validClientModelIds;
- (id)_filteredBlendingCacheUpdatePublisher:(id)a3;
- (id)_filteredCacheUpdateClientModelPublisher:(id)a3;
- (id)_timestampFromEvent:(id)a3;
- (id)clientModelsToConsider;
- (id)mergedBlendingClientContextPublisher;
- (id)uiFeedbackPublisher;
- (id)uiFeedbackSessionPublisherWithCorrelateHandler:(id)a3;
- (unsigned)validUICacheConsumerSubType;
- (void)setBlendingModelPublisher:(id)a3;
- (void)setClientModelPublisher:(id)a3;
- (void)setContextPublisher:(id)a3;
- (void)setHyperParameters:(id)a3;
- (void)setUiPublisher:(id)a3;
- (void)setValidClientModelIds:(id)a3;
- (void)setValidUICacheConsumerSubType:(unsigned __int8)a3;
@end

@implementation ATXProactiveSuggestionUIFeedbackPublisher

- (ATXProactiveSuggestionUIFeedbackPublisher)initWithClientModelPublisher:(id)a3 blendingModelPublisher:(id)a4 uiPublisher:(id)a5 contextPublisher:(id)a6 validUICacheConsumerSubType:(unsigned __int8)a7 validClientModelIds:(id)a8 hyperParameters:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)ATXProactiveSuggestionUIFeedbackPublisher;
  v18 = [(ATXProactiveSuggestionUIFeedbackPublisher *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientModelPublisher, a3);
    objc_storeStrong((id *)&v19->_blendingModelPublisher, a4);
    objc_storeStrong((id *)&v19->_uiPublisher, a5);
    objc_storeStrong((id *)&v19->_contextPublisher, a6);
    v19->_validUICacheConsumerSubType = a7;
    objc_storeStrong((id *)&v19->_validClientModelIds, a8);
    objc_storeStrong((id *)&v19->_hyperParameters, a9);
  }

  return v19;
}

- (id)uiFeedbackPublisher
{
  v3 = +[ATXUIFeedbackBiomeCorrelateHandler uiFeedbackCorrelateHandler];
  v4 = [(ATXProactiveSuggestionUIFeedbackPublisher *)self mergedBlendingClientContextPublisher];
  v5 = [(ATXProactiveSuggestionUIFeedbackPublisher *)self uiFeedbackSessionPublisherWithCorrelateHandler:v3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke;
  v9[3] = &unk_1E5F011B0;
  v9[4] = self;
  v6 = [v4 correlateWithCurrent:v5 comparator:v9 correlateHandler:v3];
  v7 = [v6 flatMapWithTransform:&__block_literal_global_13];

  return v7;
}

uint64_t __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 _timestampFromEvent:a2];
  v8 = [*(id *)(a1 + 32) _timestampFromEvent:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

uint64_t __64__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackPublisher__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bpsPublisher];
}

- (id)mergedBlendingClientContextPublisher
{
  v3 = [(ATXProactiveSuggestionUIFeedbackPublisher *)self _filteredCacheUpdateClientModelPublisher:self->_clientModelPublisher];
  v4 = [(ATXProactiveSuggestionUIFeedbackPublisher *)self _filteredBlendingCacheUpdatePublisher:self->_blendingModelPublisher];
  v5 = objc_opt_new();
  [v5 addObject:v4];
  if (self->_contextPublisher) {
    objc_msgSend(v5, "addObject:");
  }
  id v6 = [v3 orderedMergeWithOthers:v5 comparator:&__block_literal_global_9_0];

  return v6;
}

uint64_t __81__ATXProactiveSuggestionUIFeedbackPublisher_mergedBlendingClientContextPublisher__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)uiFeedbackSessionPublisherWithCorrelateHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F4B668]);
  id v6 = objc_opt_new();
  v7 = (void *)[v5 initWithFirst:0 second:v6];

  uiPublisher = self->_uiPublisher;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke;
  id v17 = &unk_1E5F011F8;
  v18 = self;
  id v19 = v4;
  id v9 = v4;
  v10 = [(BMBookmarkablePublisher *)uiPublisher scanWithInitial:v7 nextPartialResult:&v14];
  uint64_t v11 = objc_msgSend(v10, "filterWithIsIncluded:", &__block_literal_global_17_0, v14, v15, v16, v17, v18);
  v12 = [v11 mapWithTransform:&__block_literal_global_20_1];

  return v12;
}

id __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 eventBody];
  if (!v7)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F4B668]);
    v30 = [v5 second];
    v31 = (void *)[v29 initWithFirst:0 second:v30];

    goto LABEL_34;
  }
  double v8 = [v5 second];
  id v9 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v6 timestamp];
  v41 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  v10 = [v7 sessionProcessingOptionsForSessionType:0];
  uint64_t v42 = a1;
  uint64_t v11 = [v7 sessionIdentifierForSessionType:0 uiCacheConsumerSubType:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
  if (!v11)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F4B668]);
    v33 = [v5 second];
    v31 = (void *)[v32 initWithFirst:0 second:v33];

    goto LABEL_33;
  }
  id v38 = v6;
  v39 = v5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v37 = v10;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v12)
  {
    v43 = 0;
    goto LABEL_32;
  }
  uint64_t v13 = v12;
  v43 = 0;
  uint64_t v14 = *(void *)v46;
  id v16 = v41;
  uint64_t v15 = a1;
  v40 = v7;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v46 != v14) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "unsignedIntegerValue", v37, v38);
      switch(v18)
      {
        case 2:
          objc_super v25 = [v8 returnAndRemoveUIFeedbackSessionWithSessionIdentifier:v11 endDate:v16];
          id v19 = v25;
          if (v25)
          {
            id v26 = v25;

            v43 = v26;
          }
          goto LABEL_25;
        case 1:
          id v19 = [v8 uiFeedbackSessionWithSessionIdentifier:v11];
          v20 = [v7 blendingUICacheUpdateUUIDForUICacheConsumerSubType:*(unsigned __int8 *)(*(void *)(v15 + 32) + 8)];
          if (v20)
          {
            uint64_t v21 = [v19 blendingUICacheUpdateUUID];
            if (v21)
            {
              id v22 = (void *)v21;
              id v23 = [v19 blendingUICacheUpdateUUID];
              char v24 = [v20 isEqual:v23];

              if (v24)
              {
                v7 = v40;
                id v16 = v41;
              }
              else
              {
                uint64_t v27 = [v8 returnAndRemoveUIFeedbackSessionWithSessionIdentifier:v11 endDate:v41];

                [v8 trackNewUIFeedbackSessionWithSessionIdentifier:v11 startDate:v41];
                uint64_t v28 = [v8 uiFeedbackSessionWithSessionIdentifier:v11];

                v43 = (void *)v27;
                id v19 = (void *)v28;
                id v16 = v41;
                v7 = v40;
              }
            }
            uint64_t v15 = v42;
          }
          if (v19) {
            [v7 updateUIFeedbackSession:v19 uiCacheConsumerSubType:*(unsigned __int8 *)(*(void *)(v15 + 32) + 8)];
          }
          if (v20) {
            [*(id *)(v15 + 40) updateMostRecentlySeenBlendingUICacheUpdateUUID:v20];
          }

LABEL_25:
          continue;
        case 0:
          [v8 trackNewUIFeedbackSessionWithSessionIdentifier:v11 startDate:v16];
          break;
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v13);
LABEL_32:

  id v34 = objc_alloc(MEMORY[0x1E4F4B668]);
  id v5 = v39;
  v35 = [v39 second];
  v31 = (void *)[v34 initWithFirst:v43 second:v35];

  v10 = v37;
  id v6 = v38;
LABEL_33:

LABEL_34:
  return v31;
}

uint64_t __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 first];
  if (v3)
  {
    id v4 = [v2 first];
    uint64_t v5 = [v4 isValidSession];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __92__ATXProactiveSuggestionUIFeedbackPublisher_uiFeedbackSessionPublisherWithCorrelateHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 first];
}

- (id)_filteredBlendingCacheUpdatePublisher:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__ATXProactiveSuggestionUIFeedbackPublisher__filteredBlendingCacheUpdatePublisher___block_invoke;
  v5[3] = &unk_1E5F01260;
  v5[4] = self;
  v3 = [a3 filterWithIsIncluded:v5];
  return v3;
}

BOOL __83__ATXProactiveSuggestionUIFeedbackPublisher__filteredBlendingCacheUpdatePublisher___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 consumerSubType] == *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);

  return v4;
}

- (id)_filteredCacheUpdateClientModelPublisher:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__ATXProactiveSuggestionUIFeedbackPublisher__filteredCacheUpdateClientModelPublisher___block_invoke;
  v5[3] = &unk_1E5F01260;
  v5[4] = self;
  v3 = [a3 filterWithIsIncluded:v5];
  return v3;
}

uint64_t __86__ATXProactiveSuggestionUIFeedbackPublisher__filteredCacheUpdateClientModelPublisher___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 clientModelId];
    if (v5)
    {
      id v6 = *(id **)(a1 + 32);
      if (!v6[6])
      {
LABEL_6:
        v7 = [v6 clientModelsToConsider];
        uint64_t v8 = [v7 containsObject:v5];

LABEL_9:
        goto LABEL_10;
      }
      if ([v6[6] containsObject:v5])
      {
        id v6 = *(id **)(a1 + 32);
        goto LABEL_6;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_10:

  return v8;
}

- (id)clientModelsToConsider
{
  return (id)[(ATXUniversalBlendingLayerHyperParametersProtocol *)self->_hyperParameters clientModelsToConsiderForConsumerSubType:self->_validUICacheConsumerSubType];
}

- (id)_timestampFromEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = NSNumber;
    [v4 timestamp];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = NSNumber;
      id v8 = v4;
      id v9 = [v8 sessionEndDate];
      [v9 timeIntervalSinceReferenceDate];
      id v6 = objc_msgSend(v7, "numberWithDouble:");
    }
    else
    {
      v10 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(ATXProactiveSuggestionUIFeedbackPublisher *)(uint64_t)self _timestampFromEvent:v10];
      }

      id v6 = &unk_1F0627EF8;
    }
  }

  return v6;
}

- (BMBookmarkablePublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
}

- (unsigned)validUICacheConsumerSubType
{
  return self->_validUICacheConsumerSubType;
}

- (void)setValidUICacheConsumerSubType:(unsigned __int8)a3
{
  self->_validUICacheConsumerSubType = a3;
}

- (NSSet)validClientModelIds
{
  return self->_validClientModelIds;
}

- (void)setValidClientModelIds:(id)a3
{
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void)setHyperParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_validClientModelIds, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
}

- (void)_timestampFromEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_ERROR, "%@ - _timestampFromEvent invoked with unknown object: %@", (uint8_t *)&v7, 0x16u);
}

@end