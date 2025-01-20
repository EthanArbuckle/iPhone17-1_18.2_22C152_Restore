@interface _TUIDynamicArrayCountInstance
- (BOOL)applyUpdatesForTransactionGroup:(id)a3;
- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3;
- (_TUIDynamicArrayCountInstance)initWithDynamicValue:(id)a3 observer:(id)a4;
- (_TUIDynamicArrayInstance)instance;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
- (void)valueWithBlock:(id)a3;
@end

@implementation _TUIDynamicArrayCountInstance

- (_TUIDynamicArrayCountInstance)initWithDynamicValue:(id)a3 observer:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayCountInstance;
  v7 = [(_TUIDynamicValueInstance *)&v12 initWithDynamicValue:v6 value:0 observer:a4];
  if (v7)
  {
    v8 = [v6 array];
    uint64_t v9 = [v8 instanceForObserver:v7];
    instance = v7->_instance;
    v7->_instance = (_TUIDynamicArrayInstance *)v9;
  }
  return v7;
}

- (void)valueWithBlock:(id)a3
{
  if (a3)
  {
    instance = self->_instance;
    id v5 = a3;
    id v6 = +[NSNumber numberWithUnsignedInteger:[(_TUIDynamicArrayInstance *)instance count]];
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }
}

- (BOOL)optimizeUpdatesForTransactionGroup:(id)a3
{
  v3 = self;
  instance = self->_instance;
  id v5 = a3;
  unint64_t v6 = [(_TUIDynamicArrayInstance *)instance count];
  v7 = v3->_instance;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1167FC;
  v9[3] = &unk_255978;
  v9[4] = v6;
  LOBYTE(v3) = [(_TUIDynamicArrayInstance *)v7 optimizeUpdatesForTransactionGroup:v5 block:v9];

  return (char)v3;
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