@interface _HKSPImmediateScheduler
- (NAScheduler)backingScheduler;
- (_HKSPImmediateScheduler)init;
- (id)afterDelay:(double)a3 performBlock:(id)a4;
- (id)performCancelableBlock:(id)a3;
- (void)_performOnMainThreadIfNecessary:(id)a3;
- (void)performBlock:(id)a3;
@end

@implementation _HKSPImmediateScheduler

- (_HKSPImmediateScheduler)init
{
  v7.receiver = self;
  v7.super_class = (Class)_HKSPImmediateScheduler;
  v2 = [(_HKSPImmediateScheduler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
    backingScheduler = v2->_backingScheduler;
    v2->_backingScheduler = (NAScheduler *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_performOnMainThreadIfNecessary:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6 = a4;
  backingScheduler = self->_backingScheduler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51___HKSPImmediateScheduler_afterDelay_performBlock___block_invoke;
  v11[3] = &unk_1E5D33540;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  v9 = [(NAScheduler *)backingScheduler afterDelay:v11 performBlock:a3];

  return v9;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  backingScheduler = self->_backingScheduler;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40___HKSPImmediateScheduler_performBlock___block_invoke;
  v7[3] = &unk_1E5D33540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NAScheduler *)backingScheduler performBlock:v7];
}

- (id)performCancelableBlock:(id)a3
{
  id v4 = a3;
  backingScheduler = self->_backingScheduler;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___HKSPImmediateScheduler_performCancelableBlock___block_invoke;
  v9[3] = &unk_1E5D33DB8;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  objc_super v7 = [(NAScheduler *)backingScheduler performCancelableBlock:v9];

  return v7;
}

- (NAScheduler)backingScheduler
{
  return self->_backingScheduler;
}

- (void).cxx_destruct
{
}

@end