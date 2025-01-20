@interface SiriAnalyticsUnifiedBiomeStream
- (SiriAnalyticsUnifiedBiomeStream)init;
- (SiriAnalyticsUnifiedBiomeStream)initWithReadOnlyStorageURL:(id)a3 prefs:(id)a4;
- (SiriAnalyticsUnifiedBiomeStream)initWithReadWriteStorageURL:(id)a3 prefs:(id)a4;
- (void)fetchMessagesBatchSinceBookmark:(id)a3 batchSize:(unint64_t)a4 completion:(id)a5;
- (void)fetchMessagesSince:(double)a3 receiveMessage:(id)a4 completion:(id)a5;
- (void)fetchMessagesSinceBookmark:(id)a3 receiveMessage:(id)a4 completion:(id)a5;
- (void)prune;
- (void)sendEvents:(id)a3;
@end

@implementation SiriAnalyticsUnifiedBiomeStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)prune
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1A623C920](self, a2);
  id v4 = objc_alloc(MEMORY[0x1E4F50278]);
  v5 = [(NSURL *)self->_url path];
  v6 = (void *)[v4 initWithStoreBasePath:v5 segmentSize:0x100000 protectionClass:3];

  id v7 = objc_alloc(MEMORY[0x1E4F50288]);
  v8 = +[SiriAnalyticsUnifiedMessageStreamHelper identifier];
  v9 = (void *)[v7 initWithStream:v8 permission:2 config:v6];

  unint64_t v10 = [(SiriAnalyticsPreferences *)self->_prefs unifiedStreamMaxSizeOrDefault];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  unint64_t v11 = v10 << 20;
  v12 = SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315394;
    v21 = "-[SiriAnalyticsUnifiedBiomeStream prune]";
    __int16 v22 = 2048;
    double v23 = *(double *)&v11;
    _os_log_debug_impl(&dword_1A2B39000, v12, OS_LOG_TYPE_DEBUG, "%s Pruning stream with max size: %lu bytes", (uint8_t *)&v20, 0x16u);
  }
  [v9 pruneStreamToMaxStreamSizeInBytes:v11];
  [(SiriAnalyticsPreferences *)self->_prefs unifiedStreamMaxAgeOrDefault];
  double v14 = v13;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  v15 = SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315394;
    v21 = "-[SiriAnalyticsUnifiedBiomeStream prune]";
    __int16 v22 = 2048;
    double v23 = v14;
    _os_log_debug_impl(&dword_1A2B39000, v15, OS_LOG_TYPE_DEBUG, "%s Pruning stream with max age: %.1f seconds", (uint8_t *)&v20, 0x16u);
  }
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F50268]) initPruneOnAccess:0 filterByAgeOnRead:0 maxAge:0 maxStreamSize:v14];
  [v6 setPruningPolicy:v16];
  id v17 = objc_alloc(MEMORY[0x1E4F50490]);
  v18 = +[SiriAnalyticsUnifiedMessageStreamHelper identifier];
  v19 = (void *)[v17 initWithPrivateStreamIdentifier:v18 storeConfig:v6 eventDataClass:objc_opt_class()];

  [v19 pruneExpiredEventsWithBlock:&__block_literal_global_662];
}

- (void)fetchMessagesBatchSinceBookmark:(id)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke;
  v14[3] = &unk_1E5AC03F8;
  v14[4] = v15;
  v14[5] = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke_2;
  v11[3] = &unk_1E5AC0420;
  id v10 = v9;
  id v12 = v10;
  double v13 = v15;
  [(SiriAnalyticsUnifiedBiomeStream *)self fetchMessagesSinceBookmark:v8 receiveMessage:v14 completion:v11];

  _Block_object_dispose(v15, 8);
}

BOOL __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] < *(void *)(a1 + 40);
}

uint64_t __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesBatchSinceBookmark_batchSize_completion___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (a3) {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else {
    uint64_t v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, v7, a2);
}

- (void)fetchMessagesSinceBookmark:(id)a3 receiveMessage:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(BMStoreStream *)self->_stream publisherFromStartTime:0.0];
  if (!v8)
  {
    double v14 = 0;
LABEL_6:
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke;
    v19[3] = &unk_1E5AC03A8;
    id v20 = v10;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke_2;
    v17[3] = &unk_1E5AC03D0;
    id v18 = v9;
    id v16 = (id)[v11 drivableSinkWithBookmark:v14 completion:v19 shouldContinue:v17];

    id v15 = v20;
    goto LABEL_7;
  }
  id v12 = (void *)MEMORY[0x1E4F28DC0];
  double v13 = objc_msgSend(MEMORY[0x1E4F28B90], "bm_allowedClassesForSecureCodingBMBookmark");
  id v21 = 0;
  double v14 = [v12 unarchivedObjectOfClasses:v13 fromData:v8 error:&v21];
  id v15 = v21;

  if (!v15 && v14) {
    goto LABEL_6;
  }
  (*((void (**)(id, void, void, uint64_t))v10 + 2))(v10, 0, 0, 2);
