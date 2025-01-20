@interface UIKeyboardMenuView
- (BOOL)centerPopUpOverKey;
- (BOOL)isVisible;
- (BOOL)launchedFromKeyboard;
- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3;
- (BOOL)shouldShow;
- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3;
- (BOOL)showingCapsLockSwitcher;
- (BOOL)usesDarkTheme;
- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3;
- (BOOL)usesDimmingView;
- (BOOL)usesShadowView;
- (BOOL)usesStraightLeftEdge;
- (BOOL)usesTable;
- (CGRect)interactiveBounds;
- (CGRect)popupRect;
- (CGSize)preferredSize;
- (UIGlomojiAnalyticsDispatcher)glomojiAnalyticsInstance;
- (UIKBTree)referenceKey;
- (UIKeyboardLayoutStar)layout;
- (UIKeyboardMenuView)initWithFrame:(CGRect)a3;
- (double)minYOfLastTableCellForSelectionExtraView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_renderConfig;
- (id)containerView;
- (id)dimmingView;
- (id)font;
- (id)indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:(CGPoint)a3;
- (id)inputView;
- (id)maskForShadowViewBlurredBackground;
- (id)subtitleFont;
- (id)subtitleForItemAtIndex:(unint64_t)a3;
- (id)table;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (id)titleForItemAtIndex:(unint64_t)a3;
- (int64_t)getRowFromPoint:(CGPoint)a3;
- (int64_t)indexForSelectedFastSwitchMode;
- (int64_t)indexForUnselectedFastSwitchMode;
- (int64_t)mode;
- (unint64_t)_internationalKeyRoundedCornerInLayout:(id)a3;
- (unint64_t)defaultSelectedIndex;
- (unint64_t)numberOfItems;
- (void)_delayedFade;
- (void)autoscrollTimerFired:(id)a3;
- (void)clear;
- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4;
- (void)dealloc;
- (void)dimmingViewWasTapped:(id)a3;
- (void)endScrolling:(id)a3;
- (void)fade;
- (void)fadeWithDelay:(double)a3;
- (void)fadeWithDelay:(double)a3 forSelectionAtIndex:(unint64_t)a4;
- (void)hide;
- (void)highlightRow:(unint64_t)a3;
- (void)insertSelExtraView;
- (void)performShowAnimation;
- (void)removeFromSuperview;
- (void)scrollViewDidScroll:(id)a3;
- (void)selectItemAtPoint:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGlomojiAnalyticsInstance:(id)a3;
- (void)setHighlightForRowAtIndexPath:(id)a3 highlight:(BOOL)a4;
- (void)setIndexForSelectedFastSwitchMode:(int64_t)a3;
- (void)setIndexForUnselectedFastSwitchMode:(int64_t)a3;
- (void)setKeyboardDimmed:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setNeedsDisplay;
- (void)setNeedsDisplayForCell:(id)a3;
- (void)setNeedsDisplayForTopBottomCells;
- (void)setReferenceKey:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setShowingCapsLockSwitcher:(BOOL)a3;
- (void)setUsesDarkTheme:(BOOL)a3;
- (void)setUsesStraightLeftEdge:(BOOL)a3;
- (void)setupBackgroundKeyViewWithSize:(CGSize)a3;
- (void)setupShadowViewWithSize:(CGSize)a3;
- (void)show;
- (void)showAsHUD;
- (void)showAsHUDFromLocation:(CGPoint)a3 withInputView:(id)a4 touchBegan:(double)a5;
- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4;
- (void)stopAnyAutoscrolling;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateSelectionWithPoint:(CGPoint)a3;
- (void)willShow;
@end

@implementation UIKeyboardMenuView

- (UIKeyboardMenuView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardMenuView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    if ([(UIKeyboardMenuView *)v3 usesTable])
    {
      v5 = [UIInputSwitcherTableView alloc];
      double v6 = *MEMORY[0x1E4F1DB28];
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v10 = -[UITableView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], v7, v8, v9);
      m_table = v4->m_table;
      v4->m_table = (UIInputSwitcherTableView *)v10;

      [(UITableView *)v4->m_table setDataSource:v4];
      [(UITableView *)v4->m_table setDelegate:v4];
      [(UITableView *)v4->m_table setSeparatorStyle:0];
      v12 = +[UIColor clearColor];
      [(UITableView *)v4->m_table setBackgroundColor:v12];

      [(UIScrollView *)v4->m_table setUserInteractionEnabled:0];
      [(UIInputSwitcherTableView *)v4->m_table setMenu:v4];
      [(UIView *)v4 addSubview:v4->m_table];
      v13 = -[UIInputSwitcherSelectionExtraView initWithFrame:]([UIInputSwitcherSelectionExtraView alloc], "initWithFrame:", v6, v7, v8, v9);
      m_selExtraView = v4->m_selExtraView;
      v4->m_selExtraView = v13;

      [(UIInputSwitcherSelectionExtraView *)v4->m_selExtraView setMenu:v4];
      v15 = v4->m_table;
      uint64_t v16 = objc_opt_class();
      v17 = +[UIInputSwitcherTableCell reuseIdentifier];
      [(UITableView *)v15 registerClass:v16 forCellReuseIdentifier:v17];
    }
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v4 selector:sel_applicationWillSuspend_ name:@"UIApplicationSuspendedNotification" object:0];

    [(UIView *)v4 setOpaque:0];
    v4->m_shouldFade = 1;
    v4->m_initialIndexInteracted = -1;
    v4->m_menuDrag = 0;
    v19 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIApplicationSuspendedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardMenuView;
  [(UIView *)&v4 dealloc];
}

- (id)table
{
  return self->m_table;
}

- (BOOL)usesTable
{
  return 1;
}

- (BOOL)centerPopUpOverKey
{
  return 0;
}

- (id)subtitleFont
{
  return (id)[off_1E52D39B8 systemFontOfSize:12.0];
}

- (id)font
{
  return (id)[off_1E52D39B8 systemFontOfSize:18.0];
}

- (void)setFrame:(CGRect)a3
{
  CGRect v14 = CGRectIntegral(a3);
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardMenuView;
  -[UIView setFrame:](&v13, sel_setFrame_);
  m_shadowView = self->m_shadowView;
  [(UIScrollView *)self->m_table contentSize];
  double v10 = v9;
  [(UIScrollView *)self->m_table contentSize];
  -[UIInputSwitcherShadowView setFrame:](m_shadowView, "setFrame:", 0.0, 0.0, v10, v11);
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    -[UIInputSwitcherSelectionExtraView setFrame:](self->m_selExtraView, "setFrame:", 0.0, 0.0, width, height);
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  double MidX = CGRectGetMidX(v15);
  self->m_pointerOffset = MidX - CGRectGetMidX(self->m_referenceRect);
  -[UIInputSwitcherShadowView setPointerOffset:](self->m_shadowView, "setPointerOffset:");
  [(UIInputSwitcherSelectionExtraView *)self->m_selExtraView setPointerOffset:self->m_pointerOffset];
}

- (BOOL)isVisible
{
  v2 = [(UIView *)self window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performShowAnimation
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__UIKeyboardMenuView_performShowAnimation__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:117440512 delay:v2 options:0 animations:0.0 completion:0.0];
}

uint64_t __42__UIKeyboardMenuView_performShowAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setKeyboardDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[UIKeyboardImpl activeInstance];
  id v8 = [v5 _layout];

  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 deactivateActiveKeysClearingTouchInfo:1 clearingDimming:0];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(UIKeyboardMenuView *)self usesDarkTheme];
    double v7 = 0.1;
    if (v6) {
      double v7 = 0.4;
    }
    [v8 setKeyboardDim:v3 amount:v7 withDuration:0.3];
  }
}

- (id)inputView
{
  return self->m_inputView;
}

