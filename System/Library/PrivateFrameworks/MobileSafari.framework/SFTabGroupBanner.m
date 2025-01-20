@interface SFTabGroupBanner
- (BOOL)shouldUsePlainTheme;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SFTabGroupBanner)initWithFrame:(CGRect)a3;
- (UIAction)tabGroupTapAction;
- (WBTabGroup)tabGroup;
- (_SWCollaborationButtonView)collaborationButton;
- (void)_updateToolbarItems;
- (void)setCollaborationButton:(id)a3;
- (void)setTabGroup:(id)a3;
- (void)setTabGroupTapAction:(id)a3;
- (void)themeDidChange;
- (void)updateTitle;
@end

@implementation SFTabGroupBanner

- (SFTabGroupBanner)initWithFrame:(CGRect)a3
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)SFTabGroupBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFPinnableBanner *)v3 setSeparableFromStatusBar:0];
    v5 = [SFThemeColorEffectView alloc];
    v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v7 = [(SFThemeColorEffectView *)v5 initWithEffect:v6];
    backdrop = v4->_backdrop;
    v4->_backdrop = (SFThemeColorEffectView *)v7;

    [(SFTabGroupBanner *)v4 bounds];
    -[SFThemeColorEffectView setFrame:](v4->_backdrop, "setFrame:");
    [(SFThemeColorEffectView *)v4->_backdrop setAutoresizingMask:18];
    [(SFTabGroupBanner *)v4 insertSubview:v4->_backdrop atIndex:0];
    v9 = objc_alloc_init(SFTabGroupTitleView);
    titleView = v4->_titleView;
    v4->_titleView = v9;

    v11 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E4FB1DF0]);
    toolbar = v4->_toolbar;
    v4->_toolbar = v11;

    id v29 = objc_alloc_init(MEMORY[0x1E4FB1DF8]);
    [v29 configureWithTransparentBackground];
    [(UIToolbar *)v4->_toolbar setStandardAppearance:v29];
    [(UIToolbar *)v4->_toolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFTabGroupBanner *)v4 addSubview:v4->_toolbar];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [(UIToolbar *)v4->_toolbar leadingAnchor];
    v27 = [(SFTabGroupBanner *)v4 leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v31[0] = v26;
    v25 = [(UIToolbar *)v4->_toolbar widthAnchor];
    v13 = [(SFTabGroupBanner *)v4 widthAnchor];
    v14 = [v25 constraintEqualToAnchor:v13];
    v31[1] = v14;
    v15 = [(UIToolbar *)v4->_toolbar topAnchor];
    v16 = [(SFTabGroupBanner *)v4 topAnchor];
    v17 = [v15 constraintGreaterThanOrEqualToAnchor:v16];
    v31[2] = v17;
    v18 = [(UIToolbar *)v4->_toolbar heightAnchor];
    v19 = [(SFTabGroupBanner *)v4 heightAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v31[3] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    [v24 activateConstraints:v21];

    v22 = v4;
  }

  return v4;
}

- (void)setTabGroup:(id)a3
{
  v5 = (WBTabGroup *)a3;
  if (self->_tabGroup != v5)
  {
    objc_storeStrong((id *)&self->_tabGroup, a3);
    [(SFTabGroupTitleView *)self->_titleView setTabGroup:v5];
    [(SFTabGroupTitleView *)self->_titleView sizeToFit];
    [(SFTabGroupBanner *)self _updateToolbarItems];
  }
}

- (void)setTabGroupTapAction:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tabGroupTapAction, a3);
    [(SFTabGroupTitleView *)self->_titleView removeActionForIdentifier:@"com.apple.mobilesafari.TabGroupTap" forControlEvents:64];
    [(SFTabGroupTitleView *)self->_titleView addAction:v5 forControlEvents:64];
  }
}

- (void)setCollaborationButton:(id)a3
{
  id v5 = (_SWCollaborationButtonView *)a3;
  if (self->_collaborationButton != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collaborationButton, a3);
    [(SFTabGroupBanner *)self _updateToolbarItems];
    id v5 = v6;
  }
}

- (void)updateTitle
{
}

- (BOOL)shouldUsePlainTheme
{
  return 1;
}

- (void)themeDidChange
{
  id v3 = [(SFPinnableBanner *)self theme];
  [(SFThemeColorEffectView *)self->_backdrop setTheme:v3];
  -[SFTabGroupBanner setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v3 userInterfaceStyle]);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[SFTabGroupBanner systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_updateToolbarItems
{
  v9[2] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_titleView];
  v9[0] = v4;
  double v5 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
  v9[1] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v3 arrayWithArray:v6];

  if (self->_collaborationButton)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_collaborationButton];
    [v7 addObject:v8];
  }
  [(UIToolbar *)self->_toolbar setItems:v7];
}

- (WBTabGroup)tabGroup
{
  return self->_tabGroup;
}

- (UIAction)tabGroupTapAction
{
  return self->_tabGroupTapAction;
}

- (_SWCollaborationButtonView)collaborationButton
{
  return self->_collaborationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButton, 0);
  objc_storeStrong((id *)&self->_tabGroupTapAction, 0);
  objc_storeStrong((id *)&self->_tabGroup, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_titleView, 0);

  objc_storeStrong((id *)&self->_backdrop, 0);
}

@end