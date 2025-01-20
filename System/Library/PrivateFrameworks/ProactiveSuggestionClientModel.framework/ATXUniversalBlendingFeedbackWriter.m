@interface ATXUniversalBlendingFeedbackWriter
- (ATXUniversalBlendingFeedbackWriter)init;
- (ATXUniversalBlendingFeedbackWriter)initWithClientModelStream:(id)a3 lightWeightClientModelStream:(id)a4 blendingModelStream:(id)a5 uiStream:(id)a6;
- (void)donateBlendingModelUICacheUpdate:(id)a3 uiConsumer:(unsigned __int8)a4;
- (void)donateUIInteractionEvent:(id)a3;
- (void)sendEventToBiomeIfNeededForClientModelCacheUpdate:(id)a3 previousUpdate:(id)a4;
@end

@implementation ATXUniversalBlendingFeedbackWriter

- (ATXUniversalBlendingFeedbackWriter)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(ATXUniversalBlendingFeedbackWriter *)self initWithClientModelStream:v3 lightWeightClientModelStream:v4 blendingModelStream:v5 uiStream:v6];

  return v7;
}

- (ATXUniversalBlendingFeedbackWriter)initWithClientModelStream:(id)a3 lightWeightClientModelStream:(id)a4 blendingModelStream:(id)a5 uiStream:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ATXUniversalBlendingFeedbackWriter;
  v15 = [(ATXUniversalBlendingFeedbackWriter *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_clientModelStream, a3);
    objc_storeStrong((id *)&v16->_lightWeightClientModelStream, a4);
    objc_storeStrong((id *)&v16->_blendingModelStream, a5);
    objc_storeStrong((id *)&v16->_uiStream, a6);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("ATXUniversalBlendingFeedbackWriter.internalQueue", v17);
    internalQueue = v16->_internalQueue;
    v16->_internalQueue = (OS_dispatch_queue *)v18;
  }
  return v16;
}

- (void)sendEventToBiomeIfNeededForClientModelCacheUpdate:(id)a3 previousUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__ATXUniversalBlendingFeedbackWriter_sendEventToBiomeIfNeededForClientModelCacheUpdate_previousUpdate___block_invoke;
  block[3] = &unk_1E5F00CB8;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(internalQueue, block);
}

void __103__ATXUniversalBlendingFeedbackWriter_sendEventToBiomeIfNeededForClientModelCacheUpdate_previousUpdate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) suggestions];
  if ([v2 count])
  {

LABEL_4:
    v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) clientModelId];
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1AE67F000, v5, OS_LOG_TYPE_DEFAULT, "Adding event to client model Biome stream for: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v7 = [*(id *)(*(void *)(a1 + 48) + 8) source];
    [v7 sendEvent:*(void *)(a1 + 40)];

    v8 = [[ATXLightweightClientModelCacheUpdate alloc] initWithClientModelCacheUpdate:*(void *)(a1 + 40)];
    id v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(ATXLightweightClientModelCacheUpdate *)v8 clientModelId];
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_1AE67F000, v9, OS_LOG_TYPE_DEFAULT, "Adding event to lightweight client model Biome stream for: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v11 = [*(id *)(*(void *)(a1 + 48) + 16) source];
    [v11 sendEvent:v8];
    goto LABEL_9;
  }
  v3 = [*(id *)(a1 + 40) suggestions];
  uint64_t v4 = [v3 count];

  if (v4) {
    goto LABEL_4;
  }
  __atxlog_handle_blending();
  v8 = (ATXLightweightClientModelCacheUpdate *)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(&v8->super, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_10;
  }
  id v11 = [*(id *)(a1 + 40) clientModelId];
  int v12 = 138543362;
  id v13 = v11;
  _os_log_impl(&dword_1AE67F000, &v8->super, OS_LOG_TYPE_DEFAULT, "Not adding event for client model to Biome stream (%{public}@) because our previous suggestion was empty and so is our new one.", (uint8_t *)&v12, 0xCu);
LABEL_9:

LABEL_10:
}

- (void)donateBlendingModelUICacheUpdate:(id)a3 uiConsumer:(unsigned __int8)a4
{
  id v5 = a3;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__ATXUniversalBlendingFeedbackWriter_donateBlendingModelUICacheUpdate_uiConsumer___block_invoke;
  v8[3] = &unk_1E5F016B8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(internalQueue, v8);
}

uint64_t __82__ATXUniversalBlendingFeedbackWriter_donateBlendingModelUICacheUpdate_uiConsumer___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) donateBlendingModelUICacheUpdate:*(void *)(a1 + 40)];
}

- (void)donateUIInteractionEvent:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__ATXUniversalBlendingFeedbackWriter_donateUIInteractionEvent___block_invoke;
  v7[3] = &unk_1E5F016B8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __63__ATXUniversalBlendingFeedbackWriter_donateUIInteractionEvent___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = __atxlog_handle_blending();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", objc_msgSend(*(id *)(a1 + 32), "consumerSubTypeForUIStream"));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412546;
    id v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1AE67F000, v2, OS_LOG_TYPE_DEFAULT, "Feedback Writer: Recording UI interaction event for consumerSubType %@. Event: %@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) donateGenericUIEvent:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_uiStream, 0);
  objc_storeStrong((id *)&self->_blendingModelStream, 0);
  objc_storeStrong((id *)&self->_lightWeightClientModelStream, 0);
  objc_storeStrong((id *)&self->_clientModelStream, 0);
}

@end