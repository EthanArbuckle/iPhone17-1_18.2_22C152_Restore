@interface VKRouteLineObserver
- (VKRouteLineObserver)initWithTransitSupport:(void *)a3 andRouteLine:(id)a4;
- (void)dealloc;
- (void)routeLineDidUpdateSections:(id)a3;
@end

@implementation VKRouteLineObserver

- (void).cxx_destruct
{
}

- (void)routeLineDidUpdateSections:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  transitSupport = self->_transitSupport;
  id v4 = a3;
  v5 = (md::LabelManager *)*((void *)transitSupport + 2);
  v6[0] = &unk_1EF5748F8;
  v6[1] = transitSupport;
  v7 = v6;
  md::LabelManager::queueCommand(v5, 43, 1, v6);
  if (v7 == v6)
  {
    (*(void (**)(void *))(v6[0] + 32))(v6);
  }
  else if (v7)
  {
    (*(void (**)(void))(*v7 + 40))();
  }
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeLine);
  [WeakRetained setObserver:0];

  v4.receiver = self;
  v4.super_class = (Class)VKRouteLineObserver;
  [(VKRouteLineObserver *)&v4 dealloc];
}

- (VKRouteLineObserver)initWithTransitSupport:(void *)a3 andRouteLine:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKRouteLineObserver;
  v7 = [(VKRouteLineObserver *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_transitSupport = a3;
    id v9 = objc_storeWeak((id *)&v7->_routeLine, v6);
    [v6 setObserver:v8];

    v10 = v8;
  }

  return v8;
}

@end