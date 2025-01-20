@interface UITabBarButtonLabel
+ (double)_fontPointSizeForIdiom:(int64_t)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldCeilSizeToViewScale;
- (Class)_appearanceGuideClass;
- (UIColor)unselectedTintColor;
- (UITabBarButton)tabBarButton;
- (UITabBarButtonLabel)initWithFrame:(CGRect)a3;
- (UITabBarButtonLabel)initWithTabBarDisplayStyle:(int64_t)a3;
- (id)_fontForIdiom:(int64_t)a3;
- (id)_fontForIdiom:(int64_t)a3 forTabBarDisplayStyle:(int64_t)a4;
- (id)_mutableAttributedTextExcludingKern;
- (id)_titleTextAttributesForState:(unint64_t)a3;
- (int64_t)_idiomForFontGivenIdiom:(int64_t)a3;
- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4;
- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5;
- (void)_legacyApperance_updateTextColorsForState;
- (void)_setAppearanceGuideClass:(Class)a3;
- (void)_updateForFontChangeWithIdiom:(int64_t)a3;
- (void)resizeToFitWidth:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTabBarButton:(id)a3;
- (void)setUnselectedTintColor:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateTextColorsForState;
@end

@implementation UITabBarButtonLabel

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITabBarButtonLabel;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

uint64_t __53__UITabBarButtonLabel__updateForFontChangeWithIdiom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sizeToFit];
}

- (void)_didChangeFromIdiom:(int64_t)a3 onScreen:(id)a4 traverseHierarchy:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarButtonLabel;
  [(UILabel *)&v7 _didChangeFromIdiom:a3 onScreen:a4 traverseHierarchy:a5];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v6 = [(UIView *)self _screen];
    -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](self, "_updateForFontChangeWithIdiom:", -[UITabBarButtonLabel _idiomForFontGivenIdiom:](self, "_idiomForFontGivenIdiom:", [v6 _userInterfaceIdiom]));
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITabBarButtonLabel;
  [(UILabel *)&v10 traitCollectionDidChange:v4];
  if (dyld_program_sdk_at_least())
  {
    BOOL v5 = [(UIView *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (!self->_hasSeenIdiom || v6 != [v4 userInterfaceIdiom])
    {
      self->_hasSeenIdiom = 1;
      [(UITabBarButtonLabel *)self _updateForFontChangeWithIdiom:[(UITabBarButtonLabel *)self _idiomForFontGivenIdiom:v6]];
    }
  }
  objc_super v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 legibilityWeight];
  uint64_t v9 = [v4 legibilityWeight];

  if (v8 != v9) {
    self->_boundsWidth = 0.0;
  }
}

- (BOOL)_shouldCeilSizeToViewScale
{
  return 1;
}

- (Class)_appearanceGuideClass
{
  return self->_appearanceGuideClass;
}

- (void)setTabBarButton:(id)a3
{
}

- (UITabBarButtonLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITabBarButtonLabel;
  v3 = -[UILabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = +[UIDevice currentDevice];
    BOOL v5 = -[UITabBarButtonLabel _fontForIdiom:](v3, "_fontForIdiom:", [v4 userInterfaceIdiom]);
    [(UILabel *)v3 setFont:v5];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    [(UITabBarButtonLabel *)self updateTextColorsForState];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_isHighlighted != a3)
  {
    self->_isHighlighted = a3;
    [(UITabBarButtonLabel *)self updateTextColorsForState];
  }
}

