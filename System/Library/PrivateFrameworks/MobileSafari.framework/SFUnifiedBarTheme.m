@interface SFUnifiedBarTheme
+ (SFUnifiedBarTheme)defaultTheme;
- (BOOL)isPrivate;
- (SFUnifiedBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
- (SFUnifiedTabBarItemTitleContainerViewTheme)activeTabTitleTheme;
- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme;
- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme;
- (UIColor)activeTabAccessoryButtonTintColor;
- (UIColor)activeTabControlsTintColor;
- (UIColor)activeTabFieldTintColor;
- (UIColor)activeTabProgressBarTintColor;
- (UIColor)inputFieldAccessoryButtonTintColor;
- (UIColor)inputFieldSecondaryAccessoryButtonTintColor;
- (UIColor)overridePlatterColor;
- (UIColor)progressBarTintColor;
- (UIColor)selectedMenuButtonTintColor;
- (UIColor)separatorColor;
- (UIColor)tabAccessoryButtonTintColor;
- (UIColor)tabControlsTintColor;
- (UIColor)tabProgressBarTintColor;
@end

@implementation SFUnifiedBarTheme

- (SFUnifiedBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  v51.receiver = self;
  v51.super_class = (Class)SFUnifiedBarTheme;
  v6 = [(SFThemeColorBarTheme *)&v51 initWithBarTintStyle:a3 preferredBarTintColor:a4 controlsTintColor:a5];
  if (!v6) {
    goto LABEL_23;
  }
  v6->_BOOL isPrivate = _SFIsPrivateTintStyle(a3);
  v7 = [(_SFBarTheme *)v6 controlsTintColor];
  p_progressBarTintColor = &v6->_progressBarTintColor;
  objc_storeStrong((id *)&v6->_progressBarTintColor, v7);
  p_selectedMenuButtonTintColor = (void **)&v6->_selectedMenuButtonTintColor;
  objc_storeStrong((id *)&v6->_selectedMenuButtonTintColor, v7);
  uint64_t v9 = [(SFThemeColorBarTheme *)v6 themeColor];
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F98F20], "overrideTabColorForThemeColor:");
  overridePlatterColor = v6->_overridePlatterColor;
  v6->_overridePlatterColor = (UIColor *)v10;

  uint64_t v12 = [(SFThemeColorBarTheme *)v6 userInterfaceStyle];
  v13 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_transparentBarHairlineColor");
  v14 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v12];
  uint64_t v15 = [v13 resolvedColorWithTraitCollection:v14];
  separatorColor = v6->_separatorColor;
  v6->_separatorColor = (UIColor *)v15;

  if (_SFIsDarkTintStyle(a3))
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", 0.3, 1.0, p_progressBarTintColor);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = [(SFThemeColorBarTheme *)v6 overrideTintColor];
  if (v9) {
    v19 = (UIColor *)v9;
  }
  else {
    v19 = v17;
  }
  if (v6->_overridePlatterColor) {
    v20 = v6->_overridePlatterColor;
  }
  else {
    v20 = v19;
  }
  uint64_t v21 = makeTitleTheme(v12, v18, v20);
  titleTheme = v6->_titleTheme;
  v6->_titleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v21;

  BOOL isPrivate = v6->_isPrivate;
  p_tabTitleTheme = (id *)&v6->_tabTitleTheme;
  objc_storeStrong((id *)&v6->_tabTitleTheme, v6->_titleTheme);
  v50 = (void *)v9;
  if (isPrivate)
  {
    v25 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v26 = makeTitleTheme(2, 0, v25);
    activeTabTitleTheme = v6->_activeTabTitleTheme;
    v6->_activeTabTitleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v26;

    v28 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)v6->_activeTabTitleTheme secondaryTextColor];
    objc_storeStrong((id *)&v6->_tabProgressBarTintColor, v28);
    objc_storeStrong((id *)&v6->_tabControlsTintColor, v28);
    objc_storeStrong((id *)&v6->_activeTabProgressBarTintColor, v28);
    objc_storeStrong((id *)&v6->_activeTabControlsTintColor, v28);
    inputFieldSecondaryAccessoryButtonTintColor = v6->_inputFieldSecondaryAccessoryButtonTintColor;
    v6->_inputFieldSecondaryAccessoryButtonTintColor = v28;
    v30 = v28;

    uint64_t v31 = [MEMORY[0x1E4FB1618] whiteColor];
    activeTabFieldTintColor = *p_selectedMenuButtonTintColor;
    *p_selectedMenuButtonTintColor = (void *)v31;
    v33 = v7;
  }
  else
  {
    if (_SFIsDarkTintStyle(a3)) {
      uint64_t v34 = 2;
    }
    else {
      uint64_t v34 = 1;
    }
    uint64_t v35 = makeTitleTheme(v34, 0, 0);
    v36 = v6->_activeTabTitleTheme;
    v6->_activeTabTitleTheme = (SFUnifiedTabBarItemTitleContainerViewTheme *)v35;

    objc_storeStrong((id *)&v6->_tabProgressBarTintColor, *v49);
    v33 = v7;
    objc_storeStrong((id *)&v6->_tabControlsTintColor, v7);
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    v30 = (UIColor *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_activeTabProgressBarTintColor, v30);
    objc_storeStrong((id *)&v6->_activeTabControlsTintColor, v30);
    uint64_t v37 = [*p_tabTitleTheme secondaryTextColor];
    v38 = v6->_inputFieldSecondaryAccessoryButtonTintColor;
    v6->_inputFieldSecondaryAccessoryButtonTintColor = (UIColor *)v37;

    if (v12 != 2) {
      goto LABEL_19;
    }
    uint64_t v39 = [*p_tabTitleTheme primaryTextColor];
    activeTabFieldTintColor = v6->_activeTabFieldTintColor;
    v6->_activeTabFieldTintColor = (UIColor *)v39;
  }

