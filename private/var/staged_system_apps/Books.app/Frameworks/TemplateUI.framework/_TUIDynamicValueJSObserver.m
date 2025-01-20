@interface _TUIDynamicValueJSObserver
- (JSManagedValue)managedValue;
- (TUIDynamicValueInstance)instance;
- (TUITransactionCoordinating)coordinator;
- (_TUIDynamicValueJSObserver)initWithCoordinator:(id)a3 block:(id)a4 value:(id)a5;
- (id)value;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
@end

@implementation _TUIDynamicValueJSObserver

- (_TUIDynamicValueJSObserver)initWithCoordinator:(id)a3 block:(id)a4 value:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicValueJSObserver;
  v12 = [(_TUIDynamicValueJSObserver *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    uint64_t v14 = +[JSManagedValue managedValueWithValue:v10];
    managedValue = v13->_managedValue;
    v13->_managedValue = (JSManagedValue *)v14;

    uint64_t v16 = [v11 instanceForObserver:v13];
    instance = v13->_instance;
    v13->_instance = (TUIDynamicValueInstance *)v16;
  }
  return v13;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  coordinator = self->_coordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1890AC;
  v5[3] = &unk_2526E0;
  v5[4] = self;
  [(TUITransactionCoordinating *)coordinator scheduleLayoutUpdateWithTransaction:a4 block:v5];
}

- (id)value
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_189324;
  id v10 = sub_189334;
  id v11 = 0;
  instance = self->_instance;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_18933C;
  v5[3] = &unk_253270;
  v5[4] = &v6;
  [(TUIDynamicValueInstance *)instance valueWithBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (TUITransactionCoordinating)coordinator
{
  return self->_coordinator;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (TUIDynamicValueInstance)instance
{
  return self->_instance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_managedValue, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end