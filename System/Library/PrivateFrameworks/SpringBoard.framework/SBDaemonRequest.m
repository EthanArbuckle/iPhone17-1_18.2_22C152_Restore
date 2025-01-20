@interface SBDaemonRequest
+ (id)requestWithEnabler:(id)a3 disabler:(id)a4;
- (id)disabler;
- (id)enabler;
- (void)dispatchDisablerOnQueue:(id)a3;
- (void)dispatchEnablerOnQueue:(id)a3;
- (void)setDisabler:(id)a3;
- (void)setEnabler:(id)a3;
@end

@implementation SBDaemonRequest

- (void)dispatchEnablerOnQueue:(id)a3
{
  queue = a3;
  v4 = (void *)MEMORY[0x1D948C7A0](self->_enabler);
  if (v4) {
    dispatch_async(queue, v4);
  }
}

+ (id)requestWithEnabler:(id)a3 disabler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SBDaemonRequest);
  [(SBDaemonRequest *)v7 setEnabler:v6];

  [(SBDaemonRequest *)v7 setDisabler:v5];
  return v7;
}

- (void)setEnabler:(id)a3
{
}

- (void)setDisabler:(id)a3
{
}

void __43__SBDaemonRequest_dispatchDisablerOnQueue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D948C4D0]();
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disabler, 0);
  objc_storeStrong(&self->_enabler, 0);
}

- (void)dispatchDisablerOnQueue:(id)a3
{
  if (self->_disabler)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__SBDaemonRequest_dispatchDisablerOnQueue___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

- (id)enabler
{
  return self->_enabler;
}

- (id)disabler
{
  return self->_disabler;
}

@end