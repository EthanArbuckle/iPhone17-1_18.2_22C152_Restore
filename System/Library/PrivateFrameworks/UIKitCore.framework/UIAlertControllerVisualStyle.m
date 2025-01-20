@interface UIAlertControllerVisualStyle
+ (int64_t)interfaceActionPresentationStyle;
+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7;
- (BOOL)_shouldReverseActions;
- (BOOL)contentClipsToBounds;
- (BOOL)contentHasShadow;
- (BOOL)definesWidthByContentFitting;
- (BOOL)focusAvoidsNonDefaultActionsIfPossible;
- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)placementAvoidsKeyboard;
- (BOOL)shouldOccludeDuringPresentation;
- (BOOL)shouldPreserveRespondersAcrossWindows;
- (BOOL)shouldRespectContentViewControllerClippingPreference;
- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4;
- (CGSize)collectionViewOutsetSize;
- (CGSize)contentShadowOffset;
- (CGSize)minimumActionContentSize;
- (Class)interfaceActionVisualStyleClassForManagingConcreteVisualStyle;
- (UIAlertControllerDescriptor)descriptor;
- (UIAlertControllerVisualStyle)init;
- (UIEdgeInsets)actionImageMarginForAction;
- (UIEdgeInsets)actionSequenceEdgeInsets;
- (UIEdgeInsets)contentInsetsForContainerView:(id)a3;
- (UIEdgeInsets)textFieldContentInset;
- (UIInterfaceActionVisualStyle)interfaceActionVisualStyle;
- (UITraitCollection)traitCollection;
- (double)_labelHorizontalInsets;
- (double)_marginAboveDetailMessageFirstBaseline;
- (double)_marginAroundActionGroup;
- (double)_marginBelowDetailMessage;
- (double)_minimumSpacingAboveTopmostLabelSafeAscender;
- (double)_scaledMarginAboveDetailMessageFirstBaseline;
- (double)_scaledMarginAboveMessageLabelFirstBaseline;
- (double)_scaledMarginAboveTitleLabelFirstBaselineInAlertControllerView:(id)a3 titleText:(id)a4;
- (double)_scaledMarginBelowDetailMessage;
- (double)_scaledMarginBelowLastLabelLastBaseline;
- (double)_scaledMarginBelowMessageLabelLastBaseline;
- (double)_scaledMarginBelowTitleLabelLastBaseline;
- (double)_scaledMessageSafeBaselineHeightInAlertControllerView:(id)a3;
- (double)_scaledSafeBaselineHeightForLabelFont:(id)a3 inAlertControllerView:(id)a4;
- (double)_scaledTitleLabelSafeBaselineHeightInAlertControllerView:(id)a3;
- (double)_spacingBetweenDismissButtonAndContent;
- (double)accessibilityWidth;
- (double)actionSpacingForHorizontalLayout:(BOOL)a3;
- (double)contentCornerRadius;
- (double)contentHorizontalMargin;
- (double)contentShadowOpacity;
- (double)contentShadowRadius;
- (double)contentVerticalMargin;
- (double)marginAboveMessageLabelFirstBaseline;
- (double)marginAboveTitleLabelFirstBaseline;
- (double)marginBelowLastLabelLastBaseline;
- (double)marginBelowMessageLabelLastBaseline;
- (double)marginBelowTitleLabelLastBaseline;
- (double)maximumContentHeight;
- (double)maximumHeightForDisplayOnScreen:(id)a3;
- (double)maximumWidth;
- (double)minimumContentHeight;
- (double)minimumWidth;
- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 maxPreferredWidth:(double)a6 preferredSizeForContentContainers:(CGSize)a7;
- (double)textFieldHorizontalMargin;
- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4;
- (id)_keyCommandInputForCancelAction;
- (id)contentBackdropView;
- (id)contentCornerCurve;
- (id)contentShadowColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultActionFont;
- (id)dimmingViewForAlertController:(id)a3;
- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4;
- (id)messageCompositingFilter;
- (id)messageLabelFont;
- (id)preferredActionFont;
- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4;
- (id)regularActionFont;
- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4;
- (id)tintColorForAlertController:(id)a3;
- (id)titleLabelColor;
- (id)titleLabelFont;
- (id)vibrancyEffectForTitleAndMessageLabel;
- (int64_t)forcedInterfaceIdiom;
- (int64_t)maximumNumberOfLinesInMessageLabel;
- (int64_t)maximumNumberOfLinesInTitleLabel;
- (int64_t)permittedActionLayoutDirection;
- (void)_reloadInterfaceActionVisualStyle;
- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9;
- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7;
- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5;
- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5;
- (void)setDescriptor:(id)a3;
- (void)setForcedInterfaceIdiom:(int64_t)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation UIAlertControllerVisualStyle