- (void)_legacyApperance_updateTextColorsForState
{
  p_tabBarButton = &self->_tabBarButton;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  id v4 = [WeakRetained tabBar];
  BOOL v5 = [(UITabBarButtonLabel *)v4 _effectiveUnselectedTabTintColorConsideringView:self];
  int v6 = [WeakRetained isFocused];
  id v7 = objc_loadWeakRetained((id *)p_tabBarButton);
  if ([v7 isDefaultTVLayout])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:8];
    objc_super v10 = [v9 valueForKey:*(void *)off_1E52D2048];
    BOOL v8 = v10 != 0;
  }
  if ([(UITabBarButtonLabel *)v4 _useVibrantItems]) {
    v11 = v4;
  }
  else {
    v11 = self;
  }
  v12 = [(UIView *)v11 tintColor];
  unselectedTintColor = self->_unselectedTintColor;
  if (unselectedTintColor && !self->_isSelected)
  {
    v27 = unselectedTintColor;
    BOOL v28 = 1;
    goto LABEL_47;
  }
  if (self->_isHighlighted && self->_isSelected)
  {
    v14 = [(UIView *)self traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15 == 3)
    {
      v16 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2048 state:5];
      v17 = v16;
      if (v16)
      {
LABEL_33:
        v27 = v16;
LABEL_41:

        BOOL v28 = 0;
        goto LABEL_47;
      }
      uint64_t v36 = [WeakRetained _contentTintColorForState:5];
      v34 = (void *)v36;
      if (v36) {
        v35 = (void *)v36;
      }
      else {
        v35 = v12;
      }
LABEL_40:
      v27 = v35;

      goto LABEL_41;
    }
  }
  if ((v6 & v8) == 1)
  {
    id v18 = objc_loadWeakRetained((id *)p_tabBarButton);
    int v19 = [v18 isDefaultTVLayout];

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)p_tabBarButton);
      v21 = [v20 defaultColorForState:4];
      v22 = v21;
      if (v21)
      {
        id v23 = v21;
      }
      else
      {
        id v23 = [(UIView *)self tintColor];
      }
      id v32 = v23;

      v12 = v32;
    }
    v16 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2048 state:8];
    v17 = v16;
    if (v16) {
      goto LABEL_33;
    }
    uint64_t v33 = [WeakRetained _contentTintColorForState:8];
    v34 = (void *)v33;
    if (v33) {
      v35 = (void *)v33;
    }
    else {
      v35 = v12;
    }
    goto LABEL_40;
  }
  if (self->_isHighlighted)
  {
    v24 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2048 state:1];
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v26 = [WeakRetained _contentTintColorForState:1];
    }
    v27 = v26;
    goto LABEL_28;
  }
  appearanceStorage = self->_appearanceStorage;
  uint64_t v30 = *(void *)off_1E52D2048;
  if (self->_isSelected)
  {
    uint64_t v31 = [(_UIBarItemAppearanceStorage *)appearanceStorage textAttributeForKey:v30 state:4];
    if (v31)
    {
      v27 = (UIColor *)v31;
      BOOL v28 = 1;
    }
    else
    {
      v38 = [WeakRetained _contentTintColorForState:4];
      BOOL v28 = v38 != 0;
      if (!v38)
      {
        v38 = v12;
        v12 = v38;
        BOOL v28 = 0;
      }
      v27 = v38;
    }
  }
  else
  {
    uint64_t v37 = [(_UIBarItemAppearanceStorage *)appearanceStorage textAttributeForKey:v30 state:0];
    BOOL v28 = v37 != 0;
    if (!v37)
    {
      uint64_t v52 = [WeakRetained _defaultUnselectedLabelTintColor];
      if (v52)
      {
        v27 = (UIColor *)v52;
        goto LABEL_29;
      }
      uint64_t v53 = [WeakRetained _contentTintColorForState:0];
      v25 = (void *)v53;
      if (v53) {
        v54 = (void *)v53;
      }
      else {
        v54 = v5;
      }
      v27 = v54;
LABEL_28:

LABEL_29:
      BOOL v28 = 0;
      goto LABEL_47;
    }
    v27 = (UIColor *)v37;
  }