- (id)dimmingView
{
  if (!self->m_dimmingView)
  {
    BOOL v3 = [UIDimmingView alloc];
    objc_super v4 = -[UIDimmingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    m_dimmingView = self->m_dimmingView;
    self->m_dimmingView = v4;

    [(UIDimmingView *)self->m_dimmingView setDelegate:self];
  }
  BOOL v6 = [(UIKeyboardMenuView *)self containerView];
  double v7 = v6;
  if (v6)
  {
    [v6 frame];
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v12 = +[UIKeyboard activeKeyboard];
    [v12 frame];
    double v9 = v13;
    double v11 = v14;
  }
  -[UIView setFrame:](self->m_dimmingView, "setFrame:", 0.0, 0.0, v9, v11);
  CGRect v15 = self->m_dimmingView;

  return v15;
}

- (void)dimmingViewWasTapped:(id)a3
{
  objc_super v4 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
  [v4 setKBMenuDismissSource:3];

  [(UIKeyboardMenuView *)self hide];
  [(UIKeyboardMenuView *)self returnToKeyboardIfNeeded];
}

- (BOOL)usesDimmingView
{
  return 1;
}

- (BOOL)usesShadowView
{
  return [(UIKeyboardMenuView *)self mode] == 0;
}

- (void)insertSelExtraView
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    BOOL v3 = [(UIKeyboardMenuView *)self usesShadowView];
    m_selExtraView = self->m_selExtraView;
    v5 = &OBJC_IVAR___UIKeyboardMenuView_m_table;
    if (v3) {
      v5 = &OBJC_IVAR___UIKeyboardMenuView_m_shadowView;
    }
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.isa + *v5);
    [(UIView *)self insertSubview:m_selExtraView aboveSubview:v6];
  }
}

- (void)show
{
  if ([(UIKeyboardMenuView *)self shouldShow])
  {
    [(UITableView *)self->m_table reloadData];
    [(UIKeyboardMenuView *)self willShow];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __26__UIKeyboardMenuView_show__block_invoke;
    v68[3] = &unk_1E52D9F70;
    v68[4] = self;
    +[UIView performWithoutAnimation:v68];
    [(UIInputSwitcherShadowView *)self->m_shadowView setMode:LODWORD(self->m_mode)];
    [(UIView *)self->m_shadowView setNeedsDisplay];
    [(UIView *)self->m_selExtraView setNeedsDisplay];
    BOOL v3 = [(UIKeyboardMenuView *)self containerView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v5 = [(UIKeyboardMenuView *)self containerView];
    uint64_t v6 = v5;
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v7 = [v5 window];

      uint64_t v6 = (void *)v7;
    }

    if (([v6 _isHostedInAnotherProcess] & 1) != 0
      || ([v6 windowScene],
          double v8 = objc_claimAutoreleasedReturnValue(),
          [v8 _effectiveSettings],
          double v9 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      double v9 = 0;
      uint64_t v10 = *MEMORY[0x1E4F1DB28];
      uint64_t v11 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
      double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [v9 frame];
      double v13 = v12;
      double v15 = v14;
    }
    double v16 = v13;
    double v17 = v15;
    if (CGRectIsEmpty(*(CGRect *)&v10))
    {
      v18 = +[UIScreen mainScreen];
      [v18 bounds];
      double v13 = v19;
      double v21 = v20;
    }
    else
    {
      uint64_t v22 = [v9 interfaceOrientation];
      if ([(id)UIApp _isSpringBoard])
      {
        int64_t v23 = +[UIKeyboardSceneDelegate interfaceOrientation];
        if ((unint64_t)(v23 - 1) >= 4) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = v23;
        }
      }
      if ((unint64_t)(v22 - 3) >= 2) {
        double v21 = v15;
      }
      else {
        double v21 = v13;
      }
      if ((unint64_t)(v22 - 3) < 2) {
        double v13 = v15;
      }
    }
    self->m_visibleRows = [(UIKeyboardMenuView *)self numberOfItems];
    [(UIKeyboardMenuView *)self preferredSize];
    double v25 = v24;
    double v27 = v26;
    double v28 = v21;
    if (!self->m_mode) {
      goto LABEL_69;
    }
    double v28 = v21;
    if ([(UIKeyboardMenuView *)self usesTable])
    {
      double y = self->m_referenceRect.origin.y;
      v30 = [(UIKeyboardMenuView *)self containerView];
      [v30 frame];
      double v32 = y + v31 + -6.0;
      v33 = [(UIKeyboardMenuView *)self containerView];
      v34 = [v33 window];
      v35 = __UIStatusBarManagerForWindow(v34);
      [v35 statusBarHeight];
      double v37 = v36;

      double v28 = v32 - v37;
    }
    if (!self->m_mode)
    {
LABEL_69:
      if (self->m_inputView)
      {
        double v38 = self->m_referenceLocation.y;
        v39 = [(UIKeyboardMenuView *)self containerView];
        [v39 safeAreaInsets];
        double v28 = v38 - v40 + -6.0;
      }
    }
    if (v25 > v13 + -10.0) {
      double v25 = v13 + -10.0;
    }
    self->m_scrollable = v27 > v28;
    self->m_scrolling = 0;
    if (self->m_scrollable)
    {
      if (self->m_mode) {
        BOOL v41 = 1;
      }
      else {
        BOOL v41 = self->m_inputView != 0;
      }
    }
    else
    {
      BOOL v41 = 0;
    }
    [(UIScrollView *)self->m_table setUserInteractionEnabled:v41];
    self->m_startAutoscroll = 0;
    [(UIScrollView *)self->m_table setScrollEnabled:self->m_scrollable];
    [(UIScrollView *)self->m_table _setAutoscrolling:self->m_scrollable];
    if (self->m_scrollable)
    {
      self->m_visibleRows = vcvtmd_u64_f64(v28 / 50.0);
      double v42 = (double)(unint64_t)floor(v28 / 50.0) * 50.0;
      double v27 = v42 + -4.0;
    }
    else
    {
      double v42 = v27;
    }
    -[UITableView setFrame:](self->m_table, "setFrame:", 0.0, 0.0, v25, v27);
    [(UIKeyboardMenuView *)self setUsesStraightLeftEdge:0];
    if (self->m_mode)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v43 = 0.0;
      }
      else {
        double v43 = 20.0;
      }
      p_m_referenceRect = &self->m_referenceRect;
      double x = self->m_referenceRect.origin.x;
      if (x < v43)
      {
        [(UIKeyboardMenuView *)self setUsesStraightLeftEdge:1];
        double x = p_m_referenceRect->origin.x;
      }
      double v46 = self->m_referenceRect.origin.y - v42 + -6.0;
      double v47 = fmax(x + self->m_referenceRect.size.width * 0.5 - v25 * 0.5, 10.0);
      if ([(UIKeyboardMenuView *)self usesStraightLeftEdge]) {
        double v47 = p_m_referenceRect->origin.x;
      }
      v69.size.double width = self->m_referenceRect.size.width;
      v69.size.double height = self->m_referenceRect.size.height;
      v69.origin.double x = p_m_referenceRect->origin.x;
      v69.origin.double y = self->m_referenceRect.origin.y;
      if (CGRectGetMidX(v69) > 32.0)
      {
        v70.origin.double x = p_m_referenceRect->origin.x;
        v70.origin.double y = self->m_referenceRect.origin.y;
        v70.size.double width = self->m_referenceRect.size.width;
        v70.size.double height = self->m_referenceRect.size.height;
        if (v25 + CGRectGetMinX(v70) >= v13)
        {
          v71.origin.double x = p_m_referenceRect->origin.x;
          v71.origin.double y = self->m_referenceRect.origin.y;
          v71.size.double width = self->m_referenceRect.size.width;
          v71.size.double height = self->m_referenceRect.size.height;
          double v47 = fmax(CGRectGetMidX(v71) - v25 + 14.0 + 8.0, 25.0);
        }
      }
      v72.origin.double x = v47;
      v72.origin.double y = v46;
      v72.size.double width = v25;
      v72.size.double height = v42;
      CGFloat v48 = CGRectGetMinX(v72) + 8.0;
      v73.origin.double x = p_m_referenceRect->origin.x;
      v73.origin.double y = self->m_referenceRect.origin.y;
      v73.size.double width = self->m_referenceRect.size.width;
      v73.size.double height = self->m_referenceRect.size.height;
      if (v48 > CGRectGetMinX(v73))
      {
        v74.origin.double x = p_m_referenceRect->origin.x;
        v74.origin.double y = self->m_referenceRect.origin.y;
        v74.size.double width = self->m_referenceRect.size.width;
        v74.size.double height = self->m_referenceRect.size.height;
        double v47 = CGRectGetMinX(v74) + -8.0;
      }
    }
    else
    {
      v49 = [(UIKeyboardMenuView *)self containerView];
      [v49 safeAreaInsets];
      double v51 = v50;
      double v53 = v52;

      if (self->m_inputView)
      {
        double v54 = self->m_referenceLocation.x + v25 * -0.5;
        double v46 = self->m_referenceLocation.y - v42 + -6.0;
        double v47 = v51 + 5.0;
        if (v54 >= v47)
        {
          if (v53 + v25 + v54 + 5.0 <= v13) {
            double v47 = self->m_referenceLocation.x + v25 * -0.5;
          }
          else {
            double v47 = v13 - v25 + -5.0 - v53;
          }
        }
      }
      else
      {
        double v47 = round(*MEMORY[0x1E4F1DAD8] + (v13 - v25) * 0.5);
        double v46 = round(*(double *)(MEMORY[0x1E4F1DAD8] + 8) + (v21 - v42) * 0.5);
      }
    }
    -[UIKeyboardMenuView setupBackgroundKeyViewWithSize:](self, "setupBackgroundKeyViewWithSize:", v25, v42);
    -[UIKeyboardMenuView setFrame:](self, "setFrame:", v47, v46, v25, v42);
    if ([(UIKeyboardMenuView *)self usesDimmingView])
    {
      v55 = [(UIKeyboardMenuView *)self dimmingView];
      v56 = [(UIKeyboardMenuView *)self containerView];
      [v56 addSubview:v55];
    }
    v57 = [(UIKeyboardMenuView *)self containerView];
    [v57 addSubview:self];

    if (self->m_scrollable) {
      [(UITableView *)self->m_table flashScrollIndicators];
    }
    unint64_t v58 = [(UIKeyboardMenuView *)self defaultSelectedIndex];
    if (v58 != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIKeyboardMenuView *)self highlightRow:v58];
    }
    [(UIView *)self->m_selExtraView removeFromSuperview];
    if (self->m_mode == 1)
    {
      uint64_t v59 = [(UITableView *)self->m_table indexPathForSelectedRow];
      if (v59)
      {
        v60 = (void *)v59;
        v61 = [(UITableView *)self->m_table indexPathForSelectedRow];
        BOOL v62 = [(UIKeyboardMenuView *)self shouldShowSelectionExtraViewForIndexPath:v61];

        if (v62) {
          [(UIKeyboardMenuView *)self insertSelExtraView];
        }
      }
    }
    [(UIKeyboardMenuView *)self setNeedsDisplay];
    [(UIKeyboardMenuView *)self performShowAnimation];
    m_slideBehavior = self->m_slideBehavior;
    if (!m_slideBehavior)
    {
      v64 = +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration];
      v65 = [v64 tweakedConfigurationForClass:objc_opt_class() usage:@"retarget"];

      v66 = [(UIFeedbackGenerator *)[UISelectionFeedbackGenerator alloc] initWithConfiguration:v65];
      v67 = self->m_slideBehavior;
      self->m_slideBehavior = v66;

      [(UIFeedbackGenerator *)self->m_slideBehavior activateWithCompletionBlock:0];
      m_slideBehavior = self->m_slideBehavior;
    }
    [(UISelectionFeedbackGenerator *)m_slideBehavior selectionChanged];
    [(UIKeyboardMenuView *)self didShow];
  }
}

