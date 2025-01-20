@interface SCDASafetyBlock
- (BOOL)invoke;
- (BOOL)invokeWithSignal:(int64_t)a3;
- (SCDASafetyBlock)initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation SCDASafetyBlock

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(SCDASafetyBlock *)self invokeWithSignal:-1];
  v3.receiver = self;
  v3.super_class = (Class)SCDASafetyBlock;
  [(SCDASafetyBlock *)&v3 dealloc];
}

- (BOOL)invoke
{
  return [(SCDASafetyBlock *)self invokeWithSignal:0];
}

- (BOOL)invokeWithSignal:(int64_t)a3
{
  unsigned __int8 v3 = atomic_exchange(&self->_hasInvoked._Value, 1u);
  if ((v3 & 1) == 0)
  {
    block = (void (**)(id, int64_t))self->_block;
    if (block)
    {
      block[2](block, a3);
      id v6 = self->_block;
      self->_block = 0;
    }
  }
  return (v3 & 1) == 0;
}

- (SCDASafetyBlock)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCDASafetyBlock;
  v5 = [(SCDASafetyBlock *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x261192180](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

@end