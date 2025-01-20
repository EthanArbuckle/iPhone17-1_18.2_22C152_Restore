@interface SidecarTransferReceiver
- (SidecarTransferReceiver)initWithSession:(id)a3 requestID:(int64_t)a4;
- (id)_resumeMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation SidecarTransferReceiver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedGroups, 0);

  objc_storeStrong((id *)&self->_groups, 0);
}

- (id)_resumeMessage:(id)a3
{
  return SidecarTransferReceiverHandleMessage(self, a3);
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__64;
  v13 = __Block_byref_object_dispose__65;
  id v14 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SidecarTransferReceiver_handleMessage___block_invoke;
  v6[3] = &unk_2649C5F68;
  v8 = &v9;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  SidecarTransferLocked((os_unfair_lock_s *)self, v6);
  (*(void (**)(void))(v10[5] + 16))();

  _Block_object_dispose(&v9, 8);
}

uint64_t __41__SidecarTransferReceiver_handleMessage___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = SidecarTransferReceiverHandleMessage(*(void **)(a1 + 32), *(void **)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (SidecarTransferReceiver)initWithSession:(id)a3 requestID:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SidecarTransferReceiver;
  return [(SidecarTransfer *)&v5 initWithSession:a3 requestID:a4 transferID:0];
}

@end