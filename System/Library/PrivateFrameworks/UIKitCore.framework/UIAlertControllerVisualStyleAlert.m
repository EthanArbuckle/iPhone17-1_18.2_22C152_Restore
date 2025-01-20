@interface UIAlertControllerVisualStyleAlert
- (BOOL)placementAvoidsKeyboard;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (double)_marginAroundActionGroup;
- (double)marginAboveMessageLabelFirstBaseline;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (double)marginBelowTitleLabelLastBaseline;
- (double)maximumWidth;
- (double)textFieldHorizontalMargin;
- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4;
- (id)messageLabelFont;
- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (int64_t)permittedActionLayoutDirection;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
@end

@implementation UIAlertControllerVisualStyleAlert

- (id)titleLabelFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleHeadline" addingSymbolicTraits:0 options:2];
  v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)titleLabelColor
{
  return +[UIColor labelColor];
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 36.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 18.0;
}

- (id)messageLabelFont
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  int v4 = [v3 hasTitle];

  if (v4)
  {
    v5 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:0x8000 options:2];
    v6 = [off_1E52D39B8 fontWithDescriptor:v5 size:0.0];
  }
  else
  {
    v6 = [(UIAlertControllerVisualStyleAlert *)self titleLabelFont];
  }
  return v6;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  if (v4) {
    return 20.0;
  }
  [(UIAlertControllerVisualStyleAlert *)self marginAboveTitleLabelFirstBaseline];
  return result;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 24.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 24.0;
}

- (double)_marginAroundActionGroup
{
  return 0.0;
}

- (double)maximumWidth
{
  v2 = [(id)UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (!IsAccessibilityCategory) {
    return 270.0;
  }
  _accessibilityMaximumWidthWhenUsingAccessibilitySizes();
  return result;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 0.0, 8.0, 0.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 15.0;
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  v35[5] = *MEMORY[0x1E4F143B8];
  if (a4 == 3)
  {
    uint64_t v5 = 12;
LABEL_7:
    char v6 = 0;
    double v7 = 7.0;
    goto LABEL_9;
  }
  if (a4 != 2)
  {
    if (a4 == 1) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 15;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 0;
  double v7 = 0.0;
  char v6 = 1;
LABEL_9:
  id v8 = a3;
  v9 = [UIView alloc];
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  id v15 = +[_UIInterfaceActionVibrantBorderView newWithRoundedCornerPosition:v5 continuousCornerRadius:v7];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v14 addSubview:v15];
  v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
  [(UIView *)v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = +[UIColor systemBackgroundColor];
  [(UIView *)v16 setBackgroundColor:v17];

  if ((v6 & 1) == 0)
  {
    [(UIView *)v16 _setContinuousCornerRadius:7.0];
    v18 = [(UIView *)v16 layer];
    [v18 setMaskedCorners:v5];
  }
  [(UIView *)v14 addSubview:v16];
  [(UIView *)v16 addSubview:v8];
  [v8 _currentScreenScale];
  UIRoundToViewScale(v8);
  double v20 = v19;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    double v21 = 0.0;
  }
  else {
    double v21 = v19;
  }
  v22 = _NSDictionaryOfVariableBindings(&cfstr_TextfieldVibra.isa, v8, v15, v16, 0);

  v34[0] = @"textFieldContainerTop";
  v23 = [NSNumber numberWithDouble:v21];
  v35[0] = v23;
  v34[1] = @"borderWidth";
  v24 = [NSNumber numberWithDouble:v20];
  v35[1] = v24;
  v35[2] = &unk_1ED3F2258;
  v34[2] = @"textFieldInsetH";
  v34[3] = @"textFieldInsetTop";
  v25 = [NSNumber numberWithDouble:7.0 - v20];
  v34[4] = @"textFieldInsetBottom";
  v35[3] = v25;
  v35[4] = &unk_1ED3F2268;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];

  v27 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[vibrantBorder]|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v27];

  v28 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(borderWidth)-[textFieldContainer]-(borderWidth)-|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v28];

  v29 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(textFieldInsetH)-[textField]-(textFieldInsetH)-|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v29];

  v30 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[vibrantBorder]|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v30];

  v31 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(textFieldContainerTop)-[textFieldContainer]-(borderWidth)-|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v31];

  v32 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(textFieldInsetTop)-[textField]-(textFieldInsetBottom)-|" options:0 metrics:v26 views:v22];
  [(UIView *)v14 addConstraints:v32];

  return v14;
}

- (int64_t)permittedActionLayoutDirection
{
  v2 = [(UIAlertControllerVisualStyle *)self descriptor];
  uint64_t v3 = [v2 numberOfActions];

  if (v3 >= 3) {
    return 1;
  }
  else {
    return 3;
  }
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.404;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  BOOL v10 = a5;
  id v12 = a3;
  id v13 = a9;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v37.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v37.c = v14;
  *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v36.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&v36.c = v14;
  *(_OWORD *)&v36.tx = *(_OWORD *)&v37.tx;
  id v15 = a4;
  if (v10)
  {
    CGAffineTransformMakeScale(&v37, 1.2, 1.2);
    double v16 = 0.0;
    double v17 = 1.0;
  }
  else
  {
    double v16 = 1.0;
    CGAffineTransformMakeScale(&v36, 1.0, 1.0);
    double v17 = 0.0;
  }
  CGAffineTransform v35 = v37;
  [v12 setTransform:&v35];
  [v12 setAlpha:v16];
  v18 = [v15 _dimmingView];

  [v18 setAlpha:v16];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E5300730;
  id v19 = v12;
  CGAffineTransform v33 = v36;
  double v34 = v17;
  id v31 = v19;
  id v32 = v18;
  id v20 = v18;
  double v21 = _Block_copy(aBlock);
  id v27 = v13;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v28[3] = &unk_1E52DA040;
  id v29 = v21;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v25[3] = &unk_1E52E45A0;
  id v26 = v19;
  id v22 = v13;
  id v23 = v19;
  id v24 = v21;
  +[UIView animateWithDuration:6 delay:v28 usingSpringWithDamping:v25 initialSpringVelocity:0.404 options:0.0 animations:600.0 completion:0.0];
}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 96)];
  return [*(id *)(a1 + 40) setAlpha:*(double *)(a1 + 96)];
}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048620, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)placementAvoidsKeyboard
{
  return 1;
}

@end