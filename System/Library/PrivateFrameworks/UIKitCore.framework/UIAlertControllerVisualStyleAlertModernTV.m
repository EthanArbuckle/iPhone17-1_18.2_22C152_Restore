@interface UIAlertControllerVisualStyleAlertModernTV
- (BOOL)contentClipsToBounds;
- (BOOL)contentHasShadow;
- (BOOL)definesWidthByContentFitting;
- (BOOL)focusAvoidsNonDefaultActionsIfPossible;
- (BOOL)shouldRespectContentViewControllerClippingPreference;
- (CGSize)contentShadowOffset;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (double)_labelHorizontalInsets;
- (double)_marginAboveDetailMessageFirstBaseline;
- (double)_marginBelowDetailMessage;
- (double)_minimumAlertWidthWithContentView:(id)a3 withCandidateSizes:(id)a4 preferredSizeForContentContainers:(CGSize)a5;
- (double)_minimumAlertWidthWithTitleLabel:(id)a3 withCandidateSizes:(id)a4;
- (double)_minimumSpacingAboveTopmostLabelSafeAscender;
- (double)_titleAndMessageHorizontalInset;
- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4;
- (double)contentCornerRadius;
- (double)contentShadowOpacity;
- (double)marginAboveMessageLabelFirstBaseline;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (double)maximumContentHeight;
- (double)maximumWidth;
- (double)maximumWidthForTitleAndMessageContentView;
- (double)minimumContentHeight;
- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 preferredSizeForContentContainers:(CGSize)a6;
- (id)contentBackdropView;
- (id)contentShadowColor;
- (id)dimmingViewForAlertController:(id)a3;
- (id)messageCompositingFilter;
- (id)messageLabelColor;
- (id)messageLabelFont;
- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4;
- (id)tintColorForAlertController:(id)a3;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (int64_t)maximumNumberOfLinesInMessageLabel;
- (int64_t)maximumNumberOfLinesInTitleLabel;
- (int64_t)permittedActionLayoutDirection;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
@end

@implementation UIAlertControllerVisualStyleAlertModernTV

- (id)titleLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedCallout"];
}

- (id)titleLabelColor
{
  return +[UIColor labelColor];
}

- (id)messageLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 19.0;
}

- (double)_marginBelowDetailMessage
{
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  return v2;
}

