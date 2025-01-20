@interface UIInterfaceActionRepresentationView
- (BOOL)_canLoadContentsIntoHierarchy;
- (BOOL)_contentsInsertedIntoViewHierarchy;
- (BOOL)_fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:(CGSize)a3;
- (BOOL)_handleVisualFeedbackForPress:(id)a3 pressed:(BOOL)a4;
- (BOOL)_isVisibleWithinContainmentAncestor;
- (BOOL)_shouldShowPressFeedbackForEventWithPresses:(id)a3;
- (BOOL)_showsFocusForFocusedView:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)canRemoveContentFromHierarchyWhenNotVisible;
- (BOOL)hasLayoutHeightConstraintsIdenticalToRepresentationView:(id)a3;
- (BOOL)isFocused;
- (BOOL)isHighlighted;
- (BOOL)isPressed;
- (BOOL)ownsActionContent;
- (CGRect)_fittingContentSizingViewFrameInBounds:(CGRect)a3;
- (CGSize)_fittingContentSizeWithFittingViewSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSArray)viewsToDisappearWhenHighlighted;
- (NSLayoutConstraint)minimumHeightConstraint;
- (NSLayoutConstraint)minimumWidthConstraint;
- (NSString)description;
- (NSString)sectionID;
- (UIEdgeInsets)_fittingContentSizingViewMargins;
- (UIInterfaceAction)action;
- (UIInterfaceActionRepresentationView)initWithAction:(id)a3;
- (UIInterfaceActionVisualBackgroundDisplaying)backgroundHighlightView;
- (UIInterfaceActionVisualStyle)visualStyle;
- (UISpringLoadedInteraction)interactionForSpringLoading;
- (id)__fittingContentSizingViewAllowingSelf;
- (id)__fittingContentSizingViewIfNotSelf;
- (id)_actionViewState;
- (id)_viewDisplayingBackground;
- (id)actionViewStateContext;
- (unint64_t)visualCornerPosition;
- (void)_addLoadedContentsToHierarchyFirstTime;
- (void)_addLoadedContentsToHierarchyIfAllowed;
- (void)_applyVisualStyle;
- (void)_applyVisualStyleToLayoutMargins;
- (void)_applyVisualStyleToMinimumSizeConstraints;
- (void)_clearBackgroundPressedState;
- (void)_enforceActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3;
- (void)_initializeHorizontalMarginsForAction;
- (void)_loadContentsIntoHierarchyAndPrepareIfNecessary;
- (void)_reloadBackgroundHighlightView;
- (void)_removeLoadedContentsFromHierarchyIfNotVisible;
- (void)_setContentsInsertedIntoViewHierarchy:(BOOL)a3;
- (void)_setHorizontalMargins:(UIEdgeInsets)a3 preservesSuperviewLayoutMargins:(BOOL)a4;
- (void)_showVisualFeedbackForPressed:(BOOL)a3;
- (void)_updateFittingContentSizingViewToFitSize;
- (void)_updateHighlightAndPressedFeedback;
- (void)_updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4;
- (void)invalidateIntrinsicContentSize;
- (void)invokeInterfaceAction;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setActionViewStateContext:(id)a3;
- (void)setCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setInteractionForSpringLoading:(id)a3;
- (void)setOwnsActionContent:(BOOL)a3;
- (void)setPressed:(BOOL)a3;
- (void)setSectionID:(id)a3;
- (void)setSpringLoaded:(BOOL)a3;
- (void)setViewsToDisappearWhenHighlighted:(id)a3;
- (void)setVisualCornerPosition:(unint64_t)a3;
- (void)updateConstraints;
@end

@implementation UIInterfaceActionRepresentationView

