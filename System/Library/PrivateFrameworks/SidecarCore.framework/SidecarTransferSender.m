@interface SidecarTransferSender
- (SidecarTransferSender)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5;
- (id)_resumeMessage:(id)a3;
- (int64_t)type;
- (void)_sendCompletion:(id)a3;
- (void)sendItems:(id)a3 messageType:(int64_t)a4;
@end

@implementation SidecarTransferSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slices, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)_sendCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v6 = SidecarCoreLogSubsystem(OS_LOG_TYPE_ERROR);
    if (v6)
    {
      log = v6;
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
      v6 = log;
      if (v7)
      {
        v8 = [v4 domain];
        uint64_t v9 = [v4 code];
        v10 = [v4 localizedDescription];
        *(_DWORD *)buf = 138543875;
        v13 = v8;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        __int16 v16 = 2113;
        v17 = v10;
        _os_log_impl(&dword_22D954000, log, OS_LOG_TYPE_ERROR, "%{public}@ (%ld) %{private}@", buf, 0x20u);

        v6 = log;
      }
    }

    goto LABEL_6;
  }
  if (!SidecarTransferSenderSliceData(self))
  {
LABEL_6:
    v5 = [(SidecarTransfer *)self delegate];
    [v5 sidecarTransfer:self didComplete:v4];
    goto LABEL_7;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  SidecarTransferSenderSetMessageData(self, v5);
  SidecarTransferSendMessage(self, v5);
LABEL_7:
}

- (void)sendItems:(id)a3 messageType:(int64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__SidecarTransferSender_sendItems_messageType___block_invoke;
  v9[3] = &unk_2649C5E28;
  v9[4] = self;
  id v7 = v6;
  id v10 = v7;
  int64_t v11 = a4;
  SidecarTransferLocked((os_unfair_lock_s *)self, v9);
  v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  SidecarMessageSetItemMetaData(v8, v7);
  if (SidecarTransferSenderSliceData(self)) {
    SidecarTransferSenderSetMessageData(self, v8);
  }
  SidecarTransferSendMessage(self, v8);
}

void __47__SidecarTransferSender_sendItems_messageType___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56) != -1) {
    __assert_rtn("-[SidecarTransferSender sendItems:messageType:]_block_invoke", "SidecarTransfer.m", 437, "self->_itemID == -1");
  }
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  *(void *)(*(void *)(a1 + 32) + 80) = *(void *)(a1 + 48);
}

- (id)_resumeMessage:(id)a3
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (SidecarTransferSender)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SidecarTransferSender;
  v5 = [(SidecarTransfer *)&v10 initWithSession:a3 requestID:a4 transferID:a5];
  id v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__SidecarTransferSender_initWithSession_requestID_transferID___block_invoke;
    v8[3] = &unk_2649C64F0;
    uint64_t v9 = v5;
    SidecarTransferLocked((os_unfair_lock_s *)v9, v8);
  }
  return v6;
}

uint64_t __62__SidecarTransferSender_initWithSession_requestID_transferID___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 56) = -1;
  return result;
}

@end