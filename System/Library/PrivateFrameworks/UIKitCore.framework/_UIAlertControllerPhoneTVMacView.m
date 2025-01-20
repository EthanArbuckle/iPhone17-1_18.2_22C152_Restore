@interface _UIAlertControllerPhoneTVMacView
+ (BOOL)requiresConstraintBasedLayout;
+ (void)initialize;
- (BOOL)_actionLayoutIsVertical;
- (BOOL)_actionsReversed;
- (BOOL)_buttonsAreTopMost;
- (BOOL)_canLayOutActionsHorizontally;
- (BOOL)_hasAttributedMessage;
- (BOOL)_hasAttributedTitle;
- (BOOL)_hasDetailMessage;
- (BOOL)_hasDiscreteCancelAction;
- (BOOL)_hasMessage;
- (BOOL)_hasTextFields;
- (BOOL)_hasTitle;
- (BOOL)_horizontalLayoutCanUseFullWidth;
- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3;
- (BOOL)_shouldHaveCancelActionInMainActionButtonSequenceView;
- (BOOL)_titleAndMessageLabelUseVibrancy;
- (BOOL)actionScrubbingEnabled;
- (BOOL)alignsToKeyboard;
- (BOOL)cancelActionIsDiscrete;
- (BOOL)hasDimmingView;
- (BOOL)hasDiscreteHorizontalCancelAction;
- (BOOL)isSpringLoaded;
- (BOOL)presentationContextPrefersCancelActionShown;
- (BOOL)presentedAsPopover;
- (BOOL)shouldHaveBackdropView;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showsCancelAction;
- (CGSize)_contentViewControllerSize;
- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3;
- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3 visualStyleRequiresActionRepresentationToFitItemSize:(BOOL *)a4;
- (CGSize)_layoutSize;
- (CGSize)_mainActionButtonSequenceViewSizeForHorizontalLayout:(BOOL)a3 itemSize:(CGSize)a4;
- (CGSize)_minimumSizeForAllActions;
- (CGSize)_sizeForLayoutWidthDetermination;
- (NSArray)titleAndMessageLabelVibrantContainerViewVerticalConstraints;
- (NSLayoutConstraint)actionGroupEqualsContentViewWidthConstraint;
- (NSLayoutConstraint)centerXConstraint;
- (NSLayoutConstraint)centerYConstraint;
- (NSLayoutConstraint)contentScrollViewBottomConstraint;
- (NSLayoutConstraint)contentScrollViewMaximumHeightConstraint;
- (NSLayoutConstraint)contentScrollViewMaximumWidthConstraint;
- (NSLayoutConstraint)contentViewBottomConstraint;
- (NSLayoutConstraint)contentViewControllerContainerViewHeightConstraint;
- (NSLayoutConstraint)contentViewControllerContainerViewTopAlignmentConstraint;
- (NSLayoutConstraint)contentViewControllerContainerViewWidthConstraint;
- (NSLayoutConstraint)contentViewControllerViewBottomConstraint;
- (NSLayoutConstraint)contentViewControllerViewLeftConstraint;
- (NSLayoutConstraint)contentViewControllerViewRightConstraint;
- (NSLayoutConstraint)contentViewControllerViewTopConstraint;
- (NSLayoutConstraint)contentViewMaxHeightConstraint;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSLayoutConstraint)detailMessageLabelTopAlignmentConstraint;
- (NSLayoutConstraint)discreteActionGroupViewHorizontalLayoutTrailingConstraint;
- (NSLayoutConstraint)discreteCancelActionViewHeightConstraint;
- (NSLayoutConstraint)discreteCancelActionViewLeadingConstraint;
- (NSLayoutConstraint)discreteCancelActionViewTopConstraint;
- (NSLayoutConstraint)discreteCancelActionViewWidthConstraint;
- (NSLayoutConstraint)foregroundViewWidthConstraint;
- (NSLayoutConstraint)headerContentViewControllerContainerViewTopAlignmentConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)mainActionButtonSequenceViewHeightConstraint;
- (NSLayoutConstraint)mainActionButtonSequenceViewHorizontalAlignmentConstraint;
- (NSLayoutConstraint)mainActionButtonSequenceViewWidthConstraint;
- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewBottomConstraint;
- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewWidthConstraint;
- (NSLayoutConstraint)textFieldViewControllerContainerViewHeightConstraint;
- (NSLayoutConstraint)textFieldViewControllerContainerViewWidthConstraint;
- (NSLayoutConstraint)textFieldViewControllerViewBottomConstraint;
- (NSLayoutConstraint)textFieldViewControllerViewLeftConstraint;
- (NSLayoutConstraint)textFieldViewControllerViewRightConstraint;
- (NSLayoutConstraint)textFieldViewControllerViewTopConstraint;
- (NSLayoutConstraint)widthConstraint;
- (UIEdgeInsets)_contentInsets;
- (_UIAlertControllerActionViewMetrics)actionViewMetrics;
- (_UIAlertControllerPhoneTVMacView)initWithFrame:(CGRect)a3;
- (_UIFlexibleConstantConstraintSet)messageLabelTopAlignmentConstraints;
- (_UIFlexibleConstantConstraintSet)textFieldViewControllerContainerViewTopAlignmentConstraints;
- (_UIFlexibleConstantConstraintSet)titleLabelTopAlignmentConstraints;
- (double)_availableWidthForHorizontalLayout:(BOOL)a3;
- (double)_idealLayoutWidth;
- (double)_labelHorizontalInsets;
- (double)_layoutWidthForHorizontalLayout:(BOOL)a3;
- (double)_marginBetweenInterfaceActionGroups;
- (double)_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:(double)a3;
- (double)_minimumWidthFittingAlertContents;
- (double)_spaceRequiredForActionSectionsSpacing;
- (double)_verticalLayoutWidth;
- (double)effectAlpha;
- (double)offset;
- (id)__cancelActionView;
- (id)_attributedDetailMessage;
- (id)_attributedMessage;
- (id)_attributedTitle;
- (id)_discreteCancelActionView;
- (id)_effectivePreferredAction;
- (id)_focusedAction;
- (id)_indexesOfActionSectionSeparators;
- (id)_interfaceActionForAlertAction:(id)a3 inActionGroupView:(id)a4;
- (id)_interfaceActionRepresentationForAlertAlertAction:(id)a3;
- (id)_newStyledBackgroundView;
- (id)_preferredActionView;
- (id)_presentableAlertActions;
- (id)_textFieldViewController;
- (id)_unlocalizedOrderedPresentableAlertActionViewRepresentations;
- (id)_unlocalizedOrderedPresentableAlertActions;
- (id)_vibrancyEffectForTitleAndMessageLabel;
- (id)_visualStyle;
- (id)actions;
- (id)alertController;
- (id)cancelAction;
- (id)contentViewController;
- (id)headerContentViewController;
- (id)message;
- (id)preferredFocusedView;
- (id)separatedHeaderContentViewController;
- (id)textFields;
- (id)title;
- (int64_t)_numberOfActionsForMainActionButtonSequenceView;
- (int64_t)tintAdjustmentMode;
- (void)_actionLayoutDirectionChanged;
- (void)_actionsChanged;
- (void)_addContentViewControllerToViewHierarchyIfNecessary;
- (void)_addHeaderContentViewControllerToViewHierarchyIfNecessary;
- (void)_addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary;
- (void)_applyContentViewControllerContainerViewConstraints;
- (void)_applyDetailMessageConstraints;
- (void)_applyHeaderContentViewControllerContainerViewConstraints;
- (void)_applyISEngineLayoutValuesToBoundsOnly:(BOOL)a3;
- (void)_applyKeyboardAlignmentViewsConstraints;
- (void)_applyMessageConstraints;
- (void)_applySeparatedContentViewControllerContainerViewContraints;
- (void)_applyTextFieldViewControllerContainerViewConstraints;
- (void)_applyTitleAndMessageLabelVibrantContainerViewConstraints;
- (void)_applyTitleConstraints;
- (void)_applyViewConstraints;
- (void)_associateActionsWithActionViews;
- (void)_configureActionGroupViewToAllowHorizontalLayout:(BOOL)a3;
- (void)_contentSizeChanged;
- (void)_disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:(id)a3;
- (void)_ensureActionViewRepresentationsHaveMetrics;
- (void)_layoutAndPositionInParentIfNeeded;
- (void)_performBatchActionChangesWithBlock:(id)a3;
- (void)_prepareContentView;
- (void)_prepareContentViewControllerContainerView;
- (void)_prepareContentViewTopItemsView;
- (void)_prepareDetailMessageLabel;
- (void)_prepareDimmingView;
- (void)_prepareDimmingViewConstraints;
- (void)_prepareDiscreteCancelActionGroupView;
- (void)_prepareForWindowDealloc;
- (void)_prepareForWindowHostingSceneRemoval;
- (void)_prepareHeaderContentViewControllerContainerView;
- (void)_prepareKeyboardLayoutAlignmentViews;
- (void)_prepareMainInterfaceActionsGroupView;
- (void)_prepareMesssageLabel;
- (void)_prepareSeparateContentViewControllerContainerView;
- (void)_prepareTextFieldViewControllerContainerView;
- (void)_prepareTitleAndMessageLabelVibrantContainer;
- (void)_prepareTitleLabel;
- (void)_prepareViewsAndAddConstraints;
- (void)_propertiesChanged;
- (void)_recomputeActionMetrics;
- (void)_recomputeAlertControllerWidth;
- (void)_reevaluateSuperviewSizingConstraints;
- (void)_reloadInterfaceActionViewRepresentations;
- (void)_reloadInterfaceActionsGroupViewPreferredAction;
- (void)_removeContentViewControllerViewFromHierarchy;
- (void)_removeHeaderContentViewControllerViewFromHierarchy;
- (void)_removeSeparatedHeaderContentViewControllerFromHierarchy;
- (void)_scrollInitialActionToVisibleForPresentation;
- (void)_setActionsReversed:(BOOL)a3;
- (void)_setAttributedDetailMessage:(id)a3;
- (void)_setAttributedMessage:(id)a3;
- (void)_setAttributedTitle:(id)a3;
- (void)_setLayoutSize:(CGSize)a3;
- (void)_setMessage:(id)a3;
- (void)_setTitle:(id)a3;
- (void)_setVisualStyle:(id)a3;
- (void)_setupHorizontalConstraintsForLabelView:(id)a3;
- (void)_sizeOfContentViewControllerChanged;
- (void)_sizeOfHeaderContentViewControllerChanged;
- (void)_sizeOfTextFieldViewControllerChanged;
- (void)_textFieldsChanged;
- (void)_updateActionViewHeight;
- (void)_updateActionViewVisualStyle:(id)a3;
- (void)_updateActionsGroupPresentationStyles;
- (void)_updateBackdropView:(BOOL)a3;
- (void)_updateCancelActionBeingDiscrete;
- (void)_updateConstraintConstants;
- (void)_updateConstraintSpacingForExternalOffset;
- (void)_updateContentView;
- (void)_updateDetailLabelContents;
- (void)_updateDetailLabelFontSize;
- (void)_updateForPropertyChangeIfNeeded;
- (void)_updateInsets;
- (void)_updateLabelFontSizes;
- (void)_updateLabelProperties;
- (void)_updateLabelTextColor;
- (void)_updateMainGroupViewProperties;
- (void)_updateMainScrollableHeaderViewHasRealContent;
- (void)_updateMessageLabelContents;
- (void)_updateMessageLabelFontSize;
- (void)_updatePreferredAction;
- (void)_updateStyleForIdiomChange:(BOOL)a3;
- (void)_updateTintColor;
- (void)_updateTitleLabelContents;
- (void)_updateTitleLabelFontSize;
- (void)_willMoveToWindow:(id)a3;
- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3;
- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3;
- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3;
- (void)dealloc;
- (void)deselectAllActions;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5;
- (void)setActionGroupEqualsContentViewWidthConstraint:(id)a3;
- (void)setActionScrubbingEnabled:(BOOL)a3;
- (void)setActionViewMetrics:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setAlignsToKeyboard:(BOOL)a3;
- (void)setCancelActionIsDiscrete:(BOOL)a3;
- (void)setCenterXConstraint:(id)a3;
- (void)setCenterYConstraint:(id)a3;
- (void)setContentScrollViewBottomConstraint:(id)a3;
- (void)setContentScrollViewMaximumHeightConstraint:(id)a3;
- (void)setContentScrollViewMaximumWidthConstraint:(id)a3;
- (void)setContentViewBottomConstraint:(id)a3;
- (void)setContentViewControllerContainerViewHeightConstraint:(id)a3;
- (void)setContentViewControllerContainerViewTopAlignmentConstraint:(id)a3;
- (void)setContentViewControllerContainerViewWidthConstraint:(id)a3;
- (void)setContentViewControllerViewBottomConstraint:(id)a3;
- (void)setContentViewControllerViewLeftConstraint:(id)a3;
- (void)setContentViewControllerViewRightConstraint:(id)a3;
- (void)setContentViewControllerViewTopConstraint:(id)a3;
- (void)setContentViewMaxHeightConstraint:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setDetailMessageLabelTopAlignmentConstraint:(id)a3;
- (void)setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:(id)a3;
- (void)setDiscreteCancelActionViewHeightConstraint:(id)a3;
- (void)setDiscreteCancelActionViewLeadingConstraint:(id)a3;
- (void)setDiscreteCancelActionViewTopConstraint:(id)a3;
- (void)setDiscreteCancelActionViewWidthConstraint:(id)a3;
- (void)setEffectAlpha:(double)a3;
- (void)setForegroundViewWidthConstraint:(id)a3;
- (void)setHasDimmingView:(BOOL)a3;
- (void)setHeaderContentViewControllerContainerViewTopAlignmentConstraint:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setMainActionButtonSequenceViewHeightConstraint:(id)a3;
- (void)setMainActionButtonSequenceViewHorizontalAlignmentConstraint:(id)a3;
- (void)setMainActionButtonSequenceViewWidthConstraint:(id)a3;
- (void)setMessageLabelTopAlignmentConstraints:(id)a3;
- (void)setOffset:(double)a3;
- (void)setPresentationContextPrefersCancelActionShown:(BOOL)a3;
- (void)setPresentedAsPopover:(BOOL)a3;
- (void)setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:(id)a3;
- (void)setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:(id)a3;
- (void)setShouldHaveBackdropView:(BOOL)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setTextFieldViewControllerContainerViewHeightConstraint:(id)a3;
- (void)setTextFieldViewControllerContainerViewTopAlignmentConstraints:(id)a3;
- (void)setTextFieldViewControllerContainerViewWidthConstraint:(id)a3;
- (void)setTextFieldViewControllerViewBottomConstraint:(id)a3;
- (void)setTextFieldViewControllerViewLeftConstraint:(id)a3;
- (void)setTextFieldViewControllerViewRightConstraint:(id)a3;
- (void)setTextFieldViewControllerViewTopConstraint:(id)a3;
- (void)setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:(id)a3;
- (void)setTitleLabelTopAlignmentConstraints:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateConstraints;
- (void)updateObservations:(id)a3;
@end

@implementation _UIAlertControllerPhoneTVMacView

- (_UIAlertControllerPhoneTVMacView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    *(_WORD *)&v3->_alertControllerViewFlags &= ~0x200u;
    if (_UIAppUseModernRotationAndPresentationBehaviors())
    {
      [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    else
    {
      [(UIView *)v4 _setHostsLayoutEngine:1];
      [(UIView *)v4 setAutoresizingMask:18];
    }
    -[_UIAlertControllerPhoneTVMacView _setLayoutSize:](v4, "_setLayoutSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v4->_presentationContextPrefersCancelActionShown = 1;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    actionViews = v4->_actionViews;
    v4->_actionViews = v5;

    v4->_actionScrubbingEnabled = 1;
  }
  return v4;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIContentSizeCategoryDidChangeNotification";
  v6[1] = @"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewVisualStyle:0];
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v5 dealloc];
}

+ (void)initialize
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v17[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v3 = +[UIView appearanceWhenContainedInInstancesOfClasses:v2];

  uint64_t v16 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  objc_super v5 = +[UIView appearanceWhenContainedInInstancesOfClasses:v4];

  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(v3);
  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke(v5);
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v7 = +[UIView appearanceWhenContainedInInstancesOfClasses:v6];

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v9 = +[UIView appearanceWhenContainedInInstancesOfClasses:v8];

  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(v7);
  __46___UIAlertControllerPhoneTVMacView_initialize__block_invoke_2(v9);
  uint64_t v13 = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v11 = +[UIView appearanceWhenContainedInInstancesOfClasses:v10];

  id v12 = v11;
  [v12 setPresentationContextPrefersCancelActionShown:1];
  [v12 setPresentedAsPopover:0];
  [v12 setShouldHaveBackdropView:1];
}

- (void)updateObservations:(id)a3
{
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if (a3)
  {
    [v5 addObserver:self selector:sel__contentSizeChanged name:@"UIContentSizeCategoryDidChangeNotification" object:0];
    [v5 addObserver:self selector:sel__accessibilityColorsChanged name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];
  }
  else
  {
    [v5 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];
    [v5 removeObserver:self name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];
  }
}

- (void)setAlertController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_alertController, obj);
    id v5 = obj;
    if (obj)
    {
      [(_UIAlertControllerPhoneTVMacView *)self _prepareViewsAndAddConstraints];
      id v5 = obj;
    }
  }
  [(_UIAlertControllerPhoneTVMacView *)self updateObservations:v5];
}

- (id)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return WeakRetained;
}

- (void)_prepareViewsAndAddConstraints
{
  [(_UIAlertControllerPhoneTVMacView *)self _prepareContentView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareMainInterfaceActionsGroupView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareDiscreteCancelActionGroupView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareContentViewTopItemsView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareSeparateContentViewControllerContainerView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareHeaderContentViewControllerContainerView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareTitleLabel];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareMesssageLabel];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareDetailMessageLabel];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareContentViewControllerContainerView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareTextFieldViewControllerContainerView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareDimmingView];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareKeyboardLayoutAlignmentViews];
  [(_UIAlertControllerPhoneTVMacView *)self _applyViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyHeaderContentViewControllerContainerViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applySeparatedContentViewControllerContainerViewContraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyContentViewControllerContainerViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyTextFieldViewControllerContainerViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _prepareDimmingViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v3 updateConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyTitleAndMessageLabelVibrantContainerViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyTitleConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyMessageConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyDetailMessageConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintSpacingForExternalOffset];
  [(_UIAlertControllerPhoneTVMacView *)self _updateForPropertyChangeIfNeeded];
}

