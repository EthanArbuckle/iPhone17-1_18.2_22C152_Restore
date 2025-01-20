@interface SBHStackConfigurationBackgroundDimmingView
- (SBIconListView)iconListView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setIconListView:(id)a3;
@end

@implementation SBHStackConfigurationBackgroundDimmingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBHStackConfigurationBackgroundDimmingView;
  -[SBHStackConfigurationBackgroundDimmingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBHStackConfigurationBackgroundDimmingView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if ([v7 type] == 9)
    {
      v8 = [(SBHStackConfigurationBackgroundDimmingView *)self iconListView];
    }
    else
    {
      v8 = self;
    }
  }

  return v8;
}

- (SBIconListView)iconListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconListView);
  return (SBIconListView *)WeakRetained;
}

- (void)setIconListView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end