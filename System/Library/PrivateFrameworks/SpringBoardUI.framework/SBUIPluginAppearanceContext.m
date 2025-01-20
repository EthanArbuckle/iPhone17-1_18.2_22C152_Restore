@interface SBUIPluginAppearanceContext
- (BOOL)hideOtherWindowsDuringAppearance;
- (void)setHideOtherWindowsDuringAppearance:(BOOL)a3;
@end

@implementation SBUIPluginAppearanceContext

- (BOOL)hideOtherWindowsDuringAppearance
{
  return self->_hideOtherWindowsDuringAppearance;
}

- (void)setHideOtherWindowsDuringAppearance:(BOOL)a3
{
  self->_hideOtherWindowsDuringAppearance = a3;
}

@end