- (void)_prepareContentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = objc_alloc_init(UIView);
    id v5 = self->_contentView;
    self->_contentView = v4;

    [(UIView *)self addSubview:self->_contentView];
    contentView = self->_contentView;
  }
  [(UIView *)contentView setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_prepareContentViewTopItemsView
{
  if (!self->_contentViewTopItemsView)
  {
    objc_super v3 = objc_alloc_init(UIView);
    contentViewTopItemsView = self->_contentViewTopItemsView;
    self->_contentViewTopItemsView = v3;

    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    v6 = self->_contentViewTopItemsView;
    [(UIInterfaceActionGroupView *)mainInterfaceActionsGroupView insertArrangedHeaderView:v6 atIndex:0 scrollable:1];
  }
}

- (void)_prepareHeaderContentViewControllerContainerView
{
  if (!self->_headerContentViewControllerContainerView)
  {
    objc_super v3 = objc_alloc_init(UIView);
    headerContentViewControllerContainerView = self->_headerContentViewControllerContainerView;
    self->_headerContentViewControllerContainerView = v3;

    [(UIView *)self->_headerContentViewControllerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_headerContentViewControllerContainerView setClipsToBounds:1];
    LODWORD(v5) = 1144750080;
    [(UIView *)self->_headerContentViewControllerContainerView setContentHuggingPriority:0 forAxis:v5];
    LODWORD(v6) = 1144750080;
    [(UIView *)self->_headerContentViewControllerContainerView setContentHuggingPriority:1 forAxis:v6];
    LODWORD(v7) = 1144750080;
    [(UIView *)self->_headerContentViewControllerContainerView setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1144750080;
    [(UIView *)self->_headerContentViewControllerContainerView setContentCompressionResistancePriority:1 forAxis:v8];
    contentViewTopItemsView = self->_contentViewTopItemsView;
    v10 = self->_headerContentViewControllerContainerView;
    [(UIView *)contentViewTopItemsView addSubview:v10];
  }
}

- (void)_prepareSeparateContentViewControllerContainerView
{
  objc_super v3 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewController];
  if (v3)
  {
    separatedHeaderContentViewControllerContainerView = self->_separatedHeaderContentViewControllerContainerView;

    if (!separatedHeaderContentViewControllerContainerView)
    {
      double v5 = objc_alloc_init(UIView);
      double v6 = self->_separatedHeaderContentViewControllerContainerView;
      self->_separatedHeaderContentViewControllerContainerView = v5;

      [(UIView *)self->_separatedHeaderContentViewControllerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_separatedHeaderContentViewControllerContainerView setClipsToBounds:1];
      double v7 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionGroup];
      double v8 = [v7 _visualStyle];
      [v8 contentCornerRadius];
      double v10 = v9;

      v11 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView layer];
      [v11 setCornerRadius:v10];

      [(UIView *)self->_separatedHeaderContentViewControllerContainerView setOpaque:0];
      id v12 = self->_separatedHeaderContentViewControllerContainerView;
      uint64_t v13 = +[UIColor clearColor];
      [(UIView *)v12 setBackgroundColor:v13];

      contentView = self->_contentView;
      v15 = self->_separatedHeaderContentViewControllerContainerView;
      [(UIView *)contentView addSubview:v15];
    }
  }
}

- (void)_prepareTitleAndMessageLabelVibrantContainer
{
  if (!self->_titleAndMessageLabelVibrantContainerView
    && [(_UIAlertControllerPhoneTVMacView *)self _titleAndMessageLabelUseVibrancy])
  {
    id v6 = [(_UIAlertControllerPhoneTVMacView *)self _vibrancyEffectForTitleAndMessageLabel];
    objc_super v3 = [[UIVisualEffectView alloc] initWithEffect:v6];
    titleAndMessageLabelVibrantContainerView = self->_titleAndMessageLabelVibrantContainerView;
    self->_titleAndMessageLabelVibrantContainerView = v3;

    double v5 = [(UIVisualEffectView *)self->_titleAndMessageLabelVibrantContainerView contentView];
    [v5 setClipsToBounds:0];

    [(UIVisualEffectView *)self->_titleAndMessageLabelVibrantContainerView _setAllowsGroupFiltering:0];
    [(UIView *)self->_titleAndMessageLabelVibrantContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentViewTopItemsView addSubview:self->_titleAndMessageLabelVibrantContainerView];
  }
}

- (void)_prepareTitleLabel
{
  if (!self->_titleLabel && [(_UIAlertControllerPhoneTVMacView *)self _hasTitle])
  {
    objc_super v3 = objc_alloc_init(UILabel);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setTextAlignment:1];
    double v5 = self->_titleLabel;
    id v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    LODWORD(v7) = 1053609165;
    [(UILabel *)self->_titleLabel _setHyphenationFactor:v7];
    -[UILabel _setHyphenationFactorIgnoredIfURLsDetected:](&self->_titleLabel->super.super.super.isa, 1);
    [(UIView *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(UIView *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UIView *)self->_titleLabel setContentHuggingPriority:1 forAxis:v9];
    [(_UIAlertControllerPhoneTVMacView *)self _updateTitleLabelContents];
    [(_UIAlertControllerPhoneTVMacView *)self _updateLabelTextColor];
    [(_UIAlertControllerPhoneTVMacView *)self _updateLabelProperties];
    [(_UIAlertControllerPhoneTVMacView *)self _updateTitleLabelFontSize];
    if ([(_UIAlertControllerPhoneTVMacView *)self _titleAndMessageLabelUseVibrancy])
    {
      [(_UIAlertControllerPhoneTVMacView *)self _prepareTitleAndMessageLabelVibrantContainer];
      id v12 = [(UIVisualEffectView *)self->_titleAndMessageLabelVibrantContainerView contentView];
      [v12 addSubview:self->_titleLabel];
    }
    else
    {
      contentViewTopItemsView = self->_contentViewTopItemsView;
      v11 = self->_titleLabel;
      [(UIView *)contentViewTopItemsView addSubview:v11];
    }
  }
}

- (void)_prepareMesssageLabel
{
  if (!self->_messageLabel && [(_UIAlertControllerPhoneTVMacView *)self _hasMessage])
  {
    objc_super v3 = objc_alloc_init(UILabel);
    messageLabel = self->_messageLabel;
    self->_messageLabel = v3;

    [(UILabel *)self->_messageLabel setNumberOfLines:0];
    [(UILabel *)self->_messageLabel setTextAlignment:1];
    double v5 = self->_messageLabel;
    id v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    LODWORD(v7) = 1053609165;
    [(UILabel *)self->_messageLabel _setHyphenationFactor:v7];
    -[UILabel _setHyphenationFactorIgnoredIfURLsDetected:](&self->_messageLabel->super.super.super.isa, 1);
    [(UIView *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(UIView *)self->_messageLabel setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UIView *)self->_messageLabel setContentHuggingPriority:1 forAxis:v9];
    [(_UIAlertControllerPhoneTVMacView *)self _updateMessageLabelContents];
    [(_UIAlertControllerPhoneTVMacView *)self _updateLabelTextColor];
    [(_UIAlertControllerPhoneTVMacView *)self _updateLabelProperties];
    [(_UIAlertControllerPhoneTVMacView *)self _updateMessageLabelFontSize];
    if ([(_UIAlertControllerPhoneTVMacView *)self _titleAndMessageLabelUseVibrancy])
    {
      [(_UIAlertControllerPhoneTVMacView *)self _prepareTitleAndMessageLabelVibrantContainer];
      id v12 = [(UIVisualEffectView *)self->_titleAndMessageLabelVibrantContainerView contentView];
      [v12 addSubview:self->_messageLabel];
    }
    else
    {
      contentViewTopItemsView = self->_contentViewTopItemsView;
      v11 = self->_messageLabel;
      [(UIView *)contentViewTopItemsView addSubview:v11];
    }
  }
}

- (void)_prepareDetailMessageLabel
{
  if (!self->_detailMessageLabel && [(_UIAlertControllerPhoneTVMacView *)self _hasDetailMessage])
  {
    objc_super v3 = objc_alloc_init(UILabel);
    detailMessageLabel = self->_detailMessageLabel;
    self->_detailMessageLabel = v3;

    [(UILabel *)self->_detailMessageLabel setNumberOfLines:0];
    [(UILabel *)self->_detailMessageLabel setTextAlignment:1];
    [(UIView *)self->_detailMessageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    double v5 = self->_detailMessageLabel;
    id v6 = +[UIColor clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(_UIAlertControllerPhoneTVMacView *)self _updateDetailLabelContents];
    [(_UIAlertControllerPhoneTVMacView *)self _updateDetailLabelFontSize];
    contentView = self->_contentView;
    double v8 = self->_detailMessageLabel;
    [(UIView *)contentView addSubview:v8];
  }
}

- (void)_prepareContentViewControllerContainerView
{
  if (!self->_contentViewControllerContainerView)
  {
    objc_super v3 = objc_alloc_init(UIView);
    contentViewControllerContainerView = self->_contentViewControllerContainerView;
    self->_contentViewControllerContainerView = v3;

    [(UIView *)self->_contentViewControllerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentViewControllerContainerView setClipsToBounds:1];
    contentViewTopItemsView = self->_contentViewTopItemsView;
    id v6 = self->_contentViewControllerContainerView;
    [(UIView *)contentViewTopItemsView addSubview:v6];
  }
}

- (void)_prepareTextFieldViewControllerContainerView
{
  if (!self->_textFieldViewControllerContainerView)
  {
    objc_super v3 = objc_alloc_init(UIView);
    textFieldViewControllerContainerView = self->_textFieldViewControllerContainerView;
    self->_textFieldViewControllerContainerView = v3;

    [(UIView *)self->_textFieldViewControllerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_textFieldViewControllerContainerView setClipsToBounds:1];
    contentViewTopItemsView = self->_contentViewTopItemsView;
    id v6 = self->_textFieldViewControllerContainerView;
    [(UIView *)contentViewTopItemsView addSubview:v6];
  }
}

- (void)_prepareMainInterfaceActionsGroupView
{
  if (!self->_mainInterfaceActionsGroupView)
  {
    objc_super v3 = +[UIInterfaceActionGroup actionGroupWithActionsBySection:MEMORY[0x1E4F1CBF0]];
    v4 = [_UIAlertControllerInterfaceActionGroupView alloc];
    double v5 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    id v6 = [(_UIAlertControllerInterfaceActionGroupView *)v4 initWithAlertController:v5 actionGroup:v3 actionHandlerInvocationDelegate:self];
    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    self->_mainInterfaceActionsGroupView = v6;

    [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView setSpringLoaded:[(_UIAlertControllerPhoneTVMacView *)self isSpringLoaded]];
    [(UIView *)self->_mainInterfaceActionsGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentView addSubview:self->_mainInterfaceActionsGroupView];
  }
  BOOL v8 = [(_UIAlertControllerPhoneTVMacView *)self actionScrubbingEnabled];
  double v9 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionSelectionController];
  [v9 setScrubbingEnabled:v8];

  [(UIView *)self->_mainInterfaceActionsGroupView setSemanticContentAttribute:3];
  [(_UIAlertControllerPhoneTVMacView *)self _updateActionsGroupPresentationStyles];
}

- (void)_prepareDiscreteCancelActionGroupView
{
  if (!self->_discreteCancelActionGroupView)
  {
    objc_super v3 = +[UIInterfaceActionGroup actionGroupWithActionsBySection:MEMORY[0x1E4F1CBF0]];
    v4 = [_UIAlertControllerInterfaceActionGroupView alloc];
    double v5 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    id v6 = [(_UIAlertControllerInterfaceActionGroupView *)v4 initWithAlertController:v5 actionGroup:v3 actionHandlerInvocationDelegate:self];
    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    self->_discreteCancelActionGroupView = v6;

    BOOL v8 = [(UIView *)self->_mainInterfaceActionsGroupView focusGroupIdentifier];
    [(UIView *)self->_discreteCancelActionGroupView setFocusGroupIdentifier:v8];

    [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView setSpringLoaded:[(_UIAlertControllerPhoneTVMacView *)self isSpringLoaded]];
    [(UIView *)self->_discreteCancelActionGroupView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v9 = [(UIView *)self->_discreteCancelActionGroupView widthAnchor];
    double v10 = [v9 constraintEqualToConstant:0.0];
    [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewWidthConstraint:v10];

    v11 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewWidthConstraint];
    LODWORD(v12) = 1148829696;
    [v11 setPriority:v12];

    uint64_t v13 = self->_discreteCancelActionGroupView;
    v14 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewWidthConstraint];
    [(UIView *)v13 addConstraint:v14];

    v15 = [(UIView *)self->_discreteCancelActionGroupView heightAnchor];
    uint64_t v16 = [v15 constraintEqualToConstant:0.0];
    [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewHeightConstraint:v16];

    v17 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewHeightConstraint];
    LODWORD(v18) = 1144750080;
    [v17 setPriority:v18];

    v19 = self->_discreteCancelActionGroupView;
    v20 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewHeightConstraint];
    [(UIView *)v19 addConstraint:v20];
  }
  BOOL v21 = [(_UIAlertControllerPhoneTVMacView *)self actionScrubbingEnabled];
  id v22 = [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView actionSelectionController];
  [v22 setScrubbingEnabled:v21];
}

- (void)setActionScrubbingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_actionScrubbingEnabled = a3;
  double v5 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionSelectionController];
  [v5 setScrubbingEnabled:v3];

  id v6 = [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView actionSelectionController];
  [v6 setScrubbingEnabled:v3];
}

- (id)_newStyledBackgroundView
{
  return [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView _newActionGroupBackgroundView];
}

- (void)_updateActionsGroupPresentationStyles
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v4 = [v3 _resolvedStyle];
  if (v4 == 1000) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4 == 0;
  }

  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView setPresentationStyle:v5];
  discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
  [(UIInterfaceActionGroupView *)discreteCancelActionGroupView setPresentationStyle:v5];
}

- (void)_prepareDimmingView
{
  if (!self->_dimmingView)
  {
    BOOL v3 = objc_alloc_init(UIView);
    dimmingView = self->_dimmingView;
    self->_dimmingView = v3;

    [(UIView *)self->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v5 = self->_dimmingView;
    id v6 = +[UIColor _alertControllerDimmingViewColor];
    [(UIView *)v5 setBackgroundColor:v6];

    double v7 = self->_dimmingView;
    id v9 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    BOOL v8 = [v9 _dismissGestureRecognizer];
    [(UIView *)v7 addGestureRecognizer:v8];
  }
}

- (void)_prepareKeyboardLayoutAlignmentViews
{
  if (!self->_keyboardLayoutAlignmentView
    && !+[UIAlertController _shouldUsePresentationController])
  {
    BOOL v3 = objc_alloc_init(_UIKeyboardLayoutAlignmentView);
    keyboardLayoutAlignmentView = self->_keyboardLayoutAlignmentView;
    self->_keyboardLayoutAlignmentView = v3;

    uint64_t v5 = objc_alloc_init(UIView);
    keyboardLayoutAlignmentAvailableSpaceView = self->_keyboardLayoutAlignmentAvailableSpaceView;
    self->_keyboardLayoutAlignmentAvailableSpaceView = v5;

    [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView setUserInteractionEnabled:0];
    double v7 = self->_keyboardLayoutAlignmentAvailableSpaceView;
    [(UIView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)_applyViewConstraints
{
  BOOL v3 = [(UIView *)self->_contentView centerXAnchor];
  uint64_t v4 = [(UIView *)self centerXAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  [(UIView *)self addConstraint:v5];

  if (+[UIAlertController _shouldUsePresentationController])
  {
    id v6 = [(UIView *)self->_contentView centerYAnchor];
    double v7 = [(UIView *)self centerYAnchor];
    BOOL v8 = [v6 constraintEqualToAnchor:v7];

    [(UIView *)self addConstraint:v8];
  }
  id v9 = [(UIView *)self->_mainInterfaceActionsGroupView widthAnchor];
  double v10 = [(UIView *)self->_contentView widthAnchor];
  id v28 = [v9 constraintEqualToAnchor:v10];

  LODWORD(v11) = 1148829696;
  [v28 setPriority:v11];
  [(UIView *)self->_contentView addConstraint:v28];
  [(_UIAlertControllerPhoneTVMacView *)self setActionGroupEqualsContentViewWidthConstraint:v28];
  contentView = self->_contentView;
  uint64_t v13 = [(UIView *)contentView heightAnchor];
  v14 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v14 minimumContentHeight];
  v15 = objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:");
  [(UIView *)contentView addConstraint:v15];

  uint64_t v16 = [(UIView *)self->_contentViewControllerContainerView widthAnchor];
  v17 = [v16 constraintLessThanOrEqualToConstant:0.0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentScrollViewMaximumWidthConstraint:v17];

  double v18 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumWidthConstraint];
  LODWORD(v19) = 1148846080;
  [v18 setPriority:v19];

  v20 = [(UIView *)self->_contentView heightAnchor];
  BOOL v21 = [v20 constraintLessThanOrEqualToConstant:0.0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewMaxHeightConstraint:v21];

  id v22 = [(UIView *)self->_contentViewTopItemsView heightAnchor];
  v23 = [v22 constraintLessThanOrEqualToConstant:0.0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentScrollViewMaximumHeightConstraint:v23];

  v24 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
  LODWORD(v25) = 1148846080;
  [v24 setPriority:v25];

  contentViewTopItemsView = self->_contentViewTopItemsView;
  v27 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
  [(UIView *)contentViewTopItemsView addConstraint:v27];
}

- (void)_prepareDimmingViewConstraints
{
  _NSDictionaryOfVariableBindings(&cfstr_DimmingviewSel.isa, self->_dimmingView, self, self->_contentView, 0);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_dimmingViewConstraints)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(UIView *)self->_dimmingView centerXAnchor];
    uint64_t v5 = [(UIView *)self centerXAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    [v3 addObject:v6];

    double v7 = [(UIView *)self->_dimmingView centerYAnchor];
    BOOL v8 = [(UIView *)self centerYAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8];
    [v3 addObject:v9];

    double v10 = [(UIView *)self->_dimmingView widthAnchor];
    double v11 = [(UIView *)self widthAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11];
    [v3 addObject:v12];

    uint64_t v13 = [(UIView *)self->_dimmingView heightAnchor];
    v14 = [(UIView *)self heightAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v3 addObject:v15];

    _UIConstraintsBySortingConstraintsForInsertionPerformance(v3, v16);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraints = self->_dimmingViewConstraints;
    self->_dimmingViewConstraints = v17;
  }
  if (!self->_dimmingViewConstraintsForActionSheetStyle)
  {
    double v19 = [MEMORY[0x1E4F1CA48] array];
    v20 = [MEMORY[0x1E4F1CA48] array];
    BOOL v21 = [MEMORY[0x1E4F1CA48] array];
    id v22 = [(UIView *)self->_contentView topAnchor];
    v23 = [(UIView *)self topAnchor];
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23];

    double v25 = [(UIView *)self->_contentView bottomAnchor];
    v26 = [(UIView *)self bottomAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];

    [v19 addObject:v24];
    [v19 addObject:v27];
    [v20 addObject:v24];
    [v21 addObject:v27];
    _UIConstraintsBySortingConstraintsForInsertionPerformance(v19, v28);
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraintsForActionSheetStyle = self->_dimmingViewConstraintsForActionSheetStyle;
    self->_dimmingViewConstraintsForActionSheetStyle = v29;

    _UIConstraintsBySortingConstraintsForInsertionPerformance(v20, v31);
    v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewForegroundViewTopConstraints = self->_dimmingViewForegroundViewTopConstraints;
    self->_dimmingViewForegroundViewTopConstraints = v32;

    _UIConstraintsBySortingConstraintsForInsertionPerformance(v21, v34);
    v35 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewForegroundViewBottomConstraints = self->_dimmingViewForegroundViewBottomConstraints;
    self->_dimmingViewForegroundViewBottomConstraints = v35;
  }
  if (!self->_dimmingViewConstraintsForAlertStyle)
  {
    v37 = [MEMORY[0x1E4F1CA48] array];
    v38 = [(UIView *)self->_contentView centerYAnchor];
    v39 = [(UIView *)self centerYAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];

    LODWORD(v41) = 1144750080;
    [v40 setPriority:v41];
    [v37 addObject:v40];
    v42 = [(UIView *)self->_contentView topAnchor];
    v43 = [(UIView *)self topAnchor];
    v44 = [v42 constraintGreaterThanOrEqualToAnchor:v43];
    [v37 addObject:v44];

    v45 = [(UIView *)self->_contentView bottomAnchor];
    v46 = [(UIView *)self bottomAnchor];
    v47 = [v45 constraintLessThanOrEqualToAnchor:v46];
    [v37 addObject:v47];

    _UIConstraintsBySortingConstraintsForInsertionPerformance(v37, v48);
    v49 = (NSArray *)objc_claimAutoreleasedReturnValue();
    dimmingViewConstraintsForAlertStyle = self->_dimmingViewConstraintsForAlertStyle;
    self->_dimmingViewConstraintsForAlertStyle = v49;
  }
  if (!self->_noDimmingViewConstraints)
  {
    v51 = [MEMORY[0x1E4F1CA48] array];
    v52 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:[self(>=_contentView)]" options:0 metrics:0 views:v64];
    [v51 addObjectsFromArray:v52];

    v53 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:[self(==_contentView)]" options:0 metrics:0 views:v64];
    [v51 addObjectsFromArray:v53];

    if (!+[UIAlertController _shouldUsePresentationController])
    {
      v54 = [(UIView *)self->_contentView centerYAnchor];
      v55 = [(UIView *)self centerYAnchor];
      v56 = [v54 constraintEqualToAnchor:v55];
      [v51 addObject:v56];
    }
    v57 = [(UIView *)self widthAnchor];
    v58 = [(UIView *)self->_contentView widthAnchor];
    v59 = [v57 constraintEqualToAnchor:v58];

    LODWORD(v60) = 1111752704;
    [v59 setPriority:v60];
    [v51 addObject:v59];
    _UIConstraintsBySortingConstraintsForInsertionPerformance(v51, v61);
    v62 = (NSArray *)objc_claimAutoreleasedReturnValue();
    noDimmingViewConstraints = self->_noDimmingViewConstraints;
    self->_noDimmingViewConstraints = v62;
  }
  if (+[UIAlertController _shouldUsePresentationController])
  {
    [MEMORY[0x1E4F5B268] activateConstraints:self->_noDimmingViewConstraints];
  }
}

