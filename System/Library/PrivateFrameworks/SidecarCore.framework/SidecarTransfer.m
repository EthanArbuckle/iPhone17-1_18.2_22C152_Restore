@interface SidecarTransfer
- (SidecarSession)session;
- (SidecarTransfer)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5;
- (SidecarTransferDelegate)delegate;
- (id)_resumeMessage:(id)a3;
- (id)dataForType:(id)a3;
- (int64_t)requestID;
- (int64_t)transferID;
- (void)setDelegate:(id)a3;
@end

@implementation SidecarTransfer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (int64_t)transferID
{
  return self->_transferID;
}

- (int64_t)requestID
{
  return self->_requestID;
}

- (void)setDelegate:(id)a3
{
}

- (SidecarTransferDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SidecarTransferDelegate *)WeakRetained;
}

- (id)_resumeMessage:(id)a3
{
  id result = a3;
  __break(1u);
  return result;
}

- (id)dataForType:(id)a3
{
  return 0;
}

- (SidecarSession)session
{
  return self->_session;
}

- (SidecarTransfer)initWithSession:(id)a3 requestID:(int64_t)a4 transferID:(int64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SidecarTransfer;
  v9 = [(SidecarTransfer *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __56__SidecarTransfer_initWithSession_requestID_transferID___block_invoke;
    v12[3] = &unk_2649C61C0;
    v13 = v9;
    int64_t v15 = a4;
    id v14 = v8;
    int64_t v16 = a5;
    SidecarTransferLocked((os_unfair_lock_s *)v13, v12);
  }
  return v10;
}

void __56__SidecarTransfer_initWithSession_requestID_transferID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(void *)(*(void *)(a1 + 32) + 48) = *(void *)(a1 + 56);
}

@end