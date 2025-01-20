@interface TMLDisposeBlock
- (TMLDisposeBlock)initWithBlock:(id)a3;
- (void)tmlDispose;
@end

@implementation TMLDisposeBlock

- (TMLDisposeBlock)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLDisposeBlock;
  v5 = [(TMLDisposeBlock *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x23ECA7DD0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (void)tmlDispose
{
  id block = (void (**)(id, SEL))self->_block;
  if (block)
  {
    block[2](block, a2);
    id block = (void (**)(id, SEL))self->_block;
  }
  self->_id block = 0;
}

- (void).cxx_destruct
{
}

@end