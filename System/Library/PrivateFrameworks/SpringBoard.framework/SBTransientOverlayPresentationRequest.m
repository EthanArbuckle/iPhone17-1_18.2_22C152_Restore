@interface SBTransientOverlayPresentationRequest
- (BOOL)isAnimated;
- (BOOL)shouldDismissSiri;
- (BSProcessHandle)originatingProcess;
- (SBTransientOverlayPresentationRequest)initWithViewController:(id)a3;
- (SBTransientOverlayViewController)viewController;
- (SBWindowScene)windowScene;
- (id)_copyWithClass:(Class)a3;
- (id)completionHandler;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation SBTransientOverlayPresentationRequest

- (SBTransientOverlayPresentationRequest)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransientOverlayPresentationRequest;
  v6 = [(SBTransientOverlayPresentationRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    v6->_shouldDismissSiri = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayPresentationRequest *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  uint64_t v4 = [[a3 alloc] initWithViewController:self->_viewController];
  uint64_t v5 = v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_animated;
    uint64_t v6 = [self->_completionHandler copy];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(unsigned char *)(v5 + 24) = self->_shouldDismissSiri;
    objc_storeStrong((id *)(v5 + 40), self->_originatingProcess);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 48), WeakRetained);
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

- (BOOL)shouldDismissSiri
{
  return self->_shouldDismissSiri;
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

- (BSProcessHandle)originatingProcess
{
  return self->_originatingProcess;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_originatingProcess, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end