@interface UIInterfaceActionGroupView
- (BOOL)_actionLayoutAxisUnknownDisallowedIsVertical;
- (BOOL)_alignActionSeparatorLeadingEdgeWithContent;
- (BOOL)_drawsBackground;
- (BOOL)_hasLoadedStackViewContents;
- (BOOL)_isCornerRadiusDisplayEnabled;
- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3;
- (BOOL)_shouldInstallContentGuideConstraints;
- (BOOL)_shouldShowSeparatorAboveActionsSequenceView;
- (BOOL)focusAvoidsNonDefaultActionsIfPossible;
- (BOOL)isSpringLoaded;
- (BOOL)scrubbingEnabled;
- (BOOL)showsSeparatorAboveActions;
- (CGRect)_actionSequenceVisibleRectForMakingCenteredAction:(id)a3;
- (CGRect)_contentEdgeFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)allowedActionLayoutAxisByPriority;
- (NSArray)arrangedHeaderViews;
- (NSArray)topLevelViewArrangementConstraints;
- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToConstantConstraint;
- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToContentGuideConstraint;
- (NSMutableArray)arrangedScrollableHeaderViews;
- (NSPointerArray)weakSimultaneouslyPresentedGroupViews;
- (UIEdgeInsets)_buttonEdgeInsetsFromGroupViewEdge;
- (UIFont)_visualStyleOverrideTitleLabelFont;
- (UIInterfaceActionGroup)actionGroup;
- (UIInterfaceActionGroupView)initWithActionGroup:(id)a3 actionHandlerInvocationDelegate:(id)a4;
- (UIInterfaceActionHandlerInvocationDelegate)actionHandlerInvocationDelegate;
- (UIInterfaceActionHighlightAttributes)visualStyleOverrideActionHighlightAttributes;
- (UIInterfaceActionRepresentationView)preferredActionRepresentation;
- (UIInterfaceActionSelectionTrackingController)actionSelectionController;
- (UIInterfaceActionSeparatorAttributes)_visualStyleOverrideSeparatorAttributes;
- (UIInterfaceActionVisualStyle)appliedVisualStyle;
- (UIInterfaceActionVisualStyle)visualStyle;
- (UIInterfaceActionVisualStyleProviding)visualStyleProvider;
- (UILongPressGestureRecognizer)actionSelectionGestureRecognizer;
- (UISeparatorDisplaying)actionSequenceTopSeparatorView;
- (UIView)backgroundView;
- (UIView)topLevelItemsView;
- (_UIContentConstraintsLayoutGuide)contentGuide;
- (_UIInterfaceActionRepresentationsSequenceView)actionSequenceView;
- (double)_selectionHighlightContinuousCornerRadius;
- (double)_topLevelItemsMargin;
- (double)requiredActionRepresentationWidth;
- (id)_actionRepresentationViewForAction:(id)a3;
- (id)_alertController;
- (id)_allActionViews;
- (id)_constraintsToPinView:(id)a3 toObject:(id)a4 identifier:(id)a5;
- (id)_currentlyFocusedActionView;
- (id)_defaultOrderingForActionRepresentationViews:(id)a3;
- (id)_initWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5;
- (id)_interfaceActionGroupViewState;
- (id)_interfaceActionOfFocusedRepresentationView;
- (id)_loadVisualStyleForTraitCollection:(id)a3;
- (id)_newActionGroupBackgroundView;
- (id)_newSeparatorViewForSeparatingTitleAndButtons;
- (id)_orderedTopLevelViews;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_viewContainingTopLevelItems;
- (id)_viewDisplayingRoundedBackground;
- (id)_visualStyleByApplyingOurTraitsToVisualStyle:(id)a3 traitCollection:(id)a4;
- (id)_widthAnchoredToContentGuideConstraintForTopLevelView:(id)a3;
- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
- (int64_t)_actionLayoutAxisUnknowDisallowed;
- (int64_t)actionLayoutAxis;
- (int64_t)presentationStyle;
- (void)_addBackgroudViewToViewHierarchy:(id)a3;
- (void)_addConstraintToActiveTopLevelViewArrangementConstraints:(id)a3;
- (void)_applyVisualStyle;
- (void)_applyVisualStyleCornerRadius;
- (void)_applyVisualStyleToActionsViewScrollView;
- (void)_applyVisualStyleToBackgroundViewDisplay;
- (void)_arrangeActionViewsInActionSequenceView;
- (void)_arrangeTopLevelViews;
- (void)_associateWeakSimultaneouslyPresentedGroupViews:(id)a3 bidirectional:(BOOL)a4;
- (void)_commonInitWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5;
- (void)_determineActualLayoutAxis;
- (void)_installContentGuideConstraints;
- (void)_loadActionSequenceView;
- (void)_loadTopLevelItemsView;
- (void)_loadViewsIfNeeded;
- (void)_reloadStackViewContentsIfNeeded;
- (void)_reloadTopSeparatorView;
- (void)_reloadVisualStyleTrackingTraitUsage;
- (void)_removeConstraintToActiveTopLevelViewArrangementConstraints:(id)a3;
- (void)_removeUsAsThePresentingViewControllerForAllActions;
- (void)_scrollActionRepresentationViewToVisibleForAction:(id)a3 animated:(BOOL)a4;
- (void)_scrollPreferredActionRepresentationViewToVisibleAnimated:(BOOL)a3;
- (void)_setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3;
- (void)_setAndApplyVisualStyle:(id)a3;
- (void)_setDrawsBackground:(BOOL)a3;
- (void)_setLayoutDebuggingIdentifier:(id)a3;
- (void)_setNeedsUpdateActionSequenceViewArrangement;
- (void)_setNeedsUpdateTopLevelViewsArrangement;
- (void)_setSelectionHighlightContinuousCornerRadius:(double)a3;
- (void)_setUsAsThePresentingViewControllerForAllActions;
- (void)_setVisualStyleOverrideActionHighlightAttributes:(id)a3;
- (void)_setVisualStyleOverrideSeparatorAttributes:(id)a3;
- (void)_setVisualStyleOverrideTitleLabelFont:(id)a3;
- (void)_updateActionSequenceScrollability;
- (void)_updateActionSequenceViewActionLayoutAxis;
- (void)_updateActionSequenceViewDebugLayoutIdentifier;
- (void)_updateRequiredActionRepresentationSizeConstraints;
- (void)_updateRoundedCornerPositionForSubviews;
- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3;
- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3;
- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3;
- (void)dealloc;
- (void)insertArrangedHeaderView:(id)a3 atIndex:(unint64_t)a4 scrollable:(BOOL)a5;
- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5;
- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentActionGroupProperties:(id)a4;
- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentVisualStyle:(id)a4;
- (void)layoutSubviews;
- (void)reloadVisualStyle;
- (void)removeArrangedHeaderView:(id)a3;
- (void)scrollToCenterForInterfaceAction:(id)a3;
- (void)setActionGroup:(id)a3;
- (void)setActionHandlerInvocationDelegate:(id)a3;
- (void)setActionLayoutAxis:(int64_t)a3;
- (void)setActionSelectionGestureRecognizer:(id)a3;
- (void)setActiveTestingVisualStyle:(id)a3;
- (void)setAllowedActionLayoutAxisByPriority:(id)a3;
- (void)setAppliedVisualStyle:(id)a3;
- (void)setFocusAvoidsNonDefaultActionsIfPossible:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPreferredActionRepresentation:(id)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setRequiredActionRepresentationWidth:(double)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setShowsSeparatorAboveActions:(BOOL)a3;
- (void)setSimultaneouslyPresentedGroupViews:(id)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setVisualStyle:(id)a3;
- (void)setVisualStyleProvider:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateConstraints;
@end

@implementation UIInterfaceActionGroupView

- (void)setFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)UIInterfaceActionGroupView;
  -[UIView setFrame:](&v30, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(UIView *)self superview];
  if (v4
    && dyld_program_sdk_at_least()
    && -[UIView _usesAutoresizingConstraints]((uint64_t)self))
  {
    v5 = -[UIView _autoresizingConstraints](self);
    if ([v5 count] == 4)
    {
      [v4 bounds];
      -[UIView _alignmentRectForBounds:](self, "_alignmentRectForBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat rect = v12;
      [(UIView *)self _alignmentFrame];
      CGFloat v15 = v14;
      CGFloat v28 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      v22 = [v5 objectAtIndexedSubscript:0];
      v31.origin.x = v15;
      v31.origin.y = v17;
      v31.size.width = v19;
      v31.size.height = v21;
      double MinX = CGRectGetMinX(v31);
      v32.origin.x = v7;
      v32.origin.y = v9;
      v32.size.width = v11;
      v32.size.height = v13;
      [v22 setConstant:MinX - CGRectGetMinX(v32)];

      v24 = [v5 objectAtIndexedSubscript:1];
      v33.origin.x = v28;
      v33.origin.y = v17;
      v33.size.width = v19;
      v33.size.height = v21;
      [v24 setConstant:CGRectGetWidth(v33)];

      v25 = [v5 objectAtIndexedSubscript:2];
      v34.origin.x = v28;
      v34.origin.y = v17;
      v34.size.width = v19;
      v34.size.height = v21;
      double MinY = CGRectGetMinY(v34);
      v35.origin.x = v7;
      v35.origin.y = v9;
      v35.size.width = v11;
      v35.size.height = rect;
      [v25 setConstant:MinY - CGRectGetMinY(v35)];

      v27 = [v5 objectAtIndexedSubscript:3];
      v36.origin.x = v28;
      v36.origin.y = v17;
      v36.size.width = v19;
      v36.size.height = v21;
      [v27 setConstant:CGRectGetHeight(v36)];
    }
    else
    {
      -[UIView _invalidateAutoresizingConstraints]((uint64_t)self);
    }
  }
}