- (UIInterfaceActionRepresentationView)initWithAction:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UIInterfaceActionRepresentationView;
  v6 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v7->_ownsActionContent = 1;
    sectionID = v7->_sectionID;
    v7->_sectionID = (NSString *)&stru_1ED0E84C0;

    [(UIInterfaceAction *)v7->_action _addActionDisplayPropertyObserver:v7];
    v7->_canRemoveContentFromHierarchyWhenNotVisible = 0;
    v9 = [(UIView *)v7 widthAnchor];
    uint64_t v10 = [v9 constraintGreaterThanOrEqualToConstant:0.0];
    minimumWidthConstraint = v7->_minimumWidthConstraint;
    v7->_minimumWidthConstraint = (NSLayoutConstraint *)v10;

    v12 = [(UIView *)v7 heightAnchor];
    uint64_t v13 = [v12 constraintGreaterThanOrEqualToConstant:0.0];
    minimumHeightConstraint = v7->_minimumHeightConstraint;
    v7->_minimumHeightConstraint = (NSLayoutConstraint *)v13;

    LODWORD(v15) = 1148829696;
    [(NSLayoutConstraint *)v7->_minimumHeightConstraint setPriority:v15];
    [(UIView *)v7 setFocusEffect:0];
    [(UIInterfaceActionRepresentationView *)v7 _initializeHorizontalMarginsForAction];
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIInterfaceActionRepresentationView;
  v4 = [(UIView *)&v8 description];
  id v5 = [(UIInterfaceActionRepresentationView *)self action];
  v6 = [v3 stringWithFormat:@"%@ action = %@", v4, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  [(UIInterfaceAction *)self->_action _removeActionDisplayPropertyObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  [(UIView *)&v3 dealloc];
}

- (void)_setContentsInsertedIntoViewHierarchy:(BOOL)a3
{
  if (self->_contentsInsertedIntoViewHierarchy != a3)
  {
    self->_contentsInsertedIntoViewHierarchy = a3;
    [(UIInterfaceActionRepresentationView *)self updateContentsInsertedIntoHierarchy];
  }
}

- (void)invokeInterfaceAction
{
  id v2 = [(UIInterfaceActionRepresentationView *)self action];
  [v2 _invokeHandlerWithCompletionBlock:&__block_literal_global_10];
}

- (UIInterfaceActionVisualStyle)visualStyle
{
  id v2 = [(UIInterfaceActionRepresentationView *)self action];
  objc_super v3 = [v2 _visualStyle];

  return (UIInterfaceActionVisualStyle *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(UIInterfaceActionRepresentationView *)self _updateHighlightAndPressedFeedback];
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(UIInterfaceActionRepresentationView *)self _updateHighlightAndPressedFeedback];
  }
}

- (void)setVisualCornerPosition:(unint64_t)a3
{
  if (self->_visualCornerPosition != a3)
  {
    self->_visualCornerPosition = a3;
    [(UIInterfaceActionRepresentationView *)self _applyVisualStyle];
  }
}

- (void)setCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3
{
  if (self->_enforcedCanRemoveContentFromHierarchyWhenNotVisible) {
    *(_DWORD *)&a3 = self->_enforcedCanRemoveContentFromHierarchyWhenNotVisibleValue;
  }
  if (self->_canRemoveContentFromHierarchyWhenNotVisible != a3)
  {
    self->_canRemoveContentFromHierarchyWhenNotVisible = a3;
    if (a3) {
      [(UIInterfaceActionRepresentationView *)self _removeLoadedContentsFromHierarchyIfNotVisible];
    }
  }
}

- (BOOL)hasLayoutHeightConstraintsIdenticalToRepresentationView:(id)a3
{
  return 0;
}

- (void)_enforceActionRepresentationViewsCanRemoveContentFromHierarchyWhenNotVisible:(BOOL)a3
{
  self->_enforcedCanRemoveContentFromHierarchyWhenNotVisibleValue = a3;
  self->_enforcedCanRemoveContentFromHierarchyWhenNotVisible = 1;
  [(UIInterfaceActionRepresentationView *)self setCanRemoveContentFromHierarchyWhenNotVisible:1];
  [(UIInterfaceActionRepresentationView *)self _updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary];
}

