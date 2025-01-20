@interface SFCapsuleNavigationBarTheme
+ (BOOL)backdropIsDarkForStyle:(int64_t)a3;
+ (id)backdropEffectForStyle:(int64_t)a3;
- (BOOL)hidesOverlayEffects;
- (BOOL)isEqual:(id)a3;
- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme;
- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme;
- (_SFBarTheme)backgroundTheme;
- (_SFBarTheme)contentTheme;
- (id)_titleThemeIsMinimized:(BOOL)a3;
- (id)backgroundOverlayEffects;
- (void)applyBackdropEffectsToView:(id)a3;
- (void)setBackgroundTheme:(id)a3;
- (void)setHidesOverlayEffects:(BOOL)a3;
@end

@implementation SFCapsuleNavigationBarTheme

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCapsuleNavigationBarTheme *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFCapsuleNavigationBarTheme;
    if ([(_SFBarTheme *)&v8 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (WBSIsEqual()) {
        BOOL v6 = self->_hidesOverlayEffects == v5[80];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (_SFBarTheme)contentTheme
{
  backgroundTheme = (SFCapsuleNavigationBarTheme *)self->_backgroundTheme;
  if (!backgroundTheme || !self->_hidesOverlayEffects) {
    backgroundTheme = self;
  }
  return (_SFBarTheme *)backgroundTheme;
}

- (_SFBarTheme)backgroundTheme
{
  return self->_backgroundTheme;
}

- (void)applyBackdropEffectsToView:(id)a3
{
  id v4 = a3;
  backgroundTheme = self->_backgroundTheme;
  if (backgroundTheme)
  {
    [(_SFBarTheme *)backgroundTheme applyBackdropEffectsToView:v4];
    BOOL v6 = [(SFCapsuleNavigationBarTheme *)self backgroundOverlayEffects];
    if (![v6 count])
    {
LABEL_7:

      goto LABEL_8;
    }
    v7 = [v4 backgroundEffects];
    objc_super v8 = [v7 arrayByAddingObjectsFromArray:v6];
    [v4 setBackgroundEffects:v8];

LABEL_6:
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)SFCapsuleNavigationBarTheme;
  [(_SFBarTheme *)&v9 applyBackdropEffectsToView:v4];
  if ([(_SFBarTheme *)self tintStyle] == 3)
  {
    BOOL v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.3];
    v7 = [v4 contentView];
    [v7 setBackgroundColor:v6];
    goto LABEL_6;
  }
LABEL_8:
}

- (id)backgroundOverlayEffects
{
  v19[1] = *MEMORY[0x1E4F143B8];
  switch([(_SFBarTheme *)self tintStyle])
  {
    case 1:
      v3 = (void *)MEMORY[0x1E4FB1EF8];
      id v4 = [MEMORY[0x1E4FB1618] whiteColor];
      double v5 = 0.8;
      if (self->_hidesOverlayEffects) {
        double v5 = 0.0;
      }
      BOOL v6 = [v3 effectCompositingColor:v4 withMode:0 alpha:v5];
      v19[0] = v6;
      v7 = (void **)v19;
      goto LABEL_15;
    case 2:
      objc_super v9 = (void *)MEMORY[0x1E4FB1EF8];
      id v4 = [MEMORY[0x1E4FB1618] whiteColor];
      double v10 = 0.12;
      if (self->_hidesOverlayEffects) {
        double v10 = 0.0;
      }
      BOOL v6 = [v9 effectCompositingColor:v4 withMode:24 alpha:v10];
      v18 = v6;
      v7 = &v18;
      goto LABEL_15;
    case 3:
      v11 = (void *)MEMORY[0x1E4FB1EF8];
      id v4 = [MEMORY[0x1E4FB1618] blackColor];
      double v12 = 0.68;
      if (self->_hidesOverlayEffects) {
        double v12 = 0.0;
      }
      BOOL v6 = [v11 effectCompositingColor:v4 withMode:23 alpha:v12];
      v17 = v6;
      v7 = &v17;
      goto LABEL_15;
    case 4:
      v13 = (void *)MEMORY[0x1E4FB1EF8];
      id v4 = [MEMORY[0x1E4FB1618] blackColor];
      double v14 = 0.3;
      if (self->_hidesOverlayEffects) {
        double v14 = 0.0;
      }
      BOOL v6 = [v13 effectCompositingColor:v4 withMode:23 alpha:v14];
      v16 = v6;
      v7 = &v16;
LABEL_15:
      objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

      break;
    default:
      objc_super v8 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }

  return v8;
}

+ (BOOL)backdropIsDarkForStyle:(int64_t)a3
{
  if (a3 == 3) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SFCapsuleNavigationBarTheme;
  return objc_msgSendSuper2(&v6, sel_backdropIsDarkForStyle_);
}

+ (id)backdropEffectForStyle:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v3 = [MEMORY[0x1E4FB14C8] effectWithStyle:20];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___SFCapsuleNavigationBarTheme;
    uint64_t v3 = objc_msgSendSuper2(&v5, sel_backdropEffectForStyle_);
  }

  return v3;
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)titleTheme
{
  return (SFUnifiedTabBarItemTitleContainerViewTheme *)[(SFCapsuleNavigationBarTheme *)self _titleThemeIsMinimized:0];
}

- (id)_titleThemeIsMinimized:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = _SFIsPrivateTintStyle([(_SFBarTheme *)self tintStyle]);
  objc_super v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  uint64_t v7 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v8 = v7;
  if (v5 && !v3)
  {
    uint64_t v9 = [v7 resolvedColorWithTraitCollection:v6];

    uint64_t v8 = (void *)v9;
  }
  double v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  if (v5 & v3)
  {
    v11 = 0;
  }
  else
  {
    v11 = [(_SFBarTheme *)self controlsTintColor];
  }
  double v12 = [SFUnifiedTabBarItemTitleContainerViewTheme alloc];
  v13 = [(_SFBarTheme *)self preferredBarTintColor];
  double v14 = [(SFUnifiedTabBarItemTitleContainerViewTheme *)v12 initWithPrimaryTextColor:v8 secondaryTextColor:v10 placeholderTextColor:v10 overrideTintColor:v11 themeColor:v13];

  return v14;
}

- (void)setBackgroundTheme:(id)a3
{
}

- (void)setHidesOverlayEffects:(BOOL)a3
{
  self->_hidesOverlayEffects = a3;
}

- (void).cxx_destruct
{
}

- (SFUnifiedTabBarItemTitleContainerViewTheme)tabTitleTheme
{
  return (SFUnifiedTabBarItemTitleContainerViewTheme *)[(SFCapsuleNavigationBarTheme *)self _titleThemeIsMinimized:1];
}

- (BOOL)hidesOverlayEffects
{
  return self->_hidesOverlayEffects;
}

@end