void __26__UIKeyboardMenuView_show__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerView];
  v1 = +[_UIEditMenuSceneComponent sceneComponentForView:v2];
  [v1 dismissCurrentMenu];
}

- (void)setupBackgroundKeyViewWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if ([(UIKeyboardMenuView *)self mode])
  {
    m_backgroundKeyView = self->m_backgroundKeyView;
    [(UIKBKeyView *)m_backgroundKeyView removeFromSuperview];
    return;
  }
  if (!setupBackgroundKeyViewWithSize____keyplane)
  {
    uint64_t v7 = +[UIScreen mainScreen];
    double v8 = +[UIKBScreenTraits traitsWithScreen:v7 orientation:1];

    double v9 = UIKeyboardGetKBStarName(@"en_US", v8, 0, 0);
    uint64_t v10 = UIKeyboardGetKBStarKeyboardWithName(v9);
    uint64_t v11 = [v10 subtrees];
    uint64_t v12 = [v11 firstObject];
    double v13 = (void *)setupBackgroundKeyViewWithSize____keyplane;
    setupBackgroundKeyViewWithSize____keyplane = v12;

    if ([v8 idiom] == 1) {
      uint64_t v14 = 102;
    }
    else {
      uint64_t v14 = 1;
    }
    [(id)setupBackgroundKeyViewWithSize____keyplane setVisualStyle:v14];
  }
  id v32 = [(UIKeyboardMenuView *)self _renderConfig];
  v34.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v34.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectInset(v34, -2.0, -1.0);
  double x = v35.origin.x;
  double y = v35.origin.y;
  double v17 = v35.size.width;
  double v18 = v35.size.height;
  double v19 = self->m_backgroundKeyView;
  if (!v19) {
    goto LABEL_14;
  }
  double v20 = [(UIKBKeyView *)v19 renderConfig];
  int v21 = [v20 lightKeyboard];
  if (v21 != [v32 lightKeyboard])
  {

LABEL_14:
    int64_t v23 = [[UIKBTree alloc] initWithType:8];
    double v24 = +[UIKBShape shape];
    [(UIKBTree *)v23 setShape:v24];

    -[UIKBTree setPaddedFrame:](v23, "setPaddedFrame:", x, y, v17, v18);
    [(UIKBTree *)v23 setState:16];
    [(UIKBTree *)v23 setDisplayTypeHint:12];
    [(UIKBTree *)v23 setInteractionType:9];
    double v25 = +[UIKBRenderingContext renderingContextForRenderConfig:v32];
    objc_msgSend(v25, "setIsFloating:", +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"));
    double v26 = +[UIKBRenderFactory factoryForVisualStyle:renderingContext:](UIKBRenderFactory, "factoryForVisualStyle:renderingContext:", [(id)setupBackgroundKeyViewWithSize____keyplane visualStyling], v25);
    double v27 = [v26 traitsForKey:v23 onKeyplane:setupBackgroundKeyViewWithSize____keyplane];
    double v28 = objc_alloc_init(UIKBKeyViewAnimator);
    id v29 = objc_alloc([(UIKBKeyViewAnimator *)v28 keyViewClassForKey:v23 renderTraits:v27 screenTraits:0]);
    v30 = (UIKBKeyView *)objc_msgSend(v29, "initWithFrame:keyplane:key:", setupBackgroundKeyViewWithSize____keyplane, v23, x, y, v17, v18);
    -[UIKBKeyView setDrawFrame:](v30, "setDrawFrame:", x, y, v17, v18);
    [(UIKBKeyView *)self->m_backgroundKeyView removeFromSuperview];
    double v31 = self->m_backgroundKeyView;
    self->m_backgroundKeyView = v30;

    goto LABEL_15;
  }
  [(UIView *)self->m_backgroundKeyView frame];
  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.CGFloat width = v17;
  v37.size.CGFloat height = v18;
  BOOL v22 = CGRectEqualToRect(v36, v37);

  if (!v22) {
    goto LABEL_14;
  }
LABEL_15:
  [(UIView *)self insertSubview:self->m_backgroundKeyView atIndex:0];
  [(UIKBKeyView *)self->m_backgroundKeyView setRenderConfig:v32];
  [(UIKBKeyView *)self->m_backgroundKeyView prepareForDisplay];
  [(UIView *)self->m_backgroundKeyView setNeedsDisplay];
}

