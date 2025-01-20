@interface PKDeallocationGuard
- (BOOL)invalidate;
- (PKDeallocationGuard)init;
- (PKDeallocationGuard)initWithBlock:(id)a3;
- (void)dealloc;
@end

@implementation PKDeallocationGuard

- (void).cxx_destruct
{
}

- (BOOL)invalidate
{
  unsigned __int8 v2 = atomic_exchange(&self->_invalidated._Value, 1u);
  if ((v2 & 1) == 0)
  {
    id block = self->_block;
    self->_id block = 0;
  }
  return v2 & 1;
}

- (PKDeallocationGuard)initWithBlock:(id)a3
{
  result = (PKDeallocationGuard *)a3;
  if (result)
  {
    v5 = result;
    v9.receiver = self;
    v9.super_class = (Class)PKDeallocationGuard;
    v6 = [(PKDeallocationGuard *)&v9 init];
    if (v6)
    {
      v7 = _Block_copy(v5);
      id block = v6->_block;
      v6->_id block = v7;
    }
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  if ((atomic_exchange(&self->_invalidated._Value, 1u) & 1) == 0) {
    (*((void (**)(void))self->_block + 2))();
  }
  v3.receiver = self;
  v3.super_class = (Class)PKDeallocationGuard;
  [(PKDeallocationGuard *)&v3 dealloc];
}

- (PKDeallocationGuard)init
{
  return 0;
}

@end