- (void)_commonInitWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v17 = a3;
  id v9 = a4;
  objc_storeStrong((id *)&self->_actionGroup, a3);
  id v10 = a5;
  [(UIInterfaceActionGroup *)self->_actionGroup _addActionGroupDisplayPropertyObserver:self];
  [(UIInterfaceActionGroupView *)self _setUsAsThePresentingViewControllerForAllActions];
  CGFloat v11 = [MEMORY[0x1E4F1CA48] array];
  arrangedScrollableHeaderViews = self->_arrangedScrollableHeaderViews;
  self->_arrangedScrollableHeaderViews = v11;

  objc_storeWeak((id *)&self->_actionHandlerInvocationDelegate, v10);
  self->_presentationStyle = 0;
  self->_actionLayoutAxis = -1;
  allowedActionLayoutAxisByPriority = self->_allowedActionLayoutAxisByPriority;
  self->_allowedActionLayoutAxisByPriority = (NSArray *)&unk_1ED3EEFF0;

  self->_focusAvoidsNonDefaultActionsIfPossible = 0;
  self->_drawsBackground = 1;
  self->_needsUpdateTopLevelViewsArrangement = 1;
  self->_needsUpdateActionSequenceViewArrangement = 1;
  self->_needsInitialViewLoading = 1;
  objc_storeStrong((id *)&self->_cachedSizeCategory, @"_UICTContentSizeCategoryUnspecified");
  self->_scrubbingEnabled = 1;
  double v14 = objc_alloc_init(_UIContentConstraintsLayoutGuide);
  contentGuide = self->_contentGuide;
  self->_contentGuide = v14;

  [(UIView *)self addLayoutGuide:self->_contentGuide];
  [(UIInterfaceActionGroupView *)self _installContentGuideConstraints];
  [(UIView *)self setOpaque:0];
  double v16 = +[UIColor clearColor];
  [(UIView *)self setBackgroundColor:v16];

  [(UIView *)self setNeedsUpdateConstraints];
  [(UIInterfaceActionGroupView *)self _loadTopLevelItemsView];
  [(UIInterfaceActionGroupView *)self _loadActionSequenceView];
  if (v9) {
    [(UIInterfaceActionGroupView *)self setVisualStyleProvider:v9];
  }
  else {
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (UIInterfaceActionGroupView)initWithActionGroup:(id)a3 actionHandlerInvocationDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIInterfaceActionGroupView;
  double v8 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = v8;
  if (v8) {
    [(UIInterfaceActionGroupView *)v8 _commonInitWithActionGroup:v6 visualStyleProvider:0 actionHandlerInvocationDelegate:v7];
  }

  return v9;
}

- (id)_initWithActionGroup:(id)a3 visualStyleProvider:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIInterfaceActionGroupView;
  objc_super v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v12 = v11;
  if (v11) {
    [(UIInterfaceActionGroupView *)v11 _commonInitWithActionGroup:v8 visualStyleProvider:v9 actionHandlerInvocationDelegate:v10];
  }

  return v12;
}

- (void)dealloc
{
  [(UIInterfaceActionGroupView *)self _removeUsAsThePresentingViewControllerForAllActions];
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupView;
  [(UIView *)&v3 dealloc];
}

- (void)setActionGroup:(id)a3
{
  p_actionGroup = &self->_actionGroup;
  id v8 = a3;
  if (([v8 isEqual:*p_actionGroup] & 1) == 0)
  {
    [(UIInterfaceActionGroupView *)self _removeUsAsThePresentingViewControllerForAllActions];
    id v6 = [v8 _visualStyle];

    if (!v6)
    {
      id v7 = [(UIInterfaceActionGroup *)*p_actionGroup _visualStyle];
      [v8 _setVisualStyle:v7];
    }
    [(UIInterfaceActionGroup *)*p_actionGroup _removeActionGroupDisplayPropertyObserver:self];
    objc_storeStrong((id *)&self->_actionGroup, a3);
    [(UIInterfaceActionGroup *)*p_actionGroup _addActionGroupDisplayPropertyObserver:self];
    [(UIInterfaceActionGroupView *)self _setUsAsThePresentingViewControllerForAllActions];
    [(UIInterfaceActionGroupView *)self _setNeedsUpdateTopLevelViewsArrangement];
    [(UIInterfaceActionGroupView *)self _setNeedsUpdateActionSequenceViewArrangement];
  }
}

- (void)setActionLayoutAxis:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_actionLayoutAxis != a3)
  {
    self->_int64_t actionLayoutAxis = a3;
    [(UIInterfaceActionGroupView *)self _updateActionSequenceViewActionLayoutAxis];
    int64_t actionLayoutAxis = self->_actionLayoutAxis;
    v5 = [(UIInterfaceActionGroupView *)self _allActionViews];
    uint64_t v6 = [v5 count];

    if (v6 == 1) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = actionLayoutAxis;
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [(UIInterfaceActionGroupView *)self _allActionViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          CGFloat v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_super v14 = [v13 actionViewStateContext];
          char v15 = objc_opt_respondsToSelector();

          if (v15)
          {
            double v16 = [v13 actionViewStateContext];
            [v16 setActionLayoutAxis:v7];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (void)setAllowedActionLayoutAxisByPriority:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_allowedActionLayoutAxisByPriority] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_allowedActionLayoutAxisByPriority, a3);
    [(UIInterfaceActionGroupView *)self setActionLayoutAxis:-1];
    [(UIView *)self setNeedsLayout];
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (void)insertArrangedHeaderView:(id)a3 atIndex:(unint64_t)a4 scrollable:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = [[_UIInterfaceActionGroupHeaderScrollView alloc] initWithContentView:v7];

  [(UIScrollView *)v8 setScrollEnabled:v5];
  [(NSMutableArray *)self->_arrangedScrollableHeaderViews addObject:v8];
  [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
}

- (void)removeArrangedHeaderView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIInterfaceActionGroupView *)self arrangedHeaderViews];
  uint64_t v6 = [v5 indexOfObjectIdenticalTo:v4];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_arrangedScrollableHeaderViews removeObjectAtIndex:v6];
    [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
  }
}

- (NSArray)arrangedHeaderViews
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  arrangedScrollableHeaderViews = self->_arrangedScrollableHeaderViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__UIInterfaceActionGroupView_arrangedHeaderViews__block_invoke;
  v7[3] = &unk_1E52DA438;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)arrangedScrollableHeaderViews enumerateObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __49__UIInterfaceActionGroupView_arrangedHeaderViews__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_super v3 = [v6 contentView];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 contentView];
    [v4 addObject:v5];
  }
}

- (void)setPresentationStyle:(int64_t)a3
{
  if (self->_presentationStyle != a3)
  {
    self->_presentationStyle = a3;
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  if (self->_scrubbingEnabled != a3)
  {
    self->_scrubbingEnabled = a3;
    -[UIInterfaceActionSelectionTrackingController setScrubbingEnabled:](self->_actionSelectionController, "setScrubbingEnabled:");
  }
}

- (void)scrollToCenterForInterfaceAction:(id)a3
{
  id v4 = a3;
  [(UIInterfaceActionGroupView *)self _scrollActionRepresentationViewToVisibleForAction:v4 animated:+[UIView areAnimationsEnabled]];
}

- (void)configureForPresentAlongsideTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInterfaceActionGroupView *)self visualStyle];
  [v5 configureForPresentingGroupView:self alongsideTransitionCoordinator:v4];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  id v7 = v6;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke_2;
    v8[3] = &unk_1E52DA110;
    uint64_t v9 = v6;
    [v4 animateAlongsideTransition:v8 completion:0];
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scrollPreferredActionRepresentationViewToVisibleAnimated:0];
}

uint64_t __80__UIInterfaceActionGroupView_configureForPresentAlongsideTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)configureForDismissAlongsideTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(UIInterfaceActionGroupView *)self visualStyle];
  [v5 configureForDismissingGroupView:self alongsideTransitionCoordinator:v4];
}

- (void)setRequiredActionRepresentationWidth:(double)a3
{
  if (self->_requiredActionRepresentationWidth != a3)
  {
    self->_requiredActionRepresentationWidth = a3;
    [(UIInterfaceActionGroupView *)self _updateRequiredActionRepresentationSizeConstraints];
  }
}