- (void)interfaceAction:(id)a3 reloadDisplayedContentActionProperties:(id)a4
{
  id v5 = a4;
  id v9 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  v6 = [v9 actionPropertiesAffectingActionRepresentationViewStyling];
  BOOL v7 = +[UIInterfaceAction changedProperties:v5 containsAny:v6];

  if (v7)
  {
    objc_super v8 = [(UIInterfaceActionRepresentationView *)self _actionViewState];
    [v9 configureAttributesForActionRepresentationView:self actionViewState:v8];
  }
}

- (void)updateConstraints
{
  [(UIInterfaceActionRepresentationView *)self _updateFittingContentSizingViewToFitSize];
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  [(UIView *)&v3 updateConstraints];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionRepresentationView;
  [(UIView *)&v4 layoutSubviews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__UIInterfaceActionRepresentationView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(UIView *)self _withUnsatisfiableConstraintsLoggingSuspendedIfEngineDelegateExists:v3];
}

uint64_t __53__UIInterfaceActionRepresentationView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadContentsIntoHierarchyAndPrepareIfNecessary];
  [*(id *)(a1 + 32) _updateFittingContentSizingViewToFitSize];
  [*(id *)(a1 + 32) sendSubviewToBack:*(void *)(*(void *)(a1 + 32) + 448)];
  id v2 = *(void **)(a1 + 32);
  objc_super v3 = (void *)v2[56];
  [v2 bounds];
  return objc_msgSend(v3, "setFrame:");
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)UIInterfaceActionRepresentationView;
  [(UIView *)&v4 invalidateIntrinsicContentSize];
  objc_super v3 = [(UIInterfaceActionRepresentationView *)self __fittingContentSizingViewIfNotSelf];
  [v3 invalidateIntrinsicContentSize];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionRepresentationView;
  [(UIView *)&v3 layoutMarginsDidChange];
  [(UIView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  [(UIInterfaceActionRepresentationView *)self _loadContentsIntoHierarchyAndPrepareIfNecessary];
  objc_super v3 = [(UIInterfaceActionRepresentationView *)self __fittingContentSizingViewAllowingSelf];
  objc_super v4 = v3;
  if (v3 == self)
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInterfaceActionRepresentationView;
    [(UIView *)&v11 intrinsicContentSize];
  }
  else
  {
    -[UIView systemLayoutSizeFittingSize:](v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  -[UIInterfaceActionRepresentationView _fittingContentSizeWithFittingViewSize:](self, "_fittingContentSizeWithFittingViewSize:");
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(UIInterfaceActionRepresentationView *)self _loadContentsIntoHierarchyAndPrepareIfNecessary];
  double v10 = [(UIInterfaceActionRepresentationView *)self __fittingContentSizingViewAllowingSelf];
  uint64_t v13 = v10;
  if (v10 == self)
  {
    v20.receiver = self;
    v20.super_class = (Class)UIInterfaceActionRepresentationView;
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  }
  else
  {
    *(float *)&double v11 = a4;
    *(float *)&double v12 = a5;
    -[UIInterfaceActionRepresentationView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
  }
  -[UIInterfaceActionRepresentationView _fittingContentSizeWithFittingViewSize:](self, "_fittingContentSizeWithFittingViewSize:");
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)_updateFittingContentSizingViewToFitSize
{
  id v3 = [(UIInterfaceActionRepresentationView *)self __fittingContentSizingViewIfNotSelf];
  if (v3)
  {
    [(UIView *)self bounds];
    -[UIInterfaceActionRepresentationView _fittingContentSizingViewFrameInBounds:](self, "_fittingContentSizingViewFrameInBounds:");
    objc_msgSend(v3, "setFrame:");
  }
}

- (id)__fittingContentSizingViewIfNotSelf
{
  id v3 = [(UIInterfaceActionRepresentationView *)self _fittingContentSizingView];
  objc_super v4 = v3;
  if (v3 == self) {
    id v3 = 0;
  }
  double v5 = v3;

  return v5;
}

- (id)__fittingContentSizingViewAllowingSelf
{
  id v3 = [(UIInterfaceActionRepresentationView *)self _fittingContentSizingView];
  objc_super v4 = v3;
  if (!v3) {
    id v3 = self;
  }
  id v5 = v3;

  return v5;
}

- (UIEdgeInsets)_fittingContentSizingViewMargins
{
  [(UIView *)self layoutMargins];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (CGSize)_fittingContentSizeWithFittingViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIInterfaceActionRepresentationView *)self _fittingContentSizingViewMargins];
  double v7 = v6 + width + v5;
  double v10 = v9 + height + v8;
  double v11 = v7;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (CGRect)_fittingContentSizingViewFrameInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIInterfaceActionRepresentationView *)self _fittingContentSizingViewMargins];
  double v8 = y + v7;
  double v11 = width - (v9 + v10);
  double v13 = height - (v7 + v12);
  double v14 = x + v9;
  double v15 = v8;
  double v16 = v11;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)setSpringLoaded:(BOOL)a3
{
  if ([(UIInterfaceActionRepresentationView *)self isSpringLoaded] != a3)
  {
    if (a3)
    {
      double v5 = objc_opt_new();
      double v6 = objc_opt_new();
      double v7 = [[UISpringLoadedInteraction alloc] initWithInteractionBehavior:v5 interactionEffect:v6 activationHandler:&__block_literal_global_285];

      [(UIInterfaceActionRepresentationView *)self setInteractionForSpringLoading:v7];
    }
    else
    {
      [(UIInterfaceActionRepresentationView *)self setInteractionForSpringLoading:0];
    }
  }
}