LABEL_47:
  id v39 = objc_loadWeakRetained((id *)p_tabBarButton);
  int v40 = [v39 isDefaultTVLayout];

  if (v40)
  {
    v41 = [(UIView *)v4 traitCollection];
    uint64_t v42 = [v41 userInterfaceStyle];

    if (_AXSEnhanceBackgroundContrastEnabled()) {
      char v43 = 1;
    }
    else {
      char v43 = v6;
    }
    if (v43)
    {
      uint64_t v44 = 0;
      double v45 = 1.0;
    }
    else
    {
      if ([WeakRetained _isSelected])
      {
        uint64_t v44 = 0;
        double v46 = 0.86;
        if (v42 == 2) {
          double v46 = 0.5;
        }
        BOOL v47 = !v28;
      }
      else
      {
        uint64_t v48 = 23;
        if (v42 == 2) {
          uint64_t v48 = 24;
        }
        BOOL v47 = !v28;
        if (v28) {
          uint64_t v44 = 0;
        }
        else {
          uint64_t v44 = v48;
        }
        double v46 = 0.5;
      }
      if (v47) {
        double v45 = v46;
      }
      else {
        double v45 = 1.0;
      }
    }
    [(UIView *)self setCompositingMode:v44];
    [(UIView *)self setAlpha:v45];
  }
  [(UILabel *)self setTextColor:v27];
  v49 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributeForKey:*(void *)off_1E52D2238 state:4 * self->_isSelected];
  v50 = v49;
  if (v49)
  {
    v51 = [v49 shadowColor];
    [(UILabel *)self setShadowColor:v51];

    [v50 shadowOffset];
    -[UILabel setShadowOffset:](self, "setShadowOffset:");
  }
  if (+[UIView _isInAnimationBlock]) {
    [(UIView *)self forceDisplayIfNeeded];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITabBarButtonLabel;
  [(UILabel *)&v3 tintColorDidChange];
  [(UITabBarButtonLabel *)self updateTextColorsForState];
}

- (id)_fontForIdiom:(int64_t)a3 forTabBarDisplayStyle:(int64_t)a4
{
  p_tabBarButton = &self->_tabBarButton;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  uint64_t v9 = [WeakRetained itemAppearanceData];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_tabBarButton);
    uint64_t v11 = [v10 _currentItemState];

    v12 = objc_loadWeakRetained((id *)p_tabBarButton);
    v13 = [v12 titleTextAttributesForState:v11];
    v14 = [v13 objectForKey:*(void *)off_1E52D2040];
  }
  else
  {
    v12 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:0];
    v14 = [v12 objectForKey:*(void *)off_1E52D2040];
  }

  if (v14)
  {
    [v14 pointSize];
    if (v15 == 0.0)
    {
      +[UITabBarButtonLabel _fontPointSizeForIdiom:a3];
      uint64_t v16 = objc_msgSend(v14, "fontWithSize:");

      v14 = (void *)v16;
    }
    goto LABEL_24;
  }
  switch(a3)
  {
    case 8:
      goto LABEL_10;
    case 3:
      id v20 = [(UIView *)self traitCollection];
      v21 = off_1E52D39B8;
      v22 = @"UICTFontTextStyleEmphasizedCaption2";
LABEL_20:
      v14 = [v21 preferredFontForTextStyle:v22 compatibleWithTraitCollection:v20];

      goto LABEL_24;
    case 2:
LABEL_10:
      v14 = [off_1E52D39B8 boldSystemFontOfSize:29.0];
      id v17 = objc_loadWeakRetained((id *)p_tabBarButton);
      id v18 = [v17 tabBar];

      if (v18) {
        a4 = [v18 _displayStyle];
      }
      if (!a4)
      {
        uint64_t v19 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];

        v14 = (void *)v19;
      }

      goto LABEL_24;
  }
  id v23 = objc_loadWeakRetained((id *)p_tabBarButton);
  uint64_t v24 = [v23 layoutStyle];

  if (v24)
  {
    v25 = [(UIView *)self traitCollection];
    id v20 = [v25 _traitCollectionByReplacingObject:@"UICTContentSizeCategoryL" forTraitToken:0x1ED3F5AD8];

    id v26 = objc_loadWeakRetained((id *)p_tabBarButton);
    uint64_t v27 = [v26 layoutStyle];

    v21 = off_1E52D39B8;
    BOOL v28 = &UIFontTextStyleFootnote;
    if (v27 == 2) {
      BOOL v28 = &UIFontTextStyleCaption1;
    }
    v22 = (__CFString *)*v28;
    goto LABEL_20;
  }
  +[UITabBarButtonLabel _fontPointSizeForIdiom:a3];
  double v30 = v29;
  int v31 = dyld_program_sdk_at_least();
  id v32 = (double *)off_1E52D6BF0;
  if (!v31) {
    id v32 = (double *)off_1E52D6BF8;
  }
  v14 = [off_1E52D39B8 systemFontOfSize:v30 weight:*v32];
