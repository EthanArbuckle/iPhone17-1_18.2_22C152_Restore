@interface NFPromiseSeal
- (NFPromiseSeal)init;
- (NFPromiseSeal)initWithError:(id)a3;
- (NFPromiseSeal)initWithValue:(id)a3;
- (NFUnfairLock)lock;
- (NSError)error;
- (NSMutableArray)handlers;
- (id)value;
- (unint64_t)state;
- (void)alwaysOn:(id)a3 always:(id)a4;
- (void)dealloc;
- (void)registerHandler:(id)a3;
- (void)reject:(id)a3;
- (void)resolve:(id)a3;
- (void)resolveOn:(id)a3 reject:(id)a4 resolve:(id)a5;
- (void)seal:(id)a3 error:(id)a4 resolution:(unint64_t)a5;
- (void)setError:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation NFPromiseSeal

- (void)alwaysOn:(id)a3 always:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __33__NFPromiseSeal_alwaysOn_always___block_invoke;
  v10[3] = &unk_264485E00;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NFPromiseSeal *)self registerHandler:v10];
}

- (NFPromiseSeal)init
{
  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  v2 = [(NFPromiseSeal *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    uint64_t v4 = objc_opt_new();
    handlers = v3->_handlers;
    v3->_handlers = (NSMutableArray *)v4;

    id v6 = objc_alloc_init(NFUnfairLock);
    lock = v3->_lock;
    v3->_lock = v6;
  }
  return v3;
}

- (void)resolveOn:(id)a3 reject:(id)a4 resolve:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke;
  v14[3] = &unk_264485DB0;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [(NFPromiseSeal *)self registerHandler:v14];
}

- (void)resolve:(id)a3
{
}

- (void)seal:(id)a3 error:(id)a4 resolution:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NFPromiseSeal *)self lock];
  [v10 lock];

  if ([(NFPromiseSeal *)self state] && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NFPromiseSeal seal:error:resolution:]();
  }
  if (![(NFPromiseSeal *)self state])
  {
    [(NFPromiseSeal *)self setState:1];
    id v21 = v8;
    [(NFPromiseSeal *)self setValue:v8];
    [(NFPromiseSeal *)self setError:v9];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = [(NFPromiseSeal *)self handlers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
          id v17 = [(NFPromiseSeal *)self value];
          v18 = [(NFPromiseSeal *)self error];
          (*(void (**)(uint64_t, unint64_t, void *, void *))(v16 + 16))(v16, a5, v17, v18);

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    v19 = [(NFPromiseSeal *)self handlers];
    [v19 removeAllObjects];

    id v8 = v21;
  }
  v20 = [(NFPromiseSeal *)self lock];
  [v20 unlock];
}

- (unint64_t)state
{
  return self->_state;
}

- (void)registerHandler:(id)a3
{
  id v11 = (void (**)(id, BOOL, void *, void *))a3;
  uint64_t v4 = [(NFPromiseSeal *)self lock];
  [v4 lock];

  unint64_t v5 = [(NFPromiseSeal *)self state];
  if (v5)
  {
    if (v5 != 1) {
      goto LABEL_6;
    }
    id v6 = [(NFPromiseSeal *)self error];
    BOOL v7 = v6 != 0;

    id v8 = [(NFPromiseSeal *)self value];
    id v9 = [(NFPromiseSeal *)self error];
    v11[2](v11, v7, v8, v9);
  }
  else
  {
    id v8 = [(NFPromiseSeal *)self handlers];
    id v9 = (void *)MEMORY[0x223C1A400](v11);
    [v8 addObject:v9];
  }

LABEL_6:
  id v10 = [(NFPromiseSeal *)self lock];
  [v10 unlock];
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (NSError)error
{
  return self->_error;
}

- (id)value
{
  return self->_value;
}

void __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2 == 1)
  {
    id v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_3;
    v13[3] = &unk_264485D60;
    id v9 = &v15;
    id v15 = *(id *)(a1 + 48);
    id v11 = &v14;
    id v14 = v8;
    uint64_t v12 = v13;
    goto LABEL_5;
  }
  if (!a2)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_2;
    v16[3] = &unk_264485D60;
    id v9 = &v18;
    id v10 = *(void **)(a1 + 32);
    id v18 = *(id *)(a1 + 40);
    id v11 = &v17;
    id v17 = v7;
    uint64_t v12 = v16;
LABEL_5:
    NFPromiseInvokeOnQueue(v10, v12);
  }
}

- (void)dealloc
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"pending promise is being deallocated"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (NSMutableArray)handlers
{
  return self->_handlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_value, 0);
}

- (void)setValue:(id)a3
{
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void)setError:(id)a3
{
}

uint64_t __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __42__NFPromiseSeal_resolveOn_reject_resolve___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)reject:(id)a3
{
}

uint64_t __33__NFPromiseSeal_alwaysOn_always___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __33__NFPromiseSeal_alwaysOn_always___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __33__NFPromiseSeal_alwaysOn_always___block_invoke_2;
  v2[3] = &unk_264485DD8;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  NFPromiseInvokeOnQueue(v1, v2);
}

- (NFPromiseSeal)initWithValue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  id v6 = [(NFPromiseSeal *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_value, a3);
    v7->_state = 1;
  }

  return v7;
}

- (NFPromiseSeal)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPromiseSeal;
  id v6 = [(NFPromiseSeal *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_state = 1;
  }

  return v7;
}

- (void)setHandlers:(id)a3
{
}

- (void)seal:error:resolution:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Seal must be pending to seal"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end