- (void)setInteractionForSpringLoading:(id)a3
{
  double v5 = (UISpringLoadedInteraction *)a3;
  interactionForSpringLoading = self->_interactionForSpringLoading;
  double v7 = v5;
  if (interactionForSpringLoading != v5)
  {
    if (interactionForSpringLoading) {
      -[UIView removeInteraction:](self, "removeInteraction:");
    }
    objc_storeStrong((id *)&self->_interactionForSpringLoading, a3);
    if (self->_interactionForSpringLoading) {
      -[UIView addInteraction:](self, "addInteraction:");
    }
  }
}

- (BOOL)_showsFocusForFocusedView:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  double v5 = [(UIView *)self subviews];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)canBecomeFocused
{
  double v2 = [(UIInterfaceActionRepresentationView *)self action];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIInterfaceActionRepresentationView;
  id v6 = a3;
  [(UIView *)&v11 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  double v7 = objc_msgSend(v6, "nextFocusedView", v11.receiver, v11.super_class);
  BOOL v8 = [(UIInterfaceActionRepresentationView *)self _showsFocusForFocusedView:v7];

  double v9 = [v6 previouslyFocusedView];

  LODWORD(v6) = [(UIInterfaceActionRepresentationView *)self _showsFocusForFocusedView:v9];
  if (v8 != v6)
  {
    [(UIInterfaceActionRepresentationView *)self setHighlighted:v8];
    double v10 = [(UIInterfaceActionRepresentationView *)self action];
    [v10 _setIsFocused:v8];

    if (!v8) {
      [(UIInterfaceActionRepresentationView *)self _showVisualFeedbackForPressed:0];
    }
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIInterfaceActionRepresentationView *)self _handleVisualFeedbackForPress:v6 pressed:1])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    [(UIResponder *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIInterfaceActionRepresentationView *)self _handleVisualFeedbackForPress:v6 pressed:1])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    [(UIResponder *)&v8 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIInterfaceActionRepresentationView *)self _handleVisualFeedbackForPress:v6 pressed:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    [(UIResponder *)&v8 pressesEnded:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIInterfaceActionRepresentationView *)self _handleVisualFeedbackForPress:v6 pressed:0])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionRepresentationView;
    [(UIResponder *)&v8 pressesCancelled:v6 withEvent:v7];
  }
}

