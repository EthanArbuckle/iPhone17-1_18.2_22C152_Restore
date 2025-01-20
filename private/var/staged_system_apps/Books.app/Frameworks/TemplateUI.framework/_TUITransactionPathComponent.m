@interface _TUITransactionPathComponent
- (NSEnumerator)enumerator;
- (_TUITransaction)transaction;
- (_TUITransactionPathComponent)initWithTransaction:(id)a3 enumerator:(id)a4;
@end

@implementation _TUITransactionPathComponent

- (_TUITransactionPathComponent)initWithTransaction:(id)a3 enumerator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUITransactionPathComponent;
  v9 = [(_TUITransactionPathComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transaction, a3);
    objc_storeStrong((id *)&v10->_enumerator, a4);
  }

  return v10;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end