- (void)_applyKeyboardAlignmentViewsConstraints
{
  if (!+[UIAlertController _shouldUsePresentationController])
  {
    id v23 = [MEMORY[0x1E4F1CA48] array];
    BOOL v3 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView leftAnchor];
    uint64_t v4 = [(UIView *)self leftAnchor];
    uint64_t v5 = [v3 constraintEqualToAnchor:v4];

    id v6 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView rightAnchor];
    double v7 = [(UIView *)self rightAnchor];
    BOOL v8 = [v6 constraintEqualToAnchor:v7];

    id v9 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView topAnchor];
    double v10 = [(UIView *)self topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];

    double v12 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView bottomAnchor];
    uint64_t v13 = [(UIView *)self->_keyboardLayoutAlignmentView topAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];

    v15 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView bottomAnchor];
    uint64_t v16 = [(UIView *)self bottomAnchor];
    v17 = [v15 constraintLessThanOrEqualToAnchor:v16];

    [v23 addObject:v5];
    [v23 addObject:v8];
    [v23 addObject:v11];
    [v23 addObject:v14];
    [v23 addObject:v17];
    double v18 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    uint64_t v19 = [v18 _resolvedStyle];

    if (v19 == 1)
    {
      v20 = [(UIView *)self->_contentView centerYAnchor];
      BOOL v21 = [(UIView *)self->_keyboardLayoutAlignmentAvailableSpaceView centerYAnchor];
      id v22 = [v20 constraintEqualToAnchor:v21];

      [v23 addObject:v22];
    }
    [(UIView *)self addConstraints:v23];
  }
}

- (void)_applySeparatedContentViewControllerContainerViewContraints
{
  BOOL v3 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView centerXAnchor];
  uint64_t v4 = [(UIView *)self->_contentView centerXAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  id v8 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView widthAnchor];
  id v6 = [(UIView *)self->_contentView widthAnchor];
  double v7 = [v8 constraintLessThanOrEqualToAnchor:v6];
  [v7 setActive:1];
}

- (void)_applyHeaderContentViewControllerContainerViewConstraints
{
  BOOL v3 = [(UIView *)self->_headerContentViewControllerContainerView centerXAnchor];
  uint64_t v4 = [(UIView *)self->_contentView centerXAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  id v6 = [(UIView *)self->_headerContentViewControllerContainerView widthAnchor];
  double v7 = [(UIView *)self->_contentView widthAnchor];
  id v8 = [v6 constraintLessThanOrEqualToAnchor:v7];
  [v8 setActive:1];

  id v9 = [(UIView *)self->_contentView widthAnchor];
  double v10 = [(UIView *)self->_headerContentViewControllerContainerView widthAnchor];
  id v12 = [v9 constraintEqualToAnchor:v10];

  LODWORD(v11) = 1144733696;
  [v12 setPriority:v11];
  [v12 setActive:1];
}

- (void)_setupHorizontalConstraintsForLabelView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 centerXAnchor];
  id v6 = [(UIView *)self->_contentViewTopItemsView centerXAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v11 = [v4 widthAnchor];

  id v8 = [(UIView *)self->_contentViewTopItemsView widthAnchor];
  [(_UIAlertControllerPhoneTVMacView *)self _labelHorizontalInsets];
  double v10 = [v11 constraintEqualToAnchor:v8 multiplier:1.0 constant:v9 * -2.0];
  [v10 setActive:1];
}

- (void)_applyTitleAndMessageLabelVibrantContainerViewConstraints
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTitle]
    || [(_UIAlertControllerPhoneTVMacView *)self _hasMessage])
  {
    if (self->_titleAndMessageLabelVibrantContainerView)
    {
      __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
      if ((alertControllerViewFlags & 1) == 0)
      {
        *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags | 1;
        titleAndMessageLabelVibrantContainerView = self->_titleAndMessageLabelVibrantContainerView;
        [(_UIAlertControllerPhoneTVMacView *)self _setupHorizontalConstraintsForLabelView:titleAndMessageLabelVibrantContainerView];
      }
    }
  }
}

- (void)_applyTitleConstraints
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTitle])
  {
    __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 2) == 0)
    {
      *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags | 2;
      titleLabel = self->_titleLabel;
      [(_UIAlertControllerPhoneTVMacView *)self _setupHorizontalConstraintsForLabelView:titleLabel];
    }
  }
}

- (void)_applyMessageConstraints
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasMessage])
  {
    __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 4) == 0)
    {
      *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags | 4;
      messageLabel = self->_messageLabel;
      [(_UIAlertControllerPhoneTVMacView *)self _setupHorizontalConstraintsForLabelView:messageLabel];
    }
  }
}

- (void)_applyDetailMessageConstraints
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDetailMessage])
  {
    __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
    if ((alertControllerViewFlags & 8) == 0)
    {
      *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags | 8;
      id v4 = [(UIView *)self->_detailMessageLabel centerXAnchor];
      uint64_t v5 = [(UIView *)self->_contentView centerXAnchor];
      id v6 = [v4 constraintEqualToAnchor:v5];
      [v6 setActive:1];

      id v10 = [(UIView *)self->_detailMessageLabel widthAnchor];
      double v7 = [(UIView *)self->_contentView widthAnchor];
      [(_UIAlertControllerPhoneTVMacView *)self _labelHorizontalInsets];
      double v9 = [v10 constraintEqualToAnchor:v7 multiplier:1.0 constant:v8 * -2.0];
      [v9 setActive:1];
    }
  }
}

- (void)_applyContentViewControllerContainerViewConstraints
{
  contentView = self->_contentView;
  id v4 = [(UIView *)self->_contentViewControllerContainerView centerXAnchor];
  uint64_t v5 = [(UIView *)self->_contentView centerXAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];
  [(UIView *)contentView addConstraint:v6];

  double v7 = self->_contentView;
  double v8 = [(UIView *)self->_contentViewControllerContainerView widthAnchor];
  double v9 = [(UIView *)self->_contentView widthAnchor];
  id v10 = [v8 constraintLessThanOrEqualToAnchor:v9];
  [(UIView *)v7 addConstraint:v10];

  id v11 = self->_contentView;
  id v13 = [(UIView *)self->_contentViewControllerContainerView widthAnchor];
  id v12 = [v13 constraintGreaterThanOrEqualToConstant:0.0];
  [(UIView *)v11 addConstraint:v12];
}

- (void)_applyTextFieldViewControllerContainerViewConstraints
{
  BOOL v3 = [(UIView *)self->_textFieldViewControllerContainerView widthAnchor];
  id v4 = [(UIView *)self->_contentViewTopItemsView widthAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  textFieldViewControllerContainerViewWidthConstraint = self->_textFieldViewControllerContainerViewWidthConstraint;
  self->_textFieldViewControllerContainerViewWidthConstraint = v5;

  double v7 = [(UIView *)self->_textFieldViewControllerContainerView heightAnchor];
  double v8 = [v7 constraintEqualToConstant:0.0];
  textFieldViewControllerContainerViewHeightConstraint = self->_textFieldViewControllerContainerViewHeightConstraint;
  self->_textFieldViewControllerContainerViewHeightConstraint = v8;

  contentView = self->_contentView;
  id v11 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewWidthConstraint];
  [(UIView *)contentView addConstraint:v11];

  id v12 = self->_contentView;
  id v13 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewHeightConstraint];
  [(UIView *)v12 addConstraint:v13];

  v14 = self->_contentView;
  id v17 = [(UIView *)self->_textFieldViewControllerContainerView centerXAnchor];
  v15 = [(UIView *)self->_contentView centerXAnchor];
  uint64_t v16 = [v17 constraintEqualToAnchor:v15];
  [(UIView *)v14 addConstraint:v16];
}

- (BOOL)_buttonsAreTopMost
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTitle]
    || [(_UIAlertControllerPhoneTVMacView *)self _hasMessage])
  {
    return 0;
  }
  id v4 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];
  BOOL v3 = v4 == 0;

  return v3;
}

- (CGSize)_sizeForLayoutWidthDetermination
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self presentedAsPopover];
  id v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v3)
  {
    uint64_t v6 = 0x407E000000000000;
    uint64_t v7 = 0x4074000000000000;
  }
  else
  {
    double v8 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    double v9 = [v8 _existingPresentationControllerImmediate:0 effective:1];
    id v10 = [v9 containerView];

    [(_UIAlertControllerPhoneTVMacView *)self _layoutSize];
    if (v12 == *MEMORY[0x1E4F1DB30] && v11 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      [v10 bounds];
      uint64_t v7 = v16;
      uint64_t v6 = v17;
    }
    else
    {
      [(_UIAlertControllerPhoneTVMacView *)self _layoutSize];
      uint64_t v7 = v14;
      uint64_t v6 = v15;
    }
  }
  double v18 = *(double *)&v7;
  double v19 = *(double *)&v6;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)_verticalLayoutWidth
{
  [(_UIAlertControllerPhoneTVMacView *)self _sizeForLayoutWidthDetermination];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(UIView *)self traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v4 < v6 || v8 == 3) {
    double v6 = v4;
  }
  id v10 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v10 minimumWidth];
  double v12 = v11;

  if (v12 > 0.0)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _minimumSizeForAllActions];
    if (v13 < v12) {
      double v13 = v12;
    }
    if (v13 >= v4) {
      return v4;
    }
    else {
      return v13;
    }
  }
  return v6;
}

- (BOOL)_horizontalLayoutCanUseFullWidth
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  if ([v3 _resolvedStyle])
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [(_UIAlertControllerPhoneTVMacView *)self actions];
    BOOL v4 = (unint64_t)[v5 count] > 2;
  }
  return v4;
}

- (double)_minimumWidthFittingAlertContents
{
  [(_UIAlertControllerPhoneTVMacView *)self _minimumSizeForAllActions];
  double v4 = v3;
  [(_UIAlertControllerPhoneTVMacView *)self _applyTitleAndMessageLabelVibrantContainerViewConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyTitleConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyMessageConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _applyDetailMessageConstraints];
  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintSpacingForExternalOffset];
  [(_UIAlertControllerPhoneTVMacView *)self _updateForPropertyChangeIfNeeded];
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
  [v5 setActive:0];

  [(_UIAlertControllerPhoneTVMacView *)self _contentViewControllerSize];
  double v7 = v6;
  double v9 = v8;
  id v10 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];
  [v10 preferredContentSize];
  double v12 = v11;
  double v14 = v13;

  if (v7 < v12) {
    double v7 = v12;
  }
  uint64_t v15 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  objc_msgSend(v15, "minimumWidthFittingContentView:titleLabel:minimumWidthForAllActions:preferredSizeForContentContainers:", self->_contentViewTopItemsView, self->_titleLabel, v4, v7, v9 + v14);
  double v17 = v16;

  double v18 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
  [v18 setActive:1];

  return v17;
}

- (double)_availableWidthForHorizontalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  int v6 = [v5 definesWidthByContentFitting];

  double v7 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v7 maximumWidth];
  double v9 = v8;

  if (v6)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _minimumWidthFittingAlertContents];
  }
  else if (v9 <= 0.0)
  {
    if (v3
      && [(_UIAlertControllerPhoneTVMacView *)self _horizontalLayoutCanUseFullWidth])
    {
      [(_UIAlertControllerPhoneTVMacView *)self _sizeForLayoutWidthDetermination];
    }
    else
    {
      [(_UIAlertControllerPhoneTVMacView *)self _verticalLayoutWidth];
    }
    double v12 = v11;
    [(_UIAlertControllerPhoneTVMacView *)self _contentInsets];
    double result = v12 - (v13 + v14);
  }
  else
  {
    [(_UIAlertControllerPhoneTVMacView *)self _maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:v9];
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (UIEdgeInsets)_contentInsets
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  double v4 = [(UIView *)self superview];
  [v3 contentInsetsForContainerView:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (double)_layoutWidthForHorizontalLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIAlertControllerPhoneTVMacView *)self _contentViewControllerSize];
  double v6 = v5;
  double v7 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  int v8 = [v7 _shouldFitWidthToContentViewControllerWidth];

  if (v8) {
    return v6;
  }
  [(_UIAlertControllerPhoneTVMacView *)self _availableWidthForHorizontalLayout:v3];
  return result;
}

- (double)_idealLayoutWidth
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  unint64_t v4 = ((unint64_t)[v3 permittedActionLayoutDirection] >> 1) & 1;

  [(_UIAlertControllerPhoneTVMacView *)self _availableWidthForHorizontalLayout:v4];
  return result;
}

- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3 visualStyleRequiresActionRepresentationToFitItemSize:(BOOL *)a4
{
  BOOL v5 = a3;
  [(_UIAlertControllerPhoneTVMacView *)self _minimumSizeForAllActions];
  double v8 = v7;
  double v10 = v9;
  [(_UIAlertControllerPhoneTVMacView *)self _idealLayoutWidth];
  double v12 = v11;
  if (!v5)
  {
    v27 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    [v27 actionWidthForMinimumActionWidth:v8 availableWidth:v12];
    double v26 = v28;

    if (v26 <= 0.0)
    {
      [(_UIAlertControllerPhoneTVMacView *)self _contentInsets];
      double v30 = v29;
      double v32 = v31;
      [(_UIAlertControllerPhoneTVMacView *)self _verticalLayoutWidth];
      BOOL v25 = 0;
      double v26 = v33 - (v30 + v32);
      if (!a4) {
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v25 = 1;
      if (!a4) {
        goto LABEL_13;
      }
    }
LABEL_12:
    *a4 = v25;
    goto LABEL_13;
  }
  uint64_t v13 = [(_UIAlertControllerPhoneTVMacView *)self _numberOfActionsForMainActionButtonSequenceView];
  double v14 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v14 actionSequenceEdgeInsets];
  double v16 = v15;
  double v17 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v17 actionSequenceEdgeInsets];
  double v19 = v12 - (v16 + v18);

  v20 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v20 actionSpacingForHorizontalLayout:1];
  double v22 = (double)(v13 - 1);
  if (v22 < 0.0) {
    double v22 = 0.0;
  }
  double v23 = v19 - v22 * v21;

  if ([(_UIAlertControllerPhoneTVMacView *)self hasDiscreteHorizontalCancelAction])
  {
    ++v13;
    [(_UIAlertControllerPhoneTVMacView *)self _contentInsets];
    double v23 = v23 - v24;
  }
  BOOL v25 = 0;
  double v26 = v23 / (double)v13;
  if (a4) {
    goto LABEL_12;
  }
LABEL_13:
  double v34 = v26;
  double v35 = v10;
  result.height = v35;
  result.width = v34;
  return result;
}

- (CGSize)_itemSizeForHorizontalLayout:(BOOL)a3
{
  [(_UIAlertControllerPhoneTVMacView *)self _itemSizeForHorizontalLayout:a3 visualStyleRequiresActionRepresentationToFitItemSize:0];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_mainActionButtonSequenceViewSizeForHorizontalLayout:(BOOL)a3 itemSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  BOOL v6 = a3;
  uint64_t v8 = [(_UIAlertControllerPhoneTVMacView *)self _numberOfActionsForMainActionButtonSequenceView];
  double v9 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v9 actionSequenceEdgeInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v13 + v17;
  double v19 = v11 + v15;
  [(_UIAlertControllerPhoneTVMacView *)self _spaceRequiredForActionSectionsSpacing];
  double v21 = v20;
  double v22 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v22 actionSpacingForHorizontalLayout:v6];
  double v24 = (double)(v8 - 1);
  if (v24 < 0.0) {
    double v24 = 0.0;
  }
  double v25 = v24 * v23;

  double v26 = width + v18;
  if (v6)
  {
    double v26 = v21 + width * (double)v8 + v18 + v25;
    double v27 = height + v19;
  }
  else
  {
    double v27 = v21 + height * (double)v8 + v19 + v25;
  }
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (BOOL)_canLayOutActionsHorizontally
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  char v4 = [v3 permittedActionLayoutDirection];

  BOOL result = (v4 & 2) != 0
        && ([(_UIAlertControllerPhoneTVMacView *)self _itemSizeForHorizontalLayout:1], double v6 = v5, [(_UIAlertControllerPhoneTVMacView *)self _minimumSizeForAllActions], v6 >= v7)&& [(_UIAlertControllerPhoneTVMacView *)self _numberOfActionsForMainActionButtonSequenceView] > 0;
  return result;
}

- (id)_discreteCancelActionView
{
  if ([(_UIAlertControllerPhoneTVMacView *)self cancelActionIsDiscrete])
  {
    double v3 = [(_UIAlertControllerPhoneTVMacView *)self __cancelActionView];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)_hasDiscreteCancelAction
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
  BOOL v4 = v3
    && [(_UIAlertControllerPhoneTVMacView *)self showsCancelAction]
    && [(_UIAlertControllerPhoneTVMacView *)self cancelActionIsDiscrete];

  return v4;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintSpacingForExternalOffset];
}

- (void)_updateConstraintSpacingForExternalOffset
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v4 = [v3 _resolvedStyle];

  if (!v4)
  {
    [(_UIAlertControllerPhoneTVMacView *)self offset];
    double v6 = v5;
    if ([(_UIAlertControllerPhoneTVMacView *)self _hasDiscreteCancelAction]
      && ![(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally])
    {
      [(_UIAlertControllerPhoneTVMacView *)self _marginBetweenInterfaceActionGroups];
      double v7 = v6 * -0.5;
      double v12 = v7 + v11;
      uint64_t v8 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewTopConstraint];
      double v9 = v8;
      double v10 = v12;
    }
    else
    {
      double v7 = -v6;
      uint64_t v8 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewTopConstraint];
      double v9 = v8;
      double v10 = 0.0;
    }
    [v8 setConstant:v10];

    id v13 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];
    [v13 setConstant:v7];
  }
}

