@interface PLLazyObject
- (PLLazyObject)init;
- (PLLazyObject)initWithBlock:(id)a3;
- (PLLazyObject)initWithObject:(id)a3;
- (PLLazyObject)initWithRetriableBlock:(id)a3;
- (PLLazyObject)initWithRetry:(BOOL)a3 block:(id)a4;
- (id)currentObjectValueWithoutForcingEvaluation;
- (id)objectValue;
- (void)invalidate;
- (void)invalidateWithHandler:(id)a3;
- (void)resetObject;
- (void)resetObjectWithHandler:(id)a3;
@end

@implementation PLLazyObject

- (PLLazyObject)initWithRetriableBlock:(id)a3
{
  return [(PLLazyObject *)self initWithRetry:1 block:a3];
}

- (PLLazyObject)initWithBlock:(id)a3
{
  return [(PLLazyObject *)self initWithRetry:0 block:a3];
}

- (PLLazyObject)initWithRetry:(BOOL)a3 block:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLLazyObject;
  v7 = [(PLLazyObject *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id block = v7->_block;
    v7->_id block = (id)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v7->_shouldRetryBlockOnNil = a3;
    v10 = v7;
  }

  return v7;
}

- (id)objectValue
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PLLazyObject_objectValue__block_invoke;
  v4[3] = &unk_1E58A1A60;
  v4[4] = self;
  v2 = PLResultWithUnfairLock(&self->_lock, v4);
  return v2;
}

id __27__PLLazyObject_objectValue__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 24))
  {
    uint64_t v5 = *(void *)(v1 + 16);
    if (v5)
    {
      uint64_t v6 = (*(void (**)(void))(v5 + 16))();
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = v6;

      uint64_t v1 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v1 + 8))
      {
        v9 = *(void **)(v1 + 16);
        *(void *)(v1 + 16) = 0;

        uint64_t v1 = *(void *)(a1 + 32);
      }
    }
  }
  v2 = *(void **)(v1 + 24);
  return v2;
}

- (void)resetObject
{
  if (!self->_shouldRetryBlockOnNil)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PLLazyObject.m" lineNumber:79 description:@"Only retriable lazy objects can be reset"];
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PLLazyObject_resetObject__block_invoke;
  v5[3] = &unk_1E58A1EC0;
  v5[4] = self;
  PLRunWithUnfairLock(&self->_lock, v5);
}

void __27__PLLazyObject_resetObject__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_block, 0);
}

- (void)invalidateWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PLLazyObject_invalidateWithHandler___block_invoke;
  v6[3] = &unk_1E58A1A60;
  v6[4] = self;
  uint64_t v5 = PLResultWithUnfairLock(&self->_lock, v6);
  if (v5) {
    v4[2](v4, v5);
  }
}

id __38__PLLazyObject_invalidateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;

  return v4;
}

- (void)invalidate
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__PLLazyObject_invalidate__block_invoke;
  v2[3] = &unk_1E58A1EC0;
  v2[4] = self;
  PLRunWithUnfairLock(&self->_lock, v2);
}

void __26__PLLazyObject_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = 0;
}

- (void)resetObjectWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PLLazyObject_resetObjectWithHandler___block_invoke;
  v6[3] = &unk_1E58A1A60;
  v6[4] = self;
  uint64_t v5 = PLResultWithUnfairLock(&self->_lock, v6);
  if (v5) {
    v4[2](v4, v5);
  }
}

id __39__PLLazyObject_resetObjectWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  return v2;
}

- (id)currentObjectValueWithoutForcingEvaluation
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PLLazyObject_currentObjectValueWithoutForcingEvaluation__block_invoke;
  v4[3] = &unk_1E58A1A60;
  v4[4] = self;
  id v2 = PLResultWithUnfairLock(&self->_lock, v4);
  return v2;
}

id __58__PLLazyObject_currentObjectValueWithoutForcingEvaluation__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (PLLazyObject)initWithObject:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__PLLazyObject_initWithObject___block_invoke;
  v8[3] = &unk_1E58A1A60;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [(PLLazyObject *)self initWithBlock:v8];

  return v6;
}

id __31__PLLazyObject_initWithObject___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (PLLazyObject)init
{
  return [(PLLazyObject *)self initWithBlock:&__block_literal_global_9473];
}

uint64_t __20__PLLazyObject_init__block_invoke()
{
  return 0;
}

@end