- (UIEdgeInsets)_buttonEdgeInsetsFromGroupViewEdge
{
  objc_super v3 = [(UIInterfaceActionGroupView *)self visualStyle];
  [v3 actionSequenceEdgeInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(UIInterfaceActionGroupView *)self actionSequenceView];
  [v12 layoutMargins];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v5 + v14;
  double v22 = v7 + v16;
  double v23 = v9 + v18;
  double v24 = v11 + v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)_updateRequiredActionRepresentationSizeConstraints
{
  if (self->_requiredActionRepresentationWidth <= 0.0)
  {
    [(UIInterfaceActionGroupView *)self _removeConstraintToActiveTopLevelViewArrangementConstraints:self->_actionSequenceViewWidthAnchoredToConstantConstraint];
    actionSequenceViewWidthAnchoredToContentGuideConstraint = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
    [(UIInterfaceActionGroupView *)self _addConstraintToActiveTopLevelViewArrangementConstraints:actionSequenceViewWidthAnchoredToContentGuideConstraint];
  }
  else
  {
    [(UIInterfaceActionGroupView *)self _buttonEdgeInsetsFromGroupViewEdge];
    [(NSLayoutConstraint *)self->_actionSequenceViewWidthAnchoredToConstantConstraint setConstant:v4 + self->_requiredActionRepresentationWidth + v3];
    [(UIInterfaceActionGroupView *)self _addConstraintToActiveTopLevelViewArrangementConstraints:self->_actionSequenceViewWidthAnchoredToConstantConstraint];
    double v5 = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
    [(UIInterfaceActionGroupView *)self _removeConstraintToActiveTopLevelViewArrangementConstraints:v5];
  }
}

- (void)_addConstraintToActiveTopLevelViewArrangementConstraints:(id)a3
{
  id v4 = a3;
  [v4 setActive:1];
  id v8 = (id)[(NSArray *)self->_topLevelViewArrangementConstraints mutableCopy];
  [v8 addObject:v4];

  _UIConstraintsBySortingConstraintsForInsertionPerformance(v8, v5);
  double v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
  self->_topLevelViewArrangementConstraints = v6;
}

- (void)_removeConstraintToActiveTopLevelViewArrangementConstraints:(id)a3
{
  id v4 = a3;
  [v4 setActive:0];
  double v5 = (NSArray *)[(NSArray *)self->_topLevelViewArrangementConstraints mutableCopy];
  [(NSArray *)v5 removeObject:v4];

  topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
  self->_topLevelViewArrangementConstraints = v5;
}

- (id)_currentlyFocusedActionView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isFocused])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (UIInterfaceActionRepresentationView)preferredActionRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIInterfaceActionGroupView *)self _currentlyFocusedActionView];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v26 = 0;
    v27 = (id *)&v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__5;
    objc_super v30 = __Block_byref_object_dispose__5;
    id v31 = 0;
    double v6 = [(UIInterfaceActionGroupView *)self actionGroup];
    double v7 = [v6 preferredAction];

    if ([v7 isEnabled])
    {
      long long v8 = v27;
      id v9 = v7;
      id v10 = v8[5];
      v8[5] = v9;
    }
    else if ([(UIInterfaceActionGroupView *)self focusAvoidsNonDefaultActionsIfPossible])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v11 = [(UIInterfaceActionGroupView *)self actionGroup];
      double v12 = [v11 actions];

      uint64_t v13 = (void *)[v12 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v13)
      {
        id v10 = 0;
        uint64_t v14 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v12);
            }
            double v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v16 isEnabled])
            {
              if ([v16 type] != 2 && objc_msgSend(v16, "type") != 1)
              {
                id v5 = [(UIInterfaceActionGroupView *)self _actionRepresentationViewForAction:v16];

                goto LABEL_24;
              }
              if (!v10)
              {
                if ([v16 type] == 1) {
                  id v10 = v16;
                }
                else {
                  id v10 = 0;
                }
              }
            }
          }
          uint64_t v13 = (void *)[v12 countByEnumeratingWithState:&v22 objects:v32 count:16];
          if (v13) {
            continue;
          }
          break;
        }

        if (v10)
        {
          int v17 = 0;
          double v18 = v10;
          goto LABEL_31;
        }
      }
      else
      {
      }
      double v12 = [(UIInterfaceActionGroupView *)self actionGroup];
      uint64_t v13 = [v12 actions];
      double v18 = [v13 firstObject];
      id v10 = 0;
      int v17 = 1;
LABEL_31:
      objc_storeStrong(v27 + 5, v18);
      if (v17)
      {
      }
    }
    else
    {
      id v10 = [(UIInterfaceActionGroupView *)self actionGroup];
      double v19 = [v10 actions];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __59__UIInterfaceActionGroupView_preferredActionRepresentation__block_invoke;
      v21[3] = &unk_1E52DA460;
      v21[4] = &v26;
      [v19 enumerateObjectsUsingBlock:v21];
    }
    id v5 = [(UIInterfaceActionGroupView *)self _actionRepresentationViewForAction:v27[5]];
LABEL_24:

    _Block_object_dispose(&v26, 8);
  }

  return (UIInterfaceActionRepresentationView *)v5;
}

void __59__UIInterfaceActionGroupView_preferredActionRepresentation__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 isEnabled])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_systemDefaultFocusGroupIdentifier
{
  id v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    id v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInterfaceActionGroupView;
    id v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentActionGroupProperties:(id)a4
{
  id v8 = a4;
  if (+[UIInterfaceAction changedProperties:containsAny:](UIInterfaceAction, "changedProperties:containsAny:"))
  {
    [(UIView *)self setNeedsFocusUpdate];
  }
  if (+[UIInterfaceAction changedProperties:v8 containsAny:&unk_1ED3EF020])
  {
    [(UIInterfaceActionGroupView *)self _setNeedsUpdateActionSequenceViewArrangement];
  }
  id v5 = [(UIInterfaceActionGroupView *)self visualStyle];
  double v6 = [v5 actionGroupPropertiesAffectingActionsScrollViewStyling];
  BOOL v7 = +[UIInterfaceActionGroup changedProperties:v8 containsAny:v6];

  if (v7) {
    [(UIInterfaceActionGroupView *)self _applyVisualStyleToActionsViewScrollView];
  }
}

- (void)interfaceActionGroup:(id)a3 reloadDisplayedContentVisualStyle:(id)a4
{
  id v5 = a4;
  id v7 = [(UIView *)self traitCollection];
  double v6 = [(UIInterfaceActionGroupView *)self _visualStyleByApplyingOurTraitsToVisualStyle:v5 traitCollection:v7];

  [(UIInterfaceActionGroupView *)self _setAndApplyVisualStyle:v6];
}

- (void)setActiveTestingVisualStyle:(id)a3
{
  objc_storeStrong((id *)&self->_activeTestingVisualStyle, a3);
  [(UIInterfaceActionGroupView *)self reloadVisualStyle];
}

- (void)setVisualStyleProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_visualStyleProvider, obj);
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
    id v5 = obj;
  }
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  return [(UIInterfaceActionGroup *)self->_actionGroup _visualStyle];
}

- (void)_setAndApplyVisualStyle:(id)a3
{
  id v4 = a3;
  if (!self->_isSettingVisualStyle)
  {
    self->_isSettingVisualStyle = 1;
    id v7 = v4;
    id v5 = [(UIInterfaceActionGroup *)self->_actionGroup _visualStyle];
    char v6 = [v5 isEqual:v7];

    if ((v6 & 1) == 0)
    {
      [(UIInterfaceActionGroup *)self->_actionGroup _setVisualStyle:v7];
      [(UIInterfaceActionGroupView *)self _applyVisualStyle];
    }
    self->_isSettingVisualStyle = 0;
    id v4 = v7;
  }
}

- (void)reloadVisualStyle
{
}

- (void)_reloadVisualStyleTrackingTraitUsage
{
  id v3 = [(UIView *)self traitCollection];
  id v6 = [(UIInterfaceActionGroupView *)self _loadVisualStyleForTraitCollection:v3];

  id v4 = [(UIInterfaceActionGroup *)self->_actionGroup _visualStyle];
  char v5 = [v4 isEqual:v6];

  if ((v5 & 1) == 0) {
    [(UIInterfaceActionGroupView *)self _setAndApplyVisualStyle:v6];
  }
}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  return +[UIInterfaceActionVisualStyle idiomSpecificStyleForTraitCollection:a3 presentationStyle:a4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_presentationStyle == 2)
  {
    [(UIView *)self updateConstraintsIfNeeded];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    char v5 = [(UIView *)self->_topLevelItemsView subviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      double v9 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "systemLayoutSizeFittingSize:", width, v9);
          double v9 = v9 + v11;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    uint64_t v14 = [(UIInterfaceActionGroupView *)self visualStyle];
    [v14 maximumActionGroupContentSize];
    double v16 = v15;

    if (v9 >= v16) {
      double v12 = v16;
    }
    else {
      double v12 = v9;
    }
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    double width = v13;
  }
  double v17 = width;
  result.height = v12;
  result.double width = v17;
  return result;
}

