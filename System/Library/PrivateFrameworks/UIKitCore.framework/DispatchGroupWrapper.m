@interface DispatchGroupWrapper
- (DispatchGroupWrapper)init;
- (OS_dispatch_group)dispatchGroup;
- (void)executeWithDispatchGroup:(id)a3;
- (void)notify:(id)a3;
- (void)setDispatchGroup:(id)a3;
@end

@implementation DispatchGroupWrapper

- (DispatchGroupWrapper)init
{
  v6.receiver = self;
  v6.super_class = (Class)DispatchGroupWrapper;
  v2 = [(DispatchGroupWrapper *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    dispatchGroup = v2->_dispatchGroup;
    v2->_dispatchGroup = (OS_dispatch_group *)v3;
  }
  return v2;
}

- (void)executeWithDispatchGroup:(id)a3
{
  dispatchGroup = self->_dispatchGroup;
  v5 = (void (**)(id, void *))a3;
  dispatch_group_enter(dispatchGroup);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__DispatchGroupWrapper_executeWithDispatchGroup___block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  v5[2](v5, v6);
}

void __49__DispatchGroupWrapper_executeWithDispatchGroup___block_invoke(uint64_t a1)
{
}

- (void)notify:(id)a3
{
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end