- (id)messageLabelColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)messageCompositingFilter
{
  double v2 = [(UIAlertControllerVisualStyle *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  v4 = (void **)MEMORY[0x1E4F3A2E8];
  if (v3 != 2) {
    v4 = (void **)MEMORY[0x1E4F3A2E0];
  }
  v5 = *v4;
  return v5;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  return v2 + 45.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  uint64_t v3 = [(UIAlertControllerVisualStyleAlertModernTV *)self titleLabelFont];
  CTFontGetLanguageAwareOutsets();

  v4 = [(UIAlertControllerVisualStyleAlertModernTV *)self titleLabelFont];
  [v4 descender];
  double v6 = 0.0 - v5;

  return v6;
}

- (double)marginBelowMessageLabelLastBaseline
{
  uint64_t v3 = [(UIAlertControllerVisualStyleAlertModernTV *)self messageLabelFont];
  CTFontGetLanguageAwareOutsets();

  v4 = [(UIAlertControllerVisualStyleAlertModernTV *)self messageLabelFont];
  [v4 descender];
  double v6 = 0.0 - v5;

  return v6;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  uint64_t v3 = [(UIAlertControllerVisualStyle *)self descriptor];
  char v4 = [v3 hasTitle];

  if (v4) {
    return 49.0;
  }
  [(UIAlertControllerVisualStyleAlertModernTV *)self marginAboveTitleLabelFirstBaseline];
  return result;
}

- (id)tintColorForAlertController:(id)a3
{
  return +[UIColor systemBlueColor];
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 5;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 0;
}

- (double)maximumWidth
{
  return -1.0;
}

- (double)maximumContentHeight
{
  return 575.0;
}

- (BOOL)definesWidthByContentFitting
{
  return 1;
}

- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 preferredSizeForContentContainers:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = a4;
  v13 = [(UIAlertControllerVisualStyle *)self descriptor];
  if ([v13 numberOfVisibleActions] == 2)
  {
    [(UIAlertControllerVisualStyle *)self actionSpacingForHorizontalLayout:1];
    double v15 = v14;
    [(UIAlertControllerVisualStyle *)self actionSequenceEdgeInsets];
    double v17 = v16;
    [(UIAlertControllerVisualStyle *)self actionSequenceEdgeInsets];
    if (a5 + a5 + v15 + v17 + v18 <= 588.0) {
      v19 = &unk_1ED3F0BB0;
    }
    else {
      v19 = &unk_1ED3F0B98;
    }
  }
  else
  {
    v19 = &unk_1ED3F0BC8;
  }
  [(UIAlertControllerVisualStyleAlertModernTV *)self _minimumAlertWidthWithTitleLabel:v12 withCandidateSizes:v19];
  double v21 = v20;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __147__UIAlertControllerVisualStyleAlertModernTV_minimumWidthFittingContentView_titleLabel_minimumWidthForAllActions_preferredSizeForContentContainers___block_invoke;
  v26[3] = &__block_descriptor_40_e35_B24__0__NSNumber_8__NSDictionary_16l;
  *(double *)&v26[4] = v20;
  v22 = [MEMORY[0x1E4F28F60] predicateWithBlock:v26];
  v23 = [v19 filteredArrayUsingPredicate:v22];

  if ([v23 count])
  {
    -[UIAlertControllerVisualStyleAlertModernTV _minimumAlertWidthWithContentView:withCandidateSizes:preferredSizeForContentContainers:](self, "_minimumAlertWidthWithContentView:withCandidateSizes:preferredSizeForContentContainers:", v11, v23, width, height);
    double v21 = v24;
  }

  return v21;
}

BOOL __147__UIAlertControllerVisualStyleAlertModernTV_minimumWidthFittingContentView_titleLabel_minimumWidthForAllActions_preferredSizeForContentContainers___block_invoke(uint64_t a1, void *a2)
{
  [a2 floatValue];
  return *(double *)(a1 + 32) <= v3;
}

- (double)_minimumAlertWidthWithTitleLabel:(id)a3 withCandidateSizes:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  double v9 = 0.0;
  if (v6 && [v7 count])
  {
    uint64_t v23 = [v6 numberOfLines];
    [v6 setNumberOfLines:0];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v14) floatValue];
        double v16 = v15;
        [(UIAlertControllerVisualStyleAlertModernTV *)self _labelHorizontalInsets];
        double v18 = v16 - (v17 + v17);
        uint64_t v24 = 0;
        v19 = [v6 text];
        double v20 = [v6 attributedText];
        _UIComputedSizeForLabel(v6, v19, v20, 0, &v24, 0, 0, v18, 1.79769313e308);

        int64_t v21 = v24;
        if (v21 <= [(UIAlertControllerVisualStyleAlertModernTV *)self maximumNumberOfLinesInTitleLabel])break; {
        if (v12 == ++v14)
        }
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      double v16 = 0.0;
    }

    [v6 setNumberOfLines:v23];
    if (fabs(v16) >= 2.22044605e-16) {
      double v9 = v16;
    }
    else {
      double v9 = 820.0;
    }
  }

  return v9;
}

- (double)_minimumAlertWidthWithContentView:(id)a3 withCandidateSizes:(id)a4 preferredSizeForContentContainers:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [(UIAlertControllerVisualStyle *)self descriptor];
  [(UIAlertControllerVisualStyleAlertModernTV *)self maximumContentHeight];
  double v13 = v12;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18), "floatValue", (void)v27);
        double v20 = v19;
        LODWORD(v21) = 1148846080;
        LODWORD(v22) = 1112014848;
        objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v19, 0.0, v21, v22);
        double v24 = v23;
        if (([v11 hasTitle] & 1) != 0 || objc_msgSend(v11, "hasMessage")) {
          double v24 = height + v24;
        }
        if (v24 < v13)
        {
          double v25 = fmax(v20, fmin(width, 820.0));
          goto LABEL_14;
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  double v25 = 0.0;
LABEL_14:

  if (fabs(v25) < 2.22044605e-16) {
    double v25 = 820.0;
  }

  return v25;
}

- (double)maximumWidthForTitleAndMessageContentView
{
  return 820.0;
}