- (void)updateConstraints
{
  [(UIInterfaceActionGroupView *)self _reloadStackViewContentsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupView;
  [(UIView *)&v3 updateConstraints];
}

- (void)layoutSubviews
{
  [(UIInterfaceActionGroupView *)self _reloadStackViewContentsIfNeeded];
  [(UIInterfaceActionGroupView *)self _determineActualLayoutAxis];
  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionGroupView;
  [(UIView *)&v4 layoutSubviews];
  [(UIView *)self sendSubviewToBack:self->_backgroundView];
  backgroundView = self->_backgroundView;
  [(UIInterfaceActionGroupView *)self _contentEdgeFrame];
  -[UIView setFrame:](backgroundView, "setFrame:");
}

- (BOOL)_shouldAllowPassthroughToLayersBehindUsForTouches:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__UIInterfaceActionGroupView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke;
  v6[3] = &unk_1E52DA488;
  v6[4] = self;
  objc_super v3 = [a3 objectsPassingTest:v6];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

uint64_t __80__UIInterfaceActionGroupView__shouldAllowPassthroughToLayersBehindUsForTouches___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 locationInView:*(void *)(a1 + 32)];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "pointInside:withEvent:", 0);
  *a3 = result;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIInterfaceActionGroupView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    [(UIResponder *)&v8 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIInterfaceActionGroupView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    [(UIResponder *)&v8 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIInterfaceActionGroupView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    [(UIResponder *)&v8 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIInterfaceActionGroupView *)self _shouldAllowPassthroughToLayersBehindUsForTouches:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionGroupView;
    [(UIResponder *)&v8 touchesCancelled:v6 withEvent:v7];
  }
}

- (void)setSpringLoaded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_springLoaded = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v4 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setSpringLoaded:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  long long v9 = (void (**)(id, id, unsigned char *))a4;
  long long v10 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandlerInvocationDelegate);
  long long v12 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained interfaceAction:v8 invokeActionHandler:v9 completion:v10];
  }
  else
  {
    if (v8)
    {
      char v13 = 0;
      v9[2](v9, v8, &v13);
    }
    if (v10) {
      v10[2](v10);
    }
  }
}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
}

- (void)setSimultaneouslyPresentedGroupViews:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addPointer:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(UIInterfaceActionGroupView *)self _associateWeakSimultaneouslyPresentedGroupViews:v5 bidirectional:1];
}

- (void)_associateWeakSimultaneouslyPresentedGroupViews:(id)a3 bidirectional:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [v7 compact];
  if (([(NSPointerArray *)self->_weakSimultaneouslyPresentedGroupViews isEqual:v7] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_weakSimultaneouslyPresentedGroupViews, a3);
    id v8 = v7;
    [v8 compact];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    if ([v8 count])
    {
      unint64_t v10 = 0;
      do
      {
        long long v11 = objc_msgSend((id)objc_msgSend(v8, "pointerAtIndex:", v10), "actionSelectionController");
        if (v11) {
          [v9 addObject:v11];
        }

        ++v10;
      }
      while (v10 < [v8 count]);
    }

    [(UIInterfaceActionSelectionTrackingController *)self->_actionSelectionController setCooperatingSelectionTrackingControllers:v9];
    if (v4)
    {
      long long v12 = [(NSPointerArray *)self->_weakSimultaneouslyPresentedGroupViews allObjects];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __92__UIInterfaceActionGroupView__associateWeakSimultaneouslyPresentedGroupViews_bidirectional___block_invoke;
      v13[3] = &unk_1E52DA4B0;
      id v14 = v8;
      double v15 = self;
      [v12 enumerateObjectsUsingBlock:v13];
    }
  }
}

void __92__UIInterfaceActionGroupView__associateWeakSimultaneouslyPresentedGroupViews_bidirectional___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)[*(id *)(a1 + 32) copy];
  [v4 compact];
  uint64_t v5 = [MEMORY[0x1E4F28E60] indexSet];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    do
    {
      if ((id)[v4 pointerAtIndex:v6] == v3) {
        [v5 addIndex:v6];
      }
      ++v6;
    }
    while (v6 < [v4 count]);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___pointerArrayRemovePointer_block_invoke;
  v8[3] = &unk_1E52DA548;
  id v9 = v4;
  id v7 = v4;
  [v5 enumerateIndexesWithOptions:2 usingBlock:v8];

  [v7 addPointer:*(void *)(a1 + 40)];
  [v3 _associateWeakSimultaneouslyPresentedGroupViews:v7 bidirectional:0];
}

- (id)_newActionGroupBackgroundView
{
  id v3 = [(UIInterfaceActionGroupView *)self visualStyle];
  id v4 = [(UIInterfaceActionGroupView *)self visualStyle];
  uint64_t v5 = [v4 groupViewState];
  unint64_t v6 = (void *)[v3 newGroupBackgroundViewWithGroupViewState:v5];

  return v6;
}

- (id)_interfaceActionOfFocusedRepresentationView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UIInterfaceActionGroupView *)self _allActionViews];
  id v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isFocused])
        {
          id v3 = [v6 action];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_installContentGuideConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  [(UIInterfaceActionGroupView *)self _topLevelItemsMargin];
  double v4 = v3;
  if ([(UIInterfaceActionGroupView *)self _shouldInstallContentGuideConstraints])
  {
    long long v18 = [(UIView *)self topAnchor];
    double v17 = [(UILayoutGuide *)self->_contentGuide topAnchor];
    uint64_t v16 = [v18 constraintEqualToAnchor:v17 constant:-v4];
    v19[0] = v16;
    uint64_t v5 = [(UIView *)self bottomAnchor];
    unint64_t v6 = [(UILayoutGuide *)self->_contentGuide bottomAnchor];
    id v7 = [v5 constraintEqualToAnchor:v6 constant:v4];
    v19[1] = v7;
    long long v8 = [(UIView *)self leadingAnchor];
    long long v9 = [(UILayoutGuide *)self->_contentGuide leadingAnchor];
    long long v10 = [v8 constraintEqualToAnchor:v9 constant:-v4];
    v19[2] = v10;
    long long v11 = [(UIView *)self trailingAnchor];
    long long v12 = [(UILayoutGuide *)self->_contentGuide trailingAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:v4];
    v19[3] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];

    [MEMORY[0x1E4F5B268] activateConstraints:v14];
  }
  else
  {
    contentGuide = self->_contentGuide;
    -[_UIContentConstraintsLayoutGuide setEdgeInsets:](contentGuide, "setEdgeInsets:", v4, v4, v4, v4);
  }
}

- (BOOL)_shouldInstallContentGuideConstraints
{
  return 1;
}

