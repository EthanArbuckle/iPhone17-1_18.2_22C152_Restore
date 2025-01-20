@interface MTUuidQueryObserver
- (NSArray)uuidOrder;
- (NSSet)uuidSet;
- (id)addResultsChangedHandler:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)notifyObservers;
- (void)setUuidOrder:(id)a3;
- (void)setUuidSet:(id)a3;
- (void)startObserving;
@end

@implementation MTUuidQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTUuidQueryObserver;
  v5 = [(MTBaseQueryObserver *)&v7 addResultsChangedHandler:v4];

  return v5;
}

- (void)startObserving
{
  v3.receiver = self;
  v3.super_class = (Class)MTUuidQueryObserver;
  [(MTBaseQueryObserver *)&v3 startObserving];
  [(MTUuidQueryObserver *)self notifyObservers];
}

- (void)notifyObservers
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __38__MTUuidQueryObserver_notifyObservers__block_invoke;
  v13[3] = &unk_265055598;
  v13[4] = &v14;
  [(MTBaseQueryObserver *)self results:v13];
  objc_super v3 = [(MTUuidQueryObserver *)self uuidOrder];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  v5 = (void *)[v4 initWithArray:v15[5]];
  v6 = [(MTUuidQueryObserver *)self uuidSet];
  objc_super v7 = (void *)[v6 mutableCopy];
  [v7 minusSet:v5];
  v8 = (void *)[v5 mutableCopy];
  [v8 minusSet:v6];
  [(MTUuidQueryObserver *)self setUuidSet:v5];
  [(MTUuidQueryObserver *)self setUuidOrder:v15[5]];
  if ([v7 count] || objc_msgSend(v8, "count") || (objc_msgSend(v3, "isEqual:", v15[5]) & 1) == 0)
  {
    v9 = [(MTBaseQueryObserver *)self handlers];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__MTUuidQueryObserver_notifyObservers__block_invoke_3;
    v10[3] = &unk_265055C70;
    id v11 = v7;
    id v12 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __38__MTUuidQueryObserver_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend(a2, "mt_compactMap:", &__block_literal_global_6);
  return MEMORY[0x270F9A758]();
}

uint64_t __38__MTUuidQueryObserver_notifyObservers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

void __38__MTUuidQueryObserver_notifyObservers__block_invoke_3(uint64_t a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [a3 delegate];

  if (v4)
  {
    [(MTUuidQueryObserver *)self notifyObservers];
  }
}

- (NSSet)uuidSet
{
  return self->_uuidSet;
}

- (void)setUuidSet:(id)a3
{
}

- (NSArray)uuidOrder
{
  return self->_uuidOrder;
}

- (void)setUuidOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOrder, 0);
  objc_storeStrong((id *)&self->_uuidSet, 0);
}

@end