LABEL_24:
  return v14;
}

- (void)updateTextColorsForState
{
  p_tabBarButton = &self->_tabBarButton;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  uint64_t v5 = [WeakRetained itemAppearanceData];
  if (v5)
  {
    int v6 = (void *)v5;
    id v7 = objc_loadWeakRetained((id *)p_tabBarButton);
    uint64_t v8 = [v7 layoutStyle];

    if (v8 != 3)
    {
      id v18 = [(UILabel *)self text];
      if ([v18 length])
      {
        id v9 = objc_loadWeakRetained((id *)p_tabBarButton);
        uint64_t v10 = [v9 _currentItemState];

        id v11 = objc_loadWeakRetained((id *)p_tabBarButton);
        v12 = [v11 defaultColorForState:v10];
        if (v12)
        {
          [(UILabel *)self setTextColor:v12];
        }
        else
        {
          id v13 = objc_loadWeakRetained((id *)p_tabBarButton);
          v14 = [v13 tintColor];
          [(UILabel *)self setTextColor:v14];
        }
        id v15 = objc_loadWeakRetained((id *)p_tabBarButton);
        uint64_t v16 = [v15 titleTextAttributesForState:v10];

        id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v18 attributes:v16];
        [(UILabel *)self setAttributedText:v17];
      }

      return;
    }
  }
  else
  {
  }
  [(UITabBarButtonLabel *)self _legacyApperance_updateTextColorsForState];
}

+ (double)_fontPointSizeForIdiom:(int64_t)a3
{
  if (a3 == 8 || a3 == 2) {
    return 40.0;
  }
  double result = 10.0;
  if (a3 == 1)
  {
    int v4 = dyld_program_sdk_at_least();
    double result = 14.0;
    if (v4) {
      return 10.0;
    }
  }
  return result;
}

- (void)_updateForFontChangeWithIdiom:(int64_t)a3
{
  int v4 = [(UITabBarButtonLabel *)self _fontForIdiom:a3];
  [(UILabel *)self setFont:v4];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__UITabBarButtonLabel__updateForFontChangeWithIdiom___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  +[UIView performWithoutAnimation:v5];
}

- (id)_fontForIdiom:(int64_t)a3
{
  return [(UITabBarButtonLabel *)self _fontForIdiom:a3 forTabBarDisplayStyle:0];
}

- (void)_setAppearanceGuideClass:(Class)a3
{
}

- (int64_t)_idiomForFontGivenIdiom:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  uint64_t v5 = [WeakRetained tabBar];
  uint64_t v6 = [v5 _tabBarSizing];

  if (v6) {
    return v6 != 1;
  }
  else {
    return a3;
  }
}

