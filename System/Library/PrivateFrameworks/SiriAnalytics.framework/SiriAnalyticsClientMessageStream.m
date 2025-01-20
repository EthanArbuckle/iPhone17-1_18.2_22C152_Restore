@interface SiriAnalyticsClientMessageStream
- (SiriAnalyticsClientMessageStream)initWithQueue:(id)a3 analyticsService:(id)a4 delegate:(id)a5;
- (id)analyticsService;
- (void)barrierWithCompletion:(id)a3;
- (void)emitMessage:(id)a3;
- (void)emitMessage:(id)a3 isolatedStreamUUID:(id)a4;
- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4;
- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5;
- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6;
- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 requestIdentifier:(id)a5 messageMetadata:(id)a6 completion:(id)a7;
- (void)resolvePartialMessage:(id)a3;
- (void)resolvePartialMessage:(id)a3 isolatedStreamUUID:(id)a4;
- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4;
- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5;
- (void)setAnalyticsService:(id)a3;
@end

@implementation SiriAnalyticsClientMessageStream

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 requestIdentifier:(id)a5 messageMetadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F29128] UUID];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4FA0410]);
  id v18 = objc_alloc_init(MEMORY[0x1E4FA0418]);
  [v17 setMetadata:v18];

  v19 = [v17 metadata];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FA1378]) initWithNSUUID:v13];
  [v19 setAssetIdentifier:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4FA0408]);
  [v17 setContent:v21];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v17 setSpeechAudioRecord:v15];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __131__SiriAnalyticsClientMessageStream_enqueueLargeMessageObjectFromPath_assetIdentifier_requestIdentifier_messageMetadata_completion___block_invoke;
  block[3] = &unk_1E5AC0628;
  block[4] = self;
  id v28 = v12;
  id v29 = v17;
  id v30 = v14;
  id v31 = v16;
  id v23 = v16;
  id v24 = v14;
  id v25 = v17;
  id v26 = v12;
  dispatch_async(queue, block);
}

uint64_t __131__SiriAnalyticsClientMessageStream_enqueueLargeMessageObjectFromPath_assetIdentifier_requestIdentifier_messageMetadata_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) enqueueLargeMessageObjectFromPath:a1[5] dataUploadEvent:a1[6] requestIdentifier:a1[7] completion:a1[8]];
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 assetIdentifier:(id)a4 messageMetadata:(id)a5 completion:(id)a6
{
}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9 || [v8 clockIsolationLevel] != 2)
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__SiriAnalyticsClientMessageStream_resolvePartialMessage_timestamp_isolatedStreamUUID___block_invoke;
    block[3] = &unk_1E5AC0600;
    block[4] = self;
    unint64_t v18 = a4;
    id v15 = v8;
    id v16 = v12;
    id v17 = v9;
    id v10 = v12;
    dispatch_async(queue, block);
  }
  else
  {
    id v10 = [v8 qualifiedMessageName];
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v11 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SiriAnalyticsClientMessageStream resolvePartialMessage:timestamp:isolatedStreamUUID:]";
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_error_impl(&dword_1A2B39000, v11, OS_LOG_TYPE_ERROR, "%s SELF Event is marked as ISOLATED but is emitted without isolatedStreamUUID. Not emitting event: %@", buf, 0x16u);
    }
  }
}

uint64_t __87__SiriAnalyticsClientMessageStream_resolvePartialMessage_timestamp_isolatedStreamUUID___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) resolvePartialMessage:a1[5] timestamp:a1[8] messageUUID:a1[6] isolatedStreamUUID:a1[7] completion:0];
}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4
{
}

- (void)resolvePartialMessage:(id)a3 isolatedStreamUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SiriAnalyticsClientMessageStream *)self resolvePartialMessage:v7 timestamp:mach_absolute_time() isolatedStreamUUID:v6];
}

- (void)resolvePartialMessage:(id)a3
{
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SiriAnalyticsClientMessageStream_barrierWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__SiriAnalyticsClientMessageStream_barrierWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) barrierWithCompletion:*(void *)(a1 + 40)];
}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 isolatedStreamUUID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 qualifiedMessageName];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v11 = mach_continuous_time();
  uint64_t v12 = mach_absolute_time();
  id v13 = (id)SiriAnalyticsLogContextPerformance;
  os_signpost_id_t v14 = os_signpost_id_generate((os_log_t)SiriAnalyticsLogContextPerformance);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)buf = 134349314;
      id v26 = (const char *)(v11 + a4 - v12);
      __int16 v27 = 2112;
      id v28 = v10;
      _os_signpost_emit_with_name_impl(&dword_1A2B39000, v13, OS_SIGNPOST_EVENT, v15, "EventEmitted", "%{public, signpost.description:event_time}llu type=%@", buf, 0x16u);
    }
  }

  if (v9 || [v8 clockIsolationLevel] != 2)
  {
    id v17 = [MEMORY[0x1E4F29128] UUID];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__SiriAnalyticsClientMessageStream_emitMessage_timestamp_isolatedStreamUUID___block_invoke;
    block[3] = &unk_1E5AC0600;
    block[4] = self;
    unint64_t v24 = a4;
    id v21 = v8;
    id v22 = v17;
    id v23 = v9;
    id v19 = v17;
    dispatch_async(queue, block);
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v16 = SiriAnalyticsLogContextStreaming;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextStreaming, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v26 = "-[SiriAnalyticsClientMessageStream emitMessage:timestamp:isolatedStreamUUID:]";
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl(&dword_1A2B39000, v16, OS_LOG_TYPE_ERROR, "%s SELF Event is marked as ISOLATED but is emitted without isolatedStreamUUID. Not emitting event: %@", buf, 0x16u);
    }
  }
}

uint64_t __77__SiriAnalyticsClientMessageStream_emitMessage_timestamp_isolatedStreamUUID___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) emitMessage:a1[5] timestamp:a1[8] messageUUID:a1[6] isolatedStreamUUID:a1[7] completion:0];
}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4
{
}

- (void)emitMessage:(id)a3 isolatedStreamUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SiriAnalyticsClientMessageStream *)self emitMessage:v7 timestamp:mach_absolute_time() isolatedStreamUUID:v6];
}

- (void)emitMessage:(id)a3
{
}

- (void)setAnalyticsService:(id)a3
{
}

- (id)analyticsService
{
  return self->_service;
}

- (SiriAnalyticsClientMessageStream)initWithQueue:(id)a3 analyticsService:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SiriAnalyticsClientMessageStream;
  uint64_t v12 = [(SiriAnalyticsClientMessageStream *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeStrong((id *)&v13->_service, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

@end