- (void)_reloadStackViewContentsIfNeeded
{
  double v3 = [(UIInterfaceActionGroupView *)self visualStyle];

  if (v3)
  {
    [(UIInterfaceActionGroupView *)self _loadViewsIfNeeded];
    [(UIInterfaceActionGroupView *)self _reloadTopSeparatorView];
    if (self->_needsUpdateTopLevelViewsArrangement) {
      [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
    }
    if (self->_needsUpdateActionSequenceViewArrangement) {
      [(UIInterfaceActionGroupView *)self _arrangeActionViewsInActionSequenceView];
    }
    [(UIInterfaceActionGroupView *)self _updateRoundedCornerPositionForSubviews];
  }
}

- (void)_updateRoundedCornerPositionForSubviews
{
  if ([(UIInterfaceActionGroupView *)self _shouldShowSeparatorAboveActionsSequenceView])
  {
    uint64_t v3 = 12;
  }
  else
  {
    uint64_t v3 = 15;
  }
  actionSequenceView = self->_actionSequenceView;
  [(_UIInterfaceActionRepresentationsSequenceView *)actionSequenceView setVisualCornerPosition:v3];
}

- (double)_topLevelItemsMargin
{
  return 0.0;
}

- (void)_loadTopLevelItemsView
{
  uint64_t v3 = (UIView *)objc_opt_new();
  topLevelItemsView = self->_topLevelItemsView;
  self->_topLevelItemsView = v3;

  [(UIView *)self->_topLevelItemsView setClipsToBounds:1];
  [(UIView *)self->_topLevelItemsView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:self->_topLevelItemsView];
  uint64_t v5 = (void *)MEMORY[0x1E4F5B268];
  id v6 = [(UIInterfaceActionGroupView *)self _constraintsToPinView:self->_topLevelItemsView toObject:self->_contentGuide identifier:@"topLevelItemsFrame"];
  [v5 activateConstraints:v6];
}

- (void)_loadActionSequenceView
{
  uint64_t v3 = [_UIInterfaceActionRepresentationsSequenceView alloc];
  double v4 = [(UIInterfaceActionGroupView *)self visualStyle];
  uint64_t v5 = [(_UIInterfaceActionRepresentationsSequenceView *)v3 initWithVisualStyle:v4];
  actionSequenceView = self->_actionSequenceView;
  self->_actionSequenceView = v5;

  [(UIInterfaceActionGroupView *)self _updateActionSequenceViewDebugLayoutIdentifier];
  [(UIView *)self->_actionSequenceView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1144733696;
  [(UIView *)self->_actionSequenceView setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(UIView *)self->_actionSequenceView setContentHuggingPriority:1 forAxis:v8];
  long long v9 = [(UIView *)self->_actionSequenceView widthAnchor];
  long long v10 = [v9 constraintEqualToConstant:0.0];
  actionSequenceViewWidthAnchoredToConstantConstraint = self->_actionSequenceViewWidthAnchoredToConstantConstraint;
  self->_actionSequenceViewWidthAnchoredToConstantConstraint = v10;

  id v15 = [(UIView *)self->_actionSequenceView widthAnchor];
  long long v12 = [(UILayoutGuide *)self->_contentGuide widthAnchor];
  uint64_t v13 = [v15 constraintEqualToAnchor:v12];
  actionSequenceViewWidthAnchoredToContentGuideConstraint = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
  self->_actionSequenceViewWidthAnchoredToContentGuideConstraint = v13;
}

- (void)_setLayoutDebuggingIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionGroupView;
  [(UIView *)&v4 _setLayoutDebuggingIdentifier:a3];
  [(UIInterfaceActionGroupView *)self _updateActionSequenceViewDebugLayoutIdentifier];
}

- (void)_updateActionSequenceViewDebugLayoutIdentifier
{
  actionSequenceView = self->_actionSequenceView;
  uint64_t v3 = NSString;
  uint64_t v4 = [(UIView *)self _layoutDebuggingIdentifier];
  uint64_t v5 = @"groupView";
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  id v7 = (id)v4;
  id v6 = [v3 stringWithFormat:@"%@.actionsSequenceView", v5];
  [(UIView *)actionSequenceView _setLayoutDebuggingIdentifier:v6];
}

- (void)_loadViewsIfNeeded
{
  if (self->_needsInitialViewLoading)
  {
    self->_needsInitialViewLoading = 0;
    uint64_t v3 = [[UIInterfaceActionSelectionTrackingController alloc] initWithTrackableContainerView:self actionsScrollView:self->_actionSequenceView];
    actionSelectionController = self->_actionSelectionController;
    self->_actionSelectionController = v3;

    [(UIInterfaceActionSelectionTrackingController *)self->_actionSelectionController setScrubbingEnabled:[(UIInterfaceActionGroupView *)self scrubbingEnabled]];
    [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
    [(UIInterfaceActionGroupView *)self _applyVisualStyle];
  }
}

- (UIInterfaceActionSelectionTrackingController)actionSelectionController
{
  [(UIInterfaceActionGroupView *)self _loadViewsIfNeeded];
  actionSelectionController = self->_actionSelectionController;
  return actionSelectionController;
}

- (void)_arrangeTopLevelViews
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  self->_needsUpdateTopLevelViewsArrangement = 0;
  [(UIInterfaceActionGroupView *)self _loadViewsIfNeeded];
  v57 = [(UIInterfaceActionGroupView *)self _viewContainingTopLevelItems];
  uint64_t v3 = [v57 subviews];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(UIInterfaceActionGroupView *)self _orderedTopLevelViews];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(UIView *)self traitCollection];
  double v8 = [v7 preferredContentSizeCategory];

  if (![v4 isEqual:v6] || v8 != self->_cachedSizeCategory)
  {
    objc_storeStrong((id *)&self->_cachedSizeCategory, v8);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v66 objects:v72 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v67 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if (([v6 containsObject:v14] & 1) == 0) {
            [v14 removeFromSuperview];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v66 objects:v72 count:16];
      }
      while (v11);
    }

    if ([v6 count])
    {
      v53 = v8;
      v55 = v4;
      id v15 = [MEMORY[0x1E4F1CA48] array];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v54 = v6;
      id obj = v6;
      uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v18 = 0;
        uint64_t v19 = *(void *)v63;
        do
        {
          uint64_t v20 = 0;
          long long v21 = v18;
          do
          {
            if (*(void *)v63 != v19) {
              objc_enumerationMutation(obj);
            }
            long long v22 = *(void **)(*((void *)&v62 + 1) + 8 * v20);
            [v57 addSubview:v22];
            if (v21)
            {
              uint64_t v23 = [v22 topAnchor];
              long long v24 = [v21 bottomAnchor];
              long long v25 = [v23 constraintEqualToAnchor:v24];
              [v15 addObject:v25];
            }
            uint64_t v26 = [v22 centerXAnchor];
            v27 = [(UILayoutGuide *)self->_contentGuide centerXAnchor];
            uint64_t v28 = [v26 constraintEqualToAnchor:v27];
            [v15 addObject:v28];

            v29 = [(UIInterfaceActionGroupView *)self _widthAnchoredToContentGuideConstraintForTopLevelView:v22];
            [v15 addObject:v29];

            id v18 = v22;
            ++v20;
            long long v21 = v18;
          }
          while (v17 != v20);
          uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
        }
        while (v17);
      }
      else
      {
        id v18 = 0;
      }

      objc_super v30 = [obj firstObject];
      id v31 = [v30 topAnchor];
      CGRect v32 = [(UILayoutGuide *)self->_contentGuide topAnchor];
      uint64_t v33 = [v31 constraintEqualToAnchor:v32];
      [v15 addObject:v33];

      CGRect v34 = [obj lastObject];
      CGRect v35 = [v34 bottomAnchor];
      CGRect v36 = [(UILayoutGuide *)self->_contentGuide bottomAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      [v15 addObject:v37];

      if (UIContentSizeCategoryIsAccessibilityCategory(self->_cachedSizeCategory))
      {
        v38 = [(UIView *)self->_actionSequenceView heightAnchor];
        v39 = [(UILayoutGuide *)self->_contentGuide heightAnchor];
        v40 = [v38 constraintEqualToAnchor:v39 multiplier:0.5];

        LODWORD(v41) = 1132003328;
        [(NSMutableArray *)v40 setPriority:v41];
        [v15 addObject:v40];
      }
      else
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v40 = self->_arrangedScrollableHeaderViews;
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v59 != v44) {
                objc_enumerationMutation(v40);
              }
              v46 = [*(id *)(*((void *)&v58 + 1) + 8 * j) heightAnchor];
              v47 = [(UIView *)self->_actionSequenceView heightAnchor];
              v48 = [v46 constraintGreaterThanOrEqualToAnchor:v47 multiplier:1.5];

              LODWORD(v49) = 1132003328;
              [v48 setPriority:v49];
              [v15 addObject:v48];
            }
            uint64_t v43 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v58 objects:v70 count:16];
          }
          while (v43);
        }
      }

      [MEMORY[0x1E4F5B268] deactivateConstraints:self->_topLevelViewArrangementConstraints];
      _UIConstraintsBySortingConstraintsForInsertionPerformance(v15, v50);
      v51 = (NSArray *)objc_claimAutoreleasedReturnValue();
      topLevelViewArrangementConstraints = self->_topLevelViewArrangementConstraints;
      self->_topLevelViewArrangementConstraints = v51;

      [MEMORY[0x1E4F5B268] activateConstraints:v15];
      [(UIView *)self setNeedsLayout];

      id v6 = v54;
      uint64_t v4 = v55;
      double v8 = v53;
    }
  }
}

- (id)_widthAnchoredToContentGuideConstraintForTopLevelView:(id)a3
{
  if (self->_actionSequenceView == a3)
  {
    id v6 = self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
  }
  else
  {
    uint64_t v4 = [a3 widthAnchor];
    uint64_t v5 = [(UILayoutGuide *)self->_contentGuide widthAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
  }
  return v6;
}

- (id)_orderedTopLevelViews
{
  uint64_t v3 = [(UIInterfaceActionGroupView *)self arrangedScrollableHeaderViews];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = (void *)[v3 mutableCopy];

  if (self->_actionSequenceView)
  {
    if (self->_actionSequenceTopSeparatorView)
    {
      id v6 = [(UIInterfaceActionGroup *)self->_actionGroup actions];
      uint64_t v7 = [v6 count];

      if (v7) {
        [v5 addObject:self->_actionSequenceTopSeparatorView];
      }
    }
    [v5 addObject:self->_actionSequenceView];
  }
  return v5;
}

- (BOOL)_hasLoadedStackViewContents
{
  v2 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_arrangeActionViewsInActionSequenceView
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  self->_needsUpdateActionSequenceViewArrangement = 0;
  CGRect v34 = [(UIInterfaceActionGroupView *)self visualStyle];
  BOOL v3 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  CGRect v36 = (void *)[v3 mutableCopy];

  v37 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v4 = self;
  id obj = [(UIInterfaceActionGroup *)self->_actionGroup actionsBySection];
  uint64_t v32 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v47;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v47 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v5;
        id v6 = *(void **)(*((void *)&v46 + 1) + 8 * v5);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v35 = [v6 actions];
        uint64_t v7 = [v35 countByEnumeratingWithState:&v42 objects:v53 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v43 != v9) {
                objc_enumerationMutation(v35);
              }
              uint64_t v11 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              id v12 = v36;
              id v13 = v11;
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v50[2] = ___dequeueRepresentationViewWithIdenticalAction_block_invoke;
              v50[3] = &unk_1E52DA570;
              id v51 = v13;
              id v14 = v13;
              uint64_t v15 = [v12 indexOfObjectPassingTest:v50];
              if (v15 == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v16 = 0;
              }
              else
              {
                uint64_t v17 = v15;
                uint64_t v16 = [v12 objectAtIndexedSubscript:v15];
                [v12 removeObjectAtIndex:v17];
              }

              if (!v16)
              {
                id v18 = [v34 concreteVisualStyle];
                uint64_t v16 = (void *)[v18 newRepresentationViewForAction:v14];
              }
              [v16 setOwnsActionContent:1];
              objc_msgSend(v16, "setSpringLoaded:", -[UIInterfaceActionGroupView isSpringLoaded](v4, "isSpringLoaded"));
              [v37 addObject:v16];
              uint64_t v19 = [v6 sectionID];
              [v16 setSectionID:v19];
            }
            uint64_t v8 = [v35 countByEnumeratingWithState:&v42 objects:v53 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v32);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v36;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * j) setOwnsActionContent:0];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v22);
  }

  long long v25 = [(UIInterfaceActionGroupView *)v4 _defaultOrderingForActionRepresentationViews:v37];
  uint64_t v26 = [(_UIInterfaceActionRepresentationsSequenceView *)v4->_actionSequenceView arrangedActionRepresentationViews];
  char v27 = [v26 isEqual:v25];

  if ((v27 & 1) == 0)
  {
    [(_UIInterfaceActionRepresentationsSequenceView *)v4->_actionSequenceView setArrangedActionRepresentationViews:v25];
    actionSelectionController = v4->_actionSelectionController;
    v29 = [(_UIInterfaceActionRepresentationsSequenceView *)v4->_actionSequenceView arrangedActionRepresentationViews];
    [(UIInterfaceActionSelectionTrackingController *)actionSelectionController setRepresentationViews:v29];

    [(UIInterfaceActionGroupView *)v4 _actionSequenceViewContentSizeDidChange];
  }
  [(UIInterfaceActionGroupView *)v4 _updateActionSequenceScrollability];
}

