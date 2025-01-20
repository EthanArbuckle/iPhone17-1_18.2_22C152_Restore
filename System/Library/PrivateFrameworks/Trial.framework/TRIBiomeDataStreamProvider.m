@interface TRIBiomeDataStreamProvider
- (TRIBiomeDataStreamProvider)init;
- (void)_subscribeForStreamIdentifier:(id)a3 eventHandler:(id)a4;
- (void)_unsubscribeAllDataStreams;
- (void)dealloc;
- (void)readLastDataStreamEventForIdentifier:(id)a3 eventHandler:(id)a4;
- (void)readLastDataStreamEventForIdentifier:(id)a3 withFilter:(id)a4 eventHandler:(id)a5;
- (void)setShouldSubscribeWithWaking:(BOOL)a3;
- (void)subscribeDataStreamForIdentifier:(id)a3 eventHandler:(id)a4;
- (void)unsubscribeAllDataStreams;
@end

@implementation TRIBiomeDataStreamProvider

- (TRIBiomeDataStreamProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)TRIBiomeDataStreamProvider;
  v2 = [(TRIBiomeDataStreamProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.biome-provider" qosClass:17];
    providerQueue = v2->_providerQueue;
    v2->_providerQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    streamIdentifierstoSubscribedSinks = v2->_streamIdentifierstoSubscribedSinks;
    v2->_streamIdentifierstoSubscribedSinks = v5;

    v2->_shouldSubscribeWithWaking = 1;
  }
  return v2;
}

- (void)dealloc
{
  [(TRIBiomeDataStreamProvider *)self unsubscribeAllDataStreams];
  v3.receiver = self;
  v3.super_class = (Class)TRIBiomeDataStreamProvider;
  [(TRIBiomeDataStreamProvider *)&v3 dealloc];
}

- (void)readLastDataStreamEventForIdentifier:(id)a3 eventHandler:(id)a4
{
  v5 = (void (**)(id, void, id))a4;
  id v6 = a3;
  v7 = BiomeLibrary();
  id v17 = 0;
  objc_super v8 = [v7 streamWithIdentifier:v6 error:&v17];

  id v9 = v17;
  if (v9)
  {
    v5[2](v5, 0, v9);
  }
  else
  {
    v10 = [v8 publisher];
    v11 = [v10 last];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke;
    v15[3] = &unk_1E596B2D8;
    v16 = v5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke_5;
    v13[3] = &unk_1E596B300;
    v14 = v16;
    id v12 = (id)[v11 sinkWithCompletion:v15 receiveInput:v13];
  }
}

void __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = [v3 error];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_error_impl(&dword_19D909000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __80__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_eventHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v5 = [v3 json];

  if (v5)
  {
    v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readLastDataStreamEventForIdentifier:(id)a3 withFilter:(id)a4 eventHandler:(id)a5
{
  id v7 = a4;
  int v8 = (void (**)(id, void, id))a5;
  id v9 = a3;
  uint64_t v10 = BiomeLibrary();
  id v23 = 0;
  v11 = [v10 streamWithIdentifier:v9 error:&v23];

  id v12 = v23;
  if (v12)
  {
    v8[2](v8, 0, v12);
  }
  else
  {
    v13 = [v11 publisher];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke;
    v21[3] = &unk_1E596B328;
    id v22 = v7;
    v14 = [v13 filterWithIsIncluded:v21];

    v15 = [v14 last];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_2;
    v19[3] = &unk_1E596B2D8;
    v20 = v8;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_9;
    v17[3] = &unk_1E596B300;
    v18 = v20;
    id v16 = (id)[v15 sinkWithCompletion:v19 receiveInput:v17];
  }
}

uint64_t __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x19F3AD060]();
  id v5 = [v3 eventBody];
  id v6 = [v5 json];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8;
}

