@interface _TUIDynamicValueUpdate
- (_TUIDynamicValueUpdate)initWithValue:(id)a3 transaction:(id)a4;
- (_TUITransaction)transaction;
- (id)value;
- (void)dealloc;
@end

@implementation _TUIDynamicValueUpdate

- (_TUIDynamicValueUpdate)initWithValue:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValueUpdate;
  v9 = [(_TUIDynamicValueUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_value, a3);
    objc_storeStrong((id *)&v10->_transaction, a4);
    [(_TUITransaction *)v10->_transaction addCompletionDeferral];
  }

  return v10;
}

- (void)dealloc
{
  [(_TUITransaction *)self->_transaction removeCompletionDeferral];
  v3.receiver = self;
  v3.super_class = (Class)_TUIDynamicValueUpdate;
  [(_TUIDynamicValueUpdate *)&v3 dealloc];
}

- (id)value
{
  return self->_value;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong(&self->_value, 0);
}

@end