@interface SBMutableTransientOverlayPresentationRequest
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setOriginatingProcess:(id)a3;
- (void)setShouldDismissSiri:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation SBMutableTransientOverlayPresentationRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayPresentationRequest *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayPresentationRequest *)self _copyWithClass:v4];
}

- (void)setAnimated:(BOOL)a3
{
  self->super._animated = a3;
}

- (void)setCompletionHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id completionHandler = self->super._completionHandler;
  self->super._id completionHandler = v4;
}

- (void)setShouldDismissSiri:(BOOL)a3
{
  self->super._shouldDismissSiri = a3;
}

- (void)setViewController:(id)a3
{
}

- (void)setOriginatingProcess:(id)a3
{
}

- (void)setWindowScene:(id)a3
{
}

@end