@interface UIKBRenderFactory_Monolith
- (BOOL)forceVariantsInsideKeyplane;
- (CGPoint)_secondaryTextOffsetForKey:(id)a3;
- (CGPoint)_textOffsetForKey:(id)a3;
- (CGSize)letterKeyFocusIncreaseSize;
- (double)controlKeyFontSize;
- (double)controlKeyFontWeight;
- (double)controlKeyRectCornerRadius;
- (double)keyRectCornerRadius;
- (double)letterKeyFontSize;
- (double)letterKeyFontWeight;
- (double)letterKeySecondaryFontSize;
- (double)letterKeyTwoLineFontSize;
- (double)letterKeyTwoLineFontWeight;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)shadowVerticalOffset;
- (double)tldKeyFontSize;
- (double)tldKeyFontWeight;
- (double)variantKeyFocusIncrease;
- (double)variantKeyFocusRectRadius;
- (double)variantKeyHeight;
- (double)variantKeyWidth;
- (double)variantPlatterCornerRadius;
- (id)_activeTraitsForControlKey:(id)a3;
- (id)_activeTraitsForKey:(id)a3;
- (id)_activeTraitsForLetterKey:(id)a3;
- (id)_disabledTraitsForControlKey:(id)a3;
- (id)_disabledTraitsForKey:(id)a3;
- (id)_disabledTraitsForLetterKey:(id)a3;
- (id)_enabledTraitsForControlKey:(id)a3;
- (id)_enabledTraitsForKey:(id)a3;
- (id)_enabledTraitsForLetterKey:(id)a3;
- (id)_highlightedTraitsForControlKey:(id)a3;
- (id)_highlightedTraitsForKey:(id)a3;
- (id)_highlightedTraitsForLetterKey:(id)a3;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)_variantTraitsForLetterKey:(id)a3 onKeyplane:(id)a4;
- (id)activeTextColor;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)disabledTextColor;
- (id)displayContentsForKey:(id)a3;
- (id)enabledTextColor;
- (id)highlightedTextColor;
- (id)highlightedVariantBackgroundColor;
- (id)keyplaneSwitcherBackgroundColor;
- (id)keyplaneSwitcherDividerColor;
- (id)shadowColorString;
- (id)variantPlatterBackgroundColor;
- (int64_t)assetIdiom;
- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4;
- (void)configureGeometry:(id)a3 forControlKey:(id)a4;
- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4;
- (void)configureSymbolStyles:(id)a3 forLetterKey:(id)a4;
@end

@implementation UIKBRenderFactory_Monolith

- (int64_t)assetIdiom
{
  return 2;
}

- (id)displayContentsForKey:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactory_Monolith;
  v5 = [(UIKBRenderFactory *)&v12 displayContentsForKey:v4];
  if ([v4 interactionType] == 4)
  {
    [v5 setDisplayPathType:2];
    v6 = @"delete.left.fill";
LABEL_3:
    [v5 setDisplayStringImage:v6];
    goto LABEL_12;
  }
  if ([v4 interactionType] == 9
    && ([v4 localizationKey], v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    [v5 setDisplayStringImage:0];
    v8 = [v4 displayString];
    [v5 setDisplayString:v8];
  }
  else if ([v4 interactionType] == 10 {
         && ([v4 displayString],
  }
             v9 = objc_claimAutoreleasedReturnValue(),
             int v10 = [v9 isEqualToString:@"shift-symbol"],
             v9,
             v10))
  {
    [v5 setDisplayPathType:1];
    [v5 setDisplayStringImage:@"shift"];
    [v5 setDisplayString:0];
  }
  else if ([v4 interactionType] == 43)
  {
    [v5 setDisplayString:0];
    v6 = @"chevron.down";
    goto LABEL_3;
  }
LABEL_12:
  if ([v4 state] == 16) {
    [v5 setDisplayString:0];
  }

  return v5;
}