- (BOOL)_handleVisualFeedbackForPress:(id)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(UIInterfaceActionRepresentationView *)self _shouldShowPressFeedbackForEventWithPresses:a3];
  if (v6) {
    [(UIInterfaceActionRepresentationView *)self _showVisualFeedbackForPressed:v4];
  }
  return v6;
}

- (BOOL)_shouldShowPressFeedbackForEventWithPresses:(id)a3
{
  BOOL v4 = [a3 anyObject];
  uint64_t v5 = [v4 type];
  if (v5 == 4)
  {
    BOOL v6 = 1;
  }
  else if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 5)
  {
    id v7 = [(UIInterfaceActionRepresentationView *)self action];
    BOOL v6 = [v7 type] == 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_showVisualFeedbackForPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    [(UIInterfaceActionRepresentationView *)self _updateHighlightAndPressedFeedback];
  }
}

- (void)_applyVisualStyle
{
  [(UIInterfaceActionRepresentationView *)self _applyVisualStyleToMinimumSizeConstraints];
  [(UIInterfaceActionRepresentationView *)self _applyVisualStyleToLayoutMargins];
  [(UIInterfaceActionRepresentationView *)self _applyVisualStyleToBackgroundViewAndHighlighting];
}

- (void)_applyVisualStyleToMinimumSizeConstraints
{
  char v3 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  [v3 minimumActionContentSize];
  double v5 = v4;
  double v7 = v6;
  if (-[UIInterfaceActionRepresentationView _fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:](self, "_fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:"))
  {
    BOOL v8 = !self->_contentsInsertedIntoViewHierarchy;
  }
  else
  {
    BOOL v8 = 1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__UIInterfaceActionRepresentationView__applyVisualStyleToMinimumSizeConstraints__block_invoke;
  aBlock[3] = &__block_descriptor_33_e31_v24__0__NSLayoutConstraint_8d16l;
  BOOL v11 = v8;
  double v9 = (void (**)(void *, NSLayoutConstraint *, double))_Block_copy(aBlock);
  v9[2](v9, self->_minimumWidthConstraint, v5);
  v9[2](v9, self->_minimumHeightConstraint, v7);
}

void __80__UIInterfaceActionRepresentationView__applyVisualStyleToMinimumSizeConstraints__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 > 0.0 && *(unsigned char *)(a1 + 32))
  {
    [v5 setConstant:a3];
    [v6 setActive:1];
  }
  else
  {
    [v5 setActive:0];
    [v6 setConstant:0.0];
  }
}

- (BOOL)_fittingContentViewHasItsOwnActiveMinimumSizeConstraintsWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(UIInterfaceActionRepresentationView *)self _fittingContentSizingView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = objc_msgSend(v5, "hasActiveMinimumSizeConstraintsWithSize:", width, height);
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_setHorizontalMargins:(UIEdgeInsets)a3 preservesSuperviewLayoutMargins:(BOOL)a4
{
  BOOL v4 = a4;
  double right = a3.right;
  double left = a3.left;
  [(UIView *)self layoutMargins];
  if (left != v11
    || (v8 == 0.0 ? (BOOL v12 = right == v10) : (BOOL v12 = 0),
        !v12 || v9 != 0.0 || [(UIView *)self preservesSuperviewLayoutMargins] != v4))
  {
    [(UIView *)self setPreservesSuperviewLayoutMargins:v4];
    -[UIView setLayoutMargins:](self, "setLayoutMargins:", 0.0, left, 0.0, right);
    [(UIInterfaceActionRepresentationView *)self invalidateIntrinsicContentSize];
  }
}

