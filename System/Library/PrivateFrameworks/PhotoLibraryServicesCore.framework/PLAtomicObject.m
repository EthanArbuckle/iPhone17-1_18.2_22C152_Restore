@interface PLAtomicObject
- (PLAtomicObject)initWithObject:(id)a3;
- (void)atomicallyPerformBlockAndWait:(id)a3;
- (void)invalidateWithHandler:(id)a3;
@end

@implementation PLAtomicObject

- (void)atomicallyPerformBlockAndWait:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PLAtomicObject_atomicallyPerformBlockAndWait___block_invoke;
  v7[3] = &unk_1E58A1F88;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  PLRunWithUnfairLock(p_lock, v7);
}

uint64_t __48__PLAtomicObject_atomicallyPerformBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (PLAtomicObject)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAtomicObject;
  id v6 = [(PLAtomicObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)invalidateWithHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PLAtomicObject_invalidateWithHandler___block_invoke;
  v7[3] = &unk_1E58A1F88;
  p_lock = &self->_lock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  PLRunWithUnfairLock(p_lock, v7);
}

void __40__PLAtomicObject_invalidateWithHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

@end