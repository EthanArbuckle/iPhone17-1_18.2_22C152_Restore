@interface _UIAfterCACommitBlock
+ (id)blockWithBlock:(id)a3;
- (BOOL)run;
- (unsigned)_initWithBlock:(unsigned __int8 *)a1;
@end

@implementation _UIAfterCACommitBlock

- (BOOL)run
{
  if (pthread_main_np() != 1)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UIAfterCACommitQueue.m" lineNumber:127 description:@"Call must be made on main thread"];
  }
  id block = self->_block;
  if (block)
  {
    v5 = (void *)MEMORY[0x18C108260]();
    (*((void (**)(void))self->_block + 2))();
    id v6 = self->_block;
    self->_id block = 0;
  }
  return block != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

- (unsigned)_initWithBlock:(unsigned __int8 *)a1
{
  id v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_UIAfterCACommitBlock;
    v4 = (unsigned __int8 *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      v5 = (void *)*((void *)v4 + 1);
      *((void *)v4 + 1) = 0;

      uint64_t v6 = [v3 copy];
      v7 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v6;

      atomic_store(0, a1 + 24);
    }
  }

  return a1;
}

+ (id)blockWithBlock:(id)a3
{
  id v3 = a3;
  v4 = -[_UIAfterCACommitBlock _initWithBlock:]((unsigned __int8 *)[_UIAfterCACommitBlock alloc], v3);

  return v4;
}

@end