- (void)_initializeHorizontalMarginsForAction
{
  char v3 = [(UIInterfaceActionRepresentationView *)self visualStyle];

  if (v3)
  {
    [(UIInterfaceActionRepresentationView *)self _applyVisualStyleToLayoutMargins];
  }
  else
  {
    BOOL v4 = [(UIInterfaceActionRepresentationView *)self action];
    uint64_t v5 = [v4 _typeForDeterminingViewRepresentation];

    if (v5 == 100)
    {
      -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 1, 0.0, 0.0, 0.0, 0.0);
    }
  }
}

- (void)_applyVisualStyleToLayoutMargins
{
  char v3 = [(UIInterfaceActionRepresentationView *)self action];
  uint64_t v4 = [v3 _typeForDeterminingViewRepresentation];

  if (v4 == 100)
  {
    -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 1, 0.0, 0.0, 0.0, 0.0);
  }
  else
  {
    id v5 = [(UIInterfaceActionRepresentationView *)self visualStyle];
    [v5 contentMargin];
    -[UIInterfaceActionRepresentationView _setHorizontalMargins:preservesSuperviewLayoutMargins:](self, "_setHorizontalMargins:preservesSuperviewLayoutMargins:", 0);
  }
}

- (void)_reloadBackgroundHighlightView
{
  char v3 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  if (v3)
  {
    id v39 = v3;
    uint64_t v4 = [(UIInterfaceActionRepresentationView *)self _actionViewState];
    id v5 = (void *)[v39 newActionBackgroundViewForViewState:v4];

    p_backgroundHighlightView = &self->_backgroundHighlightView;
    double v7 = self->_backgroundHighlightView;
    id v8 = v5;
    uint64_t v9 = objc_opt_class();
    if (v9 == objc_opt_class() && (v8 != 0) != (v7 == 0))
    {
      [v8 alpha];
      double v11 = v10;
      [(UIInterfaceActionVisualBackgroundDisplaying *)v7 alpha];
      if (vabdd_f64(v11, v12) <= 0.00000011920929)
      {
        double v13 = [v8 backgroundColor];
        double v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = +[UIColor clearColor];
        }
        double v16 = v15;

        double v17 = [(UIInterfaceActionVisualBackgroundDisplaying *)v7 backgroundColor];
        double v18 = v17;
        if (v17)
        {
          id v19 = v17;
        }
        else
        {
          id v19 = +[UIColor clearColor];
        }
        objc_super v20 = v19;

        if ([v16 isEqual:v20])
        {
          v21 = [v8 layer];
          uint64_t v22 = [v21 filters];
          v23 = (void *)v22;
          v38 = v16;
          uint64_t v24 = MEMORY[0x1E4F1CBF0];
          v25 = (void *)(v22 ? v22 : MEMORY[0x1E4F1CBF0]);
          id v26 = v25;

          v27 = [(UIInterfaceActionVisualBackgroundDisplaying *)v7 layer];
          uint64_t v28 = [v27 filters];
          v29 = (void *)v28;
          v30 = (void *)(v28 ? v28 : v24);
          id v31 = v30;

          int v32 = [v26 isEqual:v31];
          double v16 = v38;

          if (v32)
          {
            [v8 _cornerRadius];
            double v34 = v33;
            [(UIInterfaceActionVisualBackgroundDisplaying *)v7 _cornerRadius];
            double v36 = vabdd_f64(v34, v35);

            if (v36 <= 0.00000011920929)
            {
LABEL_25:
              self->_hasLoadedBackgroundView = 1;
              [(UIView *)self setNeedsLayout];

              char v3 = v39;
              goto LABEL_26;
            }
LABEL_23:
            [(UIInterfaceActionVisualBackgroundDisplaying *)*p_backgroundHighlightView removeFromSuperview];
            v37 = *p_backgroundHighlightView;
            *p_backgroundHighlightView = 0;

            if (v8)
            {
              [(UIView *)self bounds];
              objc_msgSend(v8, "setFrame:");
              [v8 setTranslatesAutoresizingMaskIntoConstraints:1];
              [v8 setUserInteractionEnabled:0];
              [v8 layoutBelowIfNeeded];
              [(UIView *)self insertSubview:v8 atIndex:0];
              objc_storeStrong((id *)&self->_backgroundHighlightView, v5);
            }
            goto LABEL_25;
          }
        }
      }
    }

    goto LABEL_23;
  }
