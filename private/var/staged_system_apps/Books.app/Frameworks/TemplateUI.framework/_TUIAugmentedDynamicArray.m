@interface _TUIAugmentedDynamicArray
- (TUIDynamicArrayDataAugmenting)augmenter;
- (_TUIAugmentedDynamicArray)initWithArray:(id)a3 augmenter:(id)a4;
- (_TUIDynamicArrayInstance)instance;
- (id)_rootDataProvider;
- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5;
- (void)dynamicChanged:(id)a3 transaction:(id)a4;
@end

@implementation _TUIAugmentedDynamicArray

- (id)_rootDataProvider
{
  v2 = [(_TUIDynamicArrayInstance *)self->_instance array];
  v3 = [v2 _rootDataProvider];

  return v3;
}

- (_TUIAugmentedDynamicArray)initWithArray:(id)a3 augmenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIAugmentedDynamicArray;
  v8 = [(TUIDynamicArray *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_augmenter, a4);
    uint64_t v10 = [v6 instanceForObserver:v9];
    instance = v9->_instance;
    v9->_instance = (_TUIDynamicArrayInstance *)v10;

    v12 = v9->_instance;
    id v13 = [(_TUIDynamicArrayInstance *)v12 count];
    v14 = [(_TUIDynamicArrayInstance *)v9->_instance generation];
    [(TUIDynamicArray *)v9 _updateProvider:v12 count:v13 generation:v14];
  }
  return v9;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5 = [(_TUIDynamicArrayInstance *)self->_instance _dequeueUpdateGroup];
  [(TUIDynamicArray *)self _enqueueUpdate:v5];
}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(_TUIDynamicArrayInstance *)[_TUIAugmentedDynamicArrayInstance alloc] initWithArray:self generation:v9 count:a4 observer:v8];

  [(_TUIAugmentedDynamicArrayInstance *)v10 setDataAugmenter:self->_augmenter];
  return v10;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArrayDataAugmenting)augmenter
{
  return self->_augmenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_augmenter, 0);

  objc_storeStrong((id *)&self->_instance, 0);
}

@end