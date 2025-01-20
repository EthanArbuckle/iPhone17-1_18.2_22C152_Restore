@interface SBHIconLaunchContext
- (NSSet)actions;
- (SBIconView)iconView;
- (void)setActions:(id)a3;
- (void)setIconView:(id)a3;
@end

@implementation SBHIconLaunchContext

- (SBIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end