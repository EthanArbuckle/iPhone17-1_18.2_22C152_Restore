@interface TIContactManagerMock
- (NSArray)observers;
- (NSUUID)contactCollectionUUID;
- (TIContactManagerMock)initWithContactCollection:(id)a3;
- (id)addContactObserver:(id)a3;
- (void)getOnce:(id)a3;
- (void)removeContactObserver:(id)a3;
@end

@implementation TIContactManagerMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (void)getOnce:(id)a3
{
}

- (void)removeContactObserver:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  v6 = (void *)MEMORY[0x2455C2CF0](v7);
  [(NSMutableArray *)observers removeObjectIdenticalTo:v6];

  objc_sync_exit(v4);
}

- (id)addContactObserver:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))[v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  v8 = (void *)MEMORY[0x2455C2CF0](v5);
  [(NSMutableArray *)observers addObject:v8];

  objc_sync_exit(v6);
  ((void (**)(void, TIContactCollection *))v5)[2](v5, v6->_contactCollection);
  v9 = (void *)MEMORY[0x2455C2CF0](v5);

  return v9;
}

- (NSUUID)contactCollectionUUID
{
  return (NSUUID *)[MEMORY[0x263F08C38] UUID];
}

- (TIContactManagerMock)initWithContactCollection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIContactManagerMock;
  v6 = [(TIContactManagerMock *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactCollection, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v7->_observers;
    v7->_observers = v8;
  }
  return v7;
}

@end