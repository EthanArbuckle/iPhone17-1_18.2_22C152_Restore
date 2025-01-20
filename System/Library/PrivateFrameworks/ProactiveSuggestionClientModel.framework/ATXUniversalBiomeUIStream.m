@interface ATXUniversalBiomeUIStream
- (ATXUniversalBiomeUIStream)init;
- (ATXUniversalBiomeUIStream)initWithStoreConfig:(id)a3;
- (id)_innerStreamForConsumerSubType:(unsigned __int8)a3;
- (id)_innerStreamForStreamId:(id)a3;
- (id)_streamIdForConsumerSubType:(unsigned __int8)a3;
- (id)_validUIStreamConsumerSubTypes;
- (id)deprecatedGenericEventPublisherFromStartTime:(double)a3;
- (id)genericEventPublisherFromStartTime:(double)a3;
- (id)genericEventPublisherFromStartTime:(double)a3 consumerSubType:(unsigned __int8)a4;
- (id)streamIdentifiers;
- (void)donateGenericUIEvent:(id)a3;
@end

@implementation ATXUniversalBiomeUIStream

- (void)donateGenericUIEvent:(id)a3
{
  id v4 = a3;
  -[ATXUniversalBiomeUIStream _innerStreamForConsumerSubType:](self, "_innerStreamForConsumerSubType:", [v4 consumerSubTypeForUIStream]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [v6 source];
  [v5 sendEvent:v4];
}

- (id)_innerStreamForConsumerSubType:(unsigned __int8)a3
{
  id v4 = [(ATXUniversalBiomeUIStream *)self _streamIdForConsumerSubType:a3];
  v5 = [(ATXUniversalBiomeUIStream *)self _innerStreamForStreamId:v4];

  return v5;
}

- (id)streamIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(ATXUniversalBiomeUIStream *)self _validUIStreamConsumerSubTypes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[ATXUniversalBiomeUIStream _streamIdForConsumerSubType:](self, "_streamIdForConsumerSubType:", [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue]);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return v10;
}

- (id)_streamIdForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v4 = [NSString alloc];
  uint64_t v5 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
  uint64_t v6 = (void *)[v4 initWithFormat:@"blendingUI%@", v5];

  return v6;
}

- (id)_validUIStreamConsumerSubTypes
{
  return &unk_1F0628098;
}

- (id)_innerStreamForStreamId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXUniversalBiomeUIStream *)self streamIdentifiers];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    id v20 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__ATXUniversalBiomeUIStream__innerStreamForStreamId___block_invoke;
    v11[3] = &unk_1E5F010E0;
    long long v14 = &v15;
    id v12 = v4;
    long long v13 = self;
    [(_PASLock *)lock runWithLockAcquired:v11];
    id v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      [(ATXUniversalBiomeUIStream *)(uint64_t)self _innerStreamForStreamId:v9];
    }

    id v8 = 0;
  }

  return v8;
}

void __53__ATXUniversalBiomeUIStream__innerStreamForStreamId___block_invoke(void *a1, void *a2)
{
  v9 = a2;
  uint64_t v3 = [v9[1] objectForKey:a1[4]];
  uint64_t v4 = *(void *)(a1[6] + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:a1[4] storeConfig:*(void *)(a1[5] + 8)];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [v9[1] setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[4]];
  }
}

- (ATXUniversalBiomeUIStream)init
{
  return [(ATXUniversalBiomeUIStream *)self initWithStoreConfig:0];
}

- (ATXUniversalBiomeUIStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXUniversalBiomeUIStream;
  uint64_t v5 = [(ATXUniversalBiomeUIStream *)&v13 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = (BMStoreConfig *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      uint64_t v6 = (BMStoreConfig *)objc_claimAutoreleasedReturnValue();
    }
    storeConfig = v5->_storeConfig;
    v5->_storeConfig = v6;

    id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
    v9 = objc_opt_new();
    uint64_t v10 = [v8 initWithGuardedData:v9];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v10;
  }
  return v5;
}

- (id)genericEventPublisherFromStartTime:(double)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"homeScreen" storeConfig:self->_storeConfig];
  uint64_t v6 = [v5 publisherFromStartTime:a3];

  uint64_t v7 = [(ATXUniversalBiomeUIStream *)self streamIdentifiers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke;
  v11[3] = &unk_1E5F00FD0;
  void v11[4] = self;
  *(double *)&v11[5] = a3;
  id v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v11);

  v9 = [v6 orderedMergeWithOthers:v8 comparator:&__block_literal_global_11];

  return v9;
}

id __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _innerStreamForStreamId:a2];
  id v4 = [v3 publisherFromStartTime:*(double *)(a1 + 40)];

  return v4;
}

uint64_t __64__ATXUniversalBiomeUIStream_genericEventPublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)genericEventPublisherFromStartTime:(double)a3 consumerSubType:(unsigned __int8)a4
{
  id v5 = [(ATXUniversalBiomeUIStream *)self _innerStreamForConsumerSubType:a4];
  uint64_t v6 = [v5 publisherFromStartTime:a3];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CBF0] bpsPublisher];
  }
  double v9 = v8;

  return v9;
}

- (id)deprecatedGenericEventPublisherFromStartTime:(double)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"homeScreen" storeConfig:self->_storeConfig];
  id v5 = [v4 publisherFromStartTime:a3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storeConfig, 0);
}

- (void)_innerStreamForStreamId:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  id v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "%@ - could not create BMStoreStream for streamId: %@", (uint8_t *)&v7, 0x16u);
}

@end