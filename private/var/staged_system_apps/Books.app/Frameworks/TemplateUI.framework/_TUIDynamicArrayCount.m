@interface _TUIDynamicArrayCount
- (TUIDynamicArray)array;
- (_TUIDynamicArrayCount)initWithArray:(id)a3;
- (_TUIDynamicArrayInstance)instance;
- (id)newInstanceWithObserver:(id)a3;
@end

@implementation _TUIDynamicArrayCount

- (_TUIDynamicArrayCount)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIDynamicArrayCount;
  v6 = [(TUIDynamicValue *)&v9 initWithValue:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, a3);
  }

  return v7;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4 = a3;
  id v5 = [[_TUIDynamicArrayCountInstance alloc] initWithDynamicValue:self observer:v4];

  return v5;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

@end