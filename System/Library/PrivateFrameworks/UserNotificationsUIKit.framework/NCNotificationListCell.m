@interface NCNotificationListCell
- (BOOL)_actionHandlerAllowsPerformingClipping;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)_shouldPerformClipping;
- (BOOL)disableDimming;
- (BOOL)hideDate;
- (BOOL)isContentUserInteractionEnabled;
- (BOOL)isSideSwipedWithoutTouch;
- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3;
- (BOOL)shouldVerticallyStackButtonsForSwipeInteraction:(id)a3;
- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListCell)initWithFrame:(CGRect)a3;
- (NCNotificationListCellActionHandling)actionHandler;
- (NCNotificationListCellActionProviding)actionProvider;
- (NCNotificationListDimmable)contentViewController;
- (NCNotificationViewController)notificationViewController;
- (NSString)materialGroupNameBase;
- (PLSwipeInteraction)swipeInteraction;
- (UIColor)materialTintColor;
- (UIColor)textColor;
- (UIView)contentView;
- (double)backgroundAlpha;
- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3;
- (double)contentAlpha;
- (double)dateAlpha;
- (id)buttonsTintColorForSwipeInteraction:(id)a3;
- (id)senderForActionWithIdentifier:(id)a3;
- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4;
- (id)viewToMoveForSwipeInteraction:(id)a3;
- (int64_t)buttonsRecipeForSwipeInteraction:(id)a3;
- (int64_t)materialRecipe;
- (void)_configureClippingIfNecessary;
- (void)_layoutContentView;
- (void)_resetClipping;
- (void)_setupClipping;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)hideActionButtonsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5;
- (void)hintSideSwipeForDefaultAction;
- (void)layoutSubviews;
- (void)revealSupplementaryActionsWithCompletion:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setActionProvider:(id)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentUserInteractionEnabled:(BOOL)a3;
- (void)setContentViewController:(id)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDisableDimming:(BOOL)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setMaterialTintColor:(id)a3;
- (void)setSideSwipedWithoutTouch:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4;
- (void)swipeInteractionDidBeginHidingActions:(id)a3;
- (void)swipeInteractionDidBeginRevealingActions:(id)a3;
- (void)swipeInteractionDidSignificantUserInteraction:(id)a3;
@end

@implementation NCNotificationListCell

- (NCNotificationListCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)NCNotificationListCell;
  v7 = -[NCNotificationListCell initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", x, y, width, height);
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v8;

    [(NCNotificationListCell *)v7 setAccessibilityIdentifier:@"ListCell"];
    [(UIView *)v7->_contentView setAccessibilityIdentifier:@"ListCell.ContentView"];
    [(NCNotificationListCell *)v7 addSubview:v7->_contentView];
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(NCNotificationListCell *)v7 setBackgroundColor:v10];

    v11 = [(NCNotificationListCell *)v7 layer];
    [v11 setAllowsGroupOpacity:0];

    v7->_disableDimming = 0;
    v7->_dateAlpha = 1.0;
    v7->_contentAlpha = 1.0;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F91468]) initWithDelegate:v7];
    swipeInteraction = v7->_swipeInteraction;
    v7->_swipeInteraction = (PLSwipeInteraction *)v12;

    [(NCNotificationListCell *)v7 addInteraction:v7->_swipeInteraction];
  }
  return v7;
}

