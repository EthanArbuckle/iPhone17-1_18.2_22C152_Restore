@interface SBMutableTransientOverlayDismissalRequest
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
@end

@implementation SBMutableTransientOverlayDismissalRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayDismissalRequest *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBTransientOverlayDismissalRequest *)self _copyWithClass:v4];
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

@end