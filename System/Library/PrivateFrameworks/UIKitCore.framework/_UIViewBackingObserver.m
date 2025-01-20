@interface _UIViewBackingObserver
+ (id)sharedObserver;
- (NSMutableSet)additionalObservers;
- (id)additionalBlocks;
- (id)observerBlock;
- (void)observe:(id)a3 forKeyPath:(id)a4 once:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAdditionalObservers:(id)a3;
- (void)setObserverBlock:(id)a3;
@end

@implementation _UIViewBackingObserver

+ (id)sharedObserver
{
  if (qword_1EB260960 != -1) {
    dispatch_once(&qword_1EB260960, &__block_literal_global_244);
  }
  v2 = (void *)_MergedGlobals_1065;
  return v2;
}

- (void)observe:(id)a3 forKeyPath:(id)a4 once:(id)a5
{
  id v8 = a5;
  if (self->_observerBlock)
  {
    id v9 = a4;
    id v10 = a3;
    v11 = objc_alloc_init(_UIViewBackingObserver);
    v12 = [(_UIViewBackingObserver *)self additionalObservers];
    [v12 addObject:v11];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50___UIViewBackingObserver_observe_forKeyPath_once___block_invoke;
    v17[3] = &unk_1E52E3298;
    v17[4] = self;
    v18 = v11;
    id v19 = v8;
    v13 = v11;
    [(_UIViewBackingObserver *)v13 observe:v10 forKeyPath:v9 once:v17];
  }
  else
  {
    id v14 = a4;
    v13 = (_UIViewBackingObserver *)a3;
    v15 = _Block_copy(v8);
    id observerBlock = self->_observerBlock;
    self->_id observerBlock = v15;

    [(_UIViewBackingObserver *)v13 addObserver:self forKeyPath:v14 options:0 context:&_UIViewBackingObserverContext];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &_UIViewBackingObserverContext)
  {
    [a4 removeObserver:self forKeyPath:a3 context:&_UIViewBackingObserverContext];
    id v9 = (void (**)(void))_Block_copy(self->_observerBlock);
    id observerBlock = self->_observerBlock;
    self->_id observerBlock = 0;

    v9[2]();
  }
}

- (id)additionalBlocks
{
  additionalObservers = self->_additionalObservers;
  if (!additionalObservers)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5 = self->_additionalObservers;
    self->_additionalObservers = v4;

    additionalObservers = self->_additionalObservers;
  }
  return additionalObservers;
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (void)setObserverBlock:(id)a3
{
}

- (NSMutableSet)additionalObservers
{
  return self->_additionalObservers;
}

- (void)setAdditionalObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalObservers, 0);
  objc_storeStrong(&self->_observerBlock, 0);
}

@end