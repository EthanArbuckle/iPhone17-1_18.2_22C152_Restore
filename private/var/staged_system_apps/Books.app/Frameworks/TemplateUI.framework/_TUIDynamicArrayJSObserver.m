@interface _TUIDynamicArrayJSObserver
- (JSManagedValue)managedValue;
- (TUIDynamicArrayInstance)instance;
- (TUITransactionCoordinating)coordinator;
- (_TUIDynamicArrayJSObserver)initWithCoordinator:(id)a3 block:(id)a4 array:(id)a5;
- (id)objectAtIndex:(int64_t)a3;
- (id)objectsInRange:(int64_t)a3 :(int64_t)a4;
- (int64_t)count;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
@end

@implementation _TUIDynamicArrayJSObserver

- (_TUIDynamicArrayJSObserver)initWithCoordinator:(id)a3 block:(id)a4 array:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_TUIDynamicArrayJSObserver;
  v12 = [(_TUIDynamicArrayJSObserver *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coordinator, a3);
    uint64_t v14 = +[JSManagedValue managedValueWithValue:v10];
    managedValue = v13->_managedValue;
    v13->_managedValue = (JSManagedValue *)v14;

    uint64_t v16 = [v11 instanceForObserver:v13];
    instance = v13->_instance;
    v13->_instance = (TUIDynamicArrayInstance *)v16;
  }
  return v13;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  coordinator = self->_coordinator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_37718;
  v5[3] = &unk_2526E0;
  v5[4] = self;
  [(TUITransactionCoordinating *)coordinator scheduleLayoutUpdateWithTransaction:a4 block:v5];
}

- (int64_t)count
{
  return (int64_t)[(TUIDynamicArrayInstance *)self->_instance count];
}

- (id)objectAtIndex:(int64_t)a3
{
  v5 = (char *)[(TUIDynamicArrayInstance *)self->_instance count];
  v6 = 0;
  if (a3 >= (unint64_t)v5) {
    int64_t v7 = (int64_t)v5;
  }
  else {
    int64_t v7 = a3;
  }
  if (a3 >= 0) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = (unint64_t)&v5[a3];
  }
  if ((v8 & 0x8000000000000000) == 0 && v8 < (unint64_t)v5)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = sub_379DC;
    uint64_t v14 = sub_379EC;
    id v15 = 0;
    -[TUIDynamicArrayInstance objectsInRange:block:](self->_instance, "objectsInRange:block:");
    v6 = [(id)v11[5] firstObject];
    _Block_object_dispose(&v10, 8);
  }

  return v6;
}

- (id)objectsInRange:(int64_t)a3 :(int64_t)a4
{
  id v7 = [(TUIDynamicArrayInstance *)self->_instance count];
  if (a3 >= (unint64_t)v7) {
    int64_t v8 = (int64_t)v7;
  }
  else {
    int64_t v8 = a3;
  }
  if (a3 < 0) {
    int64_t v8 = (int64_t)v7 + a3;
  }
  if (a4 >= (unint64_t)v7) {
    int64_t v9 = (int64_t)v7;
  }
  else {
    int64_t v9 = a4;
  }
  if (a4 < 0) {
    int64_t v9 = (int64_t)v7 + a4;
  }
  if (v9 >= 0) {
    uint64_t v10 = v9 + 1;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_379DC;
  v17 = sub_379EC;
  id v18 = &__NSArray0__struct;
  if (v10 > (v8 & ~(v8 >> 63))) {
    -[TUIDynamicArrayInstance objectsInRange:block:](self->_instance, "objectsInRange:block:");
  }
  id v11 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v11;
}

- (TUITransactionCoordinating)coordinator
{
  return self->_coordinator;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (TUIDynamicArrayInstance)instance
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