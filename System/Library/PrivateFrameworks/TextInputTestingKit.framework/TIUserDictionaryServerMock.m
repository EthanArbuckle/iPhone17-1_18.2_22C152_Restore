@interface TIUserDictionaryServerMock
- (NSArray)pairs;
- (NSUUID)userDictionaryUUID;
- (TIUserDictionaryServerMock)init;
- (id)addObserver:(id)a3;
- (void)getPhraseShortcutPairs:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setPairs:(id)a3;
@end

@implementation TIUserDictionaryServerMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairs, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setPairs:(id)a3
{
}

- (NSArray)pairs
{
  return self->_pairs;
}

- (void)getPhraseShortcutPairs:(id)a3
{
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  observers = v4->_observers;
  v6 = (void *)MEMORY[0x2455C2CF0](v7);
  [(NSMutableArray *)observers removeObject:v6];

  objc_sync_exit(v4);
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void))[v4 copy];
  v6 = self;
  objc_sync_enter(v6);
  observers = v6->_observers;
  v8 = (void *)MEMORY[0x2455C2CF0](v5);
  [(NSMutableArray *)observers addObject:v8];

  ((void (**)(void, NSArray *))v5)[2](v5, v6->_pairs);
  objc_sync_exit(v6);

  v9 = (void *)MEMORY[0x2455C2CF0](v5);
  return v9;
}

- (NSUUID)userDictionaryUUID
{
  return (NSUUID *)[MEMORY[0x263F08C38] UUID];
}

- (TIUserDictionaryServerMock)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIUserDictionaryServerMock;
  v2 = [(TIUserDictionaryServerMock *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF8C0]);
    pairs = v2->_pairs;
    v2->_pairs = v5;
  }
  return v2;
}

@end