- (void)setupShadowViewWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(UIKeyboardMenuView *)self usesShadowView])
  {
    m_shadowView = self->m_shadowView;
    if (m_shadowView)
    {
      [(UIView *)m_shadowView removeFromSuperview];
      uint64_t v7 = self->m_shadowView;
      self->m_shadowView = 0;
    }
    double v8 = -[UIInputSwitcherShadowView initWithFrame:]([UIInputSwitcherShadowView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    double v9 = self->m_shadowView;
    self->m_shadowView = v8;

    [(UIInputSwitcherShadowView *)self->m_shadowView setMode:LODWORD(self->m_mode)];
    -[UIInputSwitcherShadowView setKeyRect:](self->m_shadowView, "setKeyRect:", self->m_referenceRect.origin.x, self->m_referenceRect.origin.y, self->m_referenceRect.size.width, self->m_referenceRect.size.height);
    [(UIInputSwitcherShadowView *)self->m_shadowView setMenu:self];
    [(UIView *)self->m_table insertSubview:self->m_shadowView atIndex:0];
    uint64_t v10 = self->m_shadowView;
    [(UIView *)v10 setNeedsDisplay];
  }
}

- (id)_renderConfig
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 inputViews];
  objc_super v4 = [v3 inputView];

  if (v4)
  {
    v5 = [v4 _inheritedRenderConfig];
  }
  else
  {
    uint64_t v6 = [v2 containerView];
    v5 = [v6 _inheritedRenderConfig];
  }
  return v5;
}

- (void)showAsHUDFromLocation:(CGPoint)a3 withInputView:(id)a4 touchBegan:(double)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v10 = a4;
  if (self->m_timeDismissed <= a5)
  {
    id v15 = v10;
    self->m_referenceLocation.CGFloat x = x;
    self->m_referenceLocation.CGFloat y = y;
    objc_storeStrong((id *)&self->m_inputView, a4);
    self->m_mode = 0;
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->m_referenceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->m_referenceRect.size = v11;
    if ([(UIKeyboardMenuView *)self isVisible])
    {
      uint64_t v12 = [(UIKeyboardMenuView *)self layout];
      [v12 deactivateActiveKeys];
    }
    double v13 = [(UIKeyboardMenuView *)self _renderConfig];
    [(UIKeyboardMenuView *)self setRenderConfig:v13];

    uint64_t v14 = [(UIKeyboardMenuView *)self containerView];

    id v10 = v15;
    if (v14)
    {
      [(UIKeyboardMenuView *)self show];
      id v10 = v15;
    }
  }
}

- (void)showAsHUD
{
}

- (id)containerView
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  objc_super v4 = [(UIView *)self->m_inputView window];
  if (v4)
  {
    v5 = self->m_inputView;
  }
  else
  {
    uint64_t v6 = +[UIKeyboard activeKeyboard];
    uint64_t v7 = [v6 window];
    if (v7)
    {
      v5 = +[UIKeyboard activeKeyboard];
    }
    else
    {
      double v8 = [v3 inputViews];
      v5 = [v8 inputView];
    }
  }

  double v9 = [(UIView *)v5 window];
  id v10 = [v9 rootViewController];
  CGSize v11 = [v10 view];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [v3 containerView];
  }
  uint64_t v14 = v13;

  id v15 = [(UIView *)v5 window];
  if (v15 && ![(UIView *)v5 isDescendantOfView:v14])
  {
    char v17 = 0;
  }
  else
  {
    double v16 = +[UIKeyboardImpl activeInstance];
    char v17 = [v16 isDictationPopoverPresented] ^ 1;
  }
  double v18 = +[UIKeyboardImpl activeInstance];
  if ([v18 isEmojiPopoverPresented])
  {
    double v19 = [v18 emojiPopoverController];
    double v20 = [v19 view];
    int v21 = [v20 window];
  }
  else
  {
    if (v17)
    {
      id v22 = v14;
    }
    else
    {
      id v22 = [(UIView *)v5 window];
    }
    int v21 = v22;
  }

  return v21;
}

- (id)maskForShadowViewBlurredBackground
{
  BOOL v3 = +[UIScreen mainScreen];
  [v3 scale];
  double v5 = v4;

  [(UIScrollView *)self->m_table contentSize];
  double v7 = v6;
  double v9 = v8;
  _UIGraphicsBeginImageContextWithOptions(0, 0, v6, v8, v5);
  id v10 = +[UIColor blackColor];
  [v10 set];

  CGSize v11 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v7, v9, 8.0, 8.0);
  [v11 fill];

  uint64_t v12 = +[UIColor clearColor];
  [v12 set];

  id v13 = [(UITableView *)self->m_table visibleCells];
  if ([v13 count])
  {
    if (v5 <= 1.0) {
      double v14 = 1.0;
    }
    else {
      double v14 = 0.5;
    }
    id v15 = [v13 objectAtIndex:0];
    [v15 frame];
    double v17 = v16;

    for (double i = v17 - v14; i < v9; double i = v17 + i)
    {
      v22.origin.CGFloat x = 0.0;
      v22.origin.CGFloat y = i;
      v22.size.double width = v7;
      v22.size.double height = v14;
      UIRectFillUsingBlendMode(v22, kCGBlendModeCopy);
    }
    double v19 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
  }
  else
  {
    double v19 = 0;
  }

  return v19;
}

- (double)minYOfLastTableCellForSelectionExtraView
{
  BOOL v3 = [(UITableView *)self->m_table visibleCells];
  double v4 = [v3 lastObject];
  double v5 = [v4 superview];
  [v4 frame];
  objc_msgSend(v5, "convertRect:toView:", self->m_selExtraView);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v16.origin.CGFloat x = v7;
  v16.origin.CGFloat y = v9;
  v16.size.double width = v11;
  v16.size.double height = v13;
  double MinY = CGRectGetMinY(v16);

  return MinY;
}

- (unint64_t)_internationalKeyRoundedCornerInLayout:(id)a3
{
  id v3 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unint64_t v4 = -1;
  }
  else
  {
    double v5 = [v3 keyboardName];
    uint64_t v6 = [v5 rangeOfString:@"Emoji"];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v4 = -1;
    }
    else {
      unint64_t v4 = 0;
    }
  }

  return v4;
}