LABEL_26:
}

- (BOOL)isFocused
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionRepresentationView;
  if ([(UIView *)&v6 isFocused]) {
    return 1;
  }
  uint64_t v4 = [(UIInterfaceActionRepresentationView *)self __fittingContentSizingViewIfNotSelf];
  char v3 = [v4 isFocused];

  return v3;
}

- (void)_updateHighlightAndPressedFeedback
{
  v19[3] = *MEMORY[0x1E4F143B8];
  [(UIInterfaceActionRepresentationView *)self _reloadBackgroundHighlightView];
  [(UIInterfaceActionVisualBackgroundDisplaying *)self->_backgroundHighlightView setPressed:[(UIInterfaceActionRepresentationView *)self isPressed]];
  [(UIInterfaceActionVisualBackgroundDisplaying *)self->_backgroundHighlightView setHighlighted:[(UIInterfaceActionRepresentationView *)self isHighlighted]];
  char v3 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  v19[0] = 0x1ED0EA240;
  v19[1] = 0x1ED0EA260;
  v19[2] = 0x1ED0EA220;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  id v5 = [v3 actionPropertiesAffectingActionRepresentationViewStyling];
  BOOL v6 = +[UIInterfaceAction changedProperties:v4 containsAny:v5];

  if (v6)
  {
    double v7 = [(UIInterfaceActionRepresentationView *)self _actionViewState];
    [v3 configureAttributesForActionRepresentationView:self actionViewState:v7];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  if ([(UIInterfaceActionRepresentationView *)self isHighlighted]) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  long long v16 = 0uLL;
  long long v17 = 0uLL;
  uint64_t v9 = [(UIInterfaceActionRepresentationView *)self viewsToDisappearWhenHighlighted];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) setAlpha:v8];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_loadContentsIntoHierarchyAndPrepareIfNecessary
{
  if (self->_hasLoadedContentFirstTime
    || ![(UIInterfaceActionRepresentationView *)self _canLoadContentsIntoHierarchy])
  {
    [(UIInterfaceActionRepresentationView *)self _addLoadedContentsToHierarchyIfAllowed];
  }
  else
  {
    [(UIInterfaceActionRepresentationView *)self _addLoadedContentsToHierarchyFirstTime];
  }
}

- (void)_updateLoadedContentsHierarchyByInsertingOrRemovingIfNecessary
{
  if (self->_contentsInsertedIntoViewHierarchy) {
    [(UIInterfaceActionRepresentationView *)self _removeLoadedContentsFromHierarchyIfNotVisible];
  }
  else {
    [(UIInterfaceActionRepresentationView *)self _loadContentsIntoHierarchyAndPrepareIfNecessary];
  }
}

- (void)_addLoadedContentsToHierarchyFirstTime
{
  self->_hasLoadedContentFirstTime = 1;
  [(UIInterfaceActionRepresentationView *)self loadContents];
  [(UIInterfaceActionRepresentationView *)self _setContentsInsertedIntoViewHierarchy:1];
  [(UIInterfaceActionRepresentationView *)self interfaceAction:self->_action reloadDisplayedContentActionProperties:0];
  action = self->_action;
  id v4 = [(UIInterfaceActionRepresentationView *)self visualStyle];
  [(UIInterfaceActionRepresentationView *)self interfaceAction:action reloadDisplayedContentVisualStyle:v4];
}

