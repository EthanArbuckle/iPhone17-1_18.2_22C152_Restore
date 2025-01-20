@interface SBUISystemApertureButtonContentProvider
- (SBUISystemApertureButtonContentProvider)initWithButtonConfiguration:(id)a3 action:(id)a4;
- (SBUISystemApertureButtonContentProvider)initWithDefaultSymbolActionConfigurationWithAction:(id)a3;
- (SBUISystemApertureButtonContentProvider)initWithDefaultTextActionConfigurationWithAction:(id)a3;
- (SBUISystemApertureContentViewContaining)contentContainer;
- (UIButtonConfiguration)buttonConfiguration;
- (UIColor)contentColor;
- (UIView)providedView;
- (id)_providedView;
- (void)setButtonConfiguration:(id)a3;
- (void)setContentColor:(id)a3;
- (void)setContentContainer:(id)a3;
@end

@implementation SBUISystemApertureButtonContentProvider

- (SBUISystemApertureButtonContentProvider)initWithDefaultTextActionConfigurationWithAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F427E8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "sbui_systemApertureTextButtonConfiguration");
  v7 = [(SBUISystemApertureButtonContentProvider *)self initWithButtonConfiguration:v6 action:v5];

  return v7;
}

- (SBUISystemApertureButtonContentProvider)initWithDefaultSymbolActionConfigurationWithAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F427E8];
  id v5 = a3;
  v6 = objc_msgSend(v4, "sbui_systemApertureSymbolButtonConfiguration");
  v7 = [(SBUISystemApertureButtonContentProvider *)self initWithButtonConfiguration:v6 action:v5];

  return v7;
}

- (SBUISystemApertureButtonContentProvider)initWithButtonConfiguration:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureButtonContentProvider;
  v8 = [(SBUISystemApertureButtonContentProvider *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[SBUISystemApertureButton buttonWithConfiguration:v6 primaryAction:v7];
    providedView = v8->_providedView;
    v8->_providedView = (UIView *)v9;
  }
  return v8;
}

- (UIButtonConfiguration)buttonConfiguration
{
  v2 = [(SBUISystemApertureButtonContentProvider *)self _providedView];
  v3 = [v2 configuration];

  return (UIButtonConfiguration *)v3;
}

- (void)setButtonConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUISystemApertureButtonContentProvider *)self _providedView];
  [v5 setConfiguration:v4];
}

- (UIColor)contentColor
{
  v2 = [(SBUISystemApertureButtonContentProvider *)self buttonConfiguration];
  v3 = [v2 baseForegroundColor];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v2 baseBackgroundColor];
  }
  id v6 = v5;

  return (UIColor *)v6;
}

- (void)setContentColor:(id)a3
{
  id v4 = a3;
  id v5 = [(SBUISystemApertureButtonContentProvider *)self buttonConfiguration];
  [v5 setBaseForegroundColor:v4];
  [v5 setBaseBackgroundColor:v4];

  [(SBUISystemApertureButtonContentProvider *)self setButtonConfiguration:v5];
}

- (id)_providedView
{
  return self->_providedView;
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