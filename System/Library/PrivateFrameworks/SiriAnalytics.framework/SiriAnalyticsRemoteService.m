@interface SiriAnalyticsRemoteService
- (SiriAnalyticsRemoteService)initWithMachServiceName:(id)a3;
- (id)_packageMessageForXPC:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6;
- (void)barrierWithCompletion:(id)a3;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7;
- (void)enqueueLargeMessageObjectFromPath:(id)a3 dataUploadEvent:(id)a4 requestIdentifier:(id)a5 completion:(id)a6;
- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5;
@end

@implementation SiriAnalyticsRemoteService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SiriAnalyticsRemoteService_createTag_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __51__SiriAnalyticsRemoteService_createTag_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) createTag:a1[5] completion:a1[6]];
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__SiriAnalyticsRemoteService_sensitiveCondition_endedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __68__SiriAnalyticsRemoteService_sensitiveCondition_endedAt_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) sensitiveCondition:*(unsigned int *)(a1 + 56) endedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SiriAnalyticsRemoteService_sensitiveCondition_startedAt_completion___block_invoke;
  v11[3] = &unk_1E5AC06F0;
  int v14 = a3;
  id v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  id v10 = v8;
  dispatch_async(queue, v11);
}

uint64_t __70__SiriAnalyticsRemoteService_sensitiveCondition_startedAt_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) sensitiveCondition:*(unsigned int *)(a1 + 56) startedAt:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (id)_packageMessageForXPC:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = [a3 wrapAsAnyEvent];
  id v12 = [SiriAnalyticsXPCOrderedMessageEnvelope alloc];
  uint64_t v13 = (int)[v11 anyEventType];
  int v14 = [v11 payload];
  v15 = [(SiriAnalyticsXPCOrderedMessageEnvelope *)v12 initWithTimestamp:a4 streamUUID:v9 messageType:v13 messageUUID:v10 messageBody:v14];

  return v15;
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5AC06A0;
  id v12 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke_2;
  block[3] = &unk_1E5AC0718;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_async(queue, block);
}

uint64_t __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __52__SiriAnalyticsRemoteService_barrierWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 barrierWithCompletion:v3];
}

- (void)enqueueLargeMessageObjectFromPath:(id)a3 dataUploadEvent:(id)a4 requestIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = [SiriAnalyticsXPCLargeMessageEnvelope alloc];
  v15 = [v12 data];

  v16 = [(SiriAnalyticsXPCLargeMessageEnvelope *)v14 initWithLargeMessagePath:v13 requestIdentifier:v11 serializedDataUploadMessage:v15];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__SiriAnalyticsRemoteService_enqueueLargeMessageObjectFromPath_dataUploadEvent_requestIdentifier_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  v21 = v16;
  id v22 = v10;
  id v18 = v10;
  v19 = v16;
  dispatch_async(queue, block);
}

uint64_t __109__SiriAnalyticsRemoteService_enqueueLargeMessageObjectFromPath_dataUploadEvent_requestIdentifier_completion___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) publishLargeMessage:a1[5] completion:a1[6]];
}

- (void)resolvePartialMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7
{
  id v12 = (void (**)(void))a7;
  id v13 = [(SiriAnalyticsRemoteService *)self _packageMessageForXPC:a3 timestamp:a4 messageUUID:a5 isolatedStreamUUID:a6];
  int v14 = v13;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __104__SiriAnalyticsRemoteService_resolvePartialMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke;
    block[3] = &unk_1E5AC0768;
    block[4] = self;
    id v17 = v13;
    id v18 = v12;
    dispatch_async(queue, block);
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __104__SiriAnalyticsRemoteService_resolvePartialMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 16);
  v4[0] = a1[5];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 resolveMessages:v3 completion:a1[6]];
}

- (void)emitMessage:(id)a3 timestamp:(unint64_t)a4 messageUUID:(id)a5 isolatedStreamUUID:(id)a6 completion:(id)a7
{
  id v12 = (void (**)(void))a7;
  id v13 = [(SiriAnalyticsRemoteService *)self _packageMessageForXPC:a3 timestamp:a4 messageUUID:a5 isolatedStreamUUID:a6];
  int v14 = v13;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__SiriAnalyticsRemoteService_emitMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke;
    block[3] = &unk_1E5AC0768;
    block[4] = self;
    id v17 = v13;
    id v18 = v12;
    dispatch_async(queue, block);
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

void __94__SiriAnalyticsRemoteService_emitMessage_timestamp_messageUUID_isolatedStreamUUID_completion___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1[4] + 16);
  v4[0] = a1[5];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 publishMessages:v3 completion:a1[6]];
}

- (SiriAnalyticsRemoteService)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriAnalyticsRemoteService;
  id v5 = [(SiriAnalyticsRemoteService *)&v12 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.analytics.stream.xpc", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    id v9 = [[SiriAnalyticsXPCConnection alloc] initWithMachServiceName:v4];
    connection = v5->_connection;
    v5->_connection = v9;
  }
  return v5;
}

@end