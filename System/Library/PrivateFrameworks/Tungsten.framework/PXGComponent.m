@interface PXGComponent
+ (BOOL)shouldDiffForChanges;
+ (id)createWithDefaultDataStore;
+ (unint64_t)elementSize;
- (PXGComponent)init;
- (PXGComponent)initWithDataStore:(id)a3;
- (PXGComponentDataStore)dataStore;
- (PXGComponentObserver)observer;
- (PXGMutableComponentDataStore)mutableDataStore;
- (PXGMutableComponentDataStore)previousDataStore;
- (void)performChanges:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation PXGComponent

- (PXGMutableComponentDataStore)mutableDataStore
{
  return self->_mutableDataStore;
}

- (PXGComponentDataStore)dataStore
{
  return (PXGComponentDataStore *)self->_mutableDataStore;
}

- (PXGMutableComponentDataStore)previousDataStore
{
  return self->_previousDataStore;
}

- (PXGComponent)initWithDataStore:(id)a3
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGComponent;
  v7 = [(PXGComponent *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 elementSize];
    if (v8 != [(id)objc_opt_class() elementSize])
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, v7, @"PXGComponent.m", 40, @"Invalid parameter not satisfying: %@", @"dataStore.elementSize == self.class.elementSize" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_mutableDataStore, a3);
    if ([(id)objc_opt_class() shouldDiffForChanges])
    {
      uint64_t v9 = [v6 mutableCopy];
      previousDataStore = v7->_previousDataStore;
      v7->_previousDataStore = (PXGMutableComponentDataStore *)v9;
    }
  }

  return v7;
}

+ (id)createWithDefaultDataStore
{
  if (![a1 elementSize])
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"PXGComponent.m", 18, @"Invalid parameter not satisfying: %@", @"self.elementSize != 0" object file lineNumber description];
  }
  v4 = -[PXGComponentDataStore initWithElementSize:]([PXGMutableComponentDataStore alloc], "initWithElementSize:", [a1 elementSize]);
  v5 = (void *)[objc_alloc((Class)a1) initWithDataStore:v4];

  return v5;
}

+ (BOOL)shouldDiffForChanges
{
  return 0;
}

- (void)setObserver:(id)a3
{
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  int64_t nestedChanges = self->_nestedChanges;
  id v9 = v4;
  if (!nestedChanges)
  {
    id v6 = [(PXGComponent *)self observer];
    [v6 componentWillPerformChanges:self];

    id v4 = v9;
    int64_t nestedChanges = self->_nestedChanges;
  }
  self->_int64_t nestedChanges = nestedChanges + 1;
  (*((void (**)(id, PXGComponent *))v4 + 2))(v4, self);
  int64_t v7 = self->_nestedChanges - 1;
  self->_int64_t nestedChanges = v7;
  if (!v7)
  {
    uint64_t v8 = [(PXGComponent *)self observer];
    [v8 componentDidPerformChanges:self];
  }
}

- (PXGComponentObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (PXGComponentObserver *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDataStore, 0);
  objc_destroyWeak((id *)&self->_observer);

  objc_storeStrong((id *)&self->_mutableDataStore, 0);
}

- (PXGComponent)init
{
  return [(PXGComponent *)self initWithDataStore:0];
}

+ (unint64_t)elementSize
{
  return 0;
}

@end