- (void)_addLoadedContentsToHierarchyIfAllowed
{
  if (!self->_contentsInsertedIntoViewHierarchy
    && [(UIInterfaceActionRepresentationView *)self _canLoadContentsIntoHierarchy])
  {
    [(UIInterfaceActionRepresentationView *)self _setContentsInsertedIntoViewHierarchy:1];
  }
}

- (void)_removeLoadedContentsFromHierarchyIfNotVisible
{
  if (self->_contentsInsertedIntoViewHierarchy
    && ![(UIInterfaceActionRepresentationView *)self _isVisibleWithinContainmentAncestor]&& self->_canRemoveContentFromHierarchyWhenNotVisible)
  {
    [(UIInterfaceActionRepresentationView *)self _setContentsInsertedIntoViewHierarchy:0];
  }
}

- (BOOL)_canLoadContentsIntoHierarchy
{
  if (!self->_ownsActionContent) {
    return 0;
  }
  if (self->_canRemoveContentFromHierarchyWhenNotVisible) {
    return [(UIInterfaceActionRepresentationView *)self _isVisibleWithinContainmentAncestor];
  }
  return 1;
}

- (BOOL)_isVisibleWithinContainmentAncestor
{
  char v3 = [(UIView *)self _enclosingInterfaceActionGroupView];
  if (v3)
  {
    [(UIView *)self bounds];
    objc_msgSend(v3, "convertRect:fromView:", self);
    CGFloat x = v14.origin.x;
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    if (CGRectIsEmpty(v14))
    {
      BOOL v8 = 0;
    }
    else
    {
      [v3 bounds];
      v16.origin.CGFloat x = v9;
      v16.origin.CGFloat y = v10;
      v16.size.CGFloat width = v11;
      v16.size.CGFloat height = v12;
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      BOOL v8 = CGRectIntersectsRect(v15, v16);
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)_viewDisplayingBackground
{
  return self->_backgroundHighlightView;
}

- (void)_clearBackgroundPressedState
{
}

- (id)_actionViewState
{
  char v3 = [(UIInterfaceActionRepresentationView *)self action];
  id v4 = +[UIInterfaceActionViewState viewStateForActionRepresentationView:self action:v3];

  return v4;
}

- (BOOL)_contentsInsertedIntoViewHierarchy
{
  return self->_contentsInsertedIntoViewHierarchy;
}

- (UIInterfaceAction)action
{
  return self->_action;
}

- (BOOL)ownsActionContent
{
  return self->_ownsActionContent;
}

- (void)setOwnsActionContent:(BOOL)a3
{
  self->_ownsActionContent = a3;
}

- (unint64_t)visualCornerPosition
{
  return self->_visualCornerPosition;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (id)actionViewStateContext
{
  return self->_actionViewStateContext;
}

- (void)setActionViewStateContext:(id)a3
{
}

- (UIInterfaceActionVisualBackgroundDisplaying)backgroundHighlightView
{
  return self->_backgroundHighlightView;
}

- (NSLayoutConstraint)minimumWidthConstraint
{
  return self->_minimumWidthConstraint;
}

- (NSLayoutConstraint)minimumHeightConstraint
{
  return self->_minimumHeightConstraint;
}

- (NSArray)viewsToDisappearWhenHighlighted
{
  return self->_viewsToDisappearWhenHighlighted;
}

- (void)setViewsToDisappearWhenHighlighted:(id)a3
{
}

- (BOOL)canRemoveContentFromHierarchyWhenNotVisible
{
  return self->_canRemoveContentFromHierarchyWhenNotVisible;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (UISpringLoadedInteraction)interactionForSpringLoading
{
  return self->_interactionForSpringLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionForSpringLoading, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_viewsToDisappearWhenHighlighted, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundHighlightView, 0);
  objc_storeStrong(&self->_actionViewStateContext, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end