@interface SBRemoteTransientOverlayDismissalRequest
- (BOOL)isAnimated;
- (BOOL)shouldInvalidatePresentation;
- (SBRemoteTransientOverlayDismissalRequest)initWithViewController:(id)a3;
- (SBTransientOverlayViewController)viewController;
- (id)completionHandler;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setShouldInvalidatePresentation:(BOOL)a3;
@end

@implementation SBRemoteTransientOverlayDismissalRequest

- (SBRemoteTransientOverlayDismissalRequest)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayDismissalRequest;
  v6 = [(SBRemoteTransientOverlayDismissalRequest *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithViewController:self->_viewController];
  uint64_t v5 = v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_animated;
    uint64_t v6 = [self->_completionHandler copy];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(unsigned char *)(v5 + 9) = self->_shouldInvalidatePresentation;
  }
  return (id)v5;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)shouldInvalidatePresentation
{
  return self->_shouldInvalidatePresentation;
}

- (void)setShouldInvalidatePresentation:(BOOL)a3
{
  self->_shouldInvalidatePresentation = a3;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end