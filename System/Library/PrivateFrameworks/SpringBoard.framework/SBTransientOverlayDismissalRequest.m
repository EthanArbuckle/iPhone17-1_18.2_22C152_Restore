@interface SBTransientOverlayDismissalRequest
+ (id)dismissalRequestForAllViewControllers;
+ (id)dismissalRequestForAllViewControllersInWindowScene:(id)a3;
+ (id)dismissalRequestForViewController:(id)a3;
- (BOOL)isAnimated;
- (SBTransientOverlayViewController)viewController;
- (SBWindowScene)windowScene;
- (id)_copyWithClass:(Class)a3;
- (id)_init;
- (id)completionHandler;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)requestType;
@end

@implementation SBTransientOverlayDismissalRequest

+ (id)dismissalRequestForAllViewControllers
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  if (v2) {
    v2[3] = 2;
  }
  return v2;
}

+ (id)dismissalRequestForAllViewControllersInWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)a1) _init];
  v6 = (void *)v5;
  if (v5)
  {
    *(void *)(v5 + 24) = 3;
    objc_storeWeak((id *)(v5 + 40), v4);
  }

  return v6;
}

+ (id)dismissalRequestForViewController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  v7 = (void *)v6;
  if (v6)
  {
    *(void *)(v6 + 24) = 1;
    objc_storeStrong((id *)(v6 + 32), a3);
  }

  return v7;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBTransientOverlayDismissalRequest;
  id result = [(SBTransientOverlayDismissalRequest *)&v3 init];
  if (result) {
    *((unsigned char *)result + 8) = 1;
  }
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayDismissalRequest *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  uint64_t v4 = [[a3 alloc] _init];
  uint64_t v5 = v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_animated;
    uint64_t v6 = [self->_completionHandler copy];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(void *)(v5 + 24) = self->_requestType;
    objc_storeStrong((id *)(v5 + 32), self->_viewController);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 40), WeakRetained);
  }
  return (id)v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end