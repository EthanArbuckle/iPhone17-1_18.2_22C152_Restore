@interface _TUIDynamicArrayIndexInstance
- (BOOL)applyUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3;
- (_TUIDynamicArrayIndexInstance)initWithDynamicValue:(id)a3 observer:(id)a4;
- (_TUIDynamicArrayInstance)instance;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)valueWithBlock:(id)a3;
@end

@implementation _TUIDynamicArrayIndexInstance

- (_TUIDynamicArrayIndexInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayIndexInstance;
  v7 = [(_TUIDynamicValueInstance *)&v12 initWithDynamicValue:v6 value:0 observer:a4];
  if (v7)
  {
    v8 = [v6 subarray];
    uint64_t v9 = [v8 instanceForObserver:v7];
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicArrayInstance *)v9;
  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(_TUIDynamicArrayInstance *)self->_instance count])
    {
      instance = self->_instance;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_C79C0;
      v6[3] = &unk_254ED0;
      id v7 = v4;
      -[_TUIDynamicArrayInstance objectsInRange:block:](instance, "objectsInRange:block:", 0, 1, v6);
    }
    else
    {
      (*((void (**)(id, void))v4 + 2))(v4, 0);
    }
  }
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicArrayInstance *)self->_instance optimizeUpdatesForTransactionGroup:a3];
}

- (BOOL)applyUpdatesForTransactionGroup:(id)a3
{
  return [(_TUIDynamicArrayInstance *)self->_instance applyUpdatesForTransactionGroup:a3];
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5 = a4;
  id v6 = [(_TUIDynamicValueInstance *)self observer];
  [v6 dynamicChanged:self transaction:v5];
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
}

@end