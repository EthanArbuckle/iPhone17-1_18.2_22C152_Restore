@interface SFThemeColorBarTheme
+ (BOOL)canTintPrivateStyles;
+ (BOOL)prefersThemeColorEffect;
- (BOOL)appliesDarkeningOverlay;
- (BOOL)isEqual:(id)a3;
- (NSString)backdropGroupName;
- (SFThemeColorBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
- (UIBlurEffect)overrideBackdropEffect;
- (UIColor)overrideTintColor;
- (UIColor)themeColor;
- (UITraitCollection)traitCollection;
- (id)backdropEffect;
- (id)backdropEffects;
- (int64_t)userInterfaceStyle;
- (void)applyBackdropEffectsToView:(id)a3;
- (void)setAppliesDarkeningOverlay:(BOOL)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setOverrideBackdropEffect:(id)a3;
@end

@implementation SFThemeColorBarTheme

- (void)setBackdropGroupName:(id)a3
{
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (SFThemeColorBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = v10;
    v12 = 0;
  }
  else
  {
    id v13 = v9;
    if ([MEMORY[0x1E4F98F20] shouldOverrideTintColorForThemeColor:v13])
    {
      if (objc_msgSend(v13, "safari_meetsThresholdForDarkAppearance")) {
        [MEMORY[0x1E4FB1618] whiteColor];
      }
      else {
      v14 = [MEMORY[0x1E4FB1618] blackColor];
      }
    }
    else
    {
      v14 = 0;
    }

    id v11 = v14;
    v12 = v11;
  }
  v24.receiver = self;
  v24.super_class = (Class)SFThemeColorBarTheme;
  v15 = [(_SFBarTheme *)&v24 initWithBarTintStyle:a3 preferredBarTintColor:v9 controlsTintColor:v11];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_themeColor, a4);
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = v11;
    }
    objc_storeStrong((id *)&v16->_overrideTintColor, v17);
    uint64_t v18 = [(_SFBarTheme *)v16 overrideUserInterfaceStyle];
    v16->_userInterfaceStyle = v18;
    if (v9)
    {
      if (objc_msgSend(v9, "safari_meetsThresholdForDarkAppearance")) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = 1;
      }
      v16->_userInterfaceStyle = v19;
    }
    else
    {
      uint64_t v19 = v18;
    }
    uint64_t v20 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v19];
    traitCollection = v16->_traitCollection;
    v16->_traitCollection = (UITraitCollection *)v20;

    v22 = v16;
  }

  return v16;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (id)backdropEffects
{
  v10.receiver = self;
  v10.super_class = (Class)SFThemeColorBarTheme;
  v3 = [(_SFBarTheme *)&v10 backdropEffects];
  v4 = v3;
  if (self->_appliesDarkeningOverlay)
  {
    v5 = (void *)MEMORY[0x1E4FB1EF8];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    v7 = [v5 effectCompositingColor:v6 withMode:0 alpha:0.03];

    id v8 = [v4 arrayByAddingObject:v7];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (id)backdropEffect
{
  overrideBackdropEffect = self->_overrideBackdropEffect;
  if (overrideBackdropEffect)
  {
    v3 = overrideBackdropEffect;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SFThemeColorBarTheme;
    v3 = [(_SFBarTheme *)&v5 backdropEffect];
  }

  return v3;
}

+ (BOOL)prefersThemeColorEffect
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideBackdropEffect, 0);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_overrideTintColor, 0);

  objc_storeStrong((id *)&self->_themeColor, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFThemeColorBarTheme *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFThemeColorBarTheme;
    if ([(_SFBarTheme *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_super v5 = v4;
      if (self->_appliesDarkeningOverlay == v5[80] && WBSIsEqual()) {
        char v6 = WBSIsEqual();
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)setAppliesDarkeningOverlay:(BOOL)a3
{
  self->_appliesDarkeningOverlay = a3;
}

- (void)setOverrideBackdropEffect:(id)a3
{
}

- (void)applyBackdropEffectsToView:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(SFThemeColorBarTheme *)self themeColor];
  if (v5)
  {
    char v6 = [(SFThemeColorBarTheme *)self backdropEffect];
    v11[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v4 setBackgroundEffects:v7];

    [v4 setContentEffects:MEMORY[0x1E4F1CBF0]];
    objc_super v8 = [v5 colorWithAlphaComponent:0.85];
    id v9 = [v4 contentView];
    [v9 setBackgroundColor:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SFThemeColorBarTheme;
    [(_SFBarTheme *)&v10 applyBackdropEffectsToView:v4];
  }
  if (self->_backdropGroupName) {
    objc_msgSend(v4, "_setGroupName:");
  }
}

+ (BOOL)canTintPrivateStyles
{
  return 1;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (BOOL)appliesDarkeningOverlay
{
  return self->_appliesDarkeningOverlay;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIBlurEffect)overrideBackdropEffect
{
  return self->_overrideBackdropEffect;
}

@end