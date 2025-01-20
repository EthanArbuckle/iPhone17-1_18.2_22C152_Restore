@interface _UIKeyboardImplHeldOperation
- (_UIKeyboardImplHeldOperation)initWithOperation:(id)a3;
- (id)operation;
- (void)setOperation:(id)a3;
@end

@implementation _UIKeyboardImplHeldOperation

- (_UIKeyboardImplHeldOperation)initWithOperation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardImplHeldOperation;
  v5 = [(_UIKeyboardImplHeldOperation *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIKeyboardImplHeldOperation *)v5 setOperation:v4];
  }

  return v6;
}

- (id)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end