- (id)enabledTextColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  v3 = _labelColorSecondary([v2 lightKeyboard]);

  return v3;
}

- (id)activeTextColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  id v4 = UIKBColorBlack;
  if (!v3) {
    id v4 = UIKBColorWhite;
  }
  v5 = *v4;

  return v5;
}

- (id)highlightedTextColor
{
  return @"UIKBColorBlack";
}

- (id)disabledTextColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  id v4 = UIKBColorBlack_Alpha30;
  if (!v3) {
    id v4 = UIKBColorWhite_Alpha30;
  }
  v5 = *v4;

  return v5;
}

- (id)keyplaneSwitcherDividerColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  int v4 = _AXDarkenSystemColors();
  v5 = UIKBColorBlack_Alpha60;
  if (!v4) {
    v5 = UIKBColorBlack_Alpha40;
  }
  v6 = UIKBColorWhite_Alpha75;
  if (!v4) {
    v6 = UIKBColorWhite_Alpha30;
  }
  if (!v3) {
    v5 = v6;
  }
  v7 = *v5;

  return v7;
}

- (id)keyplaneSwitcherBackgroundColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  int v4 = UIKBColorBlack_Alpha20;
  if (!v3) {
    int v4 = UIKBColorWhite_Alpha20;
  }
  v5 = *v4;

  return v5;
}

- (id)variantPlatterBackgroundColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  int v4 = UIKBColorKeyPopupSolidLightBackground;
  if (!v3) {
    int v4 = UIKBColorKeyPopupSolidDarkBackground;
  }
  v5 = *v4;

  return v5;
}

- (id)highlightedVariantBackgroundColor
{
  return @"UIKBColorWhite_Alpha90";
}

- (double)letterKeyFontSize
{
  return 48.0;
}

- (double)letterKeySecondaryFontSize
{
  return 26.0;
}

- (double)letterKeyFontWeight
{
  BOOL v2 = [(UIKBRenderFactory *)self boldTextEnabled];
  int v3 = (double *)off_1E52D6BD8;
  if (!v2) {
    int v3 = (double *)off_1E52D6BF8;
  }
  return *v3;
}

- (double)letterKeyTwoLineFontSize
{
  return 24.0;
}

- (double)letterKeyTwoLineFontWeight
{
  BOOL v2 = [(UIKBRenderFactory *)self boldTextEnabled];
  int v3 = (double *)off_1E52D6BD8;
  if (!v2) {
    int v3 = (double *)off_1E52D6C00;
  }
  return *v3;
}

- (double)controlKeyFontSize
{
  return 29.0;
}

- (double)controlKeyFontWeight
{
  BOOL v2 = [(UIKBRenderFactory *)self boldTextEnabled];
  int v3 = (double *)off_1E52D6BD8;
  if (!v2) {
    int v3 = (double *)off_1E52D6BF0;
  }
  return *v3;
}

- (double)controlKeyRectCornerRadius
{
  return 7.0;
}

- (double)tldKeyFontSize
{
  return 29.0;
}

- (double)tldKeyFontWeight
{
  BOOL v2 = [(UIKBRenderFactory *)self boldTextEnabled];
  int v3 = (double *)off_1E52D6BD8;
  if (!v2) {
    int v3 = (double *)off_1E52D6BF0;
  }
  return *v3;
}

- (CGSize)letterKeyFocusIncreaseSize
{
  double v2 = 12.0;
  double v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)keyRectCornerRadius
{
  return 12.0;
}

- (double)shadowVerticalOffset
{
  return 10.0;
}

- (double)shadowRadius
{
  return 10.0;
}

- (double)shadowOpacity
{
  return 0.15;
}

- (id)shadowColorString
{
  return @"UIKBColorBlack_Alpha15";
}

- (double)variantPlatterCornerRadius
{
  return 8.0;
}

- (double)variantKeyWidth
{
  return 54.0;
}

