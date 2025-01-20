@interface TMLBlockReactiveValue
- (TMLBlockReactiveValue)initWithBlock:(id)a3 bindings:(id)a4 valueType:(unint64_t)a5;
- (id)value;
@end

@implementation TMLBlockReactiveValue

- (TMLBlockReactiveValue)initWithBlock:(id)a3 bindings:(id)a4 valueType:(unint64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TMLBlockReactiveValue;
  v9 = [(TMLReactiveValue *)&v13 initWithBindings:a4 valueType:a5];
  if (v9)
  {
    uint64_t v10 = MEMORY[0x23ECA7DD0](v8);
    id block = v9->_block;
    v9->_id block = (id)v10;
  }
  return v9;
}

- (id)value
{
  id block = (void (**)(void, void))self->_block;
  if (block)
  {
    v4 = objc_msgSend_bindings(self, a2, v2);
    ((void (**)(void, void *))block)[2](block, v4);
    id block = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return block;
}

- (void).cxx_destruct
{
}

@end