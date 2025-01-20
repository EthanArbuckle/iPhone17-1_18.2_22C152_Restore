@interface SBCenterWindowActivationAnimationContext
- (UIView)contentPortalContainer;
- (UIView)deparentingPortal;
- (void)setContentPortalContainer:(id)a3;
- (void)setDeparentingPortal:(id)a3;
@end

@implementation SBCenterWindowActivationAnimationContext

- (UIView)deparentingPortal
{
  return self->_deparentingPortal;
}

- (void)setDeparentingPortal:(id)a3
{
}

- (UIView)contentPortalContainer
{
  return self->_contentPortalContainer;
}

- (void)setContentPortalContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPortalContainer, 0);
  objc_storeStrong((id *)&self->_deparentingPortal, 0);
}

@end