- (void)_recomputeAlertControllerWidth
{
  double v3 = [(UIView *)self window];

  if (v3)
  {
    BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally];
    double v5 = [(_UIAlertControllerPhoneTVMacView *)self foregroundViewWidthConstraint];

    if (!v5)
    {
      double v6 = [(UIView *)self->_contentView widthAnchor];
      [(_UIAlertControllerPhoneTVMacView *)self _layoutWidthForHorizontalLayout:v4];
      double v7 = objc_msgSend(v6, "constraintEqualToConstant:");
      [(_UIAlertControllerPhoneTVMacView *)self setForegroundViewWidthConstraint:v7];

      contentView = self->_contentView;
      double v9 = [(_UIAlertControllerPhoneTVMacView *)self foregroundViewWidthConstraint];
      [(UIView *)contentView addConstraint:v9];
    }
    id v10 = [(_UIAlertControllerPhoneTVMacView *)self foregroundViewWidthConstraint];
    [(_UIAlertControllerPhoneTVMacView *)self _layoutWidthForHorizontalLayout:v4];
    objc_msgSend(v10, "setConstant:");
  }
}

- (void)_configureActionGroupViewToAllowHorizontalLayout:(BOOL)a3
{
  if (a3) {
    double v3 = &unk_1ED3EF9E0;
  }
  else {
    double v3 = &unk_1ED3EF9F8;
  }
  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView setAllowedActionLayoutAxisByPriority:v3];
}

- (void)_actionLayoutDirectionChanged
{
  v74[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally];
  [(_UIAlertControllerPhoneTVMacView *)self _recomputeAlertControllerWidth];
  [(_UIAlertControllerPhoneTVMacView *)self _configureActionGroupViewToAllowHorizontalLayout:v3];
  char v73 = 0;
  [(_UIAlertControllerPhoneTVMacView *)self _itemSizeForHorizontalLayout:v3 visualStyleRequiresActionRepresentationToFitItemSize:&v73];
  double v5 = v4;
  -[_UIAlertControllerPhoneTVMacView _mainActionButtonSequenceViewSizeForHorizontalLayout:itemSize:](self, "_mainActionButtonSequenceViewSizeForHorizontalLayout:itemSize:", v3);
  double v7 = v6;
  double v9 = v8;
  id v10 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewWidthConstraint];

  if (!v10)
  {
    double v11 = [(UIView *)self->_mainInterfaceActionsGroupView widthAnchor];
    double v12 = [v11 constraintEqualToConstant:0.0];
    [(_UIAlertControllerPhoneTVMacView *)self setMainActionButtonSequenceViewWidthConstraint:v12];

    id v13 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewWidthConstraint];
    LODWORD(v14) = 1148813312;
    [v13 setPriority:v14];

    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    double v16 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewWidthConstraint];
    [(UIView *)mainInterfaceActionsGroupView addConstraint:v16];
  }
  double v17 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewWidthConstraint];
  [v17 setConstant:v7];

  double v18 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHeightConstraint];

  if (!v18)
  {
    double v19 = [(UIView *)self->_mainInterfaceActionsGroupView heightAnchor];
    double v20 = [v19 constraintEqualToConstant:0.0];
    [(_UIAlertControllerPhoneTVMacView *)self setMainActionButtonSequenceViewHeightConstraint:v20];

    double v21 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHeightConstraint];
    LODWORD(v22) = 1132003328;
    [v21 setPriority:v22];

    double v23 = self->_mainInterfaceActionsGroupView;
    double v24 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHeightConstraint];
    [(UIView *)v23 addConstraint:v24];
  }
  double v25 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHeightConstraint];
  [v25 setConstant:v9];

  if (v3) {
    uint64_t v26 = 5;
  }
  else {
    uint64_t v26 = 9;
  }
  uint64_t v27 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHorizontalAlignmentConstraint];
  if (v27)
  {
    double v28 = (void *)v27;
    double v29 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHorizontalAlignmentConstraint];
    uint64_t v30 = [v29 firstAttribute];

    if (v30 != v26)
    {
      contentView = self->_contentView;
      double v32 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHorizontalAlignmentConstraint];
      [(UIView *)contentView removeConstraint:v32];

      [(_UIAlertControllerPhoneTVMacView *)self setMainActionButtonSequenceViewHorizontalAlignmentConstraint:0];
    }
  }
  double v33 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHorizontalAlignmentConstraint];

  if (!v33)
  {
    double v34 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_mainInterfaceActionsGroupView attribute:v26 relatedBy:0 toItem:self->_contentView attribute:v26];
    [(_UIAlertControllerPhoneTVMacView *)self setMainActionButtonSequenceViewHorizontalAlignmentConstraint:v34];

    double v35 = self->_contentView;
    v36 = [(_UIAlertControllerPhoneTVMacView *)self mainActionButtonSequenceViewHorizontalAlignmentConstraint];
    [(UIView *)v35 addConstraint:v36];
  }
  v37 = [(_UIAlertControllerPhoneTVMacView *)self discreteActionGroupViewHorizontalLayoutTrailingConstraint];

  if (!v37)
  {
    v38 = [(UIView *)self->_discreteCancelActionGroupView trailingAnchor];
    v39 = [(UIView *)self->_contentView trailingAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    [(_UIAlertControllerPhoneTVMacView *)self setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:v40];
  }
  double v41 = [(_UIAlertControllerPhoneTVMacView *)self _discreteCancelActionView];

  if (v41) {
    BOOL v42 = v3;
  }
  else {
    BOOL v42 = 0;
  }
  v43 = [(_UIAlertControllerPhoneTVMacView *)self discreteActionGroupViewHorizontalLayoutTrailingConstraint];
  [v43 setActive:v42];

  v44 = [(_UIAlertControllerPhoneTVMacView *)self actionGroupEqualsContentViewWidthConstraint];
  [v44 setActive:v3 ^ 1];

  if (v41)
  {
    BOOL v45 = [(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally];
    v46 = (void *)MEMORY[0x1E4F5B268];
    v47 = (void *)MEMORY[0x1E4F1C978];
    v48 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewTopConstraint];
    v49 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewLeadingConstraint];
    v50 = objc_msgSend(v47, "arrayWithObjects:", v48, v49, 0);
    [v46 deactivateConstraints:v50];

    v51 = [(UIView *)self->_discreteCancelActionGroupView topAnchor];
    v52 = self->_mainInterfaceActionsGroupView;
    if (v45)
    {
      v53 = [(UIView *)v52 topAnchor];
      v54 = [v51 constraintEqualToAnchor:v53 constant:0.0];
      [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewTopConstraint:v54];

      v55 = [(UIView *)self->_discreteCancelActionGroupView leadingAnchor];
      v56 = [(UIView *)self->_mainInterfaceActionsGroupView trailingAnchor];
      [(_UIAlertControllerPhoneTVMacView *)self _marginBetweenInterfaceActionGroups];
      v57 = objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56);
      double v7 = v5;
    }
    else
    {
      v58 = [(UIView *)v52 bottomAnchor];
      [(_UIAlertControllerPhoneTVMacView *)self _marginBetweenInterfaceActionGroups];
      v59 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", v58);
      [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewTopConstraint:v59];

      v55 = [(UIView *)self->_discreteCancelActionGroupView leadingAnchor];
      v56 = [(UIView *)self->_mainInterfaceActionsGroupView leadingAnchor];
      v57 = [v55 constraintEqualToAnchor:v56 constant:0.0];
    }
    [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewLeadingConstraint:v57];

    [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintSpacingForExternalOffset];
    double v60 = (void *)MEMORY[0x1E4F5B268];
    v61 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewTopConstraint];
    v74[0] = v61;
    v62 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewLeadingConstraint];
    v74[1] = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    [v60 activateConstraints:v63];

    id v64 = [(_UIAlertControllerPhoneTVMacView *)self _discreteCancelActionView];
    v65 = [v64 action];
    v66 = [v65 _contentViewController];

    if (v66)
    {
      [v66 preferredContentSize];
      double v68 = v67;
    }
    else
    {
      v69 = [(_UIAlertControllerPhoneTVMacView *)self _discreteCancelActionView];
      objc_msgSend(v69, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      double v68 = v70;
    }
    v71 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewWidthConstraint];
    [v71 setConstant:v7];

    v72 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewHeightConstraint];
    [v72 setConstant:v68];
  }
  if (!v73) {
    double v5 = 0.0;
  }
  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView setRequiredActionRepresentationWidth:v5];
  [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView setRequiredActionRepresentationWidth:v5];
  [(UIView *)self setNeedsLayout];
}

- (void)_updateMainScrollableHeaderViewHasRealContent
{
  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self _buttonsAreTopMost] ^ 1;
  [(_UIAlertControllerInterfaceActionGroupView *)mainInterfaceActionsGroupView setScrollableHeaderViewHasRealContent:v3];
}

- (void)_propertiesChanged
{
  *(_WORD *)&self->_alertControllerViewFlags |= 0x800u;
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)_updateForPropertyChangeIfNeeded
{
  v107[2] = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x800) == 0) {
    return;
  }
  *(_WORD *)&self->_alertControllerViewFlags &= ~0x800u;
  v106 = [MEMORY[0x1E4F1CA48] array];
  [(_UIAlertControllerPhoneTVMacView *)self _updateMainScrollableHeaderViewHasRealContent];
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewControllerContainerViewTopAlignmentConstraint];

  if (v3)
  {
    double v4 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewControllerContainerViewTopAlignmentConstraint];
    [v106 addObject:v4];
  }
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self titleAndMessageLabelVibrantContainerViewVerticalConstraints];

  if (v5)
  {
    double v6 = [(_UIAlertControllerPhoneTVMacView *)self titleAndMessageLabelVibrantContainerViewVerticalConstraints];
    [v106 addObjectsFromArray:v6];
  }
  double v7 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];

  if (v7)
  {
    double v8 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];
    double v9 = [v8 constraints];
    [v106 addObjectsFromArray:v9];
  }
  id v10 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];

  if (v10)
  {
    double v11 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];
    double v12 = [v11 constraints];
    [v106 addObjectsFromArray:v12];
  }
  id v13 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewTopAlignmentConstraint];

  if (v13)
  {
    double v14 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewTopAlignmentConstraint];
    [v106 addObject:v14];
  }
  double v15 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewTopAlignmentConstraints];

  if (v15)
  {
    double v16 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewTopAlignmentConstraints];
    double v17 = [v16 constraints];
    [v106 addObjectsFromArray:v17];
  }
  double v18 = [(_UIAlertControllerPhoneTVMacView *)self detailMessageLabelTopAlignmentConstraint];

  if (v18)
  {
    double v19 = [(_UIAlertControllerPhoneTVMacView *)self detailMessageLabelTopAlignmentConstraint];
    [v106 addObject:v19];
  }
  double v20 = [(_UIAlertControllerPhoneTVMacView *)self contentViewTopConstraint];

  if (v20)
  {
    double v21 = [(_UIAlertControllerPhoneTVMacView *)self contentViewTopConstraint];
    [v106 addObject:v21];
  }
  double v22 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];

  if (v22)
  {
    double v23 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];
    [v106 addObject:v23];
  }
  double v24 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewBottomConstraint];

  if (v24)
  {
    double v25 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewBottomConstraint];
    [v106 addObject:v25];
  }
  [MEMORY[0x1E4F5B268] deactivateConstraints:v106];
  p_super = self->_contentViewTopItemsView;
  uint64_t v27 = [MEMORY[0x1E4F1CA48] array];
  double v28 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];

  if (v28)
  {
    double v29 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_headerContentViewControllerContainerView attribute:3 relatedBy:0 toItem:p_super attribute:3];
    [(_UIAlertControllerPhoneTVMacView *)self setHeaderContentViewControllerContainerViewTopAlignmentConstraint:v29];

    uint64_t v30 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewControllerContainerViewTopAlignmentConstraint];
    [v27 addObject:v30];

    double v31 = self->_headerContentViewControllerContainerView;
    uint64_t v32 = 4;
    p_super = v31;
  }
  else
  {
    uint64_t v32 = 3;
  }
  BOOL v33 = [(_UIAlertControllerPhoneTVMacView *)self _hasTitle];
  BOOL v34 = [(_UIAlertControllerPhoneTVMacView *)self _hasMessage];
  BOOL v35 = v34;
  v105 = v27;
  if ((v33 || v34) && self->_titleAndMessageLabelVibrantContainerView)
  {
    uint64_t v36 = 12;
    if (v33) {
      uint64_t v37 = 11;
    }
    else {
      uint64_t v37 = 12;
    }
    v38 = *(Class *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v37]);
    if (!v34) {
      uint64_t v36 = 11;
    }
    id v103 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v36]));
    id v104 = v38;
    v102 = [v104 topAnchor];
    v101 = [(UIView *)self->_titleAndMessageLabelVibrantContainerView topAnchor];
    v39 = [v102 constraintEqualToAnchor:v101];
    v107[0] = v39;
    v40 = [v103 bottomAnchor];
    double v41 = [(UIView *)self->_titleAndMessageLabelVibrantContainerView bottomAnchor];
    BOOL v42 = [v40 constraintEqualToAnchor:v41];
    v107[1] = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
    [(_UIAlertControllerPhoneTVMacView *)self setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:v43];

    uint64_t v27 = v105;
    v44 = [(_UIAlertControllerPhoneTVMacView *)self titleAndMessageLabelVibrantContainerViewVerticalConstraints];

    [v105 addObjectsFromArray:v44];
  }
  if (!v33)
  {
    if (!v35) {
      goto LABEL_36;
    }
LABEL_38:
    unint64_t v51 = 0x1E4F5B000uLL;
    v52 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_messageLabel attribute:12 relatedBy:0 toItem:p_super attribute:v32];
    if (v33) {
      uint64_t v53 = 746;
    }
    else {
      uint64_t v53 = 748;
    }
    v54 = +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:v52 equalityPriority:v53];
    [(_UIAlertControllerPhoneTVMacView *)self setMessageLabelTopAlignmentConstraints:v54];

    v55 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];
    v56 = [v55 constraints];
    v50 = v105;
    [v105 addObjectsFromArray:v56];

    v57 = self->_messageLabel;
    uint64_t v32 = 11;
    p_super = &v57->super;
    goto LABEL_42;
  }
  BOOL v45 = [MEMORY[0x1E4F5B268] constraintWithItem:self->_titleLabel attribute:12 relatedBy:0 toItem:p_super attribute:v32];
  v46 = +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:v45 equalityPriority:748];
  [(_UIAlertControllerPhoneTVMacView *)self setTitleLabelTopAlignmentConstraints:v46];

  v47 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];
  v48 = [v47 constraints];
  [v27 addObjectsFromArray:v48];

  v49 = self->_titleLabel;
  uint64_t v32 = 11;
  p_super = &v49->super;
  if (v35) {
    goto LABEL_38;
  }
LABEL_36:
  v50 = v105;
  unint64_t v51 = 0x1E4F5B000;
LABEL_42:
  v58 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];

  if (v58)
  {
    v59 = [*(id *)(v51 + 616) constraintWithItem:self->_contentViewControllerContainerView attribute:3 relatedBy:0 toItem:p_super attribute:v32];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerContainerViewTopAlignmentConstraint:v59];

    double v60 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewTopAlignmentConstraint];
    [v50 addObject:v60];

    v61 = self->_contentViewControllerContainerView;
    uint64_t v32 = 4;
    p_super = v61;
  }
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTextFields])
  {
    v62 = [*(id *)(v51 + 616) constraintWithItem:self->_textFieldViewControllerContainerView attribute:3 relatedBy:0 toItem:p_super attribute:v32];
    v63 = +[_UIFlexibleConstantConstraintSet constraintSetWithCollapsableConstantPreferredEqualityConstraint:v62 equalityPriority:745];
    [(_UIAlertControllerPhoneTVMacView *)self setTextFieldViewControllerContainerViewTopAlignmentConstraints:v63];

    id v64 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewTopAlignmentConstraints];
    v65 = [v64 constraints];
    [v50 addObjectsFromArray:v65];

    v66 = self->_textFieldViewControllerContainerView;
    uint64_t v32 = 4;
    p_super = v66;
  }
  double v67 = [*(id *)(v51 + 616) constraintWithItem:self->_contentViewTopItemsView attribute:4 relatedBy:0 toItem:p_super attribute:v32];
  [(_UIAlertControllerPhoneTVMacView *)self setContentScrollViewBottomConstraint:v67];

  double v68 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewBottomConstraint];
  [v50 addObject:v68];

  v69 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewController];
  uint64_t v70 = 9;
  if (!v69) {
    uint64_t v70 = 7;
  }
  id v71 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v70]));

  BOOL v72 = [(_UIAlertControllerPhoneTVMacView *)self hasDiscreteHorizontalCancelAction];
  uint64_t v73 = 16;
  if (!v72) {
    uint64_t v73 = 7;
  }
  id v74 = objc_retain(*(id *)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____UIAlertControllerPhoneTVMacView__alertControllerViewFlags[v73]));
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDetailMessage])
  {
    v75 = [(UIView *)self->_detailMessageLabel firstBaselineAnchor];
    v76 = [(UIView *)self->_mainInterfaceActionsGroupView bottomAnchor];
    v77 = [v75 constraintEqualToAnchor:v76];
    [(_UIAlertControllerPhoneTVMacView *)self setDetailMessageLabelTopAlignmentConstraint:v77];

    v78 = [(_UIAlertControllerPhoneTVMacView *)self detailMessageLabelTopAlignmentConstraint];
    [v50 addObject:v78];

    v79 = self->_detailMessageLabel;
    id v74 = v79;
  }
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDiscreteCancelAction])
  {
    v80 = self->_discreteCancelActionGroupView;

    id v74 = v80;
  }
  v81 = [(UIView *)self->_contentView topAnchor];
  v82 = [v71 topAnchor];
  v83 = [v81 constraintEqualToAnchor:v82];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewTopConstraint:v83];

  v84 = [(_UIAlertControllerPhoneTVMacView *)self contentViewTopConstraint];
  [v50 addObject:v84];

  v85 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewController];

  if (v85)
  {
    v86 = [MEMORY[0x1E4F5B268] constraintWithItem:v71 attribute:7 relatedBy:0 toItem:self->_contentView attribute:7];
    [(_UIAlertControllerPhoneTVMacView *)self setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:v86];

    v87 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewControllerContainerViewWidthConstraint];
    [v50 addObject:v87];

    v88 = [MEMORY[0x1E4F5B268] constraintWithItem:v71 attribute:4 relatedBy:0 toItem:self->_mainInterfaceActionsGroupView attribute:3];
    [(_UIAlertControllerPhoneTVMacView *)self setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:v88];

    v89 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewControllerContainerViewBottomConstraint];
    double v90 = 0.0;
    if ((*(_WORD *)&self->_alertControllerViewFlags & 0x10) == 0)
    {
      [(_UIAlertControllerPhoneTVMacView *)self _marginBetweenInterfaceActionGroups];
      double v90 = v91;
    }
    [v89 constant];
    [v89 setConstant:v92 - v90];

    v93 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewControllerContainerViewBottomConstraint];
    [v50 addObject:v93];
  }
  v94 = [(UIView *)self->_contentView bottomAnchor];
  v95 = [v74 bottomAnchor];
  v96 = [v94 constraintEqualToAnchor:v95];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewBottomConstraint:v96];

  v97 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];
  [v50 addObject:v97];

  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintConstants];
  v98 = (void *)MEMORY[0x1E4F5B268];
  v100 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v50, v99);
  [v98 activateConstraints:v100];
}

