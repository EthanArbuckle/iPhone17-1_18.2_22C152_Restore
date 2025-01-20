@interface UIAlertControllerVisualStyleActionSheet
+ (int64_t)interfaceActionPresentationStyle;
+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7;
- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4;
- (BOOL)placementAvoidsKeyboard;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (double)_spacingBetweenDismissButtonAndContent;
- (double)marginAboveMessageLabelFirstBaseline;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (double)marginBelowTitleLabelLastBaseline;
- (double)maximumWidth;
- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4;
- (id)messageLabelColor;
- (id)messageLabelFont;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (id)vibrancyEffectForTitleAndMessageLabel;
- (int64_t)permittedActionLayoutDirection;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
@end

@implementation UIAlertControllerVisualStyleActionSheet

+ (int64_t)interfaceActionPresentationStyle
{
  return 1;
}

- (id)vibrancyEffectForTitleAndMessageLabel
{
  v2 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
  if (!vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect)
  {
    v3 = +[UIBlurEffect effectWithStyle:1200];
    uint64_t v4 = +[UIVibrancyEffect _effectForBlurEffect:v3 vibrancyStyle:102];
    v5 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
    vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect = v4;

    v2 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
  }
  return v2;
}

- (id)titleLabelFont
{
  v2 = [(UIAlertControllerVisualStyle *)self descriptor];
  int v3 = [v2 hasMessage];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 64;
  }
  v5 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:v4 options:2];
  v6 = [off_1E52D39B8 fontWithDescriptor:v5 size:0.0];

  return v6;
}

- (id)titleLabelColor
{
  v2 = +[UIColor whiteColor];
  return v2;
}

- (double)_spacingBetweenDismissButtonAndContent
{
  return 8.0;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 27.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 17.0;
}

- (id)messageLabelFont
{
  int v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  int v4 = [v3 hasTitle];

  if (v4)
  {
    v5 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:0 options:2];
    v6 = [off_1E52D39B8 fontWithDescriptor:v5 size:0.0];
  }
  else
  {
    v6 = [(UIAlertControllerVisualStyleActionSheet *)self titleLabelFont];
  }
  return v6;
}

- (id)messageLabelColor
{
  v2 = +[UIColor whiteColor];
  return v2;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  int v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  if (v4) {
    return 22.0;
  }
  [(UIAlertControllerVisualStyleActionSheet *)self marginAboveTitleLabelFirstBaseline];
  return result;
}

- (double)marginBelowMessageLabelLastBaseline
{
  int v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  if (v4) {
    return 28.0;
  }
  [(UIAlertControllerVisualStyleActionSheet *)self marginBelowTitleLabelLastBaseline];
  return result;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 17.0;
}

- (double)maximumWidth
{
  return 0.0;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 8.0, 8.0, 8.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  id v13 = a6;
  v14 = [v12 constraintForKey:@"UIAlertControllerVisualStyleActionSheet.centerX"];
  if (!v14)
  {
    v15 = [v10 centerXAnchor];
    v16 = [v11 centerXAnchor];
    v14 = [v15 constraintEqualToAnchor:v16];

    [v12 addConstraint:v14 forKey:@"UIAlertControllerVisualStyleActionSheet.centerX"];
  }
  v17 = [v12 constraintForKey:@"UIAlertControllerVisualStyleActionSheet.bottom"];
  if (!v17)
  {
    v18 = [v10 bottomAnchor];
    v19 = [v11 bottomAnchor];
    v17 = [v18 constraintEqualToAnchor:v19 constant:0.0];

    [v12 addConstraint:v17 forKey:@"UIAlertControllerVisualStyleActionSheet.bottom"];
  }
  v20 = [v10 superview];
  [v13 contentInsetsForContainerView:v20];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  [v17 setConstant:-v24];
  [v14 setConstant:(v22 - v26) * 0.5];
  v27 = (void *)MEMORY[0x1E4F5B268];
  v29[0] = v14;
  v29[1] = v17;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  [v27 activateConstraints:v28];
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.404;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  id v14 = a3;
  id v15 = a9;
  id v16 = a6;
  id v17 = a4;
  [v14 center];
  double v19 = v18;
  double v21 = v20;
  [v14 center];
  double v23 = v22;
  [v16 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  v32 = [v14 superview];
  objc_msgSend(v32, "convertRect:fromView:", v16, v25, v27, v29, v31);
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  v64.origin.x = v34;
  v64.origin.y = v36;
  v64.size.width = v38;
  v64.size.height = v40;
  double MaxY = CGRectGetMaxY(v64);
  [v14 frame];
  double v43 = MaxY + v42 * 0.5;
  if (a5) {
    double v44 = MaxY + v42 * 0.5;
  }
  else {
    double v44 = v21;
  }
  if (a5) {
    double v45 = v23;
  }
  else {
    double v45 = v19;
  }
  if (a5) {
    double v46 = 1.0;
  }
  else {
    double v46 = 0.0;
  }
  if (a5) {
    double v47 = 0.0;
  }
  else {
    double v47 = 1.0;
  }
  if (!a5)
  {
    double v21 = v43;
    double v19 = v23;
  }
  objc_msgSend(v14, "setCenter:", v45, v44);
  v48 = [v17 _dimmingView];

  [v48 setAlpha:v47];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E5307FB8;
  double v61 = v19;
  double v62 = v21;
  id v59 = v14;
  id v60 = v48;
  double v63 = v46;
  id v49 = v48;
  id v50 = v14;
  v51 = _Block_copy(aBlock);
  id v55 = v15;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v56[3] = &unk_1E52DA040;
  id v57 = v51;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v54[3] = &unk_1E52D9FE8;
  id v52 = v15;
  id v53 = v51;
  +[UIView animateWithDuration:6 delay:v56 usingSpringWithDamping:v54 initialSpringVelocity:a8 options:0.0 animations:600.0 completion:0.0];
}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 64);
  return [v2 setAlpha:v3];
}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048620, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)permittedActionLayoutDirection
{
  double v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  if ([v3 hasTitle])
  {
    int v4 = 1;
  }
  else
  {
    CAFrameRateRange v5 = [(UIAlertControllerVisualStyle *)self descriptor];
    if ([v5 hasMessage])
    {
      int v4 = 1;
    }
    else
    {
      double v6 = [(UIAlertControllerVisualStyle *)self descriptor];
      int v4 = [v6 hasContentViewController];
    }
  }

  v7 = [(UIAlertControllerVisualStyle *)self traitCollection];
  uint64_t v8 = [v7 verticalSizeClass];

  if (v8 == 1) {
    int v9 = v4;
  }
  else {
    int v9 = 1;
  }
  if (v9) {
    return 1;
  }
  else {
    return 3;
  }
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return objc_msgSend(a4, "_isPresentedAsPopover", a3);
}

- (BOOL)placementAvoidsKeyboard
{
  return 1;
}

@end