- (void)_updateActionSequenceScrollability
{
  BOOL v3 = [(UIInterfaceActionGroupView *)self actionGroup];
  uint64_t v4 = [v3 actions];
  BOOL v5 = (unint64_t)[v4 count] >= 2
    && [(UIInterfaceActionGroupView *)self _actionLayoutAxisUnknownDisallowedIsVertical];

  actionSequenceView = self->_actionSequenceView;
  [(UIScrollView *)actionSequenceView setScrollEnabled:v5];
}

- (void)_determineActualLayoutAxis
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(UIInterfaceActionGroupView *)self _loadViewsIfNeeded];
  [(UIInterfaceActionGroupView *)self _reloadStackViewContentsIfNeeded];
  uint64_t v3 = [(UIInterfaceActionGroupView *)self actionLayoutAxis];
  uint64_t v4 = [(UIInterfaceActionGroupView *)self allowedActionLayoutAxisByPriority];
  uint64_t v5 = [v4 count];

  if (v5 == 1)
  {
    id v6 = [(UIInterfaceActionGroupView *)self allowedActionLayoutAxisByPriority];
    uint64_t v7 = [(NSArray *)v6 firstObject];
    uint64_t v3 = [v7 integerValue];
  }
  else
  {
    uint64_t v8 = [(UIInterfaceActionGroupView *)self visualStyle];
    [v8 maximumActionGroupContentSize];
    double v10 = v9;

    uint64_t v11 = [(UIView *)self window];

    if (v11)
    {
      id v12 = [(UIView *)self window];
      [v12 frame];
      double v14 = v13;

      if (v10 >= v14) {
        double v10 = v14;
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = self->_allowedActionLayoutAxisByPriority;
    uint64_t v15 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v6);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "integerValue", (void)v24);
          [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView fittingWidthForLayoutAxis:v19];
          if (v20 < v10)
          {
            uint64_t v3 = v19;
            goto LABEL_16;
          }
        }
        uint64_t v16 = [(NSArray *)v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
LABEL_16:

  uint64_t v21 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  actionSequenceView = self->_actionSequenceView;
  uint64_t v23 = [(UIInterfaceActionGroupView *)self _defaultOrderingForActionRepresentationViews:v21];
  [(_UIInterfaceActionRepresentationsSequenceView *)actionSequenceView setArrangedActionRepresentationViews:v23];

  [(UIInterfaceActionGroupView *)self setActionLayoutAxis:v3];
}

- (void)_reloadTopSeparatorView
{
  id obj = [(UIInterfaceActionGroupView *)self _newSeparatorViewForSeparatingTitleAndButtons];
  uint64_t v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    objc_storeStrong((id *)&self->_actionSequenceTopSeparatorView, obj);
    [(UISeparatorDisplaying *)self->_actionSequenceTopSeparatorView setConstantSizedAxis:1];
    [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
  }
}

- (id)_newSeparatorViewForSeparatingTitleAndButtons
{
  if (![(UIInterfaceActionGroupView *)self _shouldShowSeparatorAboveActionsSequenceView])return 0; {
  uint64_t v3 = [(UIInterfaceActionGroupView *)self visualStyle];
  }
  uint64_t v4 = [(UIInterfaceActionGroupView *)self _interfaceActionGroupViewState];
  uint64_t v5 = (void *)[v3 newActionSeparatorViewForGroupViewState:v4];

  return v5;
}

- (id)_interfaceActionGroupViewState
{
  v2 = [(UIInterfaceActionGroupView *)self visualStyle];
  uint64_t v3 = [v2 groupViewState];

  return v3;
}

- (id)_loadVisualStyleForTraitCollection:(id)a3
{
  id v4 = a3;
  activeTestingVisualStyle = self->_activeTestingVisualStyle;
  if (activeTestingVisualStyle)
  {
    id v6 = activeTestingVisualStyle;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);

    if (!WeakRetained
      || (id v8 = objc_loadWeakRetained((id *)&self->_visualStyleProvider),
          [v8 visualStyleForTraitCollection:v4],
          double v9 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      double v9 = [(UIInterfaceActionGroupView *)self defaultVisualStyleForTraitCollection:v4 presentationStyle:self->_presentationStyle];
    }
    id v6 = [(UIInterfaceActionGroupView *)self _visualStyleByApplyingOurTraitsToVisualStyle:v9 traitCollection:v4];
  }
  return v6;
}

- (id)_visualStyleByApplyingOurTraitsToVisualStyle:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = +[UIInterfaceActionOverrideVisualStyle styleOverride];
  double v9 = [(UIInterfaceActionGroupView *)self _visualStyleOverrideSeparatorAttributes];
  [v8 setCustomSeparatorAttributes:v9];

  double v10 = [(UIInterfaceActionGroupView *)self visualStyleOverrideActionHighlightAttributes];
  [v8 setCustomActionHighlightAttributes:v10];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __91__UIInterfaceActionGroupView__visualStyleByApplyingOurTraitsToVisualStyle_traitCollection___block_invoke;
  uint64_t v23 = &unk_1E52DA4D8;
  objc_copyWeak(&v24, &location);
  [v8 setCustomTitleLabelFontProviderForViewState:&v20];
  [(UIInterfaceActionGroupView *)self _selectionHighlightContinuousCornerRadius];
  objc_msgSend(v8, "setCustomSelectionHighlightContinuousCornerRadius:");
  objc_msgSend(v8, "setAlignActionSeparatorLeadingEdgeWithContent:", -[UIInterfaceActionGroupView _alignActionSeparatorLeadingEdgeWithContent](self, "_alignActionSeparatorLeadingEdgeWithContent"));
  uint64_t v11 = [v6 groupViewState];
  id v12 = (void *)[v11 copyWithTraitCollection:v7];

  double v13 = [(UIView *)self window];
  double v14 = [v13 screen];
  uint64_t v15 = (void *)[v12 copyWithScreen:v14];

  uint64_t v16 = objc_msgSend(v15, "copyWithVerticalLayoutAxis:", -[UIInterfaceActionGroupView _actionLayoutAxisUnknownDisallowedIsVertical](self, "_actionLayoutAxisUnknownDisallowedIsVertical"));
  uint64_t v17 = (void *)[v16 copyWithResolvedPresentationStyle:self->_presentationStyle];

  id v18 = (void *)[v6 copyWithGroupViewState:v17];
  [v18 setVisualStyleOverride:v8];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v18;
}

id __91__UIInterfaceActionGroupView__visualStyleByApplyingOurTraitsToVisualStyle_traitCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _visualStyleOverrideTitleLabelFont];

  return v2;
}

- (void)_applyVisualStyle
{
  id obj = [(UIInterfaceActionGroupView *)self visualStyle];
  if (!-[UIInterfaceActionVisualStyle isEqual:](self->_appliedVisualStyle, "isEqual:"))
  {
    [obj maximumActionGroupContentSize];
    -[_UIContentConstraintsLayoutGuide setMaximumSize:](self->_contentGuide, "setMaximumSize:");
    [obj contentCornerRadius];
    -[_UIContentConstraintsLayoutGuide setMinimumSize:](self->_contentGuide, "setMinimumSize:", v3 * 3.0, 0.0);
    [(UIInterfaceActionGroupView *)self _applyVisualStyleToActionsViewScrollView];
    [(UIInterfaceActionGroupView *)self _applyVisualStyleToBackgroundViewDisplay];
    -[UIInterfaceActionSelectionTrackingController setSelectByPressGestureEnabled:](self->_actionSelectionController, "setSelectByPressGestureEnabled:", [obj selectByPressGestureRequired]);
    -[UIInterfaceActionSelectionTrackingController setSelectionFeedbackEnabled:](self->_actionSelectionController, "setSelectionFeedbackEnabled:", [obj selectionFeedbackEnabled]);
    -[UIInterfaceActionSelectionTrackingController setSelectByIndirectPointerTouchEnabled:](self->_actionSelectionController, "setSelectByIndirectPointerTouchEnabled:", [obj selectByIndirectPointerTouchRequired]);
    objc_storeStrong((id *)&self->_appliedVisualStyle, obj);
  }
}

