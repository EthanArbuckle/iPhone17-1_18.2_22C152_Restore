@interface PPXPCClientPipelinedBatchQueryContext
- (OS_dispatch_queue)queue;
- (id)description;
- (id)handleBatch;
- (void)finalizeCallWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setFinalizeCall:(id)a3;
- (void)setHandleBatch:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PPXPCClientPipelinedBatchQueryContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleBatch, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_finalizeCall, 0);
}

- (void)setQueue:(id)a3
{
}

- (void)setHandleBatch:(id)a3
{
}

- (void)setFinalizeCall:(id)a3
{
  atomic_store(0, (unsigned __int8 *)&self->_calledFinalizeBlock);
  self->_finalizeCall = (id)MEMORY[0x192F975A0](a3, a2);
  MEMORY[0x1F41817F8]();
}

- (void)finalizeCallWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_calledFinalizeBlock._Value, 1u) & 1) == 0)
  {
    id v5 = a4;
    v6 = pp_xpc_client_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      v8 = self;
      _os_log_debug_impl(&dword_18CAA6000, v6, OS_LOG_TYPE_DEBUG, "calling finalize block for context: %@", (uint8_t *)&v7, 0xCu);
    }

    (*((void (**)(void))self->_finalizeCall + 2))();
  }
}

- (id)handleBatch
{
  return self->_handleBatch;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPXPCClientPipelinedBatchQueryContext *)self queue];
  id v5 = objc_msgSend(v3, "initWithFormat:", @"<PPXPCClientPipelinedBatchQueryContext q:%s s:%d>", dispatch_queue_get_label(v4), self->_stop);

  return v5;
}

@end