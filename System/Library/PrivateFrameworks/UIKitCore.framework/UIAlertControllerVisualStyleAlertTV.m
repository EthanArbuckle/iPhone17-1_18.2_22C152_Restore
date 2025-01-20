@interface UIAlertControllerVisualStyleAlertTV
- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4;
- (BOOL)placementAvoidsKeyboard;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (UIEdgeInsets)textFieldContentInset;
- (double)_marginAboveDetailMessageFirstBaseline;
- (double)_maximumContentWidth;
- (double)_minimumButtonWidth;
- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4;
- (double)marginAboveMessageLabelFirstBaseline;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (double)marginBelowTitleLabelLastBaseline;
- (double)maximumWidth;
- (double)textFieldHorizontalMargin;
- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4;
- (id)_detailMessageFont;
- (id)_keyCommandInputForCancelAction;
- (id)dimmingViewForAlertController:(id)a3;
- (id)messageLabelFont;
- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4;
- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (int64_t)_effectStyle;
- (int64_t)maximumNumberOfLinesInMessageLabel;
- (int64_t)maximumNumberOfLinesInTitleLabel;
- (int64_t)permittedActionLayoutDirection;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
@end

@implementation UIAlertControllerVisualStyleAlertTV

- (id)titleLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)titleLabelColor
{
  return +[UIColor whiteColor];
}

- (id)messageLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (id)_detailMessageFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2"];
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 35.0;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 40.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 60.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 40.0;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 47.0;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  if (v4) {
    return 60.0;
  }
  [(UIAlertControllerVisualStyleAlertTV *)self marginAboveTitleLabelFirstBaseline];
  return result;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 4;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 7;
}

- (double)_minimumButtonWidth
{
  return 500.0;
}

- (double)_maximumContentWidth
{
  return 960.0;
}

- (double)maximumWidth
{
  [(UIAlertControllerVisualStyle *)self actionSequenceEdgeInsets];
  double v4 = v3;
  [(UIAlertControllerVisualStyle *)self actionSequenceEdgeInsets];
  double v6 = v4 + v5;
  [(UIAlertControllerVisualStyleAlertTV *)self _maximumContentWidth];
  return v7 + v6 + 70.0;
}

- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4
{
  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount];
  double v7 = v6 + v6;
  double v8 = a3 - (v6 + v6);
  [(UIAlertControllerVisualStyleAlertTV *)self _maximumContentWidth];
  double v10 = v9;
  [(UIAlertControllerVisualStyleAlertTV *)self _minimumButtonWidth];
  if (v11 < v8) {
    double v11 = v8;
  }
  if (v10 <= v11) {
    double v11 = v10;
  }
  return v7 + v11;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = 120.0;
  double v4 = 80.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v3;
  return result;
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  id v4 = a3;
  double v5 = [UIView alloc];
  double v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v6 addSubview:v4];
  double v7 = _NSDictionaryOfVariableBindings(&cfstr_Textfield.isa, v4, 0);

  double v8 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|-(horizontalInset)-[textField]-(horizontalInset)-|" options:0 metrics:&unk_1ED3F7A00 views:v7];
  [(UIView *)v6 addConstraints:v8];

  double v9 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|-(verticalInset)-[textField(>=minTextFieldHeight)]-(verticalInset)-|" options:0 metrics:&unk_1ED3F7A00 views:v7];
  [(UIView *)v6 addConstraints:v9];

  return v6;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  id v4 = [a3 title];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)dimmingViewForAlertController:(id)a3
{
  id v4 = [UIVisualEffectView alloc];
  BOOL v5 = +[UIBlurEffect effectWithStyle:[(UIAlertControllerVisualStyleAlertTV *)self _effectStyle]];
  double v6 = [(UIVisualEffectView *)v4 initWithEffect:v5];

  return v6;
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  double result = 0.7;
  if (!a3) {
    return 0.5;
  }
  return result;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  BOOL v13 = a5;
  id v16 = a3;
  id v17 = a4;
  id v46 = a6;
  id v45 = a7;
  id v18 = a9;
  long long v19 = *MEMORY[0x1E4F1DAB8];
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v70 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v71 = v20;
  long long v66 = v19;
  long long v67 = v70;
  long long v68 = v20;
  long long v69 = v19;
  BOOL v44 = v13;
  v21 = (CGAffineTransform *)&v66;
  if (v13) {
    v21 = (CGAffineTransform *)&v69;
  }
  CGAffineTransformMakeScale(v21, 0.9, 0.9);
  v47 = v17;
  v22 = [v17 _dimmingView];
  uint64_t v23 = +[UIBlurEffect effectWithStyle:[(UIAlertControllerVisualStyleAlertTV *)self _effectStyle]];
  if (v13) {
    double v24 = 0.0;
  }
  else {
    double v24 = 0.3;
  }
  if (v13) {
    double v25 = 0.3;
  }
  else {
    double v25 = 0.0;
  }
  if (v13) {
    double v26 = 0.523809524;
  }
  else {
    double v26 = 0.0;
  }
  if (v13) {
    double v27 = 0.476190476;
  }
  else {
    double v27 = 0.5;
  }
  if (v13) {
    double v28 = 0.357142857;
  }
  else {
    double v28 = 0.5;
  }
  if (v13) {
    double v29 = 1.0;
  }
  else {
    double v29 = 0.0;
  }
  double v42 = v29;
  if (v13) {
    double v30 = 0.0;
  }
  else {
    double v30 = 1.0;
  }
  if (v13) {
    v31 = (void *)v23;
  }
  else {
    v31 = 0;
  }
  if (v13) {
    v32 = 0;
  }
  else {
    v32 = (void *)v23;
  }
  v33 = +[UIColor colorWithRed:0.117647059 green:0.117647059 blue:0.117647059 alpha:v24];
  v65[0] = v69;
  v65[1] = v70;
  v65[2] = v71;
  [v16 setTransform:v65];
  [v16 setAlpha:v30];
  [v22 setBackgroundColor:v33];
  v40 = [v16 _preferredActionView];
  v34 = [[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc] initWithCustomCurve:0];
  v35 = [[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc] initWithCustomCurve:1];
  [v22 setEffect:v32];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  v60[3] = &unk_1E52ED900;
  id v43 = v22;
  id v61 = v43;
  id v41 = v31;
  id v62 = v41;
  id v36 = v33;
  id v63 = v36;
  double v64 = v25;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v58[3] = &unk_1E52D9FE8;
  id v37 = v18;
  id v59 = v37;
  +[UIView _animateWithDuration:393216 delay:v34 options:v60 factory:v58 animations:a8 completion:0.0];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v53[3] = &unk_1E52E7948;
  id v38 = v16;
  id v54 = v38;
  long long v55 = v66;
  long long v56 = v67;
  long long v57 = v68;
  +[UIView _animateWithDuration:393216 delay:v35 options:v53 factory:0 animations:v27 * a8 completion:v26 * a8];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v50[3] = &unk_1E52D9CD0;
  id v39 = v38;
  id v51 = v39;
  double v52 = v42;
  +[UIView _animateWithDuration:393216 delay:v34 options:v50 factory:0 animations:v28 * a8 completion:v26 * a8];
  if (v44)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5;
    v48[3] = &unk_1E52D9F70;
    id v49 = v40;
    +[UIView _animateWithDuration:393216 delay:v34 options:v48 factory:0 animations:a8 * 0.357142857 completion:v26 * a8 + 0.119047619];
  }
}

void __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEffect:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) colorWithAlphaComponent:*(double *)(a1 + 56)];
  [v2 setBackgroundColor:v3];
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __167__UIAlertControllerVisualStyleAlertTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:1];
}

- (UIEdgeInsets)textFieldContentInset
{
  double v2 = 35.0;
  double v3 = 70.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v2;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 26.0;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 firstObject];
  if ([v7 style] == 2 || objc_msgSend(v7, "style") == 1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "style", (void)v18) != 2 && objc_msgSend(v14, "style") != 1)
          {
            id v15 = v14;

            goto LABEL_25;
          }
          if (!v11)
          {
            if ([v14 style] == 1) {
              id v11 = v14;
            }
            else {
              id v11 = 0;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }
  if (v11) {
    id v16 = v11;
  }
  else {
    id v16 = v7;
  }
  id v15 = v16;
LABEL_25:

  return v15;
}

- (int64_t)_effectStyle
{
  return 4005;
}

- (id)_keyCommandInputForCancelAction
{
  return 0;
}

@end