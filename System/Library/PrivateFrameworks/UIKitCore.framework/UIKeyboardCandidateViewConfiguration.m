@interface UIKeyboardCandidateViewConfiguration
+ (double)fontSizeMultiplierForCurrentLanguage;
+ (double)lineHeightMultiplierForCurrentLanguage;
+ (id)configuration;
- (BOOL)allowsPullDownGesture;
- (BOOL)darkKeyboard;
- (BOOL)shouldAlwaysShowSortControl;
- (BOOL)shouldAnimateStateTransition;
- (BOOL)shouldResizeKeyboardBackdrop;
- (BOOL)shouldUsePredictionViewSecureRenderTraits;
- (BOOL)willCoverKeyboardLayout;
- (CGSize)preferredInlineFloatingViewSize;
- (UIColor)highlightedBackgroundColor;
- (double)candidateDefaultFontSize;
- (id)candidateFontWithSize:(double)a3;
- (id)candidateFontWithSize:(double)a3 language:(id)a4;
- (id)extendedScrolledState;
- (id)extendedState;
- (id)initialState;
- (int)inlineFloatingViewAdjustMode;
- (unint64_t)maxNumberOfProactiveCandidates;
- (unint64_t)rowsToExtend;
- (void)setDarkKeyboard:(BOOL)a3;
@end

@implementation UIKeyboardCandidateViewConfiguration

+ (id)configuration
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)initialState
{
  v3 = objc_alloc_init(UIKeyboardCandidateViewState);
  v4 = +[UIKeyboardCandidateViewStyle styleForDarkKeyboard:[(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]];
  [(UIKeyboardCandidateViewState *)v3 setStyle:v4];

  v5 = +[UIKeyboardCandidateViewStyle disambiguationStyleForDarkKeyboard:[(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]];
  [(UIKeyboardCandidateViewState *)v3 setDisambiguationStyle:v5];

  [(UIKeyboardCandidateViewState *)v3 setPrimaryGridRowType:0];
  [(UIKeyboardCandidateViewState *)v3 setHasBackdrop:0];
  [(UIKeyboardCandidateViewConfiguration *)self candidateDefaultFontSize];
  v6 = -[UIKeyboardCandidateViewConfiguration candidateFontWithSize:](self, "candidateFontWithSize:");
  v7 = [(UIKeyboardCandidateViewState *)v3 style];
  [v7 setCandidateFont:v6];

  v8 = [(UIKeyboardCandidateViewState *)v3 style];
  v9 = [v8 candidateFont];
  CTFontRef CopyWithSymbolicTraits = CTFontCreateCopyWithSymbolicTraits(v9, 0.0, 0, 2u, 2u);
  v11 = [(UIKeyboardCandidateViewState *)v3 style];
  [v11 setSupplementalLexiconCandidateFont:CopyWithSymbolicTraits];

  v12 = [(UIKeyboardCandidateViewState *)v3 style];
  [v12 setMaxNumberOfProactiveCells:2];

  return v3;
}

- (id)extendedState
{
  return 0;
}

- (id)extendedScrolledState
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (unint64_t)maxNumberOfProactiveCandidates
{
  return 2;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (BOOL)shouldAnimateStateTransition
{
  return 1;
}

- (id)candidateFontWithSize:(double)a3
{
  v5 = +[UIKeyboardInputModeController sharedInputModeController];
  v6 = [v5 currentInputMode];
  v7 = [v6 primaryLanguage];

  v8 = [(UIKeyboardCandidateViewConfiguration *)self candidateFontWithSize:v7 language:a3];

  return v8;
}

- (id)candidateFontWithSize:(double)a3 language:(id)a4
{
  v5 = (void *)UIApp;
  v6 = (__CFString *)a4;
  v7 = [v5 preferredContentSizeCategory];
  double v8 = 0.0;
  if (([v7 isEqualToString:@"UICTContentSizeCategoryL"] & 1) == 0)
  {
    double v8 = 2.0;
    if (([v7 isEqualToString:@"UICTContentSizeCategoryXL"] & 1) == 0)
    {
      double v8 = 4.0;
      if (([v7 isEqualToString:@"UICTContentSizeCategoryXXL"] & 1) == 0)
      {
        if (([v7 isEqualToString:@"UICTContentSizeCategoryXXXL"] & 1) != 0
          || (double v8 = 0.0, _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v7, v9)))
        {
          double v8 = 6.0;
        }
      }
    }
  }
  [(id)objc_opt_class() fontSizeMultiplierForCurrentLanguage];
  if (v10 >= 1.0)
  {
    double v12 = v8 + a3;
  }
  else
  {
    float v11 = v10 * a3;
    double v12 = ceilf(v11);
  }
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, v12, v6);

  return UIFontForLanguage;
}

- (double)candidateDefaultFontSize
{
  return 20.0;
}

+ (double)lineHeightMultiplierForCurrentLanguage
{
  id v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v4 = [v3 currentInputMode];
  v5 = [(id)v4 primaryLanguage];
  v6 = [v2 localeWithLocaleIdentifier:v5];

  v7 = [v6 languageCode];
  LOBYTE(v4) = [&unk_1ED3EFDA0 containsObject:v7];

  if (v4)
  {
    double v8 = 1.18;
  }
  else
  {
    v9 = [v6 languageCode];
    int v10 = [&unk_1ED3EFDB8 containsObject:v9];

    if (v10) {
      double v8 = 1.27;
    }
    else {
      double v8 = 1.0;
    }
  }

  return v8;
}

+ (double)fontSizeMultiplierForCurrentLanguage
{
  id v2 = (void *)MEMORY[0x1E4F1CA20];
  v3 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v4 = [v3 currentInputMode];
  v5 = [v4 primaryLanguage];
  v6 = [v2 localeWithLocaleIdentifier:v5];

  v7 = [v6 languageCode];
  LODWORD(v4) = [&unk_1ED3EFDD0 containsObject:v7];

  if (v4) {
    double v8 = 0.9;
  }
  else {
    double v8 = 1.0;
  }

  return v8;
}

- (BOOL)willCoverKeyboardLayout
{
  return 0;
}

- (BOOL)allowsPullDownGesture
{
  return 0;
}

- (CGSize)preferredInlineFloatingViewSize
{
  double v2 = 588.0;
  double v3 = 41.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIColor)highlightedBackgroundColor
{
  if ([(UIKeyboardCandidateViewConfiguration *)self darkKeyboard]) {
    +[UIColor secondarySystemFillColor];
  }
  else {
  double v2 = +[UIColor colorWithCGColor:UIKBGetNamedColor(@"UIKBLightCandidateBarCellPressedBackgroundUseKeyboardBackground")];
  }
  return (UIColor *)v2;
}

- (int)inlineFloatingViewAdjustMode
{
  return 0;
}

- (BOOL)darkKeyboard
{
  return self->_darkKeyboard;
}

- (void)setDarkKeyboard:(BOOL)a3
{
  self->_darkKeyboard = a3;
}

- (BOOL)shouldAlwaysShowSortControl
{
  return self->_shouldAlwaysShowSortControl;
}

- (BOOL)shouldUsePredictionViewSecureRenderTraits
{
  return self->_shouldUsePredictionViewSecureRenderTraits;
}

@end