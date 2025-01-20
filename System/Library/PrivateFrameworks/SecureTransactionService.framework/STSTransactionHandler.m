@interface STSTransactionHandler
- (STSSession)parent;
- (STSTransactionHandler)initWithParent:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
@end

@implementation STSTransactionHandler

- (STSTransactionHandler)initWithParent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)STSTransactionHandler;
  v5 = [(STSTransactionHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parent, v4);
  }

  return v6;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (id)stopTransaction
{
  return 0;
}

- (STSSession)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (STSSession *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end