LABEL_19:
  uint64_t v40 = [*p_tabTitleTheme secondaryTextColor];
  tabAccessoryButtonTintColor = v6->_tabAccessoryButtonTintColor;
  v6->_tabAccessoryButtonTintColor = (UIColor *)v40;

  v42 = v6->_activeTabTitleTheme;
  if (a3 == 2) {
    [(SFUnifiedTabBarItemTitleContainerViewTheme *)v42 primaryTextColor];
  }
  else {
  v43 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)v42 secondaryTextColor];
  }
  objc_storeStrong((id *)&v6->_activeTabAccessoryButtonTintColor, v43);

  uint64_t v44 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)v6->_activeTabTitleTheme primaryTextColor];
  inputFieldAccessoryButtonTintColor = v6->_inputFieldAccessoryButtonTintColor;
  v6->_inputFieldAccessoryButtonTintColor = (UIColor *)v44;

  v46 = v6;
LABEL_23:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTabFieldTintColor, 0);
  objc_storeStrong((id *)&self->_overridePlatterColor, 0);
  objc_storeStrong((id *)&self->_activeTabControlsTintColor, 0);
  objc_storeStrong((id *)&self->_tabControlsTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_tabProgressBarTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_selectedMenuButtonTintColor, 0);
  objc_storeStrong((id *)&self->_inputFieldSecondaryAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_inputFieldAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_tabAccessoryButtonTintColor, 0);
  objc_storeStrong((id *)&self->_activeTabTitleTheme, 0);
  objc_storeStrong((id *)&self->_tabTitleTheme, 0);

  objc_storeStrong((id *)&self->_titleTheme, 0);
}

+ (SFUnifiedBarTheme)defaultTheme
{
  if (defaultTheme_onceToken != -1) {
    dispatch_once(&defaultTheme_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)defaultTheme_defaultTheme;

  return (SFUnifiedBarTheme *)v2;
}

void __33__SFUnifiedBarTheme_defaultTheme__block_invoke()
{
  uint64_t v0 = +[_SFBarTheme themeWithBarTintStyle:1];
  v1 = (void *)defaultTheme_defaultTheme;
  defaultTheme_defaultTheme = v0;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme
{
  return self->_titleTheme;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme
{
  return self->_tabTitleTheme;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)activeTabTitleTheme
{
  return self->_activeTabTitleTheme;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (UIColor)tabAccessoryButtonTintColor
{
  return self->_tabAccessoryButtonTintColor;
}

- (UIColor)activeTabAccessoryButtonTintColor
{
  return self->_activeTabAccessoryButtonTintColor;
}

- (UIColor)inputFieldAccessoryButtonTintColor
{
  return self->_inputFieldAccessoryButtonTintColor;
}

- (UIColor)inputFieldSecondaryAccessoryButtonTintColor
{
  return self->_inputFieldSecondaryAccessoryButtonTintColor;
}

- (UIColor)selectedMenuButtonTintColor
{
  return self->_selectedMenuButtonTintColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (UIColor)tabProgressBarTintColor
{
  return self->_tabProgressBarTintColor;
}

- (UIColor)activeTabProgressBarTintColor
{
  return self->_activeTabProgressBarTintColor;
}

- (UIColor)tabControlsTintColor
{
  return self->_tabControlsTintColor;
}

- (UIColor)activeTabControlsTintColor
{
  return self->_activeTabControlsTintColor;
}

- (UIColor)overridePlatterColor
{
  return self->_overridePlatterColor;
}

- (UIColor)activeTabFieldTintColor
{
  return self->_activeTabFieldTintColor;
}

@end