- (void)showAsPopupForKey:(id)a3 inLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 paddedFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  self->m_mode = 1;
  CGRect v16 = [(UIKeyboardMenuView *)self containerView];
  objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
  self->m_referenceRect.origin.CGFloat x = v17;
  self->m_referenceRect.origin.CGFloat y = v18;
  self->m_referenceRect.size.double width = v19;
  self->m_referenceRect.size.double height = v20;

  [(UIInputSwitcherSelectionExtraView *)self->m_selExtraView setRoundedCorners:[(UIKeyboardMenuView *)self _internationalKeyRoundedCornerInLayout:v6]];
  -[UIInputSwitcherSelectionExtraView setKeyRect:](self->m_selExtraView, "setKeyRect:", self->m_referenceRect.origin.x, self->m_referenceRect.origin.y, self->m_referenceRect.size.width, self->m_referenceRect.size.height);
  [(UIKeyboardMenuView *)self setReferenceKey:v7];

  [(UIKeyboardMenuView *)self setLayout:v6];
  [(UIKeyboardMenuView *)self show];
  int v21 = [(UIKeyboardMenuView *)self layout];
  CGRect v22 = [(UIKeyboardMenuView *)self referenceKey];
  [v21 setState:16 forKey:v22];

  int64_t v23 = [(UIKeyboardMenuView *)self layout];
  double v24 = [v23 currentKeyplaneView];
  double v25 = [(UIKeyboardMenuView *)self referenceKey];
  id v38 = [v24 viewForKey:v25];

  double v26 = [(UIView *)self superview];
  [v38 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  CGRect v35 = [v38 superview];
  objc_msgSend(v26, "convertRect:fromView:", v35, v28, v30, v32, v34);
  objc_msgSend(v38, "setFrame:");

  CGRect v36 = [(UIView *)self superview];
  [v36 addSubview:v38];

  CGRect v37 = [(UIView *)self superview];
  [(UIView *)self frame];
  objc_msgSend(v37, "convertRect:toView:", v38);
  -[UIKeyboardMenuView setFrame:](self, "setFrame:");

  [v38 setUserInteractionEnabled:1];
  [v38 addSubview:self];
}

- (void)_delayedFade
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [(UIKeyboardMenuView *)self setKeyboardDimmed:0];
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  id v3 = [(UIView *)self superview];
  if (v3 && (BOOL m_shouldFade = self->m_shouldFade, v3, m_shouldFade))
  {
    double v5 = [(UIKeyboardMenuView *)self layout];
    id v6 = [v5 currentKeyplaneView];
    id v7 = [(UIKeyboardMenuView *)self referenceKey];
    double v8 = [v6 viewForKey:v7];

    double v9 = [(UIKeyboardMenuView *)self layout];
    double v10 = [(UIKeyboardMenuView *)self referenceKey];
    [v9 setState:2 forKey:v10];

    double v11 = [(UIView *)self superview];

    if (v11 == v8)
    {
      [(UIKeyboardMenuView *)self clear];
    }
    else
    {
      BOOL v12 = [(UIKeyboardMenuView *)self showingCapsLockSwitcher];
      double v13 = 0.5;
      if (v12) {
        double v13 = 0.25;
      }
      v14[4] = self;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __34__UIKeyboardMenuView__delayedFade__block_invoke;
      v15[3] = &unk_1E52D9F70;
      v15[4] = self;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __34__UIKeyboardMenuView__delayedFade__block_invoke_2;
      v14[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:0 delay:v15 options:v14 animations:v13 completion:0.0];
    }
  }
  else
  {
    self->BOOL m_shouldFade = 1;
  }
}

uint64_t __34__UIKeyboardMenuView__delayedFade__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __34__UIKeyboardMenuView__delayedFade__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

- (void)fade
{
  if (self->m_mode) {
    [(UIKeyboardMenuView *)self fadeWithDelay:0x7FFFFFFFFFFFFFFFLL forSelectionAtIndex:1.0];
  }
}

- (void)fadeWithDelay:(double)a3
{
}

- (void)fadeWithDelay:(double)a3 forSelectionAtIndex:(unint64_t)a4
{
  [(UIKeyboardMenuView *)self willFadeForSelectionAtIndex:a4];
  if (self->m_mode || self->m_inputView)
  {
    uint64_t v6 = [(UIView *)self superview];
    if (v6)
    {
      id v7 = (void *)v6;
      double v8 = [(UIKeyboardMenuView *)self referenceKey];
      int v9 = [v8 state];

      if (v9 == 16)
      {
        double v10 = [(UIKeyboardMenuView *)self layout];
        double v11 = [v10 currentKeyplaneView];
        BOOL v12 = [(UIKeyboardMenuView *)self referenceKey];
        double v13 = [v11 viewForKey:v12];

        if (v13)
        {
          [(UIView *)self frame];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          CGRect v22 = [(UIView *)self superview];
          objc_msgSend(v13, "convertRect:fromView:", v22, v15, v17, v19, v21);
          -[UIKeyboardMenuView setFrame:](self, "setFrame:");

          [v13 addSubview:self];
        }
      }
    }
    [(UIKeyboardMenuView *)self performSelector:sel__delayedFade withObject:0 afterDelay:a3];
  }
}

- (void)clear
{
  id v3 = [(UIKeyboardMenuView *)self dimmingView];
  [v3 removeFromSuperview];

  m_inputView = self->m_inputView;
  self->m_inputView = 0;

  self->m_mode = 0;
  self->m_timeDismissed = (double)(unint64_t)GSCurrentEventTimestamp() / 1000000000.0;
  [(UIKeyboardMenuView *)self stopAnyAutoscrolling];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(UIFeedbackGenerator *)self->m_slideBehavior deactivate];
  m_slideBehavior = self->m_slideBehavior;
  self->m_slideBehavior = 0;
}

- (BOOL)launchedFromKeyboard
{
  BOOL v3 = [(UIKeyboardMenuView *)self isVisible];
  if (v3) {
    LOBYTE(v3) = self->m_mode == 1 || self->m_inputView != 0;
  }
  return v3;
}

- (void)removeFromSuperview
{
  [(UIKeyboardMenuView *)self clear];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardMenuView;
  [(UIView *)&v3 removeFromSuperview];
}

- (void)hide
{
  if (self->m_mode || self->m_inputView)
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      [(UIKeyboardMenuView *)self setKeyboardDimmed:0];
    }
    objc_super v3 = [(UIKeyboardMenuView *)self layout];
    unint64_t v4 = [(UIKeyboardMenuView *)self referenceKey];
    [v3 setState:2 forKey:v4];

    [(UIView *)self setAlpha:0.0];
    self->BOOL m_shouldFade = 1;
    [(UIKeyboardMenuView *)self removeFromSuperview];
  }
  double v5 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
  [v5 didKBMenuAction];

  self->m_initialIndexInteracted = -1;
  self->m_menuDrag = 0;
}

- (void)setNeedsDisplayForCell:(id)a3
{
  id v3 = [a3 backgroundView];
  [v3 setNeedsDisplay];
}

- (void)setNeedsDisplayForTopBottomCells
{
  id v5 = [(UITableView *)self->m_table visibleCells];
  if ([v5 count])
  {
    id v3 = [v5 objectAtIndex:0];
    [(UIKeyboardMenuView *)self setNeedsDisplayForCell:v3];

    unint64_t v4 = [v5 lastObject];
    [(UIKeyboardMenuView *)self setNeedsDisplayForCell:v4];
  }
}

- (void)setNeedsDisplay
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIView *)self window];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v4 = [(UITableView *)self->m_table visibleCells];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [(UIKeyboardMenuView *)self setNeedsDisplayForCell:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardMenuView;
  [(UIView *)&v9 setNeedsDisplay];
}

- (void)endScrolling:(id)a3
{
  if (self->m_scrolling)
  {
    [(UIKeyboardMenuView *)self setNeedsDisplayForTopBottomCells];
    self->m_scrolling = 0;
    double x = self->m_point.x;
    double y = self->m_point.y;
    -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:", x, y);
  }
}

- (void)stopAnyAutoscrolling
{
  m_scrollTimer = self->m_scrollTimer;
  if (m_scrollTimer)
  {
    [(NSTimer *)m_scrollTimer invalidate];
    unint64_t v4 = self->m_scrollTimer;
    self->m_scrollTimer = 0;

    self->m_scrolling = 1;
    if (self->m_scrollDirection == 8) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 1;
    }
    [(UITableView *)self->m_table scrollToNearestSelectedRowAtScrollPosition:v5 animated:1];
    if (self->m_scrollDirection == 8 && self->m_mode == 1)
    {
      uint64_t v6 = [(UITableView *)self->m_table indexPathForSelectedRow];
      BOOL v7 = [(UIKeyboardMenuView *)self shouldShowSelectionExtraViewForIndexPath:v6];

      if (v7) {
        [(UIKeyboardMenuView *)self insertSelExtraView];
      }
    }
    [(UIKeyboardMenuView *)self performSelector:sel_endScrolling_ withObject:0 afterDelay:0.3];
  }
}