- (void)_performBatchActionChangesWithBlock:(id)a3
{
  double v4 = (void (**)(void))a3;
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  uint64_t v6 = [v5 count];

  ++self->_batchActionChangesInProgressCount;
  v4[2](v4);

  --self->_batchActionChangesInProgressCount;
  double v7 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  uint64_t v8 = [v7 count];

  [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x400) != 0 || v6 != v8)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _actionsChanged];
  }
}

- (void)_actionsChanged
{
  __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
  *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags & 0xFBFF;
  if (self->_batchActionChangesInProgressCount < 1)
  {
    id v4 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewVisualStyle:0];
    [(_UIAlertControllerPhoneTVMacView *)self _associateActionsWithActionViews];
    [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewVisualStyle:v4];
    [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewHeight];
    *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
    [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionViewRepresentations];
    [(_UIAlertControllerPhoneTVMacView *)self _updatePreferredAction];
    if (v4) {
      [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
    }
  }
  else
  {
    *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags | 0x400;
  }
}

- (void)_associateActionsWithActionViews
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  id v4 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  uint64_t v5 = [v4 count];
  uint64_t v6 = v5 - [(NSMutableArray *)self->_actionViews count];
  if (v6 >= 1)
  {
    do
    {
      double v7 = -[_UIAlertControllerActionView initWithFrame:]([_UIAlertControllerActionView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
      [(NSMutableArray *)self->_actionViews addObject:v7];

      --v6;
    }
    while (v6);
  }
  uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v47 = [MEMORY[0x1E4F1CA48] array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  double v9 = self->_actionViews;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v61 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        double v15 = [v14 action];

        if (v15)
        {
          double v16 = [v14 action];
          [v8 setObject:v14 forKey:v16];
        }
        else
        {
          [v47 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v11);
  }

  double v17 = (void *)[v4 mutableCopy];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v4;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v57 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v56 + 1) + 8 * j);
        double v24 = [v8 objectForKey:v23];
        if (v24)
        {
          [v8 removeObjectForKey:v23];
          [v17 removeObject:v23];
          [v3 setObject:v24 forKey:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v20);
  }
  BOOL v45 = v18;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v17;
  uint64_t v25 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v53 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * k);
        uint64_t v30 = objc_msgSend(v47, "firstObject", v45);
        if (v30)
        {
          double v31 = (void *)v30;
          [v47 removeObjectAtIndex:0];
        }
        else
        {
          uint64_t v32 = [v8 objectEnumerator];
          double v31 = [v32 nextObject];

          BOOL v33 = [v31 action];
          BOOL v34 = [(_UIAlertControllerPhoneTVMacView *)self _interfaceActionRepresentationForAlertAlertAction:v33];
          [v34 invalidate];

          BOOL v35 = [v31 action];
          [v8 removeObjectForKey:v35];
        }
        uint64_t v36 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
        [v31 setAlertController:v36];

        [v31 setAction:v29];
        [v3 setObject:v31 forKey:v29];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v52 objects:v65 count:16];
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v45, "count"));
  uint64_t v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  actionViews = self->_actionViews;
  self->_actionViews = v37;

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v39 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  uint64_t v40 = [v39 countByEnumeratingWithState:&v48 objects:v64 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = objc_msgSend(v3, "objectForKey:", *(void *)(*((void *)&v48 + 1) + 8 * m), v45);
        [(NSMutableArray *)self->_actionViews addObject:v44];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v48 objects:v64 count:16];
    }
    while (v41);
  }
}

- (void)_textFieldsChanged
{
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self textFields];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v28 = [(_UIAlertControllerPhoneTVMacView *)self _textFieldViewController];
    uint64_t v5 = [v28 parentViewController];
    uint64_t v6 = [(_UIAlertControllerPhoneTVMacView *)self alertController];

    if (v5 != v6)
    {
      double v7 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
      [v7 _willParentTextFieldViewController];

      textFieldViewControllerContainerView = self->_textFieldViewControllerContainerView;
      double v9 = [v28 view];
      [(UIView *)textFieldViewControllerContainerView addSubview:v9];

      uint64_t v10 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
      [v10 _didParentTextFieldViewController];
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = [v28 view];
    id v13 = [v12 leftAnchor];
    double v14 = [(UIView *)self->_textFieldViewControllerContainerView leftAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    [v11 addObject:v15];

    double v16 = [v28 view];
    double v17 = [v16 rightAnchor];
    id v18 = [(UIView *)self->_textFieldViewControllerContainerView rightAnchor];
    uint64_t v19 = [v17 constraintEqualToAnchor:v18];
    [v11 addObject:v19];

    uint64_t v20 = [v28 view];
    uint64_t v21 = [v20 topAnchor];
    double v22 = [(UIView *)self->_textFieldViewControllerContainerView topAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22];
    [v11 addObject:v23];

    double v24 = [v28 view];
    uint64_t v25 = [v24 bottomAnchor];
    uint64_t v26 = [(UIView *)self->_textFieldViewControllerContainerView bottomAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    [v11 addObject:v27];

    [MEMORY[0x1E4F5B268] activateConstraints:v11];
    [(_UIAlertControllerPhoneTVMacView *)self _sizeOfTextFieldViewControllerChanged];
  }
}

- (id)_interfaceActionRepresentationForAlertAlertAction:(id)a3
{
  return (id)[a3 _interfaceActionRepresentation];
}

- (id)_interfaceActionForAlertAction:(id)a3 inActionGroupView:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = objc_msgSend(a4, "actionGroup", 0);
  double v7 = [v6 actions];

  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = [v11 underlyingAlertAction];
        char v13 = [v12 isEqual:v5];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_reloadInterfaceActionViewRepresentations
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self _unlocalizedOrderedPresentableAlertActionViewRepresentations];
  uint64_t v4 = [(_UIAlertControllerPhoneTVMacView *)self _indexesOfActionSectionSeparators];
  id v5 = _newInterfaceActionSectionsForAlertActionViewRepresentations(v3, v4);

  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  double v7 = +[UIInterfaceActionGroup actionGroupWithActionsBySection:v5];
  [(UIInterfaceActionGroupView *)mainInterfaceActionsGroupView setActionGroup:v7];

  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDiscreteCancelAction])
  {
    id v8 = [(_UIAlertControllerPhoneTVMacView *)self _discreteCancelActionView];
    v14[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v10 = [MEMORY[0x1E4F28D60] indexSet];
    uint64_t v11 = _newInterfaceActionSectionsForAlertActionViewRepresentations(v9, v10);

    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    char v13 = +[UIInterfaceActionGroup actionGroupWithActionsBySection:v11];
    [(UIInterfaceActionGroupView *)discreteCancelActionGroupView setActionGroup:v13];
  }
  [(_UIAlertControllerPhoneTVMacView *)self _ensureActionViewRepresentationsHaveMetrics];
  [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionsGroupViewPreferredAction];
}

- (void)_reloadInterfaceActionsGroupViewPreferredAction
{
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self _effectivePreferredAction];
  id v8 = [(_UIAlertControllerPhoneTVMacView *)self _interfaceActionForAlertAction:v3 inActionGroupView:self->_mainInterfaceActionsGroupView];

  uint64_t v4 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionGroup];
  [v4 setPreferredAction:v8];

  id v5 = [(_UIAlertControllerPhoneTVMacView *)self _effectivePreferredAction];
  uint64_t v6 = [(_UIAlertControllerPhoneTVMacView *)self _interfaceActionForAlertAction:v5 inActionGroupView:self->_discreteCancelActionGroupView];

  double v7 = [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView actionGroup];
  [v7 setPreferredAction:v6];
}

- (void)_scrollInitialActionToVisibleForPresentation
{
  uint64_t v3 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionGroup];
  uint64_t v4 = [v3 preferredAction];

  if (!v4)
  {
    mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
    id v8 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    uint64_t v6 = [v8 preferredAction];
    double v7 = [(_UIAlertControllerPhoneTVMacView *)self _interfaceActionForAlertAction:v6 inActionGroupView:self->_mainInterfaceActionsGroupView];
    [(UIInterfaceActionGroupView *)mainInterfaceActionsGroupView scrollToCenterForInterfaceAction:v7];
  }
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = objc_opt_class();
  if (v10 != objc_opt_class())
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIAlertControllerPhoneTVMacView.m", 1623, @"unexpected class %@ for interface action", objc_opt_class() object file lineNumber description];
  }
  uint64_t v11 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v12 = [v8 underlyingAlertAction];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __83___UIAlertControllerPhoneTVMacView_interfaceAction_invokeActionHandler_completion___block_invoke;
  v15[3] = &unk_1E52D9FE8;
  id v16 = v9;
  id v13 = v9;
  [v11 _dismissWithAction:v12 dismissCompletion:v15];
}

- (BOOL)_shouldHaveCancelActionInMainActionButtonSequenceView
{
  if ([(_UIAlertControllerPhoneTVMacView *)self showsCancelAction])
  {
    uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    if (v3) {
      BOOL v4 = ![(_UIAlertControllerPhoneTVMacView *)self cancelActionIsDiscrete];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_unlocalizedOrderedPresentableAlertActionViewRepresentations
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  id v5 = [(_UIAlertControllerPhoneTVMacView *)self _unlocalizedOrderedPresentableAlertActions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActionViewRepresentations__block_invoke;
  v11[3] = &unk_1E52ECD70;
  id v12 = v4;
  id v13 = self;
  id v6 = v3;
  id v14 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v11];
  id v8 = v14;
  id v9 = v6;

  return v9;
}

- (id)_unlocalizedOrderedPresentableAlertActions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally];
  BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self _shouldHaveCancelActionInMainActionButtonSequenceView];
  BOOL v6 = [(_UIAlertControllerPhoneTVMacView *)self _actionsReversed];
  id v7 = [(_UIAlertControllerPhoneTVMacView *)self _presentableAlertActions];
  if (!v6)
  {
    [v3 addObjectsFromArray:v7];

    if (!v5) {
      goto LABEL_9;
    }
LABEL_5:
    id v8 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    [v3 removeObject:v8];
    if (v4) {
      [v3 insertObject:v8 atIndex:0];
    }
    else {
      [v3 addObject:v8];
    }

    goto LABEL_9;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78___UIAlertControllerPhoneTVMacView__unlocalizedOrderedPresentableAlertActions__block_invoke;
  v10[3] = &unk_1E52DB1D8;
  id v11 = v3;
  [v7 enumerateObjectsUsingBlock:v10];

  if (v5) {
    goto LABEL_5;
  }
LABEL_9:
  return v3;
}

- (id)_presentableAlertActions
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self _shouldHaveCancelActionInMainActionButtonSequenceView];
  BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  [v3 addObjectsFromArray:v5];

  if (!v4)
  {
    BOOL v6 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    [v3 removeObject:v6];
  }
  return v3;
}

- (int64_t)_numberOfActionsForMainActionButtonSequenceView
{
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  int64_t v4 = [v3 count];

  if (![(_UIAlertControllerPhoneTVMacView *)self _shouldHaveCancelActionInMainActionButtonSequenceView])
  {
    BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    uint64_t v6 = v5 != 0;

    v4 -= v6;
  }
  return v4;
}

- (id)_effectivePreferredAction
{
  return self->_effectivePreferredAction;
}

- (void)_updatePreferredAction
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  int64_t v4 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
  BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v6 = [v5 preferredAction];
  id v7 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v8 = [v7 _resolvedStyle];
  id v9 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  uint64_t v10 = [v9 _visualStyle];
  UIAlertControllerActionToEmphasizeGivenActions(v3, v4, v6, v8, v10);
  id v11 = (UIAlertAction *)objc_claimAutoreleasedReturnValue();

  id v12 = self->_effectivePreferredAction;
  if (v12 != v11 || ![(UIAlertAction *)v11 _isPreferred])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v3;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "_setIsPreferred:", 0, (void)v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }

    objc_storeStrong((id *)&self->_effectivePreferredAction, v11);
    [(UIAlertAction *)self->_effectivePreferredAction _setIsPreferred:1];
    [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionsGroupViewPreferredAction];
    [(UIView *)self setNeedsFocusUpdate];
  }
}

- (BOOL)_actionLayoutIsVertical
{
  return [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionLayoutAxis] == 1;
}

- (BOOL)hasDiscreteHorizontalCancelAction
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _hasDiscreteCancelAction];
  if (v3)
  {
    BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _buttonsAreTopMost];
    if (v3) {
      LOBYTE(v3) = [(_UIAlertControllerPhoneTVMacView *)self _numberOfActionsForMainActionButtonSequenceView] > 0;
    }
  }
  return v3;
}

- (double)_marginBetweenInterfaceActionGroups
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v2 _spacingBetweenDismissButtonAndContent];
  double v4 = v3;

  return v4;
}

- (CGSize)_contentViewControllerSize
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (double)_labelHorizontalInsets
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v2 _labelHorizontalInsets];
  double v4 = v3;

  return v4;
}

- (CGSize)_minimumSizeForAllActions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((*(_WORD *)&self->_alertControllerViewFlags & 0x200) == 0)
  {
    double v3 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewWidthConstraint];
    [v3 setActive:0];

    double v4 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewHeightConstraint];
    [v4 setActive:0];

    [(_UIAlertControllerPhoneTVMacView *)self _ensureActionViewRepresentationsHaveMetrics];
    p_largestActionDimension = &self->_largestActionDimension;
    double v6 = (double *)MEMORY[0x1E4F1DB30];
    self->_largestActionDimension = (CGSize)*MEMORY[0x1E4F1DB30];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v7 = self->_actionViews;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      double v11 = *v6;
      double v12 = v6[1];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v15 = [v14 action];
          uint64_t v16 = [v15 _contentViewController];

          if (v16) {
            [v16 preferredContentSize];
          }
          else {
            objc_msgSend(v14, "systemLayoutSizeFittingSize:", v11, v12);
          }
          if (v17 > p_largestActionDimension->width) {
            p_largestActionDimension->double width = v17;
          }
          if (v18 > self->_largestActionDimension.height) {
            self->_largestActionDimension.double height = v18;
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    long long v19 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewWidthConstraint];
    [v19 setActive:1];

    long long v20 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewHeightConstraint];
    [v20 setActive:1];

    *(_WORD *)&self->_alertControllerViewFlags |= 0x200u;
  }
  double width = self->_largestActionDimension.width;
  double height = self->_largestActionDimension.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:a3];
  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  v6[0] = self->_discreteCancelActionGroupView;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(UIInterfaceActionGroupView *)mainInterfaceActionsGroupView setSimultaneouslyPresentedGroupViews:v5];
}

- (void)setSpringLoaded:(BOOL)a3
{
  if (self->_springLoaded != a3)
  {
    BOOL v3 = a3;
    self->_springLoaded = a3;
    -[UIInterfaceActionGroupView setSpringLoaded:](self->_mainInterfaceActionsGroupView, "setSpringLoaded:");
    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
    [(UIInterfaceActionGroupView *)discreteCancelActionGroupView setSpringLoaded:v3];
  }
}

- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __86___UIAlertControllerPhoneTVMacView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke;
  void v6[3] = &unk_1E52DA488;
  v6[4] = self;
  BOOL v3 = [a3 objectsPassingTest:v6];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIAlertControllerPhoneTVMacView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    [(UIResponder *)&v8 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIAlertControllerPhoneTVMacView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    [(UIResponder *)&v8 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIAlertControllerPhoneTVMacView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    [(UIResponder *)&v8 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_UIAlertControllerPhoneTVMacView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIAlertControllerPhoneTVMacView;
    [(UIResponder *)&v8 touchesCancelled:v6 withEvent:v7];
  }
}

- (void)_setVisualStyle:(id)a3
{
  BOOL v4 = (UIAlertControllerVisualStyle *)a3;
  id v14 = [(_UIAlertControllerPhoneTVMacView *)self _unlocalizedOrderedPresentableAlertActions];
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  id v6 = [v5 traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  objc_super v8 = [(UIAlertControllerVisualStyle *)v4 traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v7 == v9)
  {
    uint64_t v10 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  visualStyle = self->_visualStyle;
  self->_visualStyle = v4;

  [(_UIAlertControllerPhoneTVMacView *)self _updateStyleForIdiomChange:v11];
  [(_UIAlertControllerPhoneTVMacView *)self _updateActionsGroupPresentationStyles];
  id v13 = [(_UIAlertControllerPhoneTVMacView *)self _unlocalizedOrderedPresentableAlertActions];
  if (([v14 isEqual:v13] & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionViewRepresentations];
  }
  [(_UIAlertControllerPhoneTVMacView *)self _updateBackdropView:[(_UIAlertControllerPhoneTVMacView *)self shouldHaveBackdropView]];
  [(_UIAlertControllerPhoneTVMacView *)self _updateCancelActionBeingDiscrete];
}

- (id)_visualStyle
{
  return self->_visualStyle;
}

- (void)_updateStyleForIdiomChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
  [(_UIAlertControllerPhoneTVMacView *)self _updateLabelFontSizes];
  [(_UIAlertControllerPhoneTVMacView *)self _updateLabelTextColor];
  [(_UIAlertControllerPhoneTVMacView *)self _updateLabelProperties];
  [(_UIAlertControllerPhoneTVMacView *)self _updateMainGroupViewProperties];
  [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewVisualStyle:v5];
  [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewHeight];
  if (v3) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
  [(_UIAlertControllerPhoneTVMacView *)self _updateInsets];
  [(_UIAlertControllerPhoneTVMacView *)self _updateContentView];
  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintConstants];
  [(_UIAlertControllerPhoneTVMacView *)self _updatePreferredAction];
  [(_UIAlertControllerPhoneTVMacView *)self _updateTintColor];
  [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
}

- (void)_updateTitleLabelContents
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _hasAttributedTitle];
  titleLabel = self->_titleLabel;
  if (v3)
  {
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self _attributedTitle];
    -[UILabel setAttributedText:](titleLabel, "setAttributedText:");
  }
  else
  {
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self title];
    -[UILabel setText:](titleLabel, "setText:");
  }
}

- (void)_updateDetailLabelContents
{
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDetailMessage])
  {
    detailMessageLabel = self->_detailMessageLabel;
    id v4 = [(_UIAlertControllerPhoneTVMacView *)self _attributedDetailMessage];
    [(UILabel *)detailMessageLabel setAttributedText:v4];
  }
}

- (void)_updateMessageLabelContents
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _hasAttributedMessage];
  messageLabel = self->_messageLabel;
  if (v3)
  {
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self _attributedMessage];
    -[UILabel setAttributedText:](messageLabel, "setAttributedText:");
  }
  else
  {
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self message];
    -[UILabel setText:](messageLabel, "setText:");
  }
}

- (void)_updateTitleLabelFontSize
{
  if (![(_UIAlertControllerPhoneTVMacView *)self _hasAttributedTitle])
  {
    titleLabel = self->_titleLabel;
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    id v4 = [v5 titleLabelFont];
    [(UILabel *)titleLabel setFont:v4];
  }
}

