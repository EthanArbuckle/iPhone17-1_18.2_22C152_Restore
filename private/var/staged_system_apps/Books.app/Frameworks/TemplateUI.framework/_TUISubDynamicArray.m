@interface _TUISubDynamicArray
- (_TUIDynamicArrayInstance)instance;
- (_TUISubDynamicArray)initWithArray:(id)a3 start:(int64_t)a4 end:(int64_t)a5;
- (id)_rootDataProvider;
- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5;
- (int64_t)end;
- (int64_t)start;
- (unint64_t)_countForGeneration:(id)a3;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
@end

@implementation _TUISubDynamicArray

- (id)_rootDataProvider
{
  v2 = [(_TUIDynamicArrayInstance *)self->_instance array];
  v3 = [v2 _rootDataProvider];

  return v3;
}

- (_TUISubDynamicArray)initWithArray:(id)a3 start:(int64_t)a4 end:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_TUISubDynamicArray;
  v9 = [(TUIDynamicArray *)&v16 init];
  if (v9)
  {
    uint64_t v10 = [v8 instanceForObserver:v9];
    instance = v9->_instance;
    v9->_instance = (_TUIDynamicArrayInstance *)v10;

    v9->_start = a4;
    v9->_end = a5;
    uint64_t v12 = TUIIndexMapperComputeCount([(_TUIDynamicArrayInstance *)v9->_instance count], v9->_start, v9->_end);
    v13 = v9->_instance;
    v14 = [(_TUIDynamicArrayInstance *)v13 generation];
    [(TUIDynamicArray *)v9 _updateProvider:v13 count:v12 generation:v14];
  }
  return v9;
}

- (unint64_t)_countForGeneration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TUISubDynamicArray;
  id v4 = [(TUIDynamicArray *)&v6 _countForGeneration:a3];
  return TUIIndexMapperComputeCount((unint64_t)v4, self->_start, self->_end);
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  v5 = [(_TUIDynamicArrayInstance *)self->_instance _dequeueUpdateGroup];
  id v7 = [v5 trimWithStart:self->_start end:self->_end];

  objc_super v6 = v7;
  if (v7)
  {
    [(TUIDynamicArray *)self _enqueueUpdate:v7];
    objc_super v6 = v7;
  }
}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(_TUIDynamicArrayInstance *)[_TUISubDynamicArrayInstance alloc] initWithArray:self generation:v9 count:a4 observer:v8];

  [(_TUISubDynamicArrayInstance *)v10 setStart:self->_start];
  [(_TUISubDynamicArrayInstance *)v10 setEnd:self->_end];
  return v10;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (int64_t)start
{
  return self->_start;
}

- (int64_t)end
{
  return self->_end;
}

- (void).cxx_destruct
{
}

@end