- (double)variantKeyHeight
{
  return 64.0;
}

- (double)variantKeyFocusIncrease
{
  return 1.0;
}

- (double)variantKeyFocusRectRadius
{
  return 8.0;
}

- (BOOL)forceVariantsInsideKeyplane
{
  return 0;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKBRenderFactory_Monolith;
  double v3 = [(UIKBRenderFactory *)&v5 backgroundTraitsForKeyplane:a3];
  return v3;
}

- (CGPoint)_textOffsetForKey:(id)a3
{
  id v3 = a3;
  int v4 = [v3 interactionType];
  double v5 = 0.0;
  if (v4 > 14)
  {
    double v11 = 1.0;
    if (v4 == 15 || v4 == 23) {
      goto LABEL_15;
    }
  }
  else
  {
    if ((v4 - 1) < 2)
    {
      if (qword_1EB261928 != -1) {
        dispatch_once(&qword_1EB261928, &__block_literal_global_328);
      }
      v6 = [v3 displayString];
      [v6 rangeOfCharacterFromSet:_MergedGlobals_1122];
      uint64_t v8 = v7;

      v9 = [v3 displayString];
      uint64_t v10 = [v9 length];

      if (v8 == v10) {
        double v11 = 1.0;
      }
      else {
        double v11 = 4.0;
      }
      goto LABEL_15;
    }
    if (v4 == 10)
    {
      double v11 = 2.0;
      if ([v3 displayType] != 4) {
        goto LABEL_15;
      }
    }
  }
  double v11 = 8.0;
  if ([v3 displayType] != 31)
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
LABEL_15:

  double v12 = v5;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)_secondaryTextOffsetForKey:(id)a3
{
  id v3 = a3;
  if ([v3 displayType] == 34)
  {
    double v4 = 26.0;
    double v5 = 15.0;
  }
  else if ([v3 displayType] == 31)
  {
    double v4 = -7.0;
    double v5 = 8.0;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v6 = v5;
  double v7 = v4;
  result.y = v7;
  result.x = v6;
  return result;
}

- (id)_enabledTraitsForKey:(id)a3
{
  double v4 = [a3 shape];
  double v5 = +[UIKBRenderGeometry geometryWithShape:v4];

  double v6 = +[UIKBRenderTraits traitsWithGeometry:v5];
  double v7 = [(UIKBRenderFactory_Monolith *)self enabledTextColor];
  uint64_t v8 = +[UIKBTextStyle styleWithTextColor:v7];
  [v6 setSymbolStyle:v8];

  v9 = [v6 symbolStyle];
  [v9 setFontName:@"UIKBRenderFactorySystemFontName"];

  uint64_t v10 = [(UIKBRenderFactory_Monolith *)self enabledTextColor];
  double v11 = [v6 symbolStyle];
  [v11 setTextColor:v10];

  [(UIKBRenderFactory_Monolith *)self keyRectCornerRadius];
  double v13 = v12;
  v14 = [v6 geometry];
  [v14 setRoundRectRadius:v13];

  v15 = [v6 geometry];
  [v15 setRoundRectCorners:-1];

  return v6;
}

- (id)_highlightedTraitsForKey:(id)a3
{
  double v4 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForKey:a3];
  double v5 = [v4 symbolStyle];
  [v5 setFontName:@"UIKBRenderFactorySystemFontName"];

  double v6 = [(UIKBRenderFactory_Monolith *)self highlightedTextColor];
  double v7 = [v4 symbolStyle];
  [v7 setTextColor:v6];

  [v4 setBlurBlending:1];
  [(UIKBRenderFactory_Monolith *)self keyRectCornerRadius];
  objc_msgSend(v4, "setFloatingContentViewCornerRadius:");
  [(UIKBRenderFactory_Monolith *)self letterKeyFocusIncreaseSize];
  objc_msgSend(v4, "setFloatingContentViewFocusedIncreaseSize:");
  [(UIKBRenderFactory_Monolith *)self shadowVerticalOffset];
  objc_msgSend(v4, "setFloatingContentViewShadowVerticalOffset:");
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  objc_msgSend(v4, "setFloatingContentViewShadowRadius:");
  [(UIKBRenderFactory_Monolith *)self shadowOpacity];
  objc_msgSend(v4, "setFloatingContentViewShadowOpacity:");
  return v4;
}