- (void)setContentViewController:(id)a3
{
  v5 = (NCNotificationListDimmable *)a3;
  contentViewController = self->_contentViewController;
  v11 = v5;
  if (contentViewController != v5)
  {
    v7 = [(NCNotificationListDimmable *)contentViewController view];
    [v7 removeFromSuperview];

    objc_storeStrong((id *)&self->_contentViewController, a3);
    uint64_t v8 = [(NCNotificationListCell *)self contentView];
    v9 = [(NCNotificationListDimmable *)v11 view];
    [v8 addSubview:v9];

    [(NCNotificationListCell *)self setOverrideUserInterfaceStyle:[(NCNotificationListDimmable *)self->_contentViewController overrideUserInterfaceStyle]];
    [(PLSwipeInteraction *)self->_swipeInteraction hideActionsAnimated:0 fastAnimation:0 completion:0];
    v10 = [(NCNotificationListCell *)self notificationViewController];
    [v10 setBackgroundAlpha:self->_backgroundAlpha];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (void)setContentUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NCNotificationListCell *)self notificationViewController];
  id v8 = v5;
  if (v5)
  {
    [v5 setInteractionEnabled:v3];
  }
  else
  {
    v6 = [(NCNotificationListCell *)self contentViewController];
    v7 = [v6 view];
    [v7 setUserInteractionEnabled:v3];
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    v4 = [(NCNotificationListCell *)self notificationViewController];
    [v4 setBackgroundAlpha:self->_backgroundAlpha];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    v4 = [(NCNotificationListCell *)self notificationViewController];
    [v4 setContentAlpha:self->_contentAlpha];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (void)setDisableDimming:(BOOL)a3
{
  if (self->_disableDimming != a3)
  {
    BOOL v3 = a3;
    self->_disableDimming = a3;
    v5 = [(NCNotificationListCell *)self notificationViewController];
    [v5 setDisableDimming:v3];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    BOOL v3 = a3;
    self->_hideDate = a3;
    v5 = [(NCNotificationListCell *)self notificationViewController];
    [v5 setHideDate:v3];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (void)setDateAlpha:(double)a3
{
  if (self->_dateAlpha != a3)
  {
    self->_dateAlpha = a3;
    v5 = [(NCNotificationListCell *)self notificationViewController];
    [v5 setDateAlpha:a3];

    [(NCNotificationListCell *)self setNeedsLayout];
  }
}

- (BOOL)isContentUserInteractionEnabled
{
  BOOL v3 = [(NCNotificationListCell *)self notificationViewController];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 isInteractionEnabled];
  }
  else
  {
    v6 = [(NCNotificationListCell *)self contentViewController];
    v7 = [v6 view];
    char v5 = [v7 isUserInteractionEnabled];
  }
  return v5;
}

- (void)hideActionButtonsAnimated:(BOOL)a3 fastAnimation:(BOOL)a4 completion:(id)a5
{
}

- (void)hintSideSwipeForDefaultAction
{
}

- (void)revealSupplementaryActionsWithCompletion:(id)a3
{
}

- (id)senderForActionWithIdentifier:(id)a3
{
  return (id)[(PLSwipeInteraction *)self->_swipeInteraction senderForActionWithIdentifier:a3];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListCell;
  [(NCNotificationListCell *)&v4 layoutSubviews];
  [(NCNotificationListCell *)self _layoutContentView];
  BOOL v3 = [(NCNotificationListCell *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 subviewDidLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  char v5 = [(NCNotificationListCell *)self contentViewController];
  v6 = [v5 view];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (PLSwipeInteraction)swipeInteraction
{
  return self->_swipeInteraction;
}

- (void)_layoutContentView
{
  [(NCNotificationListCell *)self bounds];
  [(UIView *)self->_contentView frame];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(NCNotificationListCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v9 = [(NCNotificationListDimmable *)self->_contentViewController view];
  objc_msgSend(v9, "setFrame:", v7, v8, v4, v6);
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  contentViewController = self->_contentViewController;
  if (contentViewController)
  {
    long long v4 = *(_OWORD *)&a3->c;
    v5[0] = *(_OWORD *)&a3->a;
    v5[1] = v4;
    v5[2] = *(_OWORD *)&a3->tx;
    [(NCNotificationListDimmable *)contentViewController configureStackDimmingForTransform:v5];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, a3);
  id v5 = a3;
  [(PLSwipeInteraction *)self->_swipeInteraction setMaterialGroupNameBase:v5];
}

- (BOOL)shouldContinuePresentingActionButtonsForSwipeInteraction:(id)a3
{
  long long v4 = [(NCNotificationListCell *)self actionProvider];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 shouldContinuePresentingActionButtonsForNotificationListCell:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)swipeInteraction:(id)a3 actionsToRevealFromLayoutLocation:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v6 = [(NCNotificationListCell *)self actionProvider];
  if (a4 == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 supplementaryActionsForNotificationListCell:self];
      goto LABEL_9;
    }
  }
  else if (!a4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = [v6 defaultActionForNotificationListCell:self];
    double v8 = (void *)v7;
    if (v7)
    {
      v11[0] = v7;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      id v9 = 0;
    }

    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)swipeInteraction:(id)a3 shouldRevealActionsFromLayoutLocation:(unint64_t)a4
{
  double v6 = [(NCNotificationListCell *)self actionProvider];
  if (a4 == 1)
  {
    if (objc_opt_respondsToSelector())
    {
      char v7 = [v6 shouldShowSupplementaryActionsForNotificationListCell:self];
      goto LABEL_7;
    }
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  if (a4 || (objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  char v7 = [v6 shouldShowDefaultActionForNotificationListCell:self];
LABEL_7:
  BOOL v8 = v7;
LABEL_9:

  return v8;
}

- (id)viewToMoveForSwipeInteraction:(id)a3
{
  return self->_contentView;
}

- (int64_t)buttonsRecipeForSwipeInteraction:(id)a3
{
  return self->_materialRecipe;
}

- (id)buttonsTintColorForSwipeInteraction:(id)a3
{
  return self->_materialTintColor;
}

- (double)buttonsCornerRadiusForSwipeInteraction:(id)a3
{
  return 23.5;
}

- (void)swipeInteractionDidBeginHidingActions:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(UIView *)contentView setUserInteractionEnabled:1];
  [(NCNotificationListCell *)self setContentUserInteractionEnabled:1];
  id v6 = [(NCNotificationListCell *)self actionHandler];
  [v6 notificationListCell:self didBeginHidingActionsForSwipeInteraction:v5];
}

- (void)swipeInteractionDidBeginRevealingActions:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(UIView *)contentView setUserInteractionEnabled:0];
  [(NCNotificationListCell *)self setContentUserInteractionEnabled:0];
  id v6 = [(NCNotificationListCell *)self actionHandler];
  [v6 notificationListCell:self didBeginRevealingActionsForSwipeInteraction:v5];
}

- (void)swipeInteractionDidSignificantUserInteraction:(id)a3
{
  id v4 = [(NCNotificationListCell *)self actionHandler];
  [v4 notificationListCellDidSignificantUserInteraction:self];
}

- (void)swipeInteraction:(id)a3 didMoveToNewXPosition:(double)a4
{
  id v6 = [(NCNotificationListCell *)self actionHandler];
  [v6 notificationListCell:self didMoveToNewXPosition:a4];
  if (a4 == 0.0) {
    [(NCNotificationListCell *)self _resetClipping];
  }
  else {
    [(NCNotificationListCell *)self _configureClippingIfNecessary];
  }
}

- (BOOL)shouldVerticallyStackButtonsForSwipeInteraction:(id)a3
{
  objc_msgSend((id)*MEMORY[0x1E4FB2608], "preferredContentSizeCategory", a3);
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  char IsAX = _NCSizeCategoryIsAX(v4);

  uint64_t v6 = [(NCNotificationListCell *)self actionProvider];
  char v7 = (void *)v6;
  if ((IsAX & 1) == 0 && v6)
  {
    if (objc_opt_respondsToSelector()) {
      char IsAX = [v7 shouldVerticallyStackActionButtonsForNotificationListCell:self];
    }
    else {
      char IsAX = 0;
    }
  }

  return IsAX;
}

- (void)_configureClippingIfNecessary
{
  if ([(NCNotificationListCell *)self _shouldPerformClipping])
  {
    [(NCNotificationListCell *)self _setupClipping];
  }
  else
  {
    [(NCNotificationListCell *)self _resetClipping];
  }
}

- (void)_setupClipping
{
  double v3 = [(NCNotificationListCell *)self layer];
  [v3 setMaskedCorners:15];

  [(NCNotificationListCell *)self _setContinuousCornerRadius:23.5];

  [(NCNotificationListCell *)self setClipsToBounds:1];
}

- (void)_resetClipping
{
  double v3 = [(NCNotificationListCell *)self layer];
  [v3 setMaskedCorners:0];

  [(NCNotificationListCell *)self setClipsToBounds:0];
}

- (BOOL)_shouldPerformClipping
{
  uint64_t v3 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation];
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v6 = ([v4 userInterfaceIdiom] == 1 || (unint64_t)(v3 - 3) <= 1)
    && [(NCNotificationListCell *)self _actionHandlerAllowsPerformingClipping];

  return v6;
}

- (BOOL)_actionHandlerAllowsPerformingClipping
{
  uint64_t v3 = [(NCNotificationListCell *)self actionHandler];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldPerformClippingForNotificationListCell:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (int64_t)materialRecipe
{
  return self->_materialRecipe;
}

- (void)setMaterialRecipe:(int64_t)a3
{
  self->_materialRecipe = a3;
}

- (UIColor)materialTintColor
{
  return self->_materialTintColor;
}

- (void)setMaterialTintColor:(id)a3
{
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (NCNotificationListDimmable)contentViewController
{
  return self->_contentViewController;
}

- (NCNotificationListCellActionHandling)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (NCNotificationListCellActionHandling *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (NCNotificationListCellActionProviding)actionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionProvider);

  return (NCNotificationListCellActionProviding *)WeakRetained;
}

- (void)setActionProvider:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (double)dateAlpha
{
  return self->_dateAlpha;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (BOOL)isSideSwipedWithoutTouch
{
  return self->_sideSwipedWithoutTouch;
}

- (void)setSideSwipedWithoutTouch:(BOOL)a3
{
  self->_sideSwipedWithoutTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_destroyWeak((id *)&self->_actionProvider);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_materialTintColor, 0);

  objc_storeStrong((id *)&self->_swipeInteraction, 0);
}

- (NCNotificationViewController)notificationViewController
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    contentViewController = self->_contentViewController;
  }
  else {
    contentViewController = 0;
  }

  return (NCNotificationViewController *)contentViewController;
}

@end