- (void)_updateDetailLabelFontSize
{
  detailMessageLabel = self->_detailMessageLabel;
  id v4 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  BOOL v3 = [v4 _detailMessageFont];
  [(UILabel *)detailMessageLabel setFont:v3];
}

- (void)_updateMessageLabelFontSize
{
  if (![(_UIAlertControllerPhoneTVMacView *)self _hasAttributedMessage])
  {
    messageLabel = self->_messageLabel;
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    id v4 = [v5 messageLabelFont];
    [(UILabel *)messageLabel setFont:v4];
  }
}

- (void)_updateLabelFontSizes
{
  [(_UIAlertControllerPhoneTVMacView *)self _updateTitleLabelFontSize];
  [(_UIAlertControllerPhoneTVMacView *)self _updateMessageLabelFontSize];
  [(_UIAlertControllerPhoneTVMacView *)self _updateDetailLabelFontSize];
}

- (void)_updateLabelTextColor
{
  if (![(_UIAlertControllerPhoneTVMacView *)self _hasAttributedTitle])
  {
    titleLabel = self->_titleLabel;
    id v4 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    id v5 = [v4 titleLabelColor];
    [(UILabel *)titleLabel setTextColor:v5];
  }
  if (![(_UIAlertControllerPhoneTVMacView *)self _hasAttributedMessage])
  {
    messageLabel = self->_messageLabel;
    uint64_t v7 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    objc_super v8 = [v7 messageLabelColor];
    [(UILabel *)messageLabel setTextColor:v8];

    uint64_t v9 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    id v16 = [v9 messageCompositingFilter];

    if ([(_UIAlertControllerPhoneTVMacView *)self _titleAndMessageLabelUseVibrancy]
      || !v16)
    {
      uint64_t v15 = [(UIView *)self->_contentViewTopItemsView layer];
      [v15 setAllowsGroupBlending:1];

      double v12 = [(UIView *)self->_contentViewTopItemsView layer];
      id v13 = v12;
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v10 = [(UIView *)self->_messageLabel layer];
      [v10 setCompositingFilter:v16];

      BOOL v11 = [(UIView *)self->_contentViewTopItemsView layer];
      [v11 setAllowsGroupBlending:0];

      double v12 = [(UIView *)self->_contentViewTopItemsView layer];
      id v13 = v12;
      uint64_t v14 = 0;
    }
    [v12 setAllowsGroupOpacity:v14];
  }
}

- (void)_updateLabelProperties
{
  p_alertController = &self->_alertController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  if ([WeakRetained _titleMaximumLineCount] < 0)
  {
    id v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    uint64_t v6 = [v5 maximumNumberOfLinesInTitleLabel];
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_alertController);
    uint64_t v6 = [v5 _titleMaximumLineCount];
  }
  uint64_t v7 = v6;

  [(UILabel *)self->_titleLabel setNumberOfLines:v7];
  titleLabel = self->_titleLabel;
  id v9 = objc_loadWeakRetained((id *)p_alertController);
  -[UILabel setLineBreakMode:](titleLabel, "setLineBreakMode:", [v9 _titleLineBreakMode]);

  messageLabel = self->_messageLabel;
  id v11 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  -[UILabel setNumberOfLines:](messageLabel, "setNumberOfLines:", [v11 maximumNumberOfLinesInMessageLabel]);
}

- (void)_updateInsets
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(_UIAlertControllerPhoneTVMacView *)self _contentInsets];
  double v4 = v3;
  double v6 = v5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_dimmingViewForegroundViewTopConstraints;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v11++) setConstant:v4];
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v12 = self->_dimmingViewForegroundViewBottomConstraints;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    double v16 = -v6;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "setConstant:", v16, (void)v18);
      }
      while (v14 != v17);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }
}

- (double)_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:(double)a3
{
  [(_UIAlertControllerPhoneTVMacView *)self _minimumSizeForAllActions];
  if (v5 > a3 && ([(id)UIApp _isSpringBoard] & 1) == 0)
  {
    double v6 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    [v6 accessibilityWidth];
    a3 = v7;
  }
  return a3;
}

- (void)_updateContentView
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v3 maximumWidthForTitleAndMessageContentView];
  -[_UIAlertControllerPhoneTVMacView _maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:](self, "_maximumWidthUsingAccessibilityWidthIfActionsAreTruncated:");
  double v5 = v4;

  double v6 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumWidthConstraint];
  double v7 = v6;
  if (v5 == 0.0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    [v6 setConstant:v5];

    double v6 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumWidthConstraint];
    double v7 = v6;
    uint64_t v8 = 1;
  }
  [v6 setActive:v8];

  uint64_t v9 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  [v9 maximumContentHeight];
  double v11 = v10;

  double v12 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
  uint64_t v13 = v12;
  if (v11 <= 0.0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    [v12 setConstant:v11];

    double v12 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewMaximumHeightConstraint];
    uint64_t v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setActive:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  double v16 = [WeakRetained _window];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(UIView *)self window];
  }
  id v64 = v18;

  uint64_t v19 = [v64 _toWindowOrientation];
  if (!v19) {
    uint64_t v19 = [v64 interfaceOrientation];
  }
  long long v20 = [v64 screen];
  if (!v20) {
    goto LABEL_21;
  }
  long long v21 = __UIStatusBarManagerForWindow(v64);
  char v22 = [v21 isStatusBarHidden];

  if (v22)
  {
    BOOL v23 = 1;
  }
  else
  {
    long long v24 = __UIStatusBarManagerForWindow(v64);
    [v24 defaultStatusBarHeightInOrientation:v19];
    double v26 = v25;

    BOOL v23 = v26 == 0.0;
  }
  if ([(id)UIApp _appAdoptsUISceneLifecycle]) {
    [v64 _referenceFrameFromSceneUsingScreenBounds:v23];
  }
  else {
    [v20 _applicationFrameForInterfaceOrientation:v19 usingStatusbarHeight:v23 ignoreStatusBar:0.0];
  }
  double v28 = v27;
  [(_UIAlertControllerPhoneTVMacView *)self _contentInsets];
  double v31 = v28 - (v29 + v30);
  if (v31 > 0.0)
  {
    uint64_t v32 = [(_UIAlertControllerPhoneTVMacView *)self contentViewMaxHeightConstraint];
    [v32 setConstant:v31];

    BOOL v33 = [(_UIAlertControllerPhoneTVMacView *)self contentViewMaxHeightConstraint];
    BOOL v34 = v33;
    uint64_t v35 = 1;
  }
  else
  {
LABEL_21:
    BOOL v33 = [(_UIAlertControllerPhoneTVMacView *)self contentViewMaxHeightConstraint];
    BOOL v34 = v33;
    uint64_t v35 = 0;
  }
  [v33 setActive:v35];

  uint64_t v36 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  int v37 = [v36 contentClipsToBounds];
  contentView = self->_contentView;
  if (v37)
  {
    [(UIView *)contentView setClipsToBounds:1];
    [v36 contentCornerRadius];
    double v40 = v39;
    uint64_t v41 = [(UIView *)self->_contentView layer];
    [v41 setCornerRadius:v40];

    uint64_t v42 = [v36 contentCornerCurve];
    v43 = [(UIView *)self->_contentView layer];
    [v43 setCornerCurve:v42];
  }
  else
  {
    [(UIView *)contentView setClipsToBounds:0];
    uint64_t v42 = [(UIView *)self->_contentView layer];
    [v42 setCornerRadius:0.0];
  }

  if ([v36 contentHasShadow])
  {
    [v36 contentShadowRadius];
    double v45 = v44;
    v46 = [(UIView *)self layer];
    [v46 setShadowRadius:v45];

    v47 = [v36 contentShadowColor];
    uint64_t v48 = [v47 cgColor];
    long long v49 = [(UIView *)self layer];
    [v49 setShadowColor:v48];

    [v36 contentShadowOffset];
    double v51 = v50;
    double v53 = v52;
    long long v54 = [(UIView *)self layer];
    objc_msgSend(v54, "setShadowOffset:", v51, v53);

    [v36 contentShadowOpacity];
    *(float *)&double v51 = v55;
    long long v56 = [(UIView *)self layer];
    long long v57 = v56;
    LODWORD(v58) = LODWORD(v51);
  }
  else
  {
    long long v59 = [(UIView *)self layer];
    [v59 setShadowRadius:0.0];

    long long v60 = [(UIView *)self layer];
    [v60 setShadowColor:0];

    double v61 = *MEMORY[0x1E4F1DB30];
    double v62 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    long long v63 = [(UIView *)self layer];
    objc_msgSend(v63, "setShadowOffset:", v61, v62);

    long long v56 = [(UIView *)self layer];
    long long v57 = v56;
    double v58 = 0.0;
  }
  [v56 setShadowOpacity:v58];
}

- (void)_updateMainGroupViewProperties
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  -[UIInterfaceActionGroupView setFocusAvoidsNonDefaultActionsIfPossible:](self->_mainInterfaceActionsGroupView, "setFocusAvoidsNonDefaultActionsIfPossible:", [v3 focusAvoidsNonDefaultActionsIfPossible]);
}

- (void)_updateActionViewVisualStyle:(id)a3
{
  id v4 = a3;
  actionViews = self->_actionViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65___UIAlertControllerPhoneTVMacView__updateActionViewVisualStyle___block_invoke;
  v7[3] = &unk_1E52ECD98;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)actionViews enumerateObjectsUsingBlock:v7];
}

- (void)_updateActionViewHeight
{
  id v3 = [(UIView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4))
  {
    double v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];

    if (v5)
    {
      [(_UIAlertControllerPhoneTVMacView *)self _idealLayoutWidth];
      actionViews = self->_actionViews;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke;
      v12[3] = &__block_descriptor_40_e45_v32__0___UIAlertControllerActionView_8Q16_B24l;
      v12[4] = v7;
      [(NSMutableArray *)actionViews enumerateObjectsUsingBlock:v12];
      *(_WORD *)&self->_alertControllerViewFlags &= ~0x200u;
      [(_UIAlertControllerPhoneTVMacView *)self _itemSizeForHorizontalLayout:[(_UIAlertControllerPhoneTVMacView *)self _canLayOutActionsHorizontally]];
      id v8 = self->_actionViews;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __59___UIAlertControllerPhoneTVMacView__updateActionViewHeight__block_invoke_2;
      v11[3] = &__block_descriptor_48_e45_v32__0___UIAlertControllerActionView_8Q16_B24l;
      void v11[4] = v9;
      v11[5] = v10;
      [(NSMutableArray *)v8 enumerateObjectsUsingBlock:v11];
    }
  }
}

- (void)_updateConstraintConstants
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  uint64_t v49 = 0;
  double v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __62___UIAlertControllerPhoneTVMacView__updateConstraintConstants__block_invoke;
  v48[3] = &unk_1E52ECE00;
  v48[4] = self;
  v48[5] = &v49;
  id v4 = (void (**)(void *, UILabel *, double))_Block_copy(v48);
  double v5 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];

  if (v5)
  {
    id v6 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewControllerContainerViewTopAlignmentConstraint];
    [v6 setConstant:0.0];
  }
  double v7 = 0.0;
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTitle])
  {
    id v8 = [(_UIAlertControllerPhoneTVMacView *)self title];
    [v3 _scaledMarginAboveTitleLabelFirstBaselineInAlertControllerView:self titleText:v8];
    double v10 = v9;

    double v11 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];
    [v11 setEqualityConstant:v10];

    double v12 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];
    [v3 _scaledTitleLabelSafeBaselineHeightInAlertControllerView:self];
    double v14 = v13;
    [v3 _minimumSpacingAboveTopmostLabelSafeAscender];
    double v16 = v15;
    uint64_t v17 = [(_UIAlertControllerPhoneTVMacView *)self titleLabelTopAlignmentConstraints];
    [v17 equalityConstant];
    double v19 = v18;
    double v20 = v14 + v16;

    if (v20 >= v19) {
      double v21 = v19;
    }
    else {
      double v21 = v20;
    }
    [v12 setMinConstant:v21];

    [v3 _scaledMarginBelowLastLabelLastBaseline];
    double v7 = v22;
    v4[2](v4, self->_titleLabel, v10);
  }
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasMessage])
  {
    BOOL v23 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];
    [v3 _scaledMarginAboveMessageLabelFirstBaseline];
    objc_msgSend(v23, "setEqualityConstant:");

    long long v24 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];
    [v3 _scaledMessageSafeBaselineHeightInAlertControllerView:self];
    double v26 = v25;
    [v3 _minimumSpacingAboveTopmostLabelSafeAscender];
    double v28 = v27;
    double v29 = [(_UIAlertControllerPhoneTVMacView *)self messageLabelTopAlignmentConstraints];
    [v29 equalityConstant];
    double v31 = v30;
    double v32 = v26 + v28;

    if (v32 >= v31) {
      double v33 = v31;
    }
    else {
      double v33 = v32;
    }
    [v24 setMinConstant:v33];

    [v3 _scaledMarginBelowMessageLabelLastBaseline];
    double v7 = v34;
    messageLabel = self->_messageLabel;
    [v3 _scaledMarginAboveMessageLabelFirstBaseline];
    ((void (*)(void (**)(void *, UILabel *, double), UILabel *))v4[2])(v4, messageLabel);
  }
  uint64_t v36 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];

  if (v36)
  {
    int v37 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewTopAlignmentConstraint];
    [v37 setConstant:v7];

    double v7 = 0.0;
  }
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasTextFields])
  {
    v38 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewTopAlignmentConstraints];
    [v38 setEqualityConstant:v7];

    double v39 = [(_UIAlertControllerPhoneTVMacView *)self textFieldViewControllerContainerViewTopAlignmentConstraints];
    double v40 = v39;
    double v41 = 8.0;
    if (v7 <= 8.0) {
      double v41 = v7;
    }
    [v39 setMinConstant:v41];

    double v7 = 0.0;
  }
  [(_UIAlertControllerPhoneTVMacView *)self _updateConstraintSpacingForExternalOffset];
  if ([(_UIAlertControllerPhoneTVMacView *)self _numberOfActionsForMainActionButtonSequenceView] <= 0)double v7 = v50[3]; {
  uint64_t v42 = [(_UIAlertControllerPhoneTVMacView *)self contentScrollViewBottomConstraint];
  }
  [v42 setConstant:v7];

  v43 = [(_UIAlertControllerPhoneTVMacView *)self detailMessageLabelTopAlignmentConstraint];
  [v3 _scaledMarginAboveDetailMessageFirstBaseline];
  objc_msgSend(v43, "setConstant:");

  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDetailMessage])
  {
    double v44 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    [v44 _scaledMarginBelowDetailMessage];
    double v46 = v45;
    v47 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];
    [v47 setConstant:v46];
  }
  _Block_object_dispose(&v49, 8);
}

- (void)_updateTintColor
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  id v4 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v6 = [v3 tintColorForAlertController:v4];

  double v5 = v6;
  if (v6)
  {
    [(UIView *)self setTintColor:v6];
    double v5 = v6;
  }
}

- (void)_setActionsReversed:(BOOL)a3
{
  if (self->_actionsReversed != a3)
  {
    self->_actionsReversed = a3;
    [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionViewRepresentations];
  }
}

- (void)deselectAllActions
{
  id v3 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionSelectionController];
  [v3 deselectAllActions];

  id v4 = [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView actionSelectionController];
  [v4 deselectAllActions];
}

- (void)_contentSizeChanged
{
  [(_UIAlertControllerPhoneTVMacView *)self _updateStyleForIdiomChange:0];
  [(_UIAlertControllerPhoneTVMacView *)self _actionsChanged];
}

- (void)_setTitle:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_titleLabel text];
  id v10 = v4;
  id v6 = v5;
  double v7 = v6;
  if (v6 == v10)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v10 && v6) {
      char v8 = [v10 isEqual:v6];
    }
  }

  id v9 = v10;
  if (v10)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _prepareTitleLabel];
    id v9 = v10;
  }
  [(UILabel *)self->_titleLabel setText:v9];
  if ((v8 & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
}

- (void)_setMessage:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_messageLabel text];
  id v10 = v4;
  id v6 = v5;
  double v7 = v6;
  if (v6 == v10)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v10 && v6) {
      char v8 = [v10 isEqual:v6];
    }
  }

  id v9 = v10;
  if (v10)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _prepareMesssageLabel];
    id v9 = v10;
  }
  [(UILabel *)self->_messageLabel setText:v9];
  if ((v8 & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
}

- (void)_setAttributedTitle:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_titleLabel attributedText];
  id v10 = v4;
  id v6 = v5;
  double v7 = v6;
  if (v6 == v10)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v10 && v6) {
      char v8 = [v10 isEqual:v6];
    }
  }

  id v9 = v10;
  if (v10)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _prepareTitleLabel];
    id v9 = v10;
  }
  [(UILabel *)self->_titleLabel setAttributedText:v9];
  if ((v8 & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
}

- (void)_setAttributedMessage:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_messageLabel attributedText];
  id v10 = v4;
  id v6 = v5;
  double v7 = v6;
  if (v6 == v10)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v10 && v6) {
      char v8 = [v10 isEqual:v6];
    }
  }

  id v9 = v10;
  if (v10)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _prepareMesssageLabel];
    id v9 = v10;
  }
  [(UILabel *)self->_messageLabel setAttributedText:v9];
  if ((v8 & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
}

- (void)_setAttributedDetailMessage:(id)a3
{
  id v4 = a3;
  double v5 = [(UILabel *)self->_detailMessageLabel attributedText];
  id v10 = v4;
  id v6 = v5;
  double v7 = v6;
  if (v6 == v10)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v10 && v6) {
      char v8 = [v10 isEqual:v6];
    }
  }

  id v9 = v10;
  if (v10)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _prepareDetailMessageLabel];
    id v9 = v10;
  }
  [(UILabel *)self->_detailMessageLabel setAttributedText:v9];
  if ((v8 & 1) == 0) {
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
  }
}

- (id)title
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v3 = [v2 title];

  return v3;
}

- (id)message
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v3 = [v2 message];

  return v3;
}

- (id)_attributedTitle
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v3 = [v2 _attributedTitle];

  return v3;
}

- (id)_attributedMessage
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v3 = [v2 _attributedMessage];

  return v3;
}

- (id)_attributedDetailMessage
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  id v3 = [v2 _attributedDetailMessage];

  return v3;
}

- (id)_vibrancyEffectForTitleAndMessageLabel
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    id v5 = [v6 _visualStyle];
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (!v5)
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Neither _UIAlertControllerPhoneTVMacView or UIAlertController have a visual style yet, which means it impossible to correctly determine the vibrancy effect.", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_vibrancyEffectForTitleAndMessageLabel___s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Neither _UIAlertControllerPhoneTVMacView or UIAlertController have a visual style yet, which means it impossible to correctly determine the vibrancy effect.", v11, 2u);
    }
  }
  double v7 = [v5 vibrancyEffectForTitleAndMessageLabel];

  return v7;
}

- (BOOL)_titleAndMessageLabelUseVibrancy
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self _vibrancyEffectForTitleAndMessageLabel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_hasTitle
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  char v3 = [v2 _hasTitle];

  return v3;
}

- (BOOL)_hasAttributedTitle
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  char v3 = [v2 _hasAttributedTitle];

  return v3;
}

- (BOOL)_hasMessage
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  char v3 = [v2 _hasMessage];

  return v3;
}

- (BOOL)_hasAttributedMessage
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  char v3 = [v2 _hasAttributedMessage];

  return v3;
}