- (id)_activeTraitsForKey:(id)a3
{
  double v4 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForKey:a3];
  double v5 = [(UIKBRenderFactory_Monolith *)self activeTextColor];
  double v6 = [v4 symbolStyle];
  [v6 setTextColor:v5];

  return v4;
}

- (id)_disabledTraitsForKey:(id)a3
{
  double v4 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForKey:a3];
  double v5 = [(UIKBRenderFactory_Monolith *)self disabledTextColor];
  double v6 = [v4 symbolStyle];
  [v6 setTextColor:v5];

  return v4;
}

- (void)configureSymbolStyles:(id)a3 forLetterKey:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 symbolStyle];
  if ([v7 displayType] == 34)
  {
    [(UIKBRenderFactory_Monolith *)self letterKeyFontWeight];
    objc_msgSend(v8, "setFontWeight:");
    [(UIKBRenderFactory_Monolith *)self letterKeyFontSize];
    objc_msgSend(v8, "setFontSize:");
    [(UIKBRenderFactory_Monolith *)self _textOffsetForKey:v7];
    objc_msgSend(v8, "setTextOffset:");
    v9 = (void *)[v8 copy];
    [(UIKBRenderFactory_Monolith *)self letterKeySecondaryFontSize];
    objc_msgSend(v9, "setFontSize:");
    [(UIKBRenderFactory_Monolith *)self _secondaryTextOffsetForKey:v7];
    objc_msgSend(v9, "setTextOffset:");
    v14[0] = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    double v11 = (void **)v14;
LABEL_5:
    double v12 = [v10 arrayWithObjects:v11 count:1];
    [v6 setSecondarySymbolStyles:v12];

    goto LABEL_10;
  }
  if ([v7 displayType] == 31)
  {
    [(UIKBRenderFactory_Monolith *)self letterKeyTwoLineFontWeight];
    objc_msgSend(v8, "setFontWeight:");
    [(UIKBRenderFactory_Monolith *)self letterKeyTwoLineFontSize];
    objc_msgSend(v8, "setFontSize:");
    [(UIKBRenderFactory_Monolith *)self _textOffsetForKey:v7];
    objc_msgSend(v8, "setTextOffset:");
    v9 = (void *)[v8 copy];
    [(UIKBRenderFactory_Monolith *)self letterKeyTwoLineFontSize];
    objc_msgSend(v9, "setFontSize:");
    [(UIKBRenderFactory_Monolith *)self _secondaryTextOffsetForKey:v7];
    objc_msgSend(v9, "setTextOffset:");
    double v13 = v9;
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    double v11 = &v13;
    goto LABEL_5;
  }
  if ([v7 displayType] == 27)
  {
    [(UIKBRenderFactory_Monolith *)self tldKeyFontWeight];
    objc_msgSend(v8, "setFontWeight:");
    [(UIKBRenderFactory_Monolith *)self tldKeyFontSize];
  }
  else
  {
    [(UIKBRenderFactory_Monolith *)self letterKeyFontWeight];
    objc_msgSend(v8, "setFontWeight:");
    [(UIKBRenderFactory_Monolith *)self letterKeyFontSize];
  }
  objc_msgSend(v8, "setFontSize:");
  [(UIKBRenderFactory_Monolith *)self _textOffsetForKey:v7];
  objc_msgSend(v8, "setTextOffset:");
LABEL_10:
}

- (id)_enabledTraitsForLetterKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForKey:v4];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyles:v5 forLetterKey:v4];

  return v5;
}

- (id)_highlightedTraitsForLetterKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _highlightedTraitsForKey:v4];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyles:v5 forLetterKey:v4];

  return v5;
}

- (id)_activeTraitsForLetterKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _activeTraitsForKey:v4];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyles:v5 forLetterKey:v4];

  return v5;
}

- (id)_disabledTraitsForLetterKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _disabledTraitsForKey:v4];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyles:v5 forLetterKey:v4];

  return v5;
}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  int v7 = [v6 interactionType];
  if (v7 == 10)
  {
    uint64_t v8 = [v6 displayString];
    int v9 = [v8 isEqualToString:@"shift-symbol"];

    if (v9)
    {
      [(UIKBRenderFactory *)self scale];
      BOOL v11 = v10 == 2.0;
      double v12 = 0.0;
      if (!v11) {
        double v12 = *MEMORY[0x1E4F1DAD8];
      }
      double v13 = -0.5;
      if (!v11) {
        double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      objc_msgSend(v14, "setTextOffset:", v12, v13, *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
  else if (v7 == 4)
  {
    [(UIKBRenderFactory_Monolith *)self controlKeyFontWeight];
    objc_msgSend(v14, "setFontWeight:");
    [(UIKBRenderFactory_Monolith *)self deleteKeyFontSize];
    objc_msgSend(v14, "setFontSize:");
    [(UIKBRenderFactory_Monolith *)self _textOffsetForKey:v6];
    objc_msgSend(v14, "setTextOffset:");
    [v14 setUsesSymbolImage:1];
    [v14 setSymbolScale:1];
    goto LABEL_11;
  }
  [(UIKBRenderFactory_Monolith *)self controlKeyFontWeight];
  objc_msgSend(v14, "setFontWeight:");
  [(UIKBRenderFactory_Monolith *)self controlKeyFontSize];
  objc_msgSend(v14, "setFontSize:");
  [(UIKBRenderFactory_Monolith *)self _textOffsetForKey:v6];
  objc_msgSend(v14, "setTextOffset:");
  [v14 setUsesSymbolImage:1];
LABEL_11:
}

- (void)configureCornersOnGeometry:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 intForProperty:@"popup-bias"];
  switch(v7)
  {
    case 2:
      uint64_t v8 = 0;
      goto LABEL_7;
    case 21:
      uint64_t v8 = 5;
      goto LABEL_7;
    case 29:
      uint64_t v8 = 10;
LABEL_7:
      [v9 setRoundRectCorners:v8];
      break;
  }
  if ([v6 interactionType] == 10 || objc_msgSend(v6, "interactionType") == 9)
  {
    [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
    objc_msgSend(v9, "setRoundRectRadius:");
  }
}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  id v7 = a3;
  [v7 symbolFrame];
  objc_msgSend(v7, "setSymbolFrame:", v4 + 12.0, v6 + 0.0, v5 + -24.0);
}

- (id)_enabledTraitsForControlKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForKey:v4];
  double v6 = [v5 geometry];
  [(UIKBRenderFactory_Monolith *)self configureGeometry:v6 forControlKey:v4];

  id v7 = [(UIKBRenderFactory_Monolith *)self keyplaneSwitcherBackgroundColor];
  uint64_t v8 = +[UIKBGradient gradientWithFlatColor:v7];
  [v5 setBackgroundGradient:v8];

  id v9 = [(UIKBRenderFactory_Monolith *)self enabledTextColor];
  double v10 = [v5 symbolStyle];
  [v10 setTextColor:v9];

  if ([v4 interactionType] - 9 >= 2) {
    BOOL v11 = &unk_1ED3F0178;
  }
  else {
    BOOL v11 = &unk_1ED3F0160;
  }
  [v5 setRenderFlags:v11];
  int v12 = [v4 intForProperty:@"popup-bias"];
  if (v12 == 29 || v12 == 2)
  {
    id v14 = [(UIKBRenderFactory_Monolith *)self keyplaneSwitcherDividerColor];
    v15 = +[UIKBEdgeEffect effectWithColor:v14 edges:2 inset:0.0 weight:1.0];

    [v5 addRenderEffect:v15];
  }
  v16 = [v5 geometry];
  [(UIKBRenderFactory_Monolith *)self configureCornersOnGeometry:v16 forKey:v4];

  v17 = [v5 symbolStyle];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyle:v17 forControlKey:v4];

  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKBRenderFactory_Monolith *)self _highlightedTraitsForKey:v4];
  double v6 = [v5 geometry];
  [(UIKBRenderFactory_Monolith *)self configureGeometry:v6 forControlKey:v4];

  id v7 = [v5 symbolStyle];
  [(UIKBRenderFactory_Monolith *)self configureSymbolStyle:v7 forControlKey:v4];

  return v5;
}