- (UIAlertControllerVisualStyle)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIAlertControllerVisualStyle;
  v2 = [(UIAlertControllerVisualStyle *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_forcedInterfaceIdiom = -1;
    v4 = +[UIScreen mainScreen];
    uint64_t v5 = [v4 traitCollection];
    traitCollection = v3->_traitCollection;
    v3->_traitCollection = (UITraitCollection *)v5;

    [(UIAlertControllerVisualStyle *)v3 _reloadInterfaceActionVisualStyle];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    objc_super v8 = [(UIAlertControllerVisualStyle *)self traitCollection];
    v9 = [v7 traitCollection];
    if ([v8 isEqual:v9])
    {
      v10 = [(UIAlertControllerVisualStyle *)self descriptor];
      v11 = [v7 descriptor];
      char v6 = [v10 isEqual:v11];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = [(UIAlertControllerVisualStyle *)self descriptor];
  uint64_t v7 = [v6 copyWithZone:a3];
  objc_super v8 = (void *)v5[1];
  v5[1] = v7;

  v9 = [(UIAlertControllerVisualStyle *)self traitCollection];
  uint64_t v10 = [v9 copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = a3;
  if (!-[UITraitCollection isEqual:](self->_traitCollection, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_traitCollection, a3);
    [(UIAlertControllerVisualStyle *)self _reloadInterfaceActionVisualStyle];
  }
}

- (void)setDescriptor:(id)a3
{
  id v5 = a3;
  if (!-[UIAlertControllerDescriptor isEqual:](self->_descriptor, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_descriptor, a3);
    [(UIAlertControllerVisualStyle *)self _reloadInterfaceActionVisualStyle];
  }
}

- (void)setForcedInterfaceIdiom:(int64_t)a3
{
  if (self->_forcedInterfaceIdiom != a3)
  {
    self->_forcedInterfaceIdiom = a3;
    [(UIAlertControllerVisualStyle *)self _reloadInterfaceActionVisualStyle];
  }
}

+ (int64_t)interfaceActionPresentationStyle
{
  return 0;
}

- (Class)interfaceActionVisualStyleClassForManagingConcreteVisualStyle
{
  return (Class)objc_opt_class();
}

- (void)_reloadInterfaceActionVisualStyle
{
  v3 = [(UIAlertControllerVisualStyle *)self traitCollection];
  id v4 = v3;
  int64_t forcedInterfaceIdiom = self->_forcedInterfaceIdiom;
  if (forcedInterfaceIdiom != -1)
  {
    uint64_t v6 = [v3 _traitCollectionByReplacingNSIntegerValue:forcedInterfaceIdiom forTraitToken:0x1ED3F5A30];

    id v4 = (void *)v6;
  }
  -[objc_class idiomSpecificStyleForTraitCollection:presentationStyle:](-[UIAlertControllerVisualStyle interfaceActionVisualStyleClassForManagingConcreteVisualStyle](self, "interfaceActionVisualStyleClassForManagingConcreteVisualStyle"), "idiomSpecificStyleForTraitCollection:presentationStyle:", v4, [(id)objc_opt_class() interfaceActionPresentationStyle]);
  uint64_t v7 = (UIInterfaceActionVisualStyle *)objc_claimAutoreleasedReturnValue();
  interfaceActionVisualStyle = self->_interfaceActionVisualStyle;
  self->_interfaceActionVisualStyle = v7;

  objc_initWeak(&location, self);
  v9 = self->_interfaceActionVisualStyle;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__UIAlertControllerVisualStyle__reloadInterfaceActionVisualStyle__block_invoke;
  v10[3] = &unk_1E52DA4D8;
  objc_copyWeak(&v11, &location);
  [(UIInterfaceActionVisualStyle *)v9 setFontForViewStateBlock:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __65__UIAlertControllerVisualStyle__reloadInterfaceActionVisualStyle__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v3 isPreferred]) {
      [WeakRetained preferredActionFont];
    }
    else {
    uint64_t v5 = [WeakRetained regularActionFont];
    }
  }
  else
  {
    uint64_t v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)vibrancyEffectForTitleAndMessageLabel
{
  return 0;
}

- (id)messageCompositingFilter
{
  return 0;
}

- (id)titleLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)titleLabelColor
{
  return +[UIColor labelColor];
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 0.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 0.0;
}

- (double)_marginAroundActionGroup
{
  return 0.0;
}

- (int64_t)maximumNumberOfLinesInTitleLabel
{
  return 0;
}

- (id)messageLabelFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (double)_marginAboveDetailMessageFirstBaseline
{
  return 20.0;
}

- (double)_marginBelowDetailMessage
{
  return 0.0;
}

- (double)_spacingBetweenDismissButtonAndContent
{
  return 8.0;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  return 0.0;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 0.0;
}

- (int64_t)maximumNumberOfLinesInMessageLabel
{
  return 0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 0.0;
}

- (id)tintColorForAlertController:(id)a3
{
  return 0;
}

- (double)minimumWidth
{
  return 0.0;
}

- (double)maximumWidth
{
  return 0.0;
}

- (double)maximumContentHeight
{
  return 0.0;
}

- (BOOL)definesWidthByContentFitting
{
  return 0;
}

- (double)minimumWidthFittingContentView:(id)a3 titleLabel:(id)a4 minimumWidthForAllActions:(double)a5 maxPreferredWidth:(double)a6 preferredSizeForContentContainers:(CGSize)a7
{
  return 0.0;
}

- (double)accessibilityWidth
{
  return 0.0;
}

- (double)maximumHeightForDisplayOnScreen:(id)a3
{
  [a3 _applicationFrame];
  return CGRectGetHeight(*(CGRect *)&v3);
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  objc_super v8 = (void *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v19 = [v8 array];
  id v11 = [v10 centerXAnchor];
  v12 = [v9 safeAreaLayoutGuide];
  v13 = [v12 centerXAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  [v19 addObject:v14];

  v15 = [v10 centerYAnchor];

  v16 = [v9 safeAreaLayoutGuide];

  v17 = [v16 centerYAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v19 addObject:v18];

  [MEMORY[0x1E4F5B268] activateConstraints:v19];
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  id v4 = a3;
  return v4;
}

- (id)defaultActionFont
{
  v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  double v3 = +[UIInterfaceActionViewState _nullViewStateForActionType:0];
  id v4 = [v2 actionTitleLabelFontForViewState:v3];

  return v4;
}

- (int64_t)permittedActionLayoutDirection
{
  return 3;
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return 0;
}

- (CGSize)collectionViewOutsetSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)textFieldContentInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 16.0;
}

- (id)dimmingViewForAlertController:(id)a3
{
  double v3 = [UIView alloc];
  double v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = +[UIColor _alertControllerDimmingViewColor];
  [(UIView *)v4 setBackgroundColor:v5];

  return v4;
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.0;
}

- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7
{
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
}

- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4
{
  return 0;
}

- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  return 0;
}