void __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_error_impl(&dword_19D909000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __91__TRIBiomeDataStreamProvider_readLastDataStreamEventForIdentifier_withFilter_eventHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)MEMORY[0x19F3AD060]();
  v4 = [v7 eventBody];
  uint64_t v5 = [v4 json];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)subscribeDataStreamForIdentifier:(id)a3 eventHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__TRIBiomeDataStreamProvider_subscribeDataStreamForIdentifier_eventHandler___block_invoke;
  block[3] = &unk_1E596B350;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(providerQueue, block);
}

uint64_t __76__TRIBiomeDataStreamProvider_subscribeDataStreamForIdentifier_eventHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeForStreamIdentifier:*(void *)(a1 + 40) eventHandler:*(void *)(a1 + 48)];
}

- (void)_subscribeForStreamIdentifier:(id)a3 eventHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, id))a4;
  providerQueue = self->_providerQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(providerQueue);
  id v9 = BiomeLibrary();
  id v30 = 0;
  id v10 = [v9 streamWithIdentifier:v8 error:&v30];

  id v11 = v30;
  if (v11)
  {
    v6[2](v6, 0, v11);
  }
  else
  {
    id v12 = NSString;
    id v13 = [v10 identifier];
    v14 = [v12 stringWithFormat:@"com.apple.trial.%@", v13];

    v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v14;
      _os_log_impl(&dword_19D909000, v15, OS_LOG_TYPE_DEFAULT, "Subscribing to events from Biome stream: %@", buf, 0xCu);
    }

    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F502E8]) initWithIdentifier:v14 targetQueue:self->_providerQueue waking:self->_shouldSubscribeWithWaking];
    id v17 = [v10 DSLPublisher];
    v18 = [v17 subscribeOn:v16];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke;
    v28[3] = &unk_1E596B2D8;
    v29 = v6;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke_14;
    v26[3] = &unk_1E596B300;
    v27 = v29;
    v19 = [v18 sinkWithCompletion:v28 receiveInput:v26];

    streamIdentifierstoSubscribedSinks = self->_streamIdentifierstoSubscribedSinks;
    v21 = [v10 identifier];
    id v22 = [(NSMutableDictionary *)streamIdentifierstoSubscribedSinks objectForKeyedSubscript:v21];

    if (v22)
    {
      id v23 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v14;
        _os_log_impl(&dword_19D909000, v23, OS_LOG_TYPE_DEFAULT, "Subscribed sink already exists. Replacing: %@", buf, 0xCu);
      }
    }
    v24 = self->_streamIdentifierstoSubscribedSinks;
    v25 = [v10 identifier];
    [(NSMutableDictionary *)v24 setObject:v19 forKeyedSubscript:v25];
  }
}

void __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 error];
      int v8 = 138412290;
      id v9 = v7;
      _os_log_error_impl(&dword_19D909000, v4, OS_LOG_TYPE_ERROR, "failed to to read Biome stream: %@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 error];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);
  }
}

void __73__TRIBiomeDataStreamProvider__subscribeForStreamIdentifier_eventHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (void *)MEMORY[0x19F3AD060]();
  v4 = [v7 eventBody];
  uint64_t v5 = [v4 json];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
  }
  else
  {
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsubscribeAllDataStreams
{
  providerQueue = self->_providerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TRIBiomeDataStreamProvider_unsubscribeAllDataStreams__block_invoke;
  block[3] = &unk_1E596A0B0;
  block[4] = self;
  dispatch_sync(providerQueue, block);
}

uint64_t __55__TRIBiomeDataStreamProvider_unsubscribeAllDataStreams__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeAllDataStreams];
}

- (void)_unsubscribeAllDataStreams
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_providerQueue);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_streamIdentifierstoSubscribedSinks;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamIdentifierstoSubscribedSinks, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 cancel];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setShouldSubscribeWithWaking:(BOOL)a3
{
  self->_shouldSubscribeWithWaking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamIdentifierstoSubscribedSinks, 0);
  objc_storeStrong((id *)&self->_providerQueue, 0);
}

@end