- (void)_applyVisualStyleToActionsViewScrollView
{
  id v5 = [(UIInterfaceActionGroupView *)self visualStyle];
  [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView setVisualStyle:v5];
  actionSequenceView = self->_actionSequenceView;
  id v4 = [(UIInterfaceActionGroupView *)self _interfaceActionGroupViewState];
  [v5 configureAttributesForActionScrollView:actionSequenceView groupViewState:v4];
}

- (void)_applyVisualStyleToBackgroundViewDisplay
{
  double v3 = [(UIInterfaceActionGroupView *)self visualStyle];
  id v4 = [(UIInterfaceActionGroupView *)self _interfaceActionGroupViewState];
  if (![(UIInterfaceActionGroupView *)self _drawsBackground]
    || (uint64_t v5 = [v3 newGroupBackgroundViewWithGroupViewState:v4]) == 0)
  {
    uint64_t v5 = objc_opt_new();
  }
  id v7 = (id)v5;
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class()) {
    [(UIInterfaceActionGroupView *)self _addBackgroudViewToViewHierarchy:v7];
  }
  [(UIInterfaceActionGroupView *)self _applyVisualStyleCornerRadius];
  [(UIView *)self->_backgroundView setClipsToBounds:1];
  [(UIInterfaceActionGroupView *)self _arrangeTopLevelViews];
}

- (void)_applyVisualStyleCornerRadius
{
  double v3 = 0.0;
  if ([(UIInterfaceActionGroupView *)self _isCornerRadiusDisplayEnabled])
  {
    id v4 = [(UIInterfaceActionGroupView *)self visualStyle];
    [v4 contentCornerRadius];
    double v3 = v5;
  }
  [(UIInterfaceActionGroupView *)self _topLevelItemsMargin];
  if (v6 == 0.0)
  {
    id v7 = [(UIInterfaceActionGroupView *)self _viewContainingTopLevelItems];
    [v7 _setContinuousCornerRadius:v3];
  }
  char v8 = objc_opt_respondsToSelector();
  backgroundView = self->_backgroundView;
  if (v8)
  {
    [(UIView *)backgroundView setCornerRadius:v3];
  }
  else
  {
    [(UIView *)backgroundView _setContinuousCornerRadius:v3];
  }
}

- (void)_addBackgroudViewToViewHierarchy:(id)a3
{
  id v4 = (UIView *)a3;
  [(UIView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
  double v6 = v4;

  [(UIView *)self addSubview:self->_backgroundView];
  [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = (void *)MEMORY[0x1E4F5B268];
  id v8 = [(UIInterfaceActionGroupView *)self _constraintsToPinView:self->_backgroundView toObject:self identifier:@"backgroundViewFrame"];
  [v7 activateConstraints:v8];
}

- (BOOL)_actionLayoutAxisUnknownDisallowedIsVertical
{
  return [(UIInterfaceActionGroupView *)self _actionLayoutAxisUnknowDisallowed] == 1;
}

- (int64_t)_actionLayoutAxisUnknowDisallowed
{
  if (self->_actionLayoutAxis != -1) {
    return self->_actionLayoutAxis;
  }
  double v3 = [(NSArray *)self->_allowedActionLayoutAxisByPriority firstObject];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (id)_constraintsToPinView:(id)a3 toObject:(id)a4 identifier:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v7 leadingAnchor];
  id v12 = [v8 leadingAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  [v10 addObject:v13];

  double v14 = [v7 trailingAnchor];
  uint64_t v15 = [v8 trailingAnchor];
  uint64_t v16 = [v14 constraintEqualToAnchor:v15];
  [v10 addObject:v16];

  uint64_t v17 = [v7 topAnchor];
  id v18 = [v8 topAnchor];
  uint64_t v19 = [v17 constraintEqualToAnchor:v18];
  [v10 addObject:v19];

  uint64_t v20 = [v10 lastObject];
  LODWORD(v21) = 1144750080;
  [v20 setPriority:v21];

  uint64_t v22 = [v7 bottomAnchor];
  uint64_t v23 = [v8 bottomAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];
  [v10 addObject:v24];

  long long v25 = [v10 lastObject];
  LODWORD(v26) = 1144750080;
  [v25 setPriority:v26];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v27 = v10;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "setIdentifier:", v9, (void)v35);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v29);
  }

  uint64_t v33 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v27, v32);

  return v33;
}

- (void)_updateActionSequenceViewActionLayoutAxis
{
  int64_t actionLayoutAxis = self->_actionLayoutAxis;
  if (actionLayoutAxis != -1)
  {
    uint64_t v4 = actionLayoutAxis == 1;
    if ([(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView actionLayoutAxis] != v4)
    {
      [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView setActionLayoutAxis:v4];
      [(UIInterfaceActionGroupView *)self reloadVisualStyle];
      [(UIInterfaceActionGroupView *)self _updateActionSequenceScrollability];
      [(UIInterfaceActionGroupView *)self _setNeedsUpdateActionSequenceViewArrangement];
      [(UIInterfaceActionGroupView *)self _actionSequenceViewContentSizeDidChange];
    }
  }
}

- (id)_defaultOrderingForActionRepresentationViews:(id)a3
{
  id v4 = a3;
  double v5 = [v4 indexesOfObjectsPassingTest:&__block_literal_global_8];
  double v6 = [v4 objectsAtIndexes:v5];

  id v7 = (void *)[v4 mutableCopy];
  [v7 removeObjectsInArray:v6];
  if (self->_actionLayoutAxis)
  {
    id v8 = v7;
    id v9 = v6;
  }
  else
  {
    id v8 = v6;
    id v9 = v7;
  }
  double v10 = [v8 arrayByAddingObjectsFromArray:v9];

  return v10;
}

BOOL __75__UIInterfaceActionGroupView__defaultOrderingForActionRepresentationViews___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 action];
  BOOL v3 = [v2 type] == 1;

  return v3;
}

- (id)_actionRepresentationViewForAction:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v5 = [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 action];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_scrollPreferredActionRepresentationViewToVisibleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(UIInterfaceActionGroupView *)self actionGroup];
  double v5 = [v6 preferredAction];
  [(UIInterfaceActionGroupView *)self _scrollActionRepresentationViewToVisibleForAction:v5 animated:v3];
}

- (void)_scrollActionRepresentationViewToVisibleForAction:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    [(UIInterfaceActionGroupView *)self _actionSequenceVisibleRectForMakingCenteredAction:v6];
    double x = v12.origin.x;
    double y = v12.origin.y;
    double width = v12.size.width;
    double height = v12.size.height;
    if (!CGRectIsEmpty(v12))
    {
      if (a4)
      {
        -[UIScrollView scrollRectToVisible:animated:](self->_actionSequenceView, "scrollRectToVisible:animated:", 1, x, y, width, height);
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __89__UIInterfaceActionGroupView__scrollActionRepresentationViewToVisibleForAction_animated___block_invoke;
        v11[3] = &unk_1E52DA520;
        v11[4] = self;
        *(double *)&v11[5] = x;
        *(double *)&v11[6] = y;
        *(double *)&v11[7] = width;
        *(double *)&v11[8] = height;
        +[UIView performWithoutAnimation:v11];
      }
    }
  }
}