- (void)autoscrollTimerFired:(id)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v5 = Current - self->m_scrollStartTime + Current - self->m_scrollStartTime;
  if (v5 >= 1.0) {
    double v6 = 40.0;
  }
  else {
    double v6 = v5 * v5 * 40.0;
  }
  if (v6 <= 0.0) {
    goto LABEL_12;
  }
  double v7 = v6 * 1.1;
  [(UIScrollView *)self->m_table _contentOffsetAnimationDuration];
  double v9 = v8;
  [(UIScrollView *)self->m_table contentOffset];
  double v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self->m_table contentSize];
  double v15 = v14;
  double v16 = -(v6 * 1.1);
  double v17 = self->m_scrollDirection == 8 ? v6 * 1.1 : -(v6 * 1.1);
  double v18 = v13 + v17;
  if (v13 + v17 <= v16 || ([(UIView *)self->m_table frame], v18 >= v7 + v15 - v19))
  {
LABEL_12:
    [(UIKeyboardMenuView *)self stopAnyAutoscrolling];
  }
  else
  {
    if (self->m_scrollDirection == 8)
    {
      [(UIView *)self->m_table frame];
      double v21 = v20 + -16.6666667;
    }
    else
    {
      double v21 = 16.6666667;
    }
    double v22 = v13 + v21;
    [(UIView *)self->m_selExtraView removeFromSuperview];
    -[UITableView indexPathForRowAtPoint:](self->m_table, "indexPathForRowAtPoint:", v11, v22);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v23 = [(UITableView *)self->m_table indexPathForSelectedRow];
    if (([v30 isEqual:v23] & 1) == 0)
    {
      m_table = self->m_table;
      double v25 = [(UITableView *)m_table indexPathForSelectedRow];
      [(UIInputSwitcherTableView *)m_table deselectRowAtIndexPath:v25 animated:1];

      [(UIInputSwitcherTableView *)self->m_table selectRowAtIndexPath:v30 animated:0 scrollPosition:0];
      double v26 = [(UITableView *)self->m_table cellForRowAtIndexPath:v23];
      [(UIKeyboardMenuView *)self setNeedsDisplayForCell:v26];

      [(UIKeyboardMenuView *)self setNeedsDisplayForTopBottomCells];
    }
    double v27 = 0.0;
    if (v18 >= 0.0)
    {
      [(UIView *)self->m_table frame];
      double v27 = v18;
      if (v18 > v15 - v28)
      {
        [(UIView *)self->m_table frame];
        double v27 = v15 - v29;
      }
    }
    [(UIScrollView *)self->m_table _setContentOffsetAnimationDuration:0.11];
    -[UIScrollView _setContentOffset:animated:animationCurve:](self->m_table, "_setContentOffset:animated:animationCurve:", 1, 3, v11, v27);
    [(UIScrollView *)self->m_table _setContentOffsetAnimationDuration:v9];
  }
}

- (id)indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v6 = [(UITableView *)self->m_table visibleCells];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v11 frame];
        double v13 = v12;
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        [v11 interactiveInsets];
        CGFloat v21 = v15 + v20;
        CGFloat v24 = v17 - (v22 + v23);
        v36.size.double height = v19 - (v20 + v25);
        v36.origin.CGFloat x = v13 + v22;
        v36.origin.CGFloat y = v21;
        v36.size.double width = v24;
        v35.CGFloat x = x;
        v35.CGFloat y = y;
        if (CGRectContainsPoint(v36, v35))
        {
          double v26 = [(UITableView *)self->m_table indexPathForCell:v11];
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  double v26 = 0;
LABEL_11:

  return v26;
}

- (CGRect)interactiveBounds
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  [(UIView *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  double v11 = [(UITableView *)self->m_table visibleCells];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v16 frame];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        [v16 interactiveInsets];
        v42.origin.CGFloat x = v18 + v25;
        v42.origin.CGFloat y = v20 + v26;
        v42.size.CGFloat width = v22 - (v25 + v27);
        v42.size.CGFloat height = v24 - (v26 + v28);
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        CGRect v40 = CGRectUnion(v39, v42);
        CGFloat x = v40.origin.x;
        CGFloat y = v40.origin.y;
        CGFloat width = v40.size.width;
        CGFloat height = v40.size.height;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  m_table = self->m_table;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", m_table);
  -[UITableView indexPathForRowAtPoint:](m_table, "indexPathForRowAtPoint:");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  double v7 = [(UITableView *)self->m_table indexPathForSelectedRow];
  if (!self->m_menuDrag)
  {
    int64_t m_initialIndexInteracted = self->m_initialIndexInteracted;
    if ((m_initialIndexInteracted & 0x8000000000000000) == 0
      && m_initialIndexInteracted != -[UIKeyboardMenuView getRowFromPoint:](self, "getRowFromPoint:", x, y))
    {
      self->m_menuDrag = 1;
    }
  }
  if (!self->m_scrollable) {
    goto LABEL_17;
  }
  if (v24)
  {
    uint64_t v8 = [(UITableView *)self->m_table visibleCells];
    double v9 = [(UITableView *)self->m_table cellForRowAtIndexPath:v24];
    char v10 = [v8 containsObject:v9];

    if (v10)
    {
      self->m_startAutoscroll = 1;
      goto LABEL_11;
    }
  }
  id v24 = 0;
LABEL_11:
  self->m_point.double x = x;
  self->m_point.double y = y;
  if (self->m_startAutoscroll && x >= 0.0)
  {
    [(UIView *)self->m_table frame];
    if (x <= v12)
    {
      if (y <= 25.0 || ([(UIView *)self->m_table frame], y >= v13 + -12.5))
      {
        if (y > 50.0) {
          int v17 = 8;
        }
        else {
          int v17 = 4;
        }
        self->m_scrollDirection = v17;
        if (!self->m_scrollTimer)
        {
          self->m_scrollStartTime = CFAbsoluteTimeGetCurrent();
          double v18 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_autoscrollTimerFired_ selector:0 userInfo:1 repeats:0.1];
          m_scrollTimer = self->m_scrollTimer;
          self->m_scrollTimer = v18;
        }
        goto LABEL_39;
      }
    }
  }
  [(UIKeyboardMenuView *)self stopAnyAutoscrolling];
  if (self->m_scrolling) {
    goto LABEL_39;
  }
LABEL_17:
  if (v24)
  {
    if (-[UIKeyboardMenuView shouldSelectItemAtIndex:](self, "shouldSelectItemAtIndex:", [v24 row]))
    {
      uint64_t v14 = v24;
    }
    else
    {
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[UIKeyboardMenuView defaultSelectedIndex](self, "defaultSelectedIndex"), 0);

      uint64_t v14 = (void *)v16;
    }
  }
  else
  {
    self->BOOL m_shouldFade = 1;
    [(UIView *)self bounds];
    v27.size.CGFloat height = v15 + 16.6666667;
    v26.double x = x;
    v26.double y = y;
    if (CGRectContainsPoint(v27, v26))
    {
      id v24 = 0;
      goto LABEL_39;
    }
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[UIKeyboardMenuView defaultSelectedIndex](self, "defaultSelectedIndex"), 0);
  }
  id v24 = v14;
  if (!v7 || (uint64_t v20 = [v14 row], v20 != objc_msgSend(v7, "row")))
  {
    double v21 = self->m_table;
    double v22 = [(UITableView *)v21 indexPathForSelectedRow];
    [(UIInputSwitcherTableView *)v21 deselectRowAtIndexPath:v22 animated:1];

    if ([v24 row] != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIInputSwitcherTableView *)self->m_table selectRowAtIndexPath:v24 animated:0 scrollPosition:0];
    }
    [(UIView *)self->m_selExtraView removeFromSuperview];
    if (self->m_mode == 1
      && [(UIKeyboardMenuView *)self shouldShowSelectionExtraViewForIndexPath:v24])
    {
      [(UIKeyboardMenuView *)self insertSelExtraView];
    }
    uint64_t v23 = [(UITableView *)self->m_table indexPathForSelectedRow];

    if (v23)
    {
      [(UISelectionFeedbackGenerator *)self->m_slideBehavior selectionChanged];
      double v7 = (void *)v23;
    }
    else
    {
      double v7 = 0;
    }
  }