- (BOOL)shouldOccludeDuringPresentation
{
  return 1;
}

- (BOOL)shouldPreserveRespondersAcrossWindows
{
  return 0;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (id)preferredActionForActions:(id)a3 suggestedPreferredAction:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return 0;
}

- (id)contentBackdropView
{
  return 0;
}

- (BOOL)contentClipsToBounds
{
  return 0;
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (id)contentCornerCurve
{
  return (id)*MEMORY[0x1E4F39EA8];
}

- (BOOL)contentHasShadow
{
  return 0;
}

- (double)contentShadowRadius
{
  return 0.0;
}

- (id)contentShadowColor
{
  return 0;
}

- (CGSize)contentShadowOffset
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)contentShadowOpacity
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v2 actionSequenceEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)regularActionFont
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  double v3 = [v2 defaultConcreteActionTitleLabelRegularFont];

  return v3;
}

- (id)preferredActionFont
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  double v3 = [v2 defaultConcreteActionTitleLabelPreferredFont];

  return v3;
}

- (CGSize)minimumActionContentSize
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v2 minimumActionContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)contentHorizontalMargin
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v2 contentMargin];
  double v4 = v3;

  return v4;
}

- (double)contentVerticalMargin
{
  double v2 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v2 contentMargin];
  double v4 = v3;

  return v4;
}

- (UIEdgeInsets)actionImageMarginForAction
{
  double v3 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v3 verticalImageContentSpacing];
  double v5 = v4;

  double v6 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v6 horizontalImageContentSpacing];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  double v11 = v5;
  double v12 = v8;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v11 configureAttributesForTitleLabel:v10 classificationLabel:v9 actionViewState:v8];
}

- (void)configureAttributesForImageView:(id)a3 imageProperty:(id)a4 actionViewState:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v11 configureAttributesForImageView:v10 imageProperty:v9 actionViewState:v8];
}

