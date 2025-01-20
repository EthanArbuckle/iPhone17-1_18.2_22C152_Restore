@interface RCOperationExternalSignal
- (RCOperationExternalSignal)init;
- (void)onQueue:(id)a3 signal:(id)a4;
- (void)triggerWithRetry:(BOOL)a3;
@end

@implementation RCOperationExternalSignal

- (RCOperationExternalSignal)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCOperationExternalSignal;
  id v2 = [(RCOperationExternalSignal *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 2));
  }
  return (RCOperationExternalSignal *)v2;
}

- (void)triggerWithRetry:(BOOL)a3
{
  self->_result = a3;
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6 = a4;
  group = self->_group;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__RCOperationExternalSignal_onQueue_signal___block_invoke;
  v9[3] = &unk_1E5B761A0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_group_notify(group, (dispatch_queue_t)a3, v9);
}

uint64_t __44__RCOperationExternalSignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
}

@end