- (id)_activeTraitsForControlKey:(id)a3
{
  id v4 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForControlKey:a3];
  double v5 = [(UIKBRenderFactory_Monolith *)self activeTextColor];
  double v6 = [v4 symbolStyle];
  [v6 setTextColor:v5];

  return v4;
}

- (id)_disabledTraitsForControlKey:(id)a3
{
  id v4 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForControlKey:a3];
  double v5 = [(UIKBRenderFactory_Monolith *)self disabledTextColor];
  double v6 = [v4 symbolStyle];
  [v6 setTextColor:v5];

  return v4;
}

- (id)_variantTraitsForLetterKey:(id)a3 onKeyplane:(id)a4
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 paddedFrame];
  double v126 = v8;
  double v121 = v10;
  double v122 = v9;
  double v12 = v11;
  double v13 = [v6 subtrees];
  uint64_t v14 = [v13 count];

  v15 = +[UIKeyboardInputModeController sharedInputModeController];
  v16 = [v15 currentInputMode];
  int v17 = [v16 isDefaultRightToLeft];

  v18 = [v6 subtrees];
  uint64_t v19 = [v18 indexOfObjectPassingTest:&__block_literal_global_63_2];

  v20 = [v6 shape];
  v21 = +[UIKBRenderGeometry geometryWithShape:v20];

  [(UIKBRenderFactory_Monolith *)self variantKeyWidth];
  double v23 = v22;
  [(UIKBRenderFactory_Monolith *)self variantKeyFocusIncrease];
  double v25 = v23 + v24 + v24;
  [(UIKBRenderFactory_Monolith *)self variantKeyHeight];
  double v27 = v26;
  [(UIKBRenderFactory_Monolith *)self variantKeyFocusIncrease];
  double v29 = v27 + v28 + v28;
  [v6 paddedFrame];
  double v31 = (v30 - v25) * 0.5;
  [v6 paddedFrame];
  double v33 = (v32 - v29) * 0.5;
  [v21 paddedFrame];
  objc_msgSend(v21, "setPaddedFrame:", v34 + v31, v36 + v33, v35 - (v31 + v31), v37 - (v33 + v33));
  double v38 = 0.0;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v39 = 0;
  }
  else {
    uint64_t v39 = -1;
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(UIKBRenderFactory_Monolith *)self variantKeyWidth];
    double v38 = -v40;
  }
  [(UIKBRenderFactory_Monolith *)self variantKeyWidth];
  double v42 = -(v41 * (double)(v14 + v39 - 1));
  [v21 paddedFrame];
  if (v17) {
    double v46 = v42;
  }
  else {
    double v46 = v38;
  }
  objc_msgSend(v21, "setPaddedFrame:", v46 + v43, v44 + 0.0, v45 - (v38 + v42));
  [v21 paddedFrame];
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  double v56 = v55;
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  double v58 = v57;
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  double v60 = v59;
  [(UIKBRenderFactory_Monolith *)self shadowVerticalOffset];
  double v62 = -(v60 + v61);
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  objc_msgSend(v21, "setDisplayFrame:", v48 - v63, v50 - v56, v52 - (-v63 - v58), v54 - (v62 - v56));
  [(UIKBRenderFactory_Monolith *)self variantPlatterCornerRadius];
  objc_msgSend(v21, "setRoundRectRadius:");
  [v21 setRoundRectCorners:-1];
  if ([(UIKBRenderFactory_Monolith *)self forceVariantsInsideKeyplane])
  {
    if (v17)
    {
      [v7 frame];
      double MinX = CGRectGetMinX(v136);
      [v21 displayFrame];
      double v65 = MinX - CGRectGetMinX(v137);
      if (v65 <= 0.0) {
        goto LABEL_16;
      }
      double v126 = v126 + v65;
      double v66 = -v65;
    }
    else
    {
      [v21 displayFrame];
      double MaxX = CGRectGetMaxX(v138);
      [v7 frame];
      double v66 = MaxX - CGRectGetMaxX(v139);
      if (v66 <= 0.0) {
        goto LABEL_16;
      }
      double v126 = v126 - v66;
      double v65 = -v66;
    }
    objc_msgSend(v21, "applyInsets:", 0.0, v65, 0.0, v66);
  }
