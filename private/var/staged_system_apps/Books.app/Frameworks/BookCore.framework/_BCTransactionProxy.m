@interface _BCTransactionProxy
- (BCSceneControlling)destinationSceneController;
- (BCSceneControlling)originatingSceneController;
- (BCSceneControlling)targetSceneController;
- (BCSceneDescriptor)targetSceneDescriptor;
- (BCTransactionContext)context;
- (_BCTransaction)transaction;
- (_BCTransactionProxy)initWithTransaction:(id)a3;
- (id)synchronizer;
- (void)commit:(id)a3;
- (void)commit:(id)a3 rollback:(id)a4;
- (void)dealloc;
- (void)finalize;
- (void)requireTargetSceneController:(id)a3;
- (void)setContext:(id)a3;
- (void)setOriginatingSceneController:(id)a3;
- (void)setTargetSceneController:(id)a3;
- (void)whenCancelled:(id)a3;
- (void)whenCompleted:(id)a3;
@end

@implementation _BCTransactionProxy

- (_BCTransactionProxy)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BCTransactionProxy;
  v6 = [(_BCTransactionProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transaction, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(_BCTransactionProxy *)self finalize];
  v3.receiver = self;
  v3.super_class = (Class)_BCTransactionProxy;
  [(_BCTransactionProxy *)&v3 dealloc];
}

- (void)commit:(id)a3 rollback:(id)a4
{
}

- (void)commit:(id)a3
{
}

- (void)whenCancelled:(id)a3
{
}

- (void)whenCompleted:(id)a3
{
}

- (void)finalize
{
}

- (id)synchronizer
{
  return [(_BCTransaction *)self->_transaction synchronizer];
}

- (BCTransactionContext)context
{
  return [(_BCTransaction *)self->_transaction context];
}

- (void)setContext:(id)a3
{
}

- (BCSceneControlling)originatingSceneController
{
  return [(_BCTransaction *)self->_transaction originatingSceneController];
}

- (void)setOriginatingSceneController:(id)a3
{
}

- (BCSceneControlling)targetSceneController
{
  return [(_BCTransaction *)self->_transaction targetSceneController];
}

- (BCSceneDescriptor)targetSceneDescriptor
{
  return [(_BCTransaction *)self->_transaction targetSceneDescriptor];
}

- (void)setTargetSceneController:(id)a3
{
}

- (void)requireTargetSceneController:(id)a3
{
}

- (BCSceneControlling)destinationSceneController
{
  objc_super v3 = [(_BCTransactionProxy *)self targetSceneController];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_BCTransactionProxy *)self originatingSceneController];
  }
  v6 = v5;

  return (BCSceneControlling *)v6;
}

- (_BCTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
}

@end