LABEL_39:
}

- (void)highlightRow:(unint64_t)a3
{
  id v12 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:0];
  BOOL v4 = [(UIKeyboardMenuView *)self showingCapsLockSwitcher];
  m_table = self->m_table;
  if (v4)
  {
    double v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [(UITableView *)m_table reloadSections:v6 withRowAnimation:5];

    int64_t v7 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
    BOOL v8 = v7 > [(UIKeyboardMenuView *)self indexForUnselectedFastSwitchMode];
    uint64_t v9 = [MEMORY[0x1E4F28D58] indexPathForRow:v8 inSection:0];

    [(UIInputSwitcherTableView *)self->m_table selectRowAtIndexPath:v9 animated:0 scrollPosition:3];
    id v12 = (id)v9;
  }
  else
  {
    char v10 = [(UITableView *)self->m_table indexPathForSelectedRow];
    [(UIInputSwitcherTableView *)m_table deselectRowAtIndexPath:v10 animated:1];

    if (self->m_mode == 1)
    {
      uint64_t v11 = 3;
    }
    else if (self->m_inputView)
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 2;
    }
    [(UIInputSwitcherTableView *)self->m_table selectRowAtIndexPath:v12 animated:0 scrollPosition:v11];
  }
  if (!self->m_mode)
  {
    [(UIScrollView *)self->m_table contentOffset];
    -[UITableView setContentOffset:](self->m_table, "setContentOffset:");
  }
  [(UIView *)self->m_selExtraView removeFromSuperview];
  if (self->m_mode == 1
    && [(UIKeyboardMenuView *)self shouldShowSelectionExtraViewForIndexPath:v12])
  {
    [(UIKeyboardMenuView *)self insertSelExtraView];
  }
  [(UIView *)self->m_table setNeedsDisplay];
}

- (BOOL)shouldShowSelectionExtraViewForIndexPath:(id)a3
{
  m_table = self->m_table;
  id v4 = a3;
  double v5 = [(UITableView *)m_table indexPathsForVisibleRows];
  id v6 = [v5 lastObject];

  return v6 == v4;
}

- (void)selectItemAtPoint:(CGPoint)a3
{
  self->BOOL m_shouldFade = 1;
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->m_table, a3.x, a3.y);
  id v4 = -[UIKeyboardMenuView indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:](self, "indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:");
  id v5 = v4;
  if (v4) {
    -[UIKeyboardMenuView didSelectItemAtIndex:](self, "didSelectItemAtIndex:", [v4 row]);
  }
  else {
    [(UIKeyboardMenuView *)self fade];
  }
}

- (void)setHighlightForRowAtIndexPath:(id)a3 highlight:(BOOL)a4
{
  id v18 = a3;
  id v6 = -[UITableView cellForRowAtIndexPath:](self->m_table, "cellForRowAtIndexPath:");
  if (a4)
  {
    int64_t v7 = +[UIColor whiteColor];
    BOOL v8 = [v6 textLabel];
    [v8 setTextColor:v7];

    uint64_t v9 = +[UIColor whiteColor];
    char v10 = [v6 detailTextLabel];
    [v10 setTextColor:v9];

    [(UIView *)self->m_selExtraView removeFromSuperview];
    if (self->m_mode == 1)
    {
      uint64_t v11 = [(UITableView *)self->m_table indexPathsForVisibleRows];
      id v12 = [v11 lastObject];

      if (v12 == v18) {
        [(UIView *)self insertSubview:self->m_selExtraView aboveSubview:self->m_shadowView];
      }
    }
  }
  else
  {
    double v13 = +[UIColor blackColor];
    uint64_t v14 = [v6 textLabel];
    [v14 setTextColor:v13];

    double v15 = +[UIColor blackColor];
    uint64_t v16 = [v6 detailTextLabel];
    [v16 setTextColor:v15];
  }
  int v17 = [v6 backgroundView];
  [v17 setNeedsDisplay];
}

- (int64_t)getRowFromPoint:(CGPoint)a3
{
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->m_table, a3.x, a3.y);
  id v4 = -[UIKeyboardMenuView indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:](self, "indexPathForInputSwitcherCellIncludingInteractiveInsetsAtPoint:");
  id v5 = v4;
  if (v4) {
    int64_t v6 = [v4 row];
  }
  else {
    int64_t v6 = -1;
  }

  return v6;
}