LABEL_16:
  v124 = v7;
  v68 = +[UIKBRenderTraits traitsWithGeometry:v21];
  v69 = [(UIKBRenderFactory_Monolith *)self variantPlatterBackgroundColor];
  v70 = +[UIKBGradient gradientWithFlatColor:v69];
  [v68 setBackgroundGradient:v70];

  [(UIKBRenderFactory_Monolith *)self shadowVerticalOffset];
  double v72 = v71;
  [(UIKBRenderFactory_Monolith *)self shadowRadius];
  v74 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha25", 0.0, v72, 0.0, 0.0, 0.0, 0.0, v73 offset insets weight];
  v123 = v68;
  [v68 addRenderEffect:v74];

  v75 = [MEMORY[0x1E4F1CA48] array];
  [(UIKBRenderFactory_Monolith *)self variantKeyWidth];
  if (v17) {
    double v76 = -v76;
  }
  double v128 = v76;
  [(UIKBRenderFactory_Monolith *)self variantKeyWidth];
  double v78 = v77;
  [(UIKBRenderFactory_Monolith *)self variantKeyFocusIncrease];
  double v80 = v79;
  [(UIKBRenderFactory_Monolith *)self variantKeyHeight];
  double v82 = v81;
  [(UIKBRenderFactory_Monolith *)self variantKeyFocusIncrease];
  double v84 = v83;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v125 = v6;
  v85 = [v6 subtrees];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v129 objects:v133 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    double v88 = (v12 - v78 - v80) * 0.5;
    double v89 = (v121 - v82 - v84) * 0.5;
    double v127 = v12 - (v88 + v88);
    double v90 = v122 + v89;
    double v91 = v121 - (v89 + v89);
    double v92 = v128;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      double v92 = 0.0;
    }
    double v93 = v126 - v92 + v88;
    uint64_t v94 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v130 != v94) {
          objc_enumerationMutation(v85);
        }
        v96 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        v97 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", v93, v90, v127, v91, v93, v90, v127, v91);
        [(UIKBRenderFactory_Monolith *)self variantPlatterCornerRadius];
        objc_msgSend(v97, "setRoundRectRadius:");
        [v97 setRoundRectCorners:-1];
        [v97 paddedFrame];
        double v99 = v98;
        double v101 = v100;
        double v103 = v102;
        double v105 = v104;
        [(UIKBRenderFactory_Monolith *)self variantKeyFocusIncrease];
        double v107 = v106 + v99;
        double v108 = v103 - v106 - v106;
        double v109 = v106 + v101;
        double v110 = v105 - v106 - v106;
        if ([v96 interactionType] == 2) {
          double v111 = v109 + 3.0;
        }
        else {
          double v111 = v109;
        }
        objc_msgSend(v97, "setSymbolFrame:", v107, v111, v108, v110);
        [v75 addObject:v97];
        double v93 = v128 + v93;
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v129 objects:v133 count:16];
    }
    while (v87);
  }

  [v123 setVariantGeometries:v75];
  [(UIKBRenderFactory_Monolith *)self letterKeyFontSize];
  v112 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", @"UIKBRenderFactorySystemFontName");
  [(UIKBRenderFactory_Monolith *)self letterKeyFontWeight];
  objc_msgSend(v112, "setFontWeight:");
  v113 = [(UIKBRenderFactory_Monolith *)self variantTextColor];
  [v112 setTextColor:v113];

  [v112 setUsesSymbolImage:1];
  [v112 setSymbolScale:1];
  v114 = +[UIKBRenderTraits traitsWithSymbolStyle:v112];
  [v123 setVariantTraits:v114];

  v115 = +[UIKBRenderTraits traitsWithSymbolStyle:v112];
  v116 = [(UIKBRenderFactory_Monolith *)self highlightedVariantTextColor];
  v117 = [v115 symbolStyle];
  [v117 setTextColor:v116];

  v118 = [(UIKBRenderFactory_Monolith *)self highlightedVariantBackgroundColor];
  v119 = +[UIKBGradient gradientWithFlatColor:v118];
  [v115 setLayeredForegroundGradient:v119];

  [v123 setHighlightedVariantTraits:v115];
  return v123;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 interactionType] == 10
    || [v6 interactionType] == 9
    || [v6 interactionType] == 23
    || [v6 interactionType] == 15
    || [v6 interactionType] == 4
    || [v6 interactionType] == 43;
  int v9 = [v6 state];
  double v10 = 0;
  switch(v9)
  {
    case 1:
      if (v8) {
        [(UIKBRenderFactory_Monolith *)self _disabledTraitsForControlKey:v6];
      }
      else {
        [(UIKBRenderFactory_Monolith *)self _disabledTraitsForLetterKey:v6];
      }
      goto LABEL_17;
    case 2:
      if (!v8) {
        goto LABEL_20;
      }
      uint64_t v11 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForControlKey:v6];
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_27;
    case 4:
      if ([v6 interactionType] != 10)
      {
        if (os_variant_has_internal_diagnostics())
        {
          uint64_t v14 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Only keyplane switcher keys can get active key state on tvOS.", buf, 2u);
          }
        }
        else
        {
          double v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_traitsForKey_onKeyplane____s_category) + 8);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Only keyplane switcher keys can get active key state on tvOS.", v15, 2u);
          }
        }
      }
      uint64_t v11 = [(UIKBRenderFactory_Monolith *)self _activeTraitsForControlKey:v6];
      break;
    case 8:
      if (v8) {
        [(UIKBRenderFactory_Monolith *)self _highlightedTraitsForControlKey:v6];
      }
      else {
        [(UIKBRenderFactory_Monolith *)self _highlightedTraitsForLetterKey:v6];
      }
      goto LABEL_17;
    default:
      if (v9 != 20 && v9 != 16) {
        goto LABEL_27;
      }
      if ([v6 interactionType] == 3)
      {
LABEL_20:
        uint64_t v11 = [(UIKBRenderFactory_Monolith *)self _enabledTraitsForLetterKey:v6];
      }
      else
      {
        if (v8) {
          [(UIKBRenderFactory_Monolith *)self _variantTraitsForControlKey:v6 onKeyplane:v7];
        }
        else {
          [(UIKBRenderFactory_Monolith *)self _variantTraitsForLetterKey:v6 onKeyplane:v7];
        }
        uint64_t v11 = LABEL_17:;
      }
      break;
  }
  double v10 = (void *)v11;
LABEL_27:

  return v10;
}

@end