- (BOOL)_hasDetailMessage
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  char v3 = [v2 _hasDetailMessage];

  return v3;
}

- (BOOL)_hasTextFields
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self textFields];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_textFieldViewController
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _textFieldViewController];

  return v3;
}

- (id)headerContentViewController
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _headerContentViewController];

  return v3;
}

- (id)contentViewController
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 contentViewController];

  return v3;
}

- (id)separatedHeaderContentViewController
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _separatedHeaderContentViewController];

  return v3;
}

- (id)actions
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _actions];

  return v3;
}

- (id)cancelAction
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _cancelAction];

  return v3;
}

- (id)_focusedAction
{
  BOOL v3 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView _interfaceActionOfFocusedRepresentationView];
  if (!v3)
  {
    BOOL v3 = [(UIInterfaceActionGroupView *)self->_discreteCancelActionGroupView _interfaceActionOfFocusedRepresentationView];
  }
  id v4 = [v3 underlyingAlertAction];

  return v4;
}

- (id)_preferredActionView
{
  mainInterfaceActionsGroupView = self->_mainInterfaceActionsGroupView;
  __UIFocusEnvironmentPreferredFocusedView(self, 0);
  id v4 = (_UIAlertControllerInterfaceActionGroupView *)objc_claimAutoreleasedReturnValue();

  id v5 = 0;
  if (mainInterfaceActionsGroupView == v4)
  {
    id v6 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView preferredActionRepresentation];
    double v7 = [v6 action];

    id v5 = [v7 alertControllerActionView];
  }
  return v5;
}

- (id)_indexesOfActionSectionSeparators
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 _indexesOfActionSectionSeparators];

  return v3;
}

- (double)_spaceRequiredForActionSectionsSpacing
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _indexesOfActionSectionSeparators];
  unint64_t v4 = [v3 count];

  if (!v4) {
    return 0.0;
  }
  id v5 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
  double v6 = (double)v4;
  double v7 = [v5 interfaceActionVisualStyle];
  [v7 actionSectionSpacing];
  double v9 = v8 * v6;

  return v9;
}

- (id)textFields
{
  v2 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  BOOL v3 = [v2 textFields];

  return v3;
}

- (void)setPresentedAsPopover:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIAlertControllerPhoneTVMacView *)self presentedAsPopover] != a3)
  {
    if (v3) {
      __int16 v5 = 16;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFEF | v5;
    if (![(_UIAlertControllerPhoneTVMacView *)self presentedAsPopover]) {
      -[_UIAlertControllerPhoneTVMacView _setLayoutSize:](self, "_setLayoutSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    }
    [(_UIAlertControllerPhoneTVMacView *)self _reevaluateSuperviewSizingConstraints];
    [(_UIAlertControllerPhoneTVMacView *)self _sizeOfContentViewControllerChanged];
    [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
  }
}

- (BOOL)presentedAsPopover
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 4) & 1;
}

- (void)setHasDimmingView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIAlertControllerPhoneTVMacView *)self hasDimmingView] != a3)
  {
    if (v3) {
      __int16 v5 = 32;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFDF | v5;
    [(_UIAlertControllerPhoneTVMacView *)self _reevaluateSuperviewSizingConstraints];
    if ([(_UIAlertControllerPhoneTVMacView *)self hasDimmingView])
    {
      [(UIView *)self insertSubview:self->_dimmingView atIndex:0];
      [(UIView *)self removeConstraints:self->_noDimmingViewConstraints];
      [(UIView *)self addConstraints:self->_dimmingViewConstraints];
      double v6 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
      uint64_t v7 = [v6 _resolvedStyle];

      if (v7) {
        double v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
      }
      else {
        double v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForAlertStyle;
      }
      if (v7) {
        double v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForAlertStyle;
      }
      else {
        double v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
      }
    }
    else
    {
      [(UIView *)self->_dimmingView removeFromSuperview];
      [(UIView *)self removeConstraints:self->_dimmingViewConstraints];
      [(UIView *)self removeConstraints:self->_dimmingViewConstraintsForAlertStyle];
      double v9 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__noDimmingViewConstraints;
      double v8 = &OBJC_IVAR____UIAlertControllerPhoneTVMacView__dimmingViewConstraintsForActionSheetStyle;
    }
    [(UIView *)self removeConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v8)];
    uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v9);
    [(UIView *)self addConstraints:v10];
  }
}

- (BOOL)hasDimmingView
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 5) & 1;
}

- (void)setPresentationContextPrefersCancelActionShown:(BOOL)a3
{
  if (self->_presentationContextPrefersCancelActionShown != a3)
  {
    self->_presentationContextPrefersCancelActionShown = a3;
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
    [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
    [(_UIAlertControllerPhoneTVMacView *)self _actionsChanged];
    [(_UIAlertControllerPhoneTVMacView *)self _updateCancelActionBeingDiscrete];
  }
}

- (BOOL)showsCancelAction
{
  if ([(_UIAlertControllerPhoneTVMacView *)self presentationContextPrefersCancelActionShown])
  {
    BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    unint64_t v4 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    __int16 v5 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    int v6 = [v3 hideCancelAction:v4 inAlertController:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)__cancelActionView
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self actions];
  unint64_t v4 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
  uint64_t v5 = [v3 indexOfObject:v4];

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = [(NSMutableArray *)self->_actionViews objectAtIndex:v5];
  }
  return v6;
}

- (void)_updateCancelActionBeingDiscrete
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  if ([v3 _resolvedStyle])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(_UIAlertControllerPhoneTVMacView *)self cancelAction];
    if (v5) {
      BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self showsCancelAction];
    }
    else {
      BOOL v4 = 0;
    }
  }
  [(_UIAlertControllerPhoneTVMacView *)self setCancelActionIsDiscrete:v4];
}

- (void)setCancelActionIsDiscrete:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIAlertControllerPhoneTVMacView *)self cancelActionIsDiscrete] != a3)
  {
    if (v3) {
      __int16 v5 = 64;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFFBF | v5;
    if (v3)
    {
      [(UIView *)self->_contentView addSubview:self->_discreteCancelActionGroupView];
    }
    else
    {
      int v6 = [(_UIAlertControllerPhoneTVMacView *)self contentViewBottomConstraint];
      [v6 setActive:0];

      [(_UIAlertControllerPhoneTVMacView *)self setContentViewBottomConstraint:0];
      uint64_t v7 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewTopConstraint];
      [v7 setActive:0];

      [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewTopConstraint:0];
      double v8 = [(_UIAlertControllerPhoneTVMacView *)self discreteCancelActionViewLeadingConstraint];
      [v8 setActive:0];

      [(_UIAlertControllerPhoneTVMacView *)self setDiscreteCancelActionViewLeadingConstraint:0];
      [(UIView *)self->_discreteCancelActionGroupView removeFromSuperview];
    }
    [(_UIAlertControllerPhoneTVMacView *)self _reloadInterfaceActionViewRepresentations];
    [(_UIAlertControllerPhoneTVMacView *)self _propertiesChanged];
    [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
  }
}

- (BOOL)cancelActionIsDiscrete
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 6) & 1;
}

- (void)_updateBackdropView:(BOOL)a3
{
  BOOL v3 = a3;
  backdropView = self->_backdropView;
  if (backdropView)
  {
    [(UIView *)backdropView removeFromSuperview];
    int v6 = self->_backdropView;
    self->_backdropView = 0;
  }
  if (v3)
  {
    uint64_t v7 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    double v8 = [v7 contentBackdropView];
    double v9 = self->_backdropView;
    self->_backdropView = v8;

    uint64_t v10 = self->_backdropView;
    if (v10)
    {
      [(UIView *)self->_contentView insertSubview:v10 atIndex:0];
      [(UIView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
      double v11 = [(UIView *)self->_backdropView leadingAnchor];
      double v12 = [(UIView *)self->_contentView leadingAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12];
      [v13 setActive:1];

      double v14 = [(UIView *)self->_backdropView trailingAnchor];
      double v15 = [(UIView *)self->_contentView trailingAnchor];
      double v16 = [v14 constraintEqualToAnchor:v15];
      [v16 setActive:1];

      uint64_t v17 = [(UIView *)self->_backdropView topAnchor];
      double v18 = [(UIView *)self->_contentView topAnchor];
      double v19 = [v17 constraintEqualToAnchor:v18];
      [v19 setActive:1];

      id v22 = [(UIView *)self->_backdropView bottomAnchor];
      double v20 = [(UIView *)self->_contentView bottomAnchor];
      double v21 = [v22 constraintEqualToAnchor:v20];
      [v21 setActive:1];
    }
  }
}

- (void)setShouldHaveBackdropView:(BOOL)a3
{
  __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;
  if (((((alertControllerViewFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      __int16 v6 = 128;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->___int16 alertControllerViewFlags = alertControllerViewFlags & 0xFF7F | v6;
    -[UIInterfaceActionGroupView _setDrawsBackground:](self->_mainInterfaceActionsGroupView, "_setDrawsBackground:");
    [(_UIAlertControllerPhoneTVMacView *)self _updateBackdropView:v4];
  }
}

- (BOOL)shouldHaveBackdropView
{
  return (*(_WORD *)&self->_alertControllerViewFlags >> 7) & 1;
}

- (void)setAlignsToKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIAlertControllerPhoneTVMacView *)self alignsToKeyboard] != a3)
  {
    if (v3) {
      __int16 v5 = 256;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->___int16 alertControllerViewFlags = *(_WORD *)&self->_alertControllerViewFlags & 0xFEFF | v5;
    if ([(_UIAlertControllerPhoneTVMacView *)self alignsToKeyboard])
    {
      [(UIView *)self insertSubview:self->_keyboardLayoutAlignmentView atIndex:0];
      [(UIView *)self insertSubview:self->_keyboardLayoutAlignmentAvailableSpaceView atIndex:0];
      [(_UIAlertControllerPhoneTVMacView *)self _applyKeyboardAlignmentViewsConstraints];
    }
    else
    {
      [(UIView *)self->_keyboardLayoutAlignmentView removeFromSuperview];
      keyboardLayoutAlignmentAvailableSpaceView = self->_keyboardLayoutAlignmentAvailableSpaceView;
      [(UIView *)keyboardLayoutAlignmentAvailableSpaceView removeFromSuperview];
    }
  }
}

- (BOOL)alignsToKeyboard
{
  return HIBYTE(*(_WORD *)&self->_alertControllerViewFlags) & 1;
}

- (void)_addHeaderContentViewControllerToViewHierarchyIfNecessary
{
  v24[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];
  BOOL v4 = [v3 view];

  __int16 v5 = [v4 superview];
  headerContentViewControllerContainerView = self->_headerContentViewControllerContainerView;

  if (v5 != headerContentViewControllerContainerView)
  {
    [(UIView *)self->_headerContentViewControllerContainerView addSubview:v4];
    uint64_t v7 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    int v8 = [v7 shouldRespectContentViewControllerClippingPreference];

    if (v8)
    {
      double v9 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
      -[UIView setClipsToBounds:](self->_headerContentViewControllerContainerView, "setClipsToBounds:", [v9 _wantsUnclippedHeaderContentViewControllerContainer] ^ 1);
    }
    double v18 = (void *)MEMORY[0x1E4F5B268];
    BOOL v23 = [v4 leftAnchor];
    id v22 = [(UIView *)self->_headerContentViewControllerContainerView leftAnchor];
    double v21 = [v23 constraintEqualToAnchor:v22];
    v24[0] = v21;
    double v20 = [v4 rightAnchor];
    double v19 = [(UIView *)self->_headerContentViewControllerContainerView rightAnchor];
    uint64_t v10 = [v20 constraintEqualToAnchor:v19];
    v24[1] = v10;
    double v11 = [v4 topAnchor];
    double v12 = [(UIView *)self->_headerContentViewControllerContainerView topAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v24[2] = v13;
    double v14 = [v4 bottomAnchor];
    double v15 = [(UIView *)self->_headerContentViewControllerContainerView bottomAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v18 activateConstraints:v17];

    [(_UIAlertControllerPhoneTVMacView *)self _sizeOfHeaderContentViewControllerChanged];
  }
}

- (void)_addContentViewControllerToViewHierarchyIfNecessary
{
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];
  BOOL v4 = [v3 view];
  __int16 v5 = [v4 superview];
  contentViewControllerContainerView = self->_contentViewControllerContainerView;

  if (v5 != contentViewControllerContainerView)
  {
    id v49 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
    int v7 = [v49 isBeingPresented];
    int v8 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];
    uint64_t v9 = [v8 appearanceTransitionsAreDisabled];
    if (v7)
    {
      uint64_t v10 = v9;
      [v8 setAppearanceTransitionsAreDisabled:1];
      double v11 = self->_contentViewControllerContainerView;
      double v12 = [v8 view];
      [(UIView *)v11 addSubview:v12];

      [v8 setAppearanceTransitionsAreDisabled:v10];
    }
    else
    {
      double v13 = self->_contentViewControllerContainerView;
      double v14 = [v8 view];
      [(UIView *)v13 addSubview:v14];
    }
    double v15 = [(_UIAlertControllerPhoneTVMacView *)self _visualStyle];
    int v16 = [v15 shouldRespectContentViewControllerClippingPreference];

    if (v16) {
      -[UIView setClipsToBounds:](self->_contentViewControllerContainerView, "setClipsToBounds:", [v49 _wantsUnclippedContentViewControllerContainer] ^ 1);
    }
    contentView = self->_contentView;
    double v18 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewLeftConstraint];
    [(UIView *)contentView removeConstraint:v18];

    double v19 = self->_contentView;
    double v20 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewRightConstraint];
    [(UIView *)v19 removeConstraint:v20];

    double v21 = [v8 view];
    id v22 = [v21 leftAnchor];
    BOOL v23 = [(UIView *)self->_contentViewControllerContainerView leftAnchor];
    long long v24 = [v22 constraintEqualToAnchor:v23];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewLeftConstraint:v24];

    double v25 = [v8 view];
    double v26 = [v25 rightAnchor];
    double v27 = [(UIView *)self->_contentViewControllerContainerView rightAnchor];
    double v28 = [v26 constraintEqualToAnchor:v27];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewRightConstraint:v28];

    double v29 = self->_contentView;
    double v30 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewLeftConstraint];
    [(UIView *)v29 addConstraint:v30];

    double v31 = self->_contentView;
    double v32 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewRightConstraint];
    [(UIView *)v31 addConstraint:v32];

    double v33 = self->_contentView;
    double v34 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewTopConstraint];
    [(UIView *)v33 removeConstraint:v34];

    uint64_t v35 = self->_contentView;
    uint64_t v36 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewBottomConstraint];
    [(UIView *)v35 removeConstraint:v36];

    int v37 = [v8 view];
    v38 = [v37 topAnchor];
    double v39 = [(UIView *)self->_contentViewControllerContainerView topAnchor];
    double v40 = [v38 constraintEqualToAnchor:v39];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewTopConstraint:v40];

    double v41 = [v8 view];
    uint64_t v42 = [v41 bottomAnchor];
    v43 = [(UIView *)self->_contentViewControllerContainerView bottomAnchor];
    double v44 = [v42 constraintEqualToAnchor:v43];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewBottomConstraint:v44];

    double v45 = self->_contentView;
    double v46 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewTopConstraint];
    [(UIView *)v45 addConstraint:v46];

    v47 = self->_contentView;
    uint64_t v48 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerViewBottomConstraint];
    [(UIView *)v47 addConstraint:v48];

    [(_UIAlertControllerPhoneTVMacView *)self _sizeOfContentViewControllerChanged];
  }
}

- (void)_addSeparatedHeaderContentViewControllerToViewHierarchyIfNecessary
{
  v21[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewController];
  BOOL v4 = [v3 view];

  __int16 v5 = [v4 superview];
  separatedHeaderContentViewControllerContainerView = self->_separatedHeaderContentViewControllerContainerView;

  if (v5 != separatedHeaderContentViewControllerContainerView)
  {
    [(UIView *)self->_separatedHeaderContentViewControllerContainerView addSubview:v4];
    int v16 = (void *)MEMORY[0x1E4F5B268];
    double v20 = [v4 leftAnchor];
    double v19 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView leftAnchor];
    double v18 = [v20 constraintEqualToAnchor:v19];
    v21[0] = v18;
    uint64_t v17 = [v4 rightAnchor];
    int v7 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView rightAnchor];
    int v8 = [v17 constraintEqualToAnchor:v7];
    v21[1] = v8;
    uint64_t v9 = [v4 topAnchor];
    uint64_t v10 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView topAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    v21[2] = v11;
    double v12 = [v4 bottomAnchor];
    double v13 = [(UIView *)self->_separatedHeaderContentViewControllerContainerView bottomAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    v21[3] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    [v16 activateConstraints:v15];
  }
}

- (void)_removeHeaderContentViewControllerViewFromHierarchy
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];
  v2 = [v3 view];
  [v2 removeFromSuperview];
}

- (void)_removeContentViewControllerViewFromHierarchy
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];
  BOOL v4 = [v3 view];
  [v4 removeFromSuperview];

  [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewLeftConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewRightConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewTopConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerViewBottomConstraint:0];
}

- (void)_removeSeparatedHeaderContentViewControllerFromHierarchy
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self separatedHeaderContentViewController];
  BOOL v4 = [v3 view];
  [v4 removeFromSuperview];

  [(_UIAlertControllerPhoneTVMacView *)self setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:0];
}

- (void)_sizeOfHeaderContentViewControllerChanged
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];

  BOOL v4 = [(_UIAlertControllerPhoneTVMacView *)self headerContentViewController];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  BOOL v10 = v8 > 0.0 && v3 != 0;
  headerContentViewControllerPreferredWidthConstraint = self->_headerContentViewControllerPreferredWidthConstraint;
  if (v3 && v6 > 0.0)
  {
    if (headerContentViewControllerPreferredWidthConstraint)
    {
      [(NSLayoutConstraint *)headerContentViewControllerPreferredWidthConstraint setConstant:v6];
    }
    else
    {
      double v13 = [(UIView *)self->_headerContentViewControllerContainerView widthAnchor];
      double v14 = [v13 constraintEqualToConstant:v6];
      double v15 = self->_headerContentViewControllerPreferredWidthConstraint;
      self->_headerContentViewControllerPreferredWidthConstraint = v14;

      LODWORD(v16) = 1144766464;
      [(NSLayoutConstraint *)self->_headerContentViewControllerPreferredWidthConstraint setPriority:v16];
      [(NSLayoutConstraint *)self->_headerContentViewControllerPreferredWidthConstraint setActive:1];
    }
  }
  else
  {
    [(NSLayoutConstraint *)headerContentViewControllerPreferredWidthConstraint setActive:0];
    double v12 = self->_headerContentViewControllerPreferredWidthConstraint;
    self->_headerContentViewControllerPreferredWidthConstraint = 0;
  }
  headerContentViewControllerPreferredHeightConstraint = self->_headerContentViewControllerPreferredHeightConstraint;
  if (v10)
  {
    if (headerContentViewControllerPreferredHeightConstraint)
    {
      [(NSLayoutConstraint *)headerContentViewControllerPreferredHeightConstraint setConstant:v8];
    }
    else
    {
      double v19 = [(UIView *)self->_headerContentViewControllerContainerView heightAnchor];
      double v20 = [v19 constraintEqualToConstant:v8];
      double v21 = self->_headerContentViewControllerPreferredHeightConstraint;
      self->_headerContentViewControllerPreferredHeightConstraint = v20;

      LODWORD(v22) = 1144766464;
      [(NSLayoutConstraint *)self->_headerContentViewControllerPreferredHeightConstraint setPriority:v22];
      [(NSLayoutConstraint *)self->_headerContentViewControllerPreferredHeightConstraint setActive:1];
    }
  }
  else
  {
    [(NSLayoutConstraint *)headerContentViewControllerPreferredHeightConstraint setActive:0];
    double v18 = self->_headerContentViewControllerPreferredHeightConstraint;
    self->_headerContentViewControllerPreferredHeightConstraint = 0;
  }
  BOOL v23 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77___UIAlertControllerPhoneTVMacView__sizeOfHeaderContentViewControllerChanged__block_invoke;
  v24[3] = &unk_1E52D9F70;
  v24[4] = self;
  objc_msgSend(v23, "_headerContentViewControllerWillTransitionToSize:withAnimations:", v24, v6, v8);
}