- (void)customizeCell:(id)a3 forItemAtIndex:(unint64_t)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = a4;
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher])
  {
    int64_t v8 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
    int64_t v9 = [(UIKeyboardMenuView *)self indexForUnselectedFastSwitchMode];
    if (a4 == 1)
    {
      if (v8 < v9)
      {
LABEL_5:
        int64_t v10 = [(UIKeyboardMenuView *)self indexForUnselectedFastSwitchMode];
LABEL_8:
        unint64_t v7 = v10;
        goto LABEL_9;
      }
    }
    else
    {
      unint64_t v7 = a4;
      if (a4) {
        goto LABEL_9;
      }
      if (v8 >= v9) {
        goto LABEL_5;
      }
    }
    int64_t v10 = [(UIKeyboardMenuView *)self indexForSelectedFastSwitchMode];
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v11 = +[UIColor clearColor];
  [v6 setBackgroundColor:v11];

  [v6 setSelectionFadeDuration:0.0];
  [v6 setSelectionStyle:0];
  [v6 setFirst:a4 == 0];
  objc_msgSend(v6, "setLast:", -[UIKeyboardMenuView numberOfItems](self, "numberOfItems") - 1 == a4);
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher])
  {
    [v6 setFirst:a4 == 0];
    [v6 setLast:a4 == 1];
  }
  objc_msgSend(v6, "setUsesDarkTheme:", -[UIKeyboardMenuView usesDarkTheme](self, "usesDarkTheme"));
  objc_msgSend(v6, "setUsesStraightLeftEdge:", -[UIKeyboardMenuView usesStraightLeftEdge](self, "usesStraightLeftEdge"));
  id v12 = [v6 textLabel];
  [v12 setTextAlignment:1];
  double v13 = [(UIKeyboardMenuView *)self localizedTitleForItemAtIndex:v7];
  [v12 setText:v13];

  if ([(UIKeyboardMenuView *)self usesDeviceLanguageForItemAtIndex:v7])
  {
    uint64_t v14 = [v12 text];

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v16 = [v12 text];
      uint64_t v38 = *MEMORY[0x1E4F24780];
      int v17 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
      v39[0] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
      double v19 = (void *)[v15 initWithString:v16 attributes:v18];
      [v12 setAttributedText:v19];
    }
  }
  if ([(UIKeyboardMenuView *)self usesDarkTheme]) {
    +[UIColor whiteColor];
  }
  else {
  uint64_t v20 = +[UIColor blackColor];
  }
  [v12 setTextColor:v20];

  double v21 = [v12 textColor];
  [v12 setHighlightedTextColor:v21];

  double v22 = [(UIKeyboardMenuView *)self fontForItemAtIndex:v7];
  [v12 setFont:v22];

  uint64_t v23 = [(UIKeyboardMenuView *)self subtitleForItemAtIndex:v7];
  if ([v23 length])
  {
    id v24 = [v6 detailTextLabel];
    [v24 setTextAlignment:1];
    if ([(UIKeyboardMenuView *)self usesDarkTheme]) {
      +[UIColor whiteColor];
    }
    else {
    double v25 = +[UIColor blackColor];
    }
    [v24 setTextColor:v25];

    CGPoint v26 = [v24 textColor];
    [v24 setHighlightedTextColor:v26];

    CGRect v27 = [(UIKeyboardMenuView *)self subtitleFontForItemAtIndex:v7];
    [v24 setFont:v27];
  }
  double v28 = [v6 _detailTextLabel:0];
  [v28 setText:v23];

  BOOL v29 = [(UIKeyboardMenuView *)self usesDeviceLanguageForItemAtIndex:v7];
  if (v23 && v29)
  {
    id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v36 = *MEMORY[0x1E4F24780];
    double v31 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    CGRect v37 = v31;
    double v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    long long v33 = (void *)[v30 initWithString:v23 attributes:v32];
    long long v34 = [v6 _detailTextLabel:0];
    [v34 setAttributedText:v33];
  }
  if (!self->m_mode)
  {
    long long v35 = [v6 textLabel];
    [v35 setShadowColor:0];
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = +[UIInputSwitcherTableCell reuseIdentifier];
  int64_t v9 = [v7 dequeueReusableCellWithIdentifier:v8 forIndexPath:v6];

  uint64_t v10 = [v6 row];
  [(UIKeyboardMenuView *)self customizeCell:v9 forItemAtIndex:v10];
  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 50.0;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher])
  {
    id v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  }
  else
  {
    int64_t v9 = [v6 cellForRowAtIndexPath:v7];
    [(UIKeyboardMenuView *)self setHighlightForRowAtIndexPath:v7 highlight:0];
    id v8 = v7;
  }
  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher])
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  }
  else
  {
    [(UIKeyboardMenuView *)self setHighlightForRowAtIndexPath:v5 highlight:1];
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = [(UITableView *)self->m_table indexPathForSelectedRow];
  [(UIKeyboardMenuView *)self setHighlightForRowAtIndexPath:v4 highlight:1];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([(UIKeyboardMenuView *)self showingCapsLockSwitcher]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [v6 row];
  }
  [(UIKeyboardMenuView *)self didSelectItemAtIndex:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->BOOL m_shouldFade = 0;
  uint64_t v5 = [a3 anyObject];
  [v5 locationInView:self];
  double v7 = v6;
  double v9 = v8;

  self->int64_t m_initialIndexInteracted = -[UIKeyboardMenuView getRowFromPoint:](self, "getRowFromPoint:", v7, v9);
  uint64_t v10 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v11 = [v10 currentInputMode];
  id v12 = [v11 identifierWithLayouts];
  double v13 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
  [v13 setOriginalInputMode:v12];

  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:", v7, v9);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  self->BOOL m_shouldFade = 0;
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  self->BOOL m_shouldFade = 1;
  id v10 = [a3 anyObject];
  [v10 locationInView:self];
  -[UIKeyboardMenuView updateSelectionWithPoint:](self, "updateSelectionWithPoint:");
  id v5 = [(UITableView *)self->m_table indexPathForSelectedRow];
  if (v5)
  {
    BOOL m_menuDrag = self->m_menuDrag;
    double v7 = [(UIKeyboardMenuView *)self glomojiAnalyticsInstance];
    double v8 = v7;
    if (m_menuDrag) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 3;
    }
    [v7 setKBMenuInteractionSource:v9];

    [v10 locationInView:self];
    -[UIKeyboardMenuView selectItemAtPoint:](self, "selectItemAtPoint:");
  }
  else
  {
    [(UIKeyboardMenuView *)self fadeWithDelay:0.1];
  }
}

- (void)setRenderConfig:(id)a3
{
  id v12 = a3;
  int v4 = [(UIKeyboardMenuView *)self usesDarkTheme];
  BOOL v5 = v4 == [v12 whiteText];
  double v6 = v12;
  if (!v5)
  {
    -[UIKeyboardMenuView setUsesDarkTheme:](self, "setUsesDarkTheme:", [v12 whiteText]);
    [(UITableView *)self->m_table reloadData];
    double v7 = [(UIKBKeyView *)self->m_backgroundKeyView renderConfig];
    int v8 = [v7 lightKeyboard];
    int v9 = [v12 lightKeyboard];

    if (v8 != v9)
    {
      [(UIView *)self frame];
      -[UIKeyboardMenuView setupBackgroundKeyViewWithSize:](self, "setupBackgroundKeyViewWithSize:", v10, v11);
    }
    [(UIKeyboardMenuView *)self setNeedsDisplay];
    double v6 = v12;
  }
}

- (CGRect)popupRect
{
  [(UIView *)self->m_table frame];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)shouldShow
{
  return 1;
}

- (void)willShow
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:0x1ED148400 object:0];
}

- (unint64_t)numberOfItems
{
  return 0;
}

- (unint64_t)defaultSelectedIndex
{
  return 0;
}

- (CGSize)preferredSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (BOOL)shouldSelectItemAtIndex:(unint64_t)a3
{
  return 1;
}

- (id)titleForItemAtIndex:(unint64_t)a3
{
  return &stru_1ED0E84C0;
}

- (BOOL)usesDeviceLanguageForItemAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)subtitleForItemAtIndex:(unint64_t)a3
{
  return &stru_1ED0E84C0;
}

- (int64_t)mode
{
  return self->m_mode;
}

- (void)setMode:(int64_t)a3
{
  self->m_mode = a3;
}

- (BOOL)usesStraightLeftEdge
{
  return self->_usesStraightLeftEdge;
}

- (void)setUsesStraightLeftEdge:(BOOL)a3
{
  self->_usesStraightLeftEdge = a3;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (BOOL)showingCapsLockSwitcher
{
  return self->_showingCapsLockSwitcher;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  self->_showingCapsLockSwitcher = a3;
}

- (int64_t)indexForSelectedFastSwitchMode
{
  return self->_indexForSelectedFastSwitchMode;
}

- (void)setIndexForSelectedFastSwitchMode:(int64_t)a3
{
  self->_indexForSelectedFastSwitchMode = a3;
}

- (int64_t)indexForUnselectedFastSwitchMode
{
  return self->_indexForUnselectedFastSwitchMode;
}

- (void)setIndexForUnselectedFastSwitchMode:(int64_t)a3
{
  self->_indexForUnselectedFastSwitchMode = a3;
}

- (UIKBTree)referenceKey
{
  return self->_referenceKey;
}

- (void)setReferenceKey:(id)a3
{
  self->_referenceKedouble y = (UIKBTree *)a3;
}

- (UIKeyboardLayoutStar)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (UIKeyboardLayoutStar *)a3;
}

- (UIGlomojiAnalyticsDispatcher)glomojiAnalyticsInstance
{
  return self->_glomojiAnalyticsInstance;
}

- (void)setGlomojiAnalyticsInstance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glomojiAnalyticsInstance, 0);
  objc_storeStrong((id *)&self->m_slideBehavior, 0);
  objc_storeStrong((id *)&self->m_backgroundKeyView, 0);
  objc_storeStrong((id *)&self->m_inputView, 0);
  objc_storeStrong((id *)&self->m_dimmingView, 0);
  objc_storeStrong((id *)&self->m_scrollTimer, 0);
  objc_storeStrong((id *)&self->m_selExtraView, 0);
  objc_storeStrong((id *)&self->m_shadowView, 0);
  objc_storeStrong((id *)&self->m_table, 0);
}

@end