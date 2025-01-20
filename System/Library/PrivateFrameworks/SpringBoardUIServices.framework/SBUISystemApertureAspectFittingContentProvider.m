@interface SBUISystemApertureAspectFittingContentProvider
- (CGSize)explicitIntrinsicSize;
- (SBUISystemApertureAspectFittingContentProvider)initWithView:(id)a3;
- (id)_providedView;
- (id)contentColor;
- (void)setContentColor:(id)a3;
- (void)setContentContainer:(id)a3;
- (void)setExplicitIntrinsicSize:(CGSize)a3;
@end

@implementation SBUISystemApertureAspectFittingContentProvider

- (SBUISystemApertureAspectFittingContentProvider)initWithView:(id)a3
{
  v5 = (UIView *)a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SBUISystemApertureAspectFittingContentProvider.m", 33, @"Invalid parameter not satisfying: %@", @"customView" object file lineNumber description];
  }
  customView = self->_customView;
  self->_customView = v5;
  v7 = v5;

  v8 = -[_SBUISystemApertureAspectFittingView initWithContentView:]((id *)[_SBUISystemApertureAspectFittingView alloc], v7);
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  v9 = [(SBUISystemApertureCustomContentProvider *)&v12 initWithView:v8];

  return v9;
}

- (void)setContentContainer:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  [(SBUISystemApertureCustomContentProvider *)&v7 setContentContainer:v4];
  uint64_t v5 = [(SBUISystemApertureAspectFittingContentProvider *)self _providedView];
  v6 = (void *)v5;
  if (v5) {
    objc_storeWeak((id *)(v5 + 416), v4);
  }
}

- (id)contentColor
{
  return [(UIView *)self->_customView tintColor];
}

- (void)setContentColor:(id)a3
{
}

- (CGSize)explicitIntrinsicSize
{
  v2 = [(SBUISystemApertureAspectFittingContentProvider *)self _providedView];
  [v2 explicitIntrinsicSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setExplicitIntrinsicSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SBUISystemApertureAspectFittingContentProvider *)self explicitIntrinsicSize];
  if (width != v7 || height != v6)
  {
    v9 = [(SBUISystemApertureAspectFittingContentProvider *)self _providedView];
    objc_msgSend(v9, "setExplicitIntrinsicSize:", width, height);

    id v10 = [(SBUISystemApertureCustomContentProvider *)self contentContainer];
    [v10 preferredContentSizeDidInvalidateForContentViewProvider:self];
  }
}

- (id)_providedView
{
  v4.receiver = self;
  v4.super_class = (Class)SBUISystemApertureAspectFittingContentProvider;
  v2 = [(SBUISystemApertureCustomContentProvider *)&v4 providedView];
  return v2;
}

- (void).cxx_destruct
{
}

@end