LABEL_7:
}

void __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 state]
    || ([v5 error], uint64_t v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v10 = 0;
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v10];
    id v9 = v10;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __88__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSinceBookmark_receiveMessage_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 eventBody];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v3 eventBody];
    uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v8 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      unint64_t v11 = "-[SiriAnalyticsUnifiedBiomeStream fetchMessagesSinceBookmark:receiveMessage:completion:]_block_invoke_2";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_error_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_ERROR, "%s Event had no eventBody: %@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v7 = 1;
  }

  return v7;
}

- (void)fetchMessagesSince:(double)a3 receiveMessage:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int v10 = [(BMStoreStream *)self->_stream publisherFromStartTime:a3];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  *(double *)&v20[3] = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke;
  v17[3] = &unk_1E5AC0358;
  id v11 = v9;
  id v18 = v11;
  v19 = v20;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke_63;
  v14[3] = &unk_1E5AC0380;
  id v16 = v20;
  id v12 = v8;
  id v15 = v12;
  id v13 = (id)[v10 sinkWithCompletion:v17 receiveInput:v14];

  _Block_object_dispose(v20, 8);
}

void __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  id v4 = (void *)SiriAnalyticsLogContextUnifiedBiomeStream;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUnifiedBiomeStream, OS_LOG_TYPE_DEBUG))
  {
    id v9 = v4;
    uint64_t v10 = [v3 state];
    id v11 = [v3 error];
    int v12 = 136315650;
    id v13 = "-[SiriAnalyticsUnifiedBiomeStream fetchMessagesSince:receiveMessage:completion:]_block_invoke";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_debug_impl(&dword_1A2B39000, v9, OS_LOG_TYPE_DEBUG, "%s Sink completion with state: %ld, error: %@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  BOOL v7 = [v3 state] == 0;
  id v8 = [v3 error];
  (*(void (**)(uint64_t, BOOL, void *, double))(v5 + 16))(v5, v7, v8, v6);
}

void __80__SiriAnalyticsUnifiedBiomeStream_fetchMessagesSince_receiveMessage_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v7 = a2;
  [v7 timestamp];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  id v4 = [v7 eventBody];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = [v7 eventBody];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)sendEvents:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(BMSource *)self->_source sendEvent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (SiriAnalyticsUnifiedBiomeStream)initWithReadOnlyStorageURL:(id)a3 prefs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SiriAnalyticsUnifiedBiomeStream;
  long long v9 = [(SiriAnalyticsUnifiedBiomeStream *)&v22 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    +[SiriAnalyticsUnifiedMessageStreamHelper ensureDirectoryExistsAt:v7];
    id v11 = objc_alloc(MEMORY[0x1E4F50278]);
    long long v12 = [v7 path];
    id v13 = (void *)[v11 initWithStoreBasePath:v12 segmentSize:0x100000 protectionClass:3];

    objc_storeStrong((id *)&v10->_prefs, a4);
    id v14 = objc_alloc(MEMORY[0x1E4F50268]);
    [v8 unifiedStreamMaxAgeOrDefault];
    __int16 v16 = objc_msgSend(v14, "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 0, 1, objc_msgSend(v8, "unifiedStreamMaxSizeOrDefault"), v15);
    [v13 setPruningPolicy:v16];
    id v17 = objc_alloc(MEMORY[0x1E4F50490]);
    uint64_t v18 = +[SiriAnalyticsUnifiedMessageStreamHelper identifier];
    uint64_t v19 = [v17 initWithPrivateStreamIdentifier:v18 storeConfig:v13 eventDataClass:objc_opt_class()];
    stream = v10->_stream;
    v10->_stream = (BMStoreStream *)v19;
  }
  return v10;
}

- (SiriAnalyticsUnifiedBiomeStream)initWithReadWriteStorageURL:(id)a3 prefs:(id)a4
{
  id v4 = [(SiriAnalyticsUnifiedBiomeStream *)self initWithReadOnlyStorageURL:a3 prefs:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(BMStoreStream *)v4->_stream source];
    source = v5->_source;
    v5->_source = (BMSource *)v6;
  }
  return v5;
}

- (SiriAnalyticsUnifiedBiomeStream)init
{
  return 0;
}

@end