uint64_t __89__UIInterfaceActionGroupView__scrollActionRepresentationViewToVisibleForAction_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 584), "scrollRectToVisible:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)_actionSequenceVisibleRectForMakingCenteredAction:(id)a3
{
  id v4 = [(UIInterfaceActionGroupView *)self _actionRepresentationViewForAction:a3];
  double v5 = v4;
  if (v4)
  {
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(UIScrollView *)self->_actionSequenceView visibleBounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    BOOL v22 = [(UIInterfaceActionGroupView *)self _actionLayoutAxisUnknownDisallowedIsVertical];
    [(UIScrollView *)self->_actionSequenceView contentSize];
    if (v22)
    {
      double v25 = v9 - fmax((v21 - v13) * 0.5, 0.0);
      double v26 = v24 - v21;
      if (v25 >= v26) {
        double v25 = v26;
      }
      if (v25 >= 0.0) {
        double v17 = v25;
      }
      else {
        double v17 = 0.0;
      }
    }
    else
    {
      double v27 = v7 - fmax((v19 - v11) * 0.5, 0.0);
      double v28 = v23 - v19;
      if (v27 < v28) {
        double v28 = v27;
      }
      if (v28 >= 0.0) {
        double v15 = v28;
      }
      else {
        double v15 = 0.0;
      }
    }
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v29 = v15;
  double v30 = v17;
  double v31 = v19;
  double v32 = v21;
  result.size.double height = v32;
  result.size.double width = v31;
  result.origin.double y = v30;
  result.origin.double x = v29;
  return result;
}

- (void)_setUsAsThePresentingViewControllerForAllActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(UIInterfaceActionGroup *)self->_actionGroup actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _setPresentingController:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_removeUsAsThePresentingViewControllerForAllActions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(UIInterfaceActionGroup *)self->_actionGroup actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        long long v9 = [v8 _presentingController];

        if (v9 == self) {
          [v8 _setPresentingController:0];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)_allActionViews
{
  return [(_UIInterfaceActionRepresentationsSequenceView *)self->_actionSequenceView arrangedActionRepresentationViews];
}

- (id)_viewDisplayingRoundedBackground
{
  return self->_backgroundView;
}

- (id)_viewContainingTopLevelItems
{
  return self->_topLevelItemsView;
}

- (void)_setNeedsUpdateTopLevelViewsArrangement
{
  self->_needsUpdateTopLevelViewsArrangement = 1;
  [(UIView *)self setNeedsUpdateConstraints];
}

- (void)_setNeedsUpdateActionSequenceViewArrangement
{
  self->_needsUpdateActionSequenceViewArrangement = 1;
  [(UIView *)self setNeedsUpdateConstraints];
}

- (BOOL)_shouldShowSeparatorAboveActionsSequenceView
{
  BOOL v3 = [(UIInterfaceActionGroup *)self->_actionGroup actions];
  if ([v3 count]) {
    BOOL v4 = [(NSMutableArray *)self->_arrangedScrollableHeaderViews count] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (CGRect)_contentEdgeFrame
{
  [(UILayoutGuide *)self->_contentGuide layoutFrame];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)_setDrawsBackground:(BOOL)a3
{
  if (self->_drawsBackground != a3)
  {
    self->_drawsBackground = a3;
    [(UIInterfaceActionGroupView *)self _applyVisualStyleToBackgroundViewDisplay];
  }
}

- (void)_setSelectionHighlightContinuousCornerRadius:(double)a3
{
  if (self->_selectionHighlightContinuousCornerRadius != a3)
  {
    self->_selectionHighlightContinuousCornerRadius = a3;
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (void)_setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3
{
  if (self->_alignActionSeparatorLeadingEdgeWithContent != a3)
  {
    self->_alignActionSeparatorLeadingEdgeWithContent = a3;
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (void)_setVisualStyleOverrideSeparatorAttributes:(id)a3
{
  id v5 = a3;
  if (!-[UIInterfaceActionSeparatorAttributes isEqual:](self->_visualStyleOverrideSeparatorAttributes, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideSeparatorAttributes, a3);
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (void)_setVisualStyleOverrideActionHighlightAttributes:(id)a3
{
  id v5 = a3;
  if (!-[UIInterfaceActionHighlightAttributes isEqual:](self->_visualStyleOverrideActionHighlightAttributes, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideActionHighlightAttributes, a3);
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (void)_setVisualStyleOverrideTitleLabelFont:(id)a3
{
  id v5 = a3;
  if ((-[UIFont isEqual:](self->_visualStyleOverrideTitleLabelFont, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_visualStyleOverrideTitleLabelFont, a3);
    [(UIInterfaceActionGroupView *)self reloadVisualStyle];
  }
}

- (BOOL)_isCornerRadiusDisplayEnabled
{
  return self->_drawsBackground;
}

- (id)_alertController
{
  return 0;
}

- (UIInterfaceActionVisualStyleProviding)visualStyleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyleProvider);
  return (UIInterfaceActionVisualStyleProviding *)WeakRetained;
}

- (BOOL)isSpringLoaded
{
  return self->_springLoaded;
}

- (UIInterfaceActionGroup)actionGroup
{
  return self->_actionGroup;
}

- (UIInterfaceActionHandlerInvocationDelegate)actionHandlerInvocationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandlerInvocationDelegate);
  return (UIInterfaceActionHandlerInvocationDelegate *)WeakRetained;
}

- (void)setActionHandlerInvocationDelegate:(id)a3
{
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (NSArray)allowedActionLayoutAxisByPriority
{
  return self->_allowedActionLayoutAxisByPriority;
}

- (int64_t)actionLayoutAxis
{
  return self->_actionLayoutAxis;
}

- (void)setVisualStyle:(id)a3
{
}

- (UIInterfaceActionVisualStyle)appliedVisualStyle
{
  return self->_appliedVisualStyle;
}

- (void)setAppliedVisualStyle:(id)a3
{
}

- (_UIContentConstraintsLayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)topLevelItemsView
{
  return self->_topLevelItemsView;
}

- (NSArray)topLevelViewArrangementConstraints
{
  return self->_topLevelViewArrangementConstraints;
}

- (NSMutableArray)arrangedScrollableHeaderViews
{
  return self->_arrangedScrollableHeaderViews;
}

- (UISeparatorDisplaying)actionSequenceTopSeparatorView
{
  return self->_actionSequenceTopSeparatorView;
}

- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToConstantConstraint
{
  return self->_actionSequenceViewWidthAnchoredToConstantConstraint;
}

- (NSLayoutConstraint)actionSequenceViewWidthAnchoredToContentGuideConstraint
{
  return self->_actionSequenceViewWidthAnchoredToContentGuideConstraint;
}

- (NSPointerArray)weakSimultaneouslyPresentedGroupViews
{
  return self->_weakSimultaneouslyPresentedGroupViews;
}

- (BOOL)showsSeparatorAboveActions
{
  return self->_showsSeparatorAboveActions;
}

- (void)setShowsSeparatorAboveActions:(BOOL)a3
{
  self->_showsSeparatorAboveActions = a3;
}

- (_UIInterfaceActionRepresentationsSequenceView)actionSequenceView
{
  return self->_actionSequenceView;
}

- (UILongPressGestureRecognizer)actionSelectionGestureRecognizer
{
  return self->_actionSelectionGestureRecognizer;
}

- (void)setActionSelectionGestureRecognizer:(id)a3
{
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (double)requiredActionRepresentationWidth
{
  return self->_requiredActionRepresentationWidth;
}

- (void)setPreferredActionRepresentation:(id)a3
{
}

- (BOOL)focusAvoidsNonDefaultActionsIfPossible
{
  return self->_focusAvoidsNonDefaultActionsIfPossible;
}

- (void)setFocusAvoidsNonDefaultActionsIfPossible:(BOOL)a3
{
  self->_focusAvoidsNonDefaultActionsIfPossible = a3;
}

- (UIInterfaceActionHighlightAttributes)visualStyleOverrideActionHighlightAttributes
{
  return self->_visualStyleOverrideActionHighlightAttributes;
}

- (UIInterfaceActionSeparatorAttributes)_visualStyleOverrideSeparatorAttributes
{
  return self->_visualStyleOverrideSeparatorAttributes;
}

- (UIFont)_visualStyleOverrideTitleLabelFont
{
  return self->_visualStyleOverrideTitleLabelFont;
}

- (BOOL)_drawsBackground
{
  return self->_drawsBackground;
}

- (double)_selectionHighlightContinuousCornerRadius
{
  return self->_selectionHighlightContinuousCornerRadius;
}

- (BOOL)_alignActionSeparatorLeadingEdgeWithContent
{
  return self->_alignActionSeparatorLeadingEdgeWithContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyleOverrideTitleLabelFont, 0);
  objc_storeStrong((id *)&self->_visualStyleOverrideSeparatorAttributes, 0);
  objc_storeStrong((id *)&self->_visualStyleOverrideActionHighlightAttributes, 0);
  objc_storeStrong((id *)&self->_preferredActionRepresentation, 0);
  objc_storeStrong((id *)&self->_actionSelectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_actionSequenceView, 0);
  objc_storeStrong((id *)&self->_weakSimultaneouslyPresentedGroupViews, 0);
  objc_storeStrong((id *)&self->_actionSequenceViewWidthAnchoredToContentGuideConstraint, 0);
  objc_storeStrong((id *)&self->_actionSequenceViewWidthAnchoredToConstantConstraint, 0);
  objc_storeStrong((id *)&self->_actionSequenceTopSeparatorView, 0);
  objc_storeStrong((id *)&self->_arrangedScrollableHeaderViews, 0);
  objc_storeStrong((id *)&self->_topLevelViewArrangementConstraints, 0);
  objc_storeStrong((id *)&self->_topLevelItemsView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_appliedVisualStyle, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_allowedActionLayoutAxisByPriority, 0);
  objc_destroyWeak((id *)&self->_actionHandlerInvocationDelegate);
  objc_storeStrong((id *)&self->_actionGroup, 0);
  objc_storeStrong((id *)&self->_actionSelectionController, 0);
  objc_destroyWeak((id *)&self->_visualStyleProvider);
  objc_storeStrong((id *)&self->_cachedSizeCategory, 0);
  objc_storeStrong((id *)&self->_activeTestingVisualStyle, 0);
}

@end