@interface SBUISystemApertureCustomContentProvider
- (SBUISystemApertureContentViewContaining)contentContainer;
- (SBUISystemApertureCustomContentProvider)initWithView:(id)a3;
- (UIColor)contentColor;
- (UIView)providedView;
- (void)setContentColor:(id)a3;
- (void)setContentContainer:(id)a3;
@end

@implementation SBUISystemApertureCustomContentProvider

- (SBUISystemApertureCustomContentProvider)initWithView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SBUISystemApertureCustomContentProvider.m", 18, @"Invalid parameter not satisfying: %@", @"customView" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)SBUISystemApertureCustomContentProvider;
  v7 = [(SBUISystemApertureCustomContentProvider *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_providedView, a3);
  }

  return v8;
}

- (UIColor)contentColor
{
  return [(UIView *)self->_providedView tintColor];
}

- (void)setContentColor:(id)a3
{
}

- (UIView)providedView
{
  return self->_providedView;
}

- (SBUISystemApertureContentViewContaining)contentContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentContainer);
  return (SBUISystemApertureContentViewContaining *)WeakRetained;
}

- (void)setContentContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentContainer);
  objc_storeStrong((id *)&self->_providedView, 0);
}

@end