- (id)_mutableAttributedTextExcludingKern
{
  if (a1)
  {
    v1 = [a1 attributedText];
    v2 = v1;
    if (v1) {
      id v3 = v1;
    }
    else {
      id v3 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1ED0E84C0];
    }
    int v4 = v3;

    uint64_t v5 = (void *)[v4 mutableCopy];
    objc_msgSend(v5, "removeAttribute:range:", *(void *)off_1E52D20C8, 0, objc_msgSend(v4, "length"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)resizeToFitWidth:(double)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  double v4 = a3 + -2.0;
  double boundsWidth = self->_boundsWidth;
  previousAttributedTextForSizingExcludingKern = self->_previousAttributedTextForSizingExcludingKern;
  id v7 = [(UILabel *)self attributedText];
  if ([v7 length]
    && ([v7 attribute:*(void *)off_1E52D20C8 atIndex:0 effectiveRange:0],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 doubleValue],
        double v10 = v9,
        v8,
        v10 < 0.0))
  {
    id v11 = -[UITabBarButtonLabel _mutableAttributedTextExcludingKern](self);
    int v12 = 1;
  }
  else
  {
    id v11 = (void *)[v7 mutableCopy];
    int v12 = 0;
  }
  BOOL v13 = v4 != boundsWidth || previousAttributedTextForSizingExcludingKern == 0;
  if (v13
    || ![v11 isEqualToAttributedString:self->_previousAttributedTextForSizingExcludingKern])
  {
    if (v4 != boundsWidth) {
      [(UIView *)self sizeToFit];
    }
    self->_double boundsWidth = v4;
    [(UIView *)self frame];
    if (((v22 < v4) & ~v12) != 0)
    {
      previousKernAttributeForSizing = self->_previousKernAttributeForSizing;
      self->_previousKernAttributeForSizing = 0;
    }
    else
    {
      double v39 = v21;
      double v40 = v20;
      double v41 = v19;
      previousKernAttributeForSizing = (NSNumber *)[v7 mutableCopy];
      uint64_t v24 = [(NSNumber *)previousKernAttributeForSizing length];
      uint64_t v25 = *(void *)off_1E52D20C8;
      id v26 = (NSNumber *)&unk_1ED3F1B78;
      -[NSNumber addAttribute:value:range:](previousKernAttributeForSizing, "addAttribute:value:range:", *(void *)off_1E52D20C8, &unk_1ED3F1B78, 0, v24);
      -[NSNumber boundingRectWithSize:options:context:](previousKernAttributeForSizing, "boundingRectWithSize:options:context:", 0, 0, 3.40282347e38, 3.40282347e38);
      double v28 = v27;
      [(UIView *)self _currentScreenScale];
      double v30 = v29;
      if (ceil(v29 * v28) / v29 < v4)
      {
        double v42 = v4;
        double v31 = 0.0;
        double v32 = 1.2;
        do
        {
          uint64_t v33 = v26;
          double v34 = (v32 + v31) * 0.5;
          id v26 = [NSNumber numberWithDouble:-v34];

          -[NSNumber addAttribute:value:range:](previousKernAttributeForSizing, "addAttribute:value:range:", v25, v26, 0, v24);
          -[NSNumber boundingRectWithSize:options:context:](previousKernAttributeForSizing, "boundingRectWithSize:options:context:", 0, 0, 3.40282347e38, 3.40282347e38);
          double v28 = ceil(v30 * v35) / v30;
          if (v28 <= v42)
          {
            if (v28 >= v42) {
              break;
            }
          }
          else
          {
            double v31 = (v32 + v31) * 0.5;
            double v34 = v32;
          }
          double v32 = v34;
        }
        while (v34 - v31 >= 0.01875);
      }
      [(UILabel *)self setAttributedText:previousKernAttributeForSizing];
      -[UILabel setFrame:](self, "setFrame:", v41, v40, v28, v39);
      uint64_t v36 = self->_previousKernAttributeForSizing;
      self->_previousKernAttributeForSizing = v26;
    }
    -[UITabBarButtonLabel _mutableAttributedTextExcludingKern](self);
    uint64_t v37 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v38 = self->_previousAttributedTextForSizingExcludingKern;
    self->_previousAttributedTextForSizingExcludingKern = v37;
  }
  else
  {
    [(NSNumber *)self->_previousKernAttributeForSizing floatValue];
    if (fabsf(v14) >= 2.2204e-16)
    {
      id v15 = self->_previousKernAttributeForSizing;
      uint64_t v43 = *(void *)off_1E52D20C8;
      v44[0] = v15;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      id v17 = v11;
      id v18 = [v16 dictionaryWithObjects:v44 forKeys:&v43 count:1];
      objc_msgSend(v17, "addAttributes:range:", v18, 0, objc_msgSend(v17, "length"));

      [(UILabel *)self setAttributedText:v17];
    }
  }
}

