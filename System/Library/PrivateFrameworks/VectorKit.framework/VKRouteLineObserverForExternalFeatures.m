@interface VKRouteLineObserverForExternalFeatures
- (VKRouteLineObserverForExternalFeatures)initWithRouteLineSupport:(void *)a3 andRouteLine:(id)a4;
- (void)dealloc;
- (void)routeLineDidUpdateSections:(id)a3;
@end

@implementation VKRouteLineObserverForExternalFeatures

- (void).cxx_destruct
{
}

- (void)routeLineDidUpdateSections:(id)a3
{
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeLine);
  [WeakRetained setObserver:0];

  v4.receiver = self;
  v4.super_class = (Class)VKRouteLineObserverForExternalFeatures;
  [(VKRouteLineObserverForExternalFeatures *)&v4 dealloc];
}

- (VKRouteLineObserverForExternalFeatures)initWithRouteLineSupport:(void *)a3 andRouteLine:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKRouteLineObserverForExternalFeatures;
  v7 = [(VKRouteLineObserverForExternalFeatures *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_routeLineSupport = a3;
    id v9 = objc_storeWeak((id *)&v7->_routeLine, v6);
    [v6 setObserver:v8];

    v10 = v8;
  }

  return v8;
}

@end