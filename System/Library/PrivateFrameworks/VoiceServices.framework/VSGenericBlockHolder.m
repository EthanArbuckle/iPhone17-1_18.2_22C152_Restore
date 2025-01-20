@interface VSGenericBlockHolder
- (VSGenericBlockHolder)initWithBlock:(id)a3;
- (void)invokeUpdateWithObject:(id)a3;
@end

@implementation VSGenericBlockHolder

- (void).cxx_destruct
{
}

- (void)invokeUpdateWithObject:(id)a3
{
  block = (void (**)(id, id))self->_block;
  if (block) {
    block[2](block, a3);
  }
}

- (VSGenericBlockHolder)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSGenericBlockHolder;
  v5 = [(VSGenericBlockHolder *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x210554730](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

@end