- (double)minimumContentHeight
{
  return 44.0;
}

- (double)_minimumSpacingAboveTopmostLabelSafeAscender
{
  return 2.0;
}

- (double)_labelHorizontalInsets
{
  return 16.0;
}

- (double)_scaledMarginAboveTitleLabelFirstBaselineInAlertControllerView:(id)a3 titleText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIAlertControllerVisualStyle *)self titleLabelFont];
  [(UIAlertControllerVisualStyle *)self marginAboveTitleLabelFirstBaseline];
  objc_msgSend(v8, "_scaledValueForValue:");
  double v10 = v9;

  id v11 = v7;
  if ([v11 length])
  {
    double v12 = +[UILabel _tooBigChars]();
    uint64_t v13 = [v11 rangeOfCharacterFromSet:v12];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(UIAlertControllerVisualStyle *)self _scaledTitleLabelSafeBaselineHeightInAlertControllerView:v6];
      if (v10 < v14) {
        double v10 = v14;
      }
    }
  }
  else
  {
  }
  return v10;
}

- (double)_scaledSafeBaselineHeightForLabelFont:(id)a3 inAlertControllerView:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CTFontGetLanguageAwareOutsets();
  [v6 ascender];

  UICeilToViewScale(v5);
  double v8 = v7;

  return v8;
}

- (double)_scaledTitleLabelSafeBaselineHeightInAlertControllerView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIAlertControllerVisualStyle *)self titleLabelFont];
  [(UIAlertControllerVisualStyle *)self _scaledSafeBaselineHeightForLabelFont:v5 inAlertControllerView:v4];
  double v7 = v6;

  return v7;
}

- (double)_scaledMessageSafeBaselineHeightInAlertControllerView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIAlertControllerVisualStyle *)self messageLabelFont];
  [(UIAlertControllerVisualStyle *)self _scaledSafeBaselineHeightForLabelFont:v5 inAlertControllerView:v4];
  double v7 = v6;

  return v7;
}

- (double)_scaledMarginBelowTitleLabelLastBaseline
{
  double v3 = [(UIAlertControllerVisualStyle *)self titleLabelFont];
  [(UIAlertControllerVisualStyle *)self marginBelowTitleLabelLastBaseline];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_scaledMarginAboveMessageLabelFirstBaseline
{
  double v3 = [(UIAlertControllerVisualStyle *)self messageLabelFont];
  [(UIAlertControllerVisualStyle *)self marginAboveMessageLabelFirstBaseline];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowMessageLabelLastBaseline
{
  double v3 = [(UIAlertControllerVisualStyle *)self messageLabelFont];
  [(UIAlertControllerVisualStyle *)self marginBelowMessageLabelLastBaseline];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowLastLabelLastBaseline
{
  double v3 = [(UIAlertControllerVisualStyle *)self titleLabelFont];
  [(UIAlertControllerVisualStyle *)self marginBelowLastLabelLastBaseline];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_scaledMarginAboveDetailMessageFirstBaseline
{
  double v3 = [(UIAlertControllerVisualStyle *)self _detailMessageFont];
  [(UIAlertControllerVisualStyle *)self _marginAboveDetailMessageFirstBaseline];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (double)_scaledMarginBelowDetailMessage
{
  double v3 = [(UIAlertControllerVisualStyle *)self _detailMessageFont];
  [(UIAlertControllerVisualStyle *)self _marginBelowDetailMessage];
  objc_msgSend(v3, "_scaledValueForValue:");
  double v5 = v4;

  return v5;
}

- (BOOL)_shouldReverseActions
{
  return 0;
}

- (id)_keyCommandInputForCancelAction
{
  return @"UIKeyInputEscape";
}

- (double)actionSpacingForHorizontalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  double v6 = [v5 groupViewState];

  double v7 = (void *)[v6 copyWithVerticalLayoutAxis:!v3];
  double v8 = [(UIAlertControllerVisualStyle *)self interfaceActionVisualStyle];
  [v8 actionSpacingForGroupViewState:v7];
  double v10 = v9;

  return v10;
}

- (BOOL)shouldRespectContentViewControllerClippingPreference
{
  return 0;
}

- (UIAlertControllerDescriptor)descriptor
{
  return self->_descriptor;
}

- (int64_t)forcedInterfaceIdiom
{
  return self->_forcedInterfaceIdiom;
}

- (UIInterfaceActionVisualStyle)interfaceActionVisualStyle
{
  return self->_interfaceActionVisualStyle;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_interfaceActionVisualStyle, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end