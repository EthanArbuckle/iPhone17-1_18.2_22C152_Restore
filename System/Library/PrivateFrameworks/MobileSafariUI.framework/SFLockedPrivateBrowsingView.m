@interface SFLockedPrivateBrowsingView
- (SFLockedPrivateBrowsingView)initWithCoder:(id)a3;
- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3;
- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIAction)tabGroupPickerAction;
- (UIAction)unlockAction;
- (void)layoutSubviews;
- (void)setTabGroupPickerAction:(id)a3;
- (void)setUnlockAction:(id)a3;
@end

@implementation SFLockedPrivateBrowsingView

- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3
{
  return -[SFLockedPrivateBrowsingView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SFLockedPrivateBrowsingView)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Method not implemented" userInfo:0];
  objc_exception_throw(v4);
}

- (SFLockedPrivateBrowsingView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v17.receiver = self;
  v17.super_class = (Class)SFLockedPrivateBrowsingView;
  v5 = -[SFLockedPrivateBrowsingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1670]);
    v7 = configurationWithAction(0);
    uint64_t v8 = [v6 initWithConfiguration:v7];
    contentUnavailableView = v5->_contentUnavailableView;
    v5->_contentUnavailableView = (UIContentUnavailableView *)v8;

    [(SFLockedPrivateBrowsingView *)v5 bounds];
    -[UIContentUnavailableView setFrame:](v5->_contentUnavailableView, "setFrame:");
    [(UIContentUnavailableView *)v5->_contentUnavailableView setAutoresizingMask:18];
    [(SFLockedPrivateBrowsingView *)v5 addSubview:v5->_contentUnavailableView];
    if (a4 == 1)
    {
      [(UIContentUnavailableView *)v5->_contentUnavailableView _setOverrideUserInterfaceRenderingMode:2];
    }
    else if (!a4)
    {
      v10 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      [(SFLockedPrivateBrowsingView *)v5 setBackgroundColor:v10];

      v11 = objc_alloc_init(TabOverviewToolbar);
      toolbar = v5->_toolbar;
      v5->_toolbar = v11;

      [(TabOverviewToolbar *)v5->_toolbar setAutoresizingMask:0];
      [(TabOverviewToolbar *)v5->_toolbar setSearchBar:0];
      [(TabOverviewToolbar *)v5->_toolbar setUserInteractionEnabled:1];
      [(TabOverviewToolbar *)v5->_toolbar setBarButton:1 hidden:1];
      [(TabOverviewToolbar *)v5->_toolbar setBarButton:3 hidden:1];
      [(TabOverviewToolbar *)v5->_toolbar setBarButton:2 hidden:1];
      [(TabOverviewToolbar *)v5->_toolbar setBarButton:0 enabled:1];
      v13 = v5->_toolbar;
      v14 = _WBSLocalizedString();
      [(TabOverviewToolbar *)v13 setTabGroupButtonTitle:v14];

      [(SFLockedPrivateBrowsingView *)v5 addSubview:v5->_toolbar];
    }
    v15 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SFLockedPrivateBrowsingView;
  [(SFLockedPrivateBrowsingView *)&v21 layoutSubviews];
  if (self->_toolbar)
  {
    id v3 = [(SFLockedPrivateBrowsingView *)self superview];
    [v3 safeAreaInsets];
    double v5 = v4;
    double v7 = v6;

    [(SFLockedPrivateBrowsingView *)self bounds];
    [(TabOverviewToolbar *)self->_toolbar setPlacement:SFTabOverviewShouldUseCompactAppearanceForSize()];
    int64_t v8 = [(TabOverviewToolbar *)self->_toolbar placement];
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (v8) {
        return;
      }
      [(SFLockedPrivateBrowsingView *)self bounds];
      double v19 = v18;
      -[TabOverviewToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v17 = v5 + v20;
      toolbar = self->_toolbar;
      double v15 = 0.0;
      double v13 = 0.0;
      double v16 = v19;
    }
    else
    {
      double v9 = *MEMORY[0x1E4F1DB28];
      [(SFLockedPrivateBrowsingView *)self bounds];
      CGFloat Width = CGRectGetWidth(v22);
      -[TabOverviewToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v12 = v7 + v11;
      [(SFLockedPrivateBrowsingView *)self bounds];
      double v13 = CGRectGetHeight(v23) - v12;
      toolbar = self->_toolbar;
      double v15 = v9;
      double v16 = Width;
      double v17 = v12;
    }
    -[TabOverviewToolbar setFrame:](toolbar, "setFrame:", v15, v13, v16, v17);
  }
}

- (UIAction)unlockAction
{
  v2 = [(UIContentUnavailableView *)self->_contentUnavailableView configuration];
  id v3 = [v2 buttonProperties];
  double v4 = [v3 primaryAction];

  return (UIAction *)v4;
}

- (void)setUnlockAction:(id)a3
{
  configurationWithAction(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIContentUnavailableView *)self->_contentUnavailableView setConfiguration:v4];
}

- (void)setTabGroupPickerAction:(id)a3
{
  id v7 = a3;
  tabGroupPickerAction = self->_tabGroupPickerAction;
  if (tabGroupPickerAction) {
    [(TabOverviewToolbar *)self->_toolbar removePrimaryAction:tabGroupPickerAction forBarButton:0];
  }
  objc_storeStrong((id *)&self->_tabGroupPickerAction, a3);
  double v6 = v7;
  if (v7)
  {
    [(TabOverviewToolbar *)self->_toolbar addPrimaryAction:v7 forBarButton:0];
    double v6 = v7;
  }
}

- (UIAction)tabGroupPickerAction
{
  return self->_tabGroupPickerAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupPickerAction, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end