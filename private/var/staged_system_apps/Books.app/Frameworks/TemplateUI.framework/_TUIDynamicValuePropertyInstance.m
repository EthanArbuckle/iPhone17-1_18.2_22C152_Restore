@interface _TUIDynamicValuePropertyInstance
- (BOOL)applyUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3;
- (_TUIDynamicValueInstance)instance;
- (_TUIDynamicValuePropertyInstance)initWithDynamicValue:(id)a3 observer:(id)a4;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)valueWithBlock:(id)a3;
@end

@implementation _TUIDynamicValuePropertyInstance

- (_TUIDynamicValuePropertyInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValuePropertyInstance;
  v7 = [(_TUIDynamicValueInstance *)&v12 initWithDynamicValue:v6 value:0 observer:a4];
  if (v7)
  {
    v8 = [v6 upstreamValue];
    uint64_t v9 = [v8 instanceForObserver:v7];
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicValueInstance *)v9;
  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  id v4 = a3;
  instance = self->_instance;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13FD30;
  v7[3] = &unk_256318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_TUIDynamicValueInstance *)instance valueWithBlock:v7];
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicValueInstance *)self->_instance optimizeUpdatesForTransactionGroup:a3];
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicValueInstance *)self->_instance applyUpdatesForTransactionGroup:a3];
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5 = a4;
  id v6 = [(_TUIDynamicValueInstance *)self observer];
  [v6 dynamicChanged:self transaction:v5];
}

- (_TUIDynamicValueInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
}

@end