- (UITabBarButtonLabel)initWithTabBarDisplayStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UITabBarButtonLabel;
  double v4 = [(UIView *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[UIDevice currentDevice];
    uint64_t v6 = -[UITabBarButtonLabel _fontForIdiom:forTabBarDisplayStyle:](v4, "_fontForIdiom:forTabBarDisplayStyle:", [v5 userInterfaceIdiom], a3);
    [(UILabel *)v4 setFont:v6];
  }
  return v4;
}

- (void)setUnselectedTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedTintColor, a3);
  [(UITabBarButtonLabel *)self _updateLabelsVibrancy];
  [(UITabBarButtonLabel *)self updateTextColorsForState];
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  appearanceStorage = self->_appearanceStorage;
  if (v6)
  {
    if (!appearanceStorage)
    {
      objc_super v8 = objc_alloc_init(_UITabBarItemAppearanceStorage);
      double v9 = self->_appearanceStorage;
      self->_appearanceStorage = v8;
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  uint64_t v18 = objc_msgSend(v6, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");

  uint64_t v10 = _checkControlStateArgumentAdjustIfNecessary(a4);
  uint64_t v11 = [(_UIBarItemAppearanceStorage *)self->_appearanceStorage textAttributesForState:v10];
  if (v18 | v11)
  {
    if (([(id)v18 isEqualToDictionary:v11] & 1) == 0)
    {
      [(_UIBarItemAppearanceStorage *)self->_appearanceStorage setTextAttributes:v18 forState:v10];
      [(UITabBarButtonLabel *)self updateTextColorsForState];
      [(UILabel *)self setNeedsDisplay];
      if (!v10)
      {
        uint64_t v12 = [(id)v18 objectForKey:*(void *)off_1E52D2040];
        uint64_t v13 = [(UILabel *)self font];
        if (v12 | v13 && ([(id)v12 isEqual:v13] & 1) == 0)
        {
          float v14 = [(UIView *)self _screen];
          -[UITabBarButtonLabel _updateForFontChangeWithIdiom:](self, "_updateForFontChangeWithIdiom:", [v14 _userInterfaceIdiom]);
        }
        [(UITabBarButtonLabel *)self _updateLabelsVibrancy];
        id v15 = [(UIView *)self _screen];
        uint64_t v16 = [v15 _userInterfaceIdiom];

        if (v16 == 3) {
          double v17 = 0.9;
        }
        else {
          double v17 = 0.0;
        }
        [(UILabel *)self setAdjustsFontSizeToFitWidth:v16 == 3];
        [(UILabel *)self setMinimumScaleFactor:v17];
      }
    }
  }
}

- (id)_titleTextAttributesForState:(unint64_t)a3
{
  uint64_t v4 = _checkControlStateArgumentAdjustIfNecessary(a3);
  appearanceStorage = self->_appearanceStorage;
  return [(_UIBarItemAppearanceStorage *)appearanceStorage textAttributesForState:v4];
}

- (void)_applyTabBarButtonAppearanceStorage:(id)a3 withTaggedSelectors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    objc_setAssociatedObject(self, &_UIAppearanceCustomizedSelectorsAssociationKey, v7, (void *)1);
  }
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__UITabBarButtonLabel__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke;
    v8[3] = &unk_1E52DF918;
    v8[4] = self;
    [v6 enumerateTextAttributesWithBlock:v8];
  }
}

uint64_t __79__UITabBarButtonLabel__applyTabBarButtonAppearanceStorage_withTaggedSelectors___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setTitleTextAttributes:a3 forState:a2];
}

- (UIColor)unselectedTintColor
{
  return self->_unselectedTintColor;
}

- (UITabBarButton)tabBarButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBarButton);
  return (UITabBarButton *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBarButton);
  objc_storeStrong((id *)&self->_unselectedTintColor, 0);
  objc_storeStrong((id *)&self->_appearanceGuideClass, 0);
  objc_storeStrong((id *)&self->_previousAttributedTextForSizingExcludingKern, 0);
  objc_storeStrong((id *)&self->_previousKernAttributeForSizing, 0);
  objc_storeStrong((id *)&self->_appearanceStorage, 0);
}

@end