- (void)_sizeOfContentViewControllerChanged
{
  id v3 = [(_UIAlertControllerPhoneTVMacView *)self contentViewController];

  [(_UIAlertControllerPhoneTVMacView *)self _contentViewControllerSize];
  double v6 = v5;
  if (v4 == 0.0) {
    goto LABEL_5;
  }
  double v7 = v4;
  double v8 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  if (![v8 _resolvedStyle])
  {
    __int16 alertControllerViewFlags = (__int16)self->_alertControllerViewFlags;

    if ((alertControllerViewFlags & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_5:
    BOOL v10 = self->_mainInterfaceActionsGroupView;
    double v7 = 0.0;
    goto LABEL_7;
  }

LABEL_6:
  BOOL v10 = 0;
LABEL_7:
  float v11 = 748.0;
  if (!v3) {
    float v11 = 751.0;
  }
  double v12 = 100.0;
  if (!v3) {
    double v12 = v6;
  }
  if (v6 == 0.0) {
    float v13 = v11;
  }
  else {
    float v13 = 751.0;
  }
  if (v6 == 0.0) {
    double v6 = v12;
  }
  double v14 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewWidthConstraint];
  double v15 = v14;
  if (v14) {
    double v14 = objc_msgSend((id)objc_msgSend(v14, "secondItem"), "_referenceView");
  }
  double v16 = v14;

  if (v16 != v10)
  {
    contentView = self->_contentView;
    double v18 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewWidthConstraint];
    [(UIView *)contentView removeConstraint:v18];

    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerContainerViewWidthConstraint:0];
  }
  double v19 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewWidthConstraint];

  if (!v19)
  {
    double v20 = [(UIView *)self->_contentViewControllerContainerView widthAnchor];
    double v21 = [(UIView *)v10 widthAnchor];
    double v22 = [v20 constraintEqualToAnchor:v21 constant:v7];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerContainerViewWidthConstraint:v22];

    BOOL v23 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewWidthConstraint];
    LODWORD(v24) = 1132068864;
    [v23 setPriority:v24];

    double v25 = self->_contentView;
    double v26 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewWidthConstraint];
    [(UIView *)v25 addConstraint:v26];
  }
  double v27 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewHeightConstraint];

  if (!v27)
  {
    double v28 = [(UIView *)self->_contentViewControllerContainerView heightAnchor];
    double v29 = [v28 constraintEqualToConstant:v6];
    [(_UIAlertControllerPhoneTVMacView *)self setContentViewControllerContainerViewHeightConstraint:v29];

    double v30 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewHeightConstraint];
    *(float *)&double v31 = v13;
    [v30 setPriority:v31];

    double v32 = self->_contentView;
    double v33 = [(_UIAlertControllerPhoneTVMacView *)self contentViewControllerContainerViewHeightConstraint];
    [(UIView *)v32 addConstraint:v33];
  }
  double v34 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __71___UIAlertControllerPhoneTVMacView__sizeOfContentViewControllerChanged__block_invoke;
  v35[3] = &unk_1E52DD178;
  v35[4] = self;
  *(double *)&v35[5] = v7;
  *(double *)&v35[6] = v6;
  objc_msgSend(v34, "_contentViewControllerWillTransitionToSize:withAnimations:", v35, v7, v6);
}

- (void)_layoutAndPositionInParentIfNeeded
{
}

- (void)_applyISEngineLayoutValuesToBoundsOnly:(BOOL)a3
{
  *(void *)&a3 = self->_layoutRequiresPositionUpdateCount < 1 && a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v3 _applyISEngineLayoutValuesToBoundsOnly:a3];
}

- (void)_sizeOfTextFieldViewControllerChanged
{
  textFieldViewControllerContainerViewHeightConstraint = self->_textFieldViewControllerContainerViewHeightConstraint;
  id v4 = [(_UIAlertControllerPhoneTVMacView *)self _textFieldViewController];
  [v4 preferredContentSize];
  [(NSLayoutConstraint *)textFieldViewControllerContainerViewHeightConstraint setConstant:v3];
}

- (void)_recomputeActionMetrics
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  double v3 = objc_alloc_init(_UIAlertControllerActionViewMetrics);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v27 = 648;
  double v28 = self;
  id v4 = self->_actionViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        float v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        double v12 = objc_msgSend(v11, "action", v27, v28);
        float v13 = [v12 _descriptiveText];

        if (v13)
        {
          [v11 currentDescriptiveLabelTextWidth];
          if (v14 > v9) {
            double v9 = v14;
          }
        }
        double v15 = [v11 action];
        uint64_t v16 = [v15 title];
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          double v18 = [v11 action];
          double v19 = [v18 _descriptiveText];

          if (v19)
          {
            [v11 currentLabelTextWidth];
            if (v20 > v8) {
              double v8 = v20;
            }
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
  }

  [(_UIAlertControllerActionViewMetrics *)v3 setDescriptiveLabelTextWidth:v9];
  [(_UIAlertControllerActionViewMetrics *)v3 setLabelTextWidth:v8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v21 = v28;
  id v22 = *(id *)((char *)&v28->super.super.super.super.isa + v27);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "applyMetrics:", v3, v27, v28, (void)v29);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }

  [(_UIAlertControllerPhoneTVMacView *)v21 setActionViewMetrics:v3];
}

- (void)_ensureActionViewRepresentationsHaveMetrics
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_actionViewMetrics) {
    [(_UIAlertControllerPhoneTVMacView *)self _recomputeActionMetrics];
  }
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self actionViewMetrics];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_actionViews;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "applyMetrics:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_reevaluateSuperviewSizingConstraints
{
  if (![(UIView *)self translatesAutoresizingMaskIntoConstraints])
  {
    id v25 = [(UIView *)self superview];
    if (v25)
    {
      double v3 = [(_UIAlertControllerPhoneTVMacView *)self centerXConstraint];
      [v25 removeConstraint:v3];

      id v4 = [(_UIAlertControllerPhoneTVMacView *)self centerYConstraint];
      [v25 removeConstraint:v4];

      uint64_t v5 = [(_UIAlertControllerPhoneTVMacView *)self widthConstraint];
      [v25 removeConstraint:v5];

      uint64_t v6 = [(_UIAlertControllerPhoneTVMacView *)self heightConstraint];
      [v25 removeConstraint:v6];

      [(_UIAlertControllerPhoneTVMacView *)self setCenterXConstraint:0];
      [(_UIAlertControllerPhoneTVMacView *)self setCenterYConstraint:0];
      [(_UIAlertControllerPhoneTVMacView *)self setWidthConstraint:0];
      [(_UIAlertControllerPhoneTVMacView *)self setHeightConstraint:0];
      uint64_t v7 = [(_UIAlertControllerPhoneTVMacView *)self alertController];
      int v8 = [v7 _shouldSizeToFillSuperview];

      if (v8)
      {
        long long v9 = [(UIView *)self centerXAnchor];
        long long v10 = [v25 centerXAnchor];
        long long v11 = [v9 constraintEqualToAnchor:v10];
        [(_UIAlertControllerPhoneTVMacView *)self setCenterXConstraint:v11];

        long long v12 = [(UIView *)self centerYAnchor];
        float v13 = [v25 centerYAnchor];
        uint64_t v14 = [v12 constraintEqualToAnchor:v13];
        [(_UIAlertControllerPhoneTVMacView *)self setCenterYConstraint:v14];

        double v15 = [(UIView *)self widthAnchor];
        uint64_t v16 = [v25 widthAnchor];
        uint64_t v17 = [v15 constraintEqualToAnchor:v16];
        [(_UIAlertControllerPhoneTVMacView *)self setWidthConstraint:v17];

        double v18 = [(UIView *)self heightAnchor];
        double v19 = [v25 heightAnchor];
        double v20 = [v18 constraintEqualToAnchor:v19];
        [(_UIAlertControllerPhoneTVMacView *)self setHeightConstraint:v20];

        double v21 = [(_UIAlertControllerPhoneTVMacView *)self centerXConstraint];
        [v25 addConstraint:v21];

        id v22 = [(_UIAlertControllerPhoneTVMacView *)self centerYConstraint];
        [v25 addConstraint:v22];

        uint64_t v23 = [(_UIAlertControllerPhoneTVMacView *)self widthConstraint];
        [v25 addConstraint:v23];

        uint64_t v24 = [(_UIAlertControllerPhoneTVMacView *)self heightConstraint];
        [v25 addConstraint:v24];
      }
    }
  }
}

- (void)didMoveToSuperview
{
  [(_UIAlertControllerPhoneTVMacView *)self setCenterXConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setCenterYConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setWidthConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self setHeightConstraint:0];
  [(_UIAlertControllerPhoneTVMacView *)self _reevaluateSuperviewSizingConstraints];
}

- (void)_willMoveToWindow:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v7 _willMoveToWindow:v4];
  if (v4)
  {
    uint64_t v5 = [v4 windowScene];
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(1, v5, self);
    _UIGameControllerNotifyRelevantSystemUIWillShow(v5, self);
  }
  else
  {
    uint64_t v5 = [(UIView *)self _window];
    uint64_t v6 = [v5 windowScene];
    _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v6, self);
  }
}

- (void)didMoveToWindow
{
  double v3 = [(UIView *)self window];

  if (v3)
  {
    [(_UIAlertControllerPhoneTVMacView *)self _updateContentView];
    [(_UIAlertControllerPhoneTVMacView *)self _updateActionViewHeight];
    [(_UIAlertControllerPhoneTVMacView *)self _actionLayoutDirectionChanged];
  }
}

- (void)_prepareForWindowDealloc
{
  double v3 = [(UIView *)self _window];
  id v4 = [v3 windowScene];
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v5 _prepareForWindowDealloc];
}

- (void)_prepareForWindowHostingSceneRemoval
{
  double v3 = [(UIView *)self _window];
  id v4 = [v3 windowScene];
  _UIFocusBehaviorSetOverrideFocusSystemEnabled(0, v4, self);

  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerPhoneTVMacView;
  [(UIView *)&v5 _prepareForWindowHostingSceneRemoval];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setEffectAlpha:(double)a3
{
}

- (double)effectAlpha
{
  [(UIView *)self->_contentView alpha];
  return result;
}

- (void)_disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self shouldHaveBackdropView];
    uint64_t v6 = [(UIView *)self layer];
    char v7 = [v6 allowsGroupOpacity];

    if (v5)
    {
      int v8 = [(UIView *)self layer];
      [v8 setAllowsGroupOpacity:0];
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __104___UIAlertControllerPhoneTVMacView__disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator___block_invoke;
    v9[3] = &unk_1E52ECE28;
    BOOL v10 = v5;
    v9[4] = self;
    char v11 = v7;
    [v4 animateAlongsideTransition:0 completion:v9];
  }
}

- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86___UIAlertControllerPhoneTVMacView_configureForPresentAlongsideTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  id v4 = a3;
  +[UIView performWithoutAnimation:v5];
  [(_UIAlertControllerPhoneTVMacView *)self _disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:v4];
  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView configureForPresentAlongsideTransitionCoordinator:v4];
}

- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3
{
  id v4 = a3;
  [(_UIAlertControllerPhoneTVMacView *)self _disableAllowGroupOpacitiyIfNecessaryAlongsideTransitionCoordinator:v4];
  [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView configureForDismissAlongsideTransitionCoordinator:v4];
}

- (int64_t)tintAdjustmentMode
{
  return 1;
}

- (id)preferredFocusedView
{
  double v3 = [(_UIAlertControllerPhoneTVMacView *)self textFields];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    BOOL v5 = [(_UIAlertControllerPhoneTVMacView *)self _textFieldViewController];
    uint64_t v6 = [v5 preferredFocusedView];

    goto LABEL_10;
  }
  if ([(_UIAlertControllerPhoneTVMacView *)self _hasDiscreteCancelAction])
  {
    discreteCancelActionGroupView = self->_discreteCancelActionGroupView;
  }
  else
  {
    int v8 = [(UIInterfaceActionGroupView *)self->_mainInterfaceActionsGroupView actionGroup];
    long long v9 = [v8 actions];
    uint64_t v10 = [v9 count];

    if (!v10)
    {
      v13.receiver = self;
      v13.super_class = (Class)_UIAlertControllerPhoneTVMacView;
      char v11 = [(UIView *)&v13 preferredFocusedView];
      goto LABEL_9;
    }
    discreteCancelActionGroupView = self->_mainInterfaceActionsGroupView;
  }
  char v11 = discreteCancelActionGroupView;
LABEL_9:
  uint64_t v6 = v11;
LABEL_10:
  return v6;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  uint64_t v4 = [a3 nextFocusedView];
  LOBYTE(self) = [(UIView *)self containsView:v4];

  return (char)self;
}

- (BOOL)_actionsReversed
{
  return self->_actionsReversed;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (CGSize)_layoutSize
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setLayoutSize:(CGSize)a3
{
  self->_layoutSize = a3;
}

- (_UIAlertControllerActionViewMetrics)actionViewMetrics
{
  return self->_actionViewMetrics;
}

- (void)setActionViewMetrics:(id)a3
{
}

- (BOOL)actionScrubbingEnabled
{
  return self->_actionScrubbingEnabled;
}

- (double)offset
{
  return self->_offset;
}

- (BOOL)presentationContextPrefersCancelActionShown
{
  return self->_presentationContextPrefersCancelActionShown;
}

- (NSLayoutConstraint)foregroundViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 800, 1);
}

- (void)setForegroundViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 808, 1);
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 816, 1);
}

- (void)setContentViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewMaxHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 824, 1);
}

- (void)setContentViewMaxHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)headerContentViewControllerContainerViewTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 832, 1);
}

- (void)setHeaderContentViewControllerContainerViewTopAlignmentConstraint:(id)a3
{
}

- (NSArray)titleAndMessageLabelVibrantContainerViewVerticalConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 840, 1);
}

- (void)setTitleAndMessageLabelVibrantContainerViewVerticalConstraints:(id)a3
{
}

- (_UIFlexibleConstantConstraintSet)titleLabelTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 848, 1);
}

- (void)setTitleLabelTopAlignmentConstraints:(id)a3
{
}

- (_UIFlexibleConstantConstraintSet)messageLabelTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 856, 1);
}

- (void)setMessageLabelTopAlignmentConstraints:(id)a3
{
}

- (NSLayoutConstraint)detailMessageLabelTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 864, 1);
}

- (void)setDetailMessageLabelTopAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerViewLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 872, 1);
}

- (void)setContentViewControllerViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerViewRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 880, 1);
}

- (void)setContentViewControllerViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 888, 1);
}

- (void)setContentViewControllerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 896, 1);
}

- (void)setContentViewControllerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerViewLeftConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 904, 1);
}

- (void)setTextFieldViewControllerViewLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerViewRightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 912, 1);
}

- (void)setTextFieldViewControllerViewRightConstraint:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 920, 1);
}

- (void)setTextFieldViewControllerViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 928, 1);
}

- (void)setTextFieldViewControllerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentScrollViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 936, 1);
}

- (void)setContentScrollViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentScrollViewMaximumWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 944, 1);
}

- (void)setContentScrollViewMaximumWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentScrollViewMaximumHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 952, 1);
}

- (void)setContentScrollViewMaximumHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerContainerViewTopAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 960, 1);
}

- (void)setContentViewControllerContainerViewTopAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 968, 1);
}

- (void)setContentViewControllerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewControllerContainerViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 976, 1);
}

- (void)setContentViewControllerContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 984, 1);
}

- (void)setSeparatedHeaderContentViewControllerContainerViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)separatedHeaderContentViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 992, 1);
}

- (void)setSeparatedHeaderContentViewControllerContainerViewWidthConstraint:(id)a3
{
}

- (_UIFlexibleConstantConstraintSet)textFieldViewControllerContainerViewTopAlignmentConstraints
{
  return (_UIFlexibleConstantConstraintSet *)objc_getProperty(self, a2, 1000, 1);
}

- (void)setTextFieldViewControllerContainerViewTopAlignmentConstraints:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerContainerViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setTextFieldViewControllerContainerViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)textFieldViewControllerContainerViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTextFieldViewControllerContainerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerYConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setCenterYConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)mainActionButtonSequenceViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setMainActionButtonSequenceViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)mainActionButtonSequenceViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setMainActionButtonSequenceViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)mainActionButtonSequenceViewHorizontalAlignmentConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setMainActionButtonSequenceViewHorizontalAlignmentConstraint:(id)a3
{
}

- (NSLayoutConstraint)discreteActionGroupViewHorizontalLayoutTrailingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setDiscreteActionGroupViewHorizontalLayoutTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionGroupEqualsContentViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setActionGroupEqualsContentViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)discreteCancelActionViewTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setDiscreteCancelActionViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)discreteCancelActionViewLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setDiscreteCancelActionViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)discreteCancelActionViewWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setDiscreteCancelActionViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)discreteCancelActionViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setDiscreteCancelActionViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discreteCancelActionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_actionGroupEqualsContentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_discreteActionGroupViewHorizontalLayoutTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewHorizontalAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_mainActionButtonSequenceViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerViewTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerViewTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewMaximumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewMaximumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewRightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewControllerViewLeftConstraint, 0);
  objc_storeStrong((id *)&self->_detailMessageLabelTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_messageLabelTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_titleLabelTopAlignmentConstraints, 0);
  objc_storeStrong((id *)&self->_titleAndMessageLabelVibrantContainerViewVerticalConstraints, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerContainerViewTopAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewMaxHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_foregroundViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_actionViewMetrics, 0);
  objc_storeStrong((id *)&self->_effectivePreferredAction, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_noDimmingViewConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraintsForActionSheetStyle, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraintsForAlertStyle, 0);
  objc_storeStrong((id *)&self->_dimmingViewForegroundViewBottomConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewForegroundViewTopConstraints, 0);
  objc_storeStrong((id *)&self->_dimmingViewConstraints, 0);
  objc_storeStrong((id *)&self->_actionViews, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutAlignmentAvailableSpaceView, 0);
  objc_storeStrong((id *)&self->_keyboardLayoutAlignmentView, 0);
  objc_storeStrong((id *)&self->_textFieldViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_headerContentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_separatedHeaderContentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_detailMessageLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndMessageLabelVibrantContainerView, 0);
  objc_storeStrong((id *)&self->_discreteCancelActionGroupView, 0);
  objc_storeStrong((id *)&self->_mainInterfaceActionsGroupView, 0);
  objc_storeStrong((id *)&self->_contentViewTopItemsView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_destroyWeak((id *)&self->_alertController);
}

@end