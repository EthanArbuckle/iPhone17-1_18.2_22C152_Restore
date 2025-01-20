@interface _TUIDynamicArrayIndex
- (TUIDynamicArray)subarray;
- (_TUIDynamicArrayIndex)initWithArray:(id)a3 index:(int64_t)a4;
- (_TUIDynamicArrayInstance)instance;
- (id)newInstanceWithObserver:(id)a3;
- (int64_t)index;
@end

@implementation _TUIDynamicArrayIndex

- (_TUIDynamicArrayIndex)initWithArray:(id)a3 index:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayIndex;
  v7 = [(TUIDynamicValue *)&v12 initWithValue:0];
  v8 = v7;
  if (v7)
  {
    v7->_index = a4;
    uint64_t v9 = [v6 tui_subarrayWithStart:a4 end:a4];
    subarray = v8->_subarray;
    v8->_subarray = (TUIDynamicArray *)v9;
  }
  return v8;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4 = a3;
  v5 = [[_TUIDynamicArrayIndexInstance alloc] initWithDynamicValue:self observer:v4];

  return v5;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArray)subarray
{
  return self->_subarray;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subarray, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

@end