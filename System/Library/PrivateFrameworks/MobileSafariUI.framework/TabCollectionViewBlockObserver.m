@interface TabCollectionViewBlockObserver
+ (id)observerMap;
+ (void)beginObservingTabView:(id)a3 steadyStateBlock:(id)a4;
+ (void)endObservingTabView:(id)a3;
+ (void)performIgnoringObservationForTabView:(id)a3 block:(id)a4;
- (id)steadyStateBlock;
- (void)setSteadyStateBlock:(id)a3;
- (void)tabCollectionView:(id)a3 didChangeSteadyState:(BOOL)a4;
@end

@implementation TabCollectionViewBlockObserver

+ (id)observerMap
{
  if (observerMap_onceToken != -1) {
    dispatch_once(&observerMap_onceToken, &__block_literal_global_46);
  }
  v2 = (void *)observerMap_map;
  return v2;
}

void __45__TabCollectionViewBlockObserver_observerMap__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  v1 = (void *)observerMap_map;
  observerMap_map = v0;
}

+ (void)beginObservingTabView:(id)a3 steadyStateBlock:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = +[TabCollectionViewBlockObserver observerMap];
  v7 = [v6 objectForKey:v9];

  if (!v7)
  {
    v7 = objc_alloc_init(TabCollectionViewBlockObserver);
    [v9 addPresentationObserver:v7];
    v8 = +[TabCollectionViewBlockObserver observerMap];
    [v8 setObject:v7 forKey:v9];
  }
  [(TabCollectionViewBlockObserver *)v7 setSteadyStateBlock:v5];
}

+ (void)endObservingTabView:(id)a3
{
  id v6 = a3;
  v3 = +[TabCollectionViewBlockObserver observerMap];
  v4 = [v3 objectForKey:v6];

  if (v4)
  {
    [v6 removePresentationObserver:v4];
    id v5 = +[TabCollectionViewBlockObserver observerMap];
    [v5 removeObjectForKey:v6];
  }
}

+ (void)performIgnoringObservationForTabView:(id)a3 block:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = a3;
  v7 = +[TabCollectionViewBlockObserver observerMap];
  v10 = [v7 objectForKey:v6];

  if (v10)
  {
    char v8 = v10[8];
    v10[8] = 1;
    v5[2](v5);

    id v9 = v10;
    v10[8] = v8;
  }
  else
  {
    v5[2](v5);

    id v9 = 0;
  }
}

- (void)tabCollectionView:(id)a3 didChangeSteadyState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_ignoreUpdates)
  {
    steadyStateBlock = (void (**)(id, BOOL))self->_steadyStateBlock;
    if (steadyStateBlock)
    {
      id v8 = v6;
      steadyStateBlock[2](steadyStateBlock, v4);
      id v6 = v8;
    }
  }
}

- (id)steadyStateBlock
{
  return self->_steadyStateBlock;
}

- (void)setSteadyStateBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end