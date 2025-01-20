@interface MTAllPropertyChangesQueryObserver
- (id)addResultsChangedHandler:(id)a3;
- (void)controllerDidChangeContent:(id)a3;
- (void)notifyObservers;
- (void)startObserving;
@end

@implementation MTAllPropertyChangesQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  v4 = _Block_copy(a3);
  v7.receiver = self;
  v7.super_class = (Class)MTAllPropertyChangesQueryObserver;
  v5 = [(MTBaseQueryObserver *)&v7 addResultsChangedHandler:v4];

  return v5;
}

- (void)startObserving
{
  v3.receiver = self;
  v3.super_class = (Class)MTAllPropertyChangesQueryObserver;
  [(MTBaseQueryObserver *)&v3 startObserving];
  [(MTAllPropertyChangesQueryObserver *)self notifyObservers];
}

- (void)notifyObservers
{
  if (!self->_inCallback)
  {
    self->_inCallback = 1;
    objc_super v3 = [(MTBaseQueryObserver *)self handlers];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__MTAllPropertyChangesQueryObserver_notifyObservers__block_invoke;
    v4[3] = &unk_1E5E63888;
    v4[4] = self;
    [v3 enumerateKeysAndObjectsUsingBlock:v4];

    self->_inCallback = 0;
  }
}

void __52__MTAllPropertyChangesQueryObserver_notifyObservers__block_invoke(uint64_t a1, int a2, void *aBlock)
{
  id v4 = _Block_copy(aBlock);
  [*(id *)(a1 + 32) results:v4];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [a3 delegate];

  if (v4)
  {
    [(MTAllPropertyChangesQueryObserver *)self notifyObservers];
  }
}

@end