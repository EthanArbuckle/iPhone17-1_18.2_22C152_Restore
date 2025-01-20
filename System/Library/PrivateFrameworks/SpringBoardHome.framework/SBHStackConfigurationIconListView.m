@interface SBHStackConfigurationIconListView
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)baseIconViewClass;
- (SBIconViewDelegate)iconViewDelegate;
- (void)_setupCustomBackgroundConfigurationForIconView:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)setIconViewDelegate:(id)a3;
@end

@implementation SBHStackConfigurationIconListView

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHStackConfigurationIconListView;
  [(SBIconListView *)&v8 configureIconView:v6 forIcon:a4];
  v7 = [(SBHStackConfigurationIconListView *)self iconViewDelegate];
  [v6 setDelegate:v7];

  [v6 setIconContentScalingEnabled:1];
  [v6 setAllowsResizeHandle:0];
  [v6 _updateAccessoryViewAnimated:0];
  [v6 setStartsDragMoreQuickly:1];
  [(SBHStackConfigurationIconListView *)self _setupCustomBackgroundConfigurationForIconView:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SBIconListView *)self addLayoutObserver:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHStackConfigurationIconListView;
  -[SBIconListView sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = SBHSizeCeiling(v3);
  result.height = v5;
  result.width = v4;
  return result;
}

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (void)_setupCustomBackgroundConfigurationForIconView:(id)a3
{
  double v3 = [a3 customIconImageViewController];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [v3 backgroundViewProvider];
    id v5 = (id)[v4 copy];

    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke;
      v10[3] = &unk_1E6AAD8D0;
      id v5 = v5;
      id v11 = v5;
      [v3 setBackgroundViewProvider:v10];
      if (objc_opt_respondsToSelector())
      {
        objc_super v6 = [v3 backgroundViewConfigurator];
        id v7 = (id)[v6 copy];

        if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v8[0] = MEMORY[0x1E4F143A8];
          v8[1] = 3221225472;
          v8[2] = __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke_2;
          v8[3] = &unk_1E6AAD8F8;
          id v7 = v7;
          id v9 = v7;
          [v3 setBackgroundViewConfigurator:v8];
        }
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }
}

SBHWidgetWrapperBackgroundView *__84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = [[SBHWidgetWrapperBackgroundView alloc] initWithUnderlyingBackgroundView:v3 widgetBackgroundView:v4];

  return v5;
}

void __84__SBHStackConfigurationIconListView__setupCustomBackgroundConfigurationForIconView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v13 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v8 = v13;
    }
    else {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }
  id v9 = v8;

  v10 = [v9 widgetBackgroundView];
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = v13;
  }
  id v12 = v11;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (SBIconViewDelegate)iconViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewDelegate);
  return (SBIconViewDelegate *)WeakRetained;
}

- (void)setIconViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end