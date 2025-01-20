@interface SHSheetActivityPresentationContext
- (BOOL)isCloudSharing;
- (BOOL)shouldDismissBeforePresentation;
- (BOOL)shouldPresentOverCurrentContext;
- (id)description;
- (void)setIsCloudSharing:(BOOL)a3;
- (void)setShouldDismissBeforePresentation:(BOOL)a3;
- (void)setShouldPresentOverCurrentContext:(BOOL)a3;
@end

@implementation SHSheetActivityPresentationContext

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(SHSheetActivityPresentationContext *)self shouldDismissBeforePresentation];
  v5 = NSStringFromBOOL();
  [(SHSheetActivityPresentationContext *)self shouldPresentOverCurrentContext];
  v6 = NSStringFromBOOL();
  [(SHSheetActivityPresentationContext *)self isCloudSharing];
  v7 = NSStringFromBOOL();
  v8 = [v3 stringWithFormat:@"<%@ shouldDismissBeforePresentation:%@ shouldPresentOverCurrentContext:%@ isCloudSharing:%@>", v4, v5, v6, v7];

  return v8;
}

- (BOOL)shouldDismissBeforePresentation
{
  return self->_shouldDismissBeforePresentation;
}

- (void)setShouldDismissBeforePresentation:(BOOL)a3
{
  self->_shouldDismissBeforePresentation = a3;
}

- (BOOL)shouldPresentOverCurrentContext
{
  return self->_shouldPresentOverCurrentContext;
}

- (void)setShouldPresentOverCurrentContext:(BOOL)a3
{
  self->_shouldPresentOverCurrentContext = a3;
}

- (BOOL)isCloudSharing
{
  return self->_isCloudSharing;
}

- (void)setIsCloudSharing:(BOOL)a3
{
  self->_isCloudSharing = a3;
}

@end