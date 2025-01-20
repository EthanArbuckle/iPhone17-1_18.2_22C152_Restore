@interface FCMTWriterLock
- (BOOL)readBool:(id)a3;
- (FCMTWriterLock)init;
- (FCMTWriterLock)initWithUnderlyingLock:(id)a3;
- (id)readObject:(id)a3;
- (void)lock;
- (void)performReadSync:(id)a3;
- (void)performWriteSync:(id)a3;
- (void)unlock;
@end

@implementation FCMTWriterLock

- (void)performWriteSync:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29060];
  v5 = (void (**)(void))a3;
  [v4 isMainThread];
  [(FCMTWriterLock *)self lock];
  v5[2](v5);

  [(FCMTWriterLock *)self unlock];
}

- (void)performReadSync:(id)a3
{
  v4 = (void (**)(void))a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v4[2]();
  }
  else
  {
    [(FCMTWriterLock *)self lock];
    v4[2]();
    [(FCMTWriterLock *)self unlock];
  }
}

- (void)lock
{
  if (self) {
    self = (FCMTWriterLock *)self->_underlyingLock;
  }
  [(FCMTWriterLock *)self lock];
}

- (void)unlock
{
  if (self) {
    self = (FCMTWriterLock *)self->_underlyingLock;
  }
  [(FCMTWriterLock *)self unlock];
}

- (id)readObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__81;
  v15 = __Block_byref_object_dispose__81;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__FCMTWriterLock_readObject___block_invoke;
  v8[3] = &unk_1E5B5B858;
  v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(FCMTWriterLock *)self performReadSync:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (FCMTWriterLock)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F81C18]);
  id v4 = [(FCMTWriterLock *)self initWithUnderlyingLock:v3];

  return v4;
}

- (FCMTWriterLock)initWithUnderlyingLock:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCMTWriterLock;
  id v6 = [(FCMTWriterLock *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingLock, a3);
  }

  return v7;
}

uint64_t __29__FCMTWriterLock_readObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (BOOL)readBool:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__FCMTWriterLock_readBool___block_invoke;
  v7[3] = &unk_1E5B5B858;
  objc_super v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(FCMTWriterLock *)self performReadSync:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __27__FCMTWriterLock_readBool___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
}

@end