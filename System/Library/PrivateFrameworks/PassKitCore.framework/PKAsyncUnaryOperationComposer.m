@interface PKAsyncUnaryOperationComposer
- (PKAsyncUnaryOperationComposer)init;
- (id)evaluateWithInput:(id)a3 completion:(id)a4;
- (id)evaluatorWithInput:(id)a3;
- (void)addOperation:(id)a3;
@end

@implementation PKAsyncUnaryOperationComposer

- (void).cxx_destruct
{
}

- (void)addOperation:(id)a3
{
  if (a3)
  {
    p_lock = &self->_lock;
    id v5 = a3;
    os_unfair_lock_lock(p_lock);
    operations = self->_operations;
    v7 = _Block_copy(v5);

    [(NSMutableArray *)operations addObject:v7];
    os_unfair_lock_unlock(p_lock);
  }
}

- (PKAsyncUnaryOperationComposer)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKAsyncUnaryOperationComposer;
  v2 = [(PKAsyncUnaryOperationComposer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    operations = v3->_operations;
    v3->_operations = v4;
  }
  return v3;
}

- (id)evaluateWithInput:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PKAsyncUnaryOperationComposer *)self evaluatorWithInput:a3];
  v8 = [v7 evaluateWithCompletion:v6];

  return v8;
}

- (id)evaluatorWithInput:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = (void *)[(NSMutableArray *)self->_operations copy];
  os_unfair_lock_unlock(p_lock);
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"PKAsyncUnaryOperationComposer: cannot compose operations with nil initial input."];
  }
  id v7 = [[PKAsyncUnaryOperationEvaluator alloc] _initWithOperations:v6 input:v5];

  return v7;
}

@end