- (double)actionWidthForMinimumActionWidth:(double)a3 availableWidth:(double)a4
{
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  double v6 = v5 + v5;
  double v7 = 640.0 - v6;
  double result = a4 - v6;
  if (v7 < result) {
    return v7;
  }
  return result;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 60.0, 80.0, 60.0, 80.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)permittedActionLayoutDirection
{
  double v2 = [(UIAlertControllerVisualStyle *)self descriptor];
  uint64_t v3 = [v2 numberOfVisibleActions];

  if (v3 == 2) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)dimmingViewForAlertController:(id)a3
{
  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_915, @"TVAlert_BackgroundDimWhite"))double v3 = 0.0; {
  else
  }
    double v3 = *(double *)&qword_1EB2576E8;
  if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB2576F0, @"TVAlert_BackgroundDimAlpha"))double v4 = 0.45; {
  else
  }
    double v4 = *(double *)&qword_1EB2576F8;
  double v5 = [UIView alloc];
  double v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = +[UIColor colorWithWhite:v3 alpha:v4];
  [(UIView *)v6 setBackgroundColor:v7];

  return v6;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a9;
  long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v48 = *MEMORY[0x1E4F1DAB8];
  long long v49 = v15;
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v45 = v48;
  long long v46 = v15;
  long long v47 = v50;
  id v16 = a4;
  uint64_t v17 = (CGAffineTransform *)&v45;
  if (v11)
  {
    uint64_t v17 = (CGAffineTransform *)&v48;
    double v18 = 0.357142857;
  }
  else
  {
    double v18 = 0.5;
  }
  if (v11) {
    double v19 = 0.476190476;
  }
  else {
    double v19 = 0.5;
  }
  if (v11) {
    double v20 = 0.523809524;
  }
  else {
    double v20 = 0.0;
  }
  if (v11) {
    double v21 = 1.0;
  }
  else {
    double v21 = 0.0;
  }
  if (v11) {
    double v22 = 0.0;
  }
  else {
    double v22 = 1.0;
  }
  CGAffineTransformMakeScale(v17, 0.9, 0.9);
  double v23 = [v16 _dimmingView];

  v44[0] = v48;
  v44[1] = v49;
  v44[2] = v50;
  [v13 setTransform:v44];
  [v13 setAlpha:v22];
  double v24 = [v13 _preferredActionView];
  double v25 = [[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc] initWithCustomCurve:0];
  long long v26 = [[_UIAlertControllerVisualStyleAlertTVCustomCurveFactory alloc] initWithCustomCurve:1];
  [v23 setAlpha:v22];
  id v40 = v14;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  v41[3] = &unk_1E52D9CD0;
  id v42 = v23;
  double v43 = v21;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v39[3] = &unk_1E52D9FE8;
  id v27 = v14;
  id v28 = v23;
  +[UIView _animateWithDuration:393216 delay:v25 options:v41 factory:v39 animations:a8 completion:0.0];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v34[3] = &unk_1E52E7948;
  id v29 = v13;
  id v35 = v29;
  long long v36 = v45;
  long long v37 = v46;
  long long v38 = v47;
  +[UIView _animateWithDuration:393216 delay:v26 options:v34 factory:0 animations:v19 * a8 completion:v20 * a8];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v31[3] = &unk_1E52D9CD0;
  id v32 = v29;
  double v33 = v21;
  id v30 = v29;
  +[UIView _animateWithDuration:393216 delay:v25 options:v31 factory:0 animations:v18 * a8 completion:v20 * a8];
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __173__UIAlertControllerVisualStyleAlertModernTV_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return 1;
}

- (id)contentBackdropView
{
  double v3 = objc_alloc_init(_UIAlertControllerModernTVBackgroundView);
  [(UIAlertControllerVisualStyleAlertModernTV *)self contentCornerRadius];
  -[_UIAlertControllerModernTVBackgroundView setCornerRadius:](v3, "setCornerRadius:");
  return v3;
}

- (BOOL)contentClipsToBounds
{
  return 1;
}

- (double)contentCornerRadius
{
  +[_UIAlertControllerModernTVBackgroundView contentCornerRadius];
  return result;
}

- (BOOL)contentHasShadow
{
  return 1;
}

- (id)contentShadowColor
{
  return +[UIColor blackColor];
}

- (CGSize)contentShadowOffset
{
  double v2 = 0.0;
  double v3 = 4.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)contentShadowOpacity
{
  return 0.2;
}

- (double)minimumContentHeight
{
  [(UIAlertControllerVisualStyleAlertModernTV *)self contentCornerRadius];
  return v2 + v2;
}

- (double)_minimumSpacingAboveTopmostLabelSafeAscender
{
  return 35.0;
}

- (double)_titleAndMessageHorizontalInset
{
  return 16.0;
}

- (double)_labelHorizontalInsets
{
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  double v4 = v3;
  [(UIAlertControllerVisualStyleAlertModernTV *)self _titleAndMessageHorizontalInset];
  return v4 + v5;
}

- (BOOL)shouldRespectContentViewControllerClippingPreference
{
  return 1;
}

@end