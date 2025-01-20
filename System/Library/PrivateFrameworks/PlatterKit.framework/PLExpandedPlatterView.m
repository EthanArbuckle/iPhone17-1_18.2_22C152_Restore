@interface PLExpandedPlatterView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)clipsVisibleContentToBounds;
- (BOOL)hasShadow;
- (BOOL)isActionsHidden;
- (BOOL)isBackgroundBlurred;
- (BOOL)isDateAllDay;
- (BOOL)isDismissControlEnabled;
- (BOOL)isHeaderEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGRect)_actionsViewFrame;
- (CGRect)_boundsInsetHorizontallyFromDismissControlIfNecessary;
- (CGRect)_effectiveMainContentViewFrame;
- (CGRect)_headerFrame;
- (CGRect)_mainContentViewFrame;
- (CGRect)_scrollViewContentViewFrame;
- (CGRect)frameForPlatterFrame:(CGRect)a3;
- (CGRect)platterFrameForFrame:(CGRect)a3;
- (CGRect)scrollViewFrame;
- (CGSize)_actionsSizeThatFits:(CGSize)a3 includingPadding:(BOOL)a4;
- (CGSize)_contentViewSize;
- (CGSize)_flexibleAreaSizeForBounds:(CGRect)a3;
- (CGSize)_sizeThatFitsContentExcludingActionsWithSize:(CGSize)a3;
- (CGSize)actionsSizeThatFits:(CGSize)a3;
- (CGSize)contentSizeExcludingActions;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)customContentSize;
- (CGSize)sizeExcludingActions;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (NSArray)iconButtons;
- (NSArray)icons;
- (NSArray)interfaceActions;
- (NSDate)date;
- (NSString)title;
- (NSTimeZone)timeZone;
- (PLExpandedPlatterView)initWithFrame:(CGRect)a3;
- (PLExpandedPlatterViewDelegate)delegate;
- (UIButton)utilityButton;
- (UIControl)dismissControl;
- (UIEdgeInsets)_dismissControlTotalOutset;
- (UIEdgeInsets)dismissControlInsets;
- (UIEdgeInsets)minimumScrollViewContentInsets;
- (UIScrollView)scrollView;
- (UIView)_headerContentView;
- (UIView)_mainContentView;
- (UIView)customContentView;
- (double)_headerKeyLineAlphaForContentOffset;
- (double)contentBottomInset;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)dateFormatStyle;
- (int64_t)dismissControlPosition;
- (void)_configureActionViewIfNecessaryWithActions:(id)a3;
- (void)_configureActionsBackgroundViewIfNecessaryWithActions:(id)a3;
- (void)_configureCustomContentView;
- (void)_configureCustomContentViewIfNecessary;
- (void)_configureDismissControlIfNecessary;
- (void)_configureHeaderBackgroundDefaultIfNecessary;
- (void)_configureHeaderBackgroundForReduceTransparencyIfNecessary;
- (void)_configureHeaderBackgroundViewsIfCanScroll;
- (void)_configureHeaderBackgroundViewsIfNecessary;
- (void)_configureHeaderContainerViewIfNecessary;
- (void)_configureHeaderContentViewIfNecessary;
- (void)_configureMainContentViewIfNecessary;
- (void)_configureScrollViewContentViewIfNecessary;
- (void)_configureScrollViewIfNecessary;
- (void)_invalidateHeaderBackgroundViews;
- (void)_layoutActionsView;
- (void)_layoutCustomContentView;
- (void)_layoutDismissControl;
- (void)_layoutHeaderBackgroundViewsWithFrame:(CGRect)a3;
- (void)_layoutHeaderContainerViewWithFrame:(CGRect)a3;
- (void)_layoutHeaderContentViewWithFrame:(CGRect)a3;
- (void)_layoutMainContentView;
- (void)_layoutMainContentViewIfNecessary;
- (void)_layoutScrollView;
- (void)_layoutScrollViewContentView;
- (void)_layoutTopRubberbandingView;
- (void)_reduceTransparencyDidChange:(id)a3;
- (void)_updateHeaderKeyLineAlphaIfNecessaryAnimated:(BOOL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActionsHidden:(BOOL)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setClipsVisibleContentToBounds:(BOOL)a3;
- (void)setContentBottomInset:(double)a3;
- (void)setCustomContentSize:(CGSize)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissControlEnabled:(BOOL)a3;
- (void)setDismissControlPosition:(int64_t)a3;
- (void)setHeaderEnabled:(BOOL)a3;
- (void)setIcons:(id)a3;
- (void)setInterfaceActions:(id)a3;
- (void)setMainContentView:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PLExpandedPlatterView

- (PLExpandedPlatterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLExpandedPlatterView;
  v3 = -[PLExpandedPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__reduceTransparencyDidChange_ name:*MEMORY[0x1E4F43480] object:0];

    [(PLExpandedPlatterView *)v3 setHeaderEnabled:1];
    [(PLExpandedPlatterView *)v3 setDismissControlEnabled:1];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PLExpandedPlatterView;
  [(PLExpandedPlatterView *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);
  -[PLExpandedPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PLExpandedPlatterView;
  if (-[PLExpandedPlatterView pointInside:withEvent:](&v27, sel_pointInside_withEvent_, v7, x, y))
  {
    if (![(PLExpandedPlatterView *)self isDismissControlEnabled]) {
      goto LABEL_9;
    }
    v8 = [(PLPlatterHeaderContentView *)self->_headerContentView superview];
    [(PLPlatterHeaderContentView *)self->_headerContentView frame];
    objc_msgSend(v8, "convertRect:toView:", self);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v28.origin.double x = v10;
    v28.origin.double y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    double MinY = CGRectGetMinY(v28);
    int v18 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
    CGFloat v19 = v10;
    CGFloat v20 = v12;
    CGFloat v21 = v14;
    CGFloat v22 = v16;
    BOOL v23 = v18 ? x >= CGRectGetMinX(*(CGRect *)&v19) : x <= CGRectGetMaxX(*(CGRect *)&v19);
    if (y < MinY || !v23)
    {
      dismissControl = self->_dismissControl;
      -[PLExpandedPlatterView convertPoint:toView:](self, "convertPoint:toView:", dismissControl, x, y);
      char v24 = -[UIControl pointInside:withEvent:](dismissControl, "pointInside:withEvent:", v7);
    }
    else
    {
LABEL_9:
      char v24 = 1;
    }
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PLExpandedPlatterView;
  [(PLExpandedPlatterView *)&v12 layoutSubviews];
  [(PLExpandedPlatterView *)self _configureDismissControlIfNecessary];
  [(PLExpandedPlatterView *)self _configureScrollViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureScrollViewContentViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureHeaderContainerViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureCustomContentViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  [(PLExpandedPlatterView *)self _configureHeaderBackgroundViewsIfCanScroll];
  [(PLExpandedPlatterView *)self _layoutDismissControl];
  if ([(PLExpandedPlatterView *)self isHeaderEnabled])
  {
    [(PLExpandedPlatterView *)self _headerFrame];
    [(PLExpandedPlatterView *)self _layoutHeaderContainerViewWithFrame:"_layoutHeaderContainerViewWithFrame:"];
    [(UIView *)self->_headerContainerView bounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    [(PLExpandedPlatterView *)self _layoutHeaderContentViewWithFrame:"_layoutHeaderContentViewWithFrame:"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__PLExpandedPlatterView_layoutSubviews__block_invoke;
    v11[3] = &unk_1E6B5FAA0;
    v11[4] = self;
    v11[5] = v4;
    v11[6] = v6;
    v11[7] = v8;
    v11[8] = v10;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
  }
  [(PLExpandedPlatterView *)self _layoutScrollView];
  [(PLExpandedPlatterView *)self _layoutScrollViewContentView];
  [(PLExpandedPlatterView *)self _layoutMainContentView];
  [(PLExpandedPlatterView *)self _layoutCustomContentView];
  [(PLExpandedPlatterView *)self _layoutActionsView];
  [(PLExpandedPlatterView *)self _layoutTopRubberbandingView];
}

uint64_t __39__PLExpandedPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutHeaderBackgroundViewsWithFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)hasShadow
{
  return 0;
}

- (BOOL)isBackgroundBlurred
{
  return 0;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[PLExpandedPlatterView _sizeThatFitsContentExcludingActionsWithSize:](self, "_sizeThatFitsContentExcludingActionsWithSize:");
  double v7 = v6;
  double v9 = v8;
  if (self->_actionsView)
  {
    -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", width, height);
    double v9 = v9 + v10;
  }
  double v11 = v7;
  double v12 = v9;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double v5 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3.width > 0.0 && height > 0.0)
  {
    double width = a3.width;
    [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
    double v5 = width - v8;
    -[PLExpandedPlatterView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:", width - v8, 0.0);
    double v4 = (double)((int)(height - v9) & ~((int)(height - v9) >> 31));
  }
  double v10 = v5;
  result.double height = v4;
  result.double width = v10;
  return result;
}

- (NSArray)icons
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView icons];
}

- (void)setIcons:(id)a3
{
  id v4 = a3;
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  [(PLPlatterHeaderContentView *)self->_headerContentView setIcons:v4];
}

- (NSString)title
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView title];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView title];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setTitle:v6];
  }
}

- (NSDate)date
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView date];
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView date];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setDate:v6];
  }
}

- (BOOL)isDateAllDay
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView isDateAllDay];
}

- (void)setDateAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLPlatterHeaderContentView *)self->_headerContentView isDateAllDay] != a3)
  {
    [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
    headerContentView = self->_headerContentView;
    [(PLPlatterHeaderContentView *)headerContentView setDateAllDay:v3];
  }
}

- (NSTimeZone)timeZone
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView timeZone];
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  id v4 = [(PLPlatterHeaderContentView *)self->_headerContentView timeZone];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
    [(PLPlatterHeaderContentView *)self->_headerContentView setTimeZone:v6];
  }
}

- (int64_t)dateFormatStyle
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView dateFormatStyle];
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if ([(PLPlatterHeaderContentView *)self->_headerContentView dateFormatStyle] != a3)
  {
    headerContentView = self->_headerContentView;
    [(PLPlatterHeaderContentView *)headerContentView setDateFormatStyle:a3];
  }
}

- (NSArray)iconButtons
{
  return [(PLPlatterHeaderContentView *)self->_headerContentView iconButtons];
}

- (UIButton)utilityButton
{
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView utilityButton];
}

- (UIControl)dismissControl
{
  [(PLExpandedPlatterView *)self _configureDismissControlIfNecessary];
  dismissControl = self->_dismissControl;
  return dismissControl;
}

- (UIEdgeInsets)dismissControlInsets
{
  int v3 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
  BOOL v4 = self->_dismissControlPosition == 0;
  double v5 = 0.0;
  if ((v3 & v4) != 0) {
    double v6 = 12.0;
  }
  else {
    double v6 = 0.0;
  }
  if ((v3 & v4) != 0) {
    double v7 = 0.0;
  }
  else {
    double v7 = 12.0;
  }
  double v8 = 0.0;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)setDismissControlPosition:(int64_t)a3
{
  if (self->_dismissControlPosition != a3)
  {
    self->_dismissControlPosition = a3;
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
}

- (void)setCustomContentSize:(CGSize)a3
{
  if (a3.width != self->_customContentSize.width || a3.height != self->_customContentSize.height)
  {
    self->_customContentSize = a3;
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
}

- (void)setActionsHidden:(BOOL)a3
{
  if (self->_actionsHidden != a3)
  {
    self->_actionsHidden = a3;
    actionsBackgroundView = self->_actionsBackgroundView;
    if (a3) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
    [(MTMaterialView *)actionsBackgroundView setAlpha:v5];
    actionsView = self->_actionsView;
    [(PLInterfaceActionGroupView *)actionsView setAlpha:v5];
  }
}

- (void)setDismissControlEnabled:(BOOL)a3
{
  if (self->_dismissControlEnabled != a3)
  {
    self->_dismissControlEnabled = a3;
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
}

- (void)setHeaderEnabled:(BOOL)a3
{
  if (self->_headerEnabled != a3)
  {
    self->_headerEnabled = a3;
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
}

- (CGSize)sizeExcludingActions
{
  -[PLExpandedPlatterView _sizeThatFitsContentExcludingActionsWithSize:](self, "_sizeThatFitsContentExcludingActionsWithSize:", self->_customContentSize.width, self->_customContentSize.height);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)contentSizeExcludingActions
{
  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](self, "_contentSizeThatFitsContentWithSizeExcludingActions:", self->_customContentSize.width, self->_customContentSize.height);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)actionsSizeThatFits:(CGSize)a3
{
  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 1, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGRect)frameForPlatterFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
  double v9 = v8;
  double v11 = v10;
  int v12 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
  double v13 = 0.0;
  if (v12) {
    double v13 = v11;
  }
  double v14 = x - v13;
  double v15 = width + v11;
  -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", v15, height);
  double v17 = height + v9 + v16;
  double v18 = v14;
  double v19 = y - v9;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)platterFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
  double v9 = v8;
  double v11 = v10;
  int v12 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
  double v13 = 0.0;
  if (v12) {
    double v13 = v11;
  }
  double v14 = x + v13;
  double v15 = width - v11;
  -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", v15, height);
  double v17 = height - (v9 + v16);
  double v18 = v14;
  double v19 = y + v9;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)scrollViewFrame
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (UIEdgeInsets)minimumScrollViewContentInsets
{
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  double v7 = v6;
  double v9 = v8;
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v9);
  double v11 = v10;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (NSArray)interfaceActions
{
  return [(PLInterfaceActionGroupView *)self->_actionsView actions];
}

- (void)setInterfaceActions:(id)a3
{
  id v6 = a3;
  double v4 = [(PLExpandedPlatterView *)self interfaceActions];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(PLExpandedPlatterView *)self _configureActionViewIfNecessaryWithActions:v6];
    [(PLInterfaceActionGroupView *)self->_actionsView setActions:v6];
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
}

- (UIEdgeInsets)_dismissControlTotalOutset
{
  [(PLExpandedPlatterView *)self _configureDismissControlIfNecessary];
  double v4 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled])
  {
    -[UIControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    int64_t dismissControlPosition = self->_dismissControlPosition;
    if (dismissControlPosition == 1)
    {
      double v6 = v7 + 8.0;
    }
    else if (!dismissControlPosition)
    {
      double v4 = v8 + 8.0;
    }
  }
  double v10 = v4;
  double v11 = v3;
  double v12 = v5;
  double v13 = v6;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (CGRect)_boundsInsetHorizontallyFromDismissControlIfNecessary
{
  [(PLExpandedPlatterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled])
  {
    [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
    double v12 = v11;
    int v13 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
    double v14 = 0.0;
    if (v13) {
      double v14 = v12;
    }
    double v4 = v4 + v14;
    double v8 = v8 - v12;
  }
  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGSize)_sizeThatFitsContentExcludingActionsWithSize:(CGSize)a3
{
  double width = a3.width;
  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](self, "_contentSizeThatFitsContentWithSizeExcludingActions:", a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled])
  {
    [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
    double v6 = v6 + v9;
    double v8 = v8 + v10;
  }
  if ([(PLExpandedPlatterView *)self isHeaderEnabled])
  {
    [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
    -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, 0.0);
    double v8 = v8 + v11;
  }
  double v12 = v6;
  double v13 = v8;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)_actionsSizeThatFits:(CGSize)a3 includingPadding:(BOOL)a4
{
  actionsView = self->_actionsView;
  if (actionsView)
  {
    BOOL v5 = a4;
    double width = a3.width;
    -[PLInterfaceActionGroupView sizeThatFits:](actionsView, "sizeThatFits:", a3.width, a3.height);
    if (v7 < width) {
      double v7 = width;
    }
    if (v5) {
      double v8 = v8 + 8.0;
    }
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (UIView)customContentView
{
  [(PLExpandedPlatterView *)self _configureCustomContentViewIfNecessary];
  customContentView = self->_customContentView;
  return customContentView;
}

- (void)_configureDismissControlIfNecessary
{
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled] && !self->_dismissControl)
  {
    double v3 = +[PLGlyphControl dismissControlWithMaterialRecipe:1];
    [(UIControl *)v3 setBlurEnabled:0];
    [(UIControl *)v3 setAccessibilityIdentifier:@"dismiss-expanded-button"];
    double v4 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:self];
    [(UIControl *)v3 addInteraction:v4];

    dismissControl = self->_dismissControl;
    self->_dismissControl = v3;
    double v6 = v3;

    [(PLExpandedPlatterView *)self addSubview:self->_dismissControl];
  }
}

- (void)_configureHeaderContainerViewIfNecessary
{
  if ([(PLExpandedPlatterView *)self isHeaderEnabled] && !self->_headerContainerView)
  {
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    headerContainerView = self->_headerContainerView;
    self->_headerContainerView = v3;

    [(UIView *)self->_headerContainerView setClipsToBounds:0];
    BOOL v5 = self->_headerContainerView;
    [(PLExpandedPlatterView *)self addSubview:v5];
  }
}

- (void)_configureHeaderBackgroundDefaultIfNecessary
{
  if ([(PLExpandedPlatterView *)self isHeaderEnabled] && !self->_headerBackgroundView)
  {
    double v3 = (void *)MEMORY[0x1E4F743C8];
    double v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v5 = [v3 materialViewWithRecipeNamed:@"expandedPlatterHeaderBackground" inBundle:v4 options:0 initialWeighting:0 scaleAdjustment:1.0];
    headerBackgroundView = self->_headerBackgroundView;
    self->_headerBackgroundView = v5;

    double v7 = [(UIView *)self->_headerBackgroundView layer];
    [v7 setMaskedCorners:3];

    [(UIView *)self->_headerBackgroundView _setContinuousCornerRadius:13.0];
    [(PLExpandedPlatterView *)self _configureHeaderContainerViewIfNecessary];
    headerContainerView = self->_headerContainerView;
    double v9 = self->_headerBackgroundView;
    if (self->_headerContentView) {
      -[UIView insertSubview:belowSubview:](headerContainerView, "insertSubview:belowSubview:", v9);
    }
    else {
      [(UIView *)headerContainerView addSubview:v9];
    }
    double v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    headerTintView = self->_headerTintView;
    self->_headerTintView = v10;

    double v12 = self->_headerTintView;
    double v13 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(UIView *)self->_headerTintView setAlpha:0.65];
    double v14 = [(UIView *)self->_headerTintView layer];
    [v14 setMaskedCorners:3];

    [(UIView *)self->_headerTintView _setContinuousCornerRadius:13.0];
    [(UIView *)self->_headerContainerView insertSubview:self->_headerTintView aboveSubview:self->_headerBackgroundView];
    [(UIView *)self->_headerKeyLineView removeFromSuperview];
    headerKeyLineView = self->_headerKeyLineView;
    self->_headerKeyLineView = 0;
  }
}

- (double)_headerKeyLineAlphaForContentOffset
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  [(UIScrollView *)self->_scrollView contentInset];
  BOOL v6 = v4 <= -v5;
  double result = 0.0;
  if (!v6) {
    return 1.0;
  }
  return result;
}

- (void)_updateHeaderKeyLineAlphaIfNecessaryAnimated:(BOOL)a3
{
  if (self->_headerKeyLineView)
  {
    BOOL v3 = a3;
    [(PLExpandedPlatterView *)self _headerKeyLineAlphaForContentOffset];
    double v6 = v5;
    [(UIView *)self->_headerKeyLineView alpha];
    if (vabdd_f64(v7, v6) > 2.22044605e-16)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __70__PLExpandedPlatterView__updateHeaderKeyLineAlphaIfNecessaryAnimated___block_invoke;
      v10[3] = &unk_1E6B5FAC8;
      v10[4] = self;
      *(double *)&v10[5] = v6;
      uint64_t v8 = MEMORY[0x1D948D440](v10);
      double v9 = (void *)v8;
      if (v3) {
        [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:0.25];
      }
      else {
        (*(void (**)(uint64_t))(v8 + 16))(v8);
      }
    }
  }
}

uint64_t __70__PLExpandedPlatterView__updateHeaderKeyLineAlphaIfNecessaryAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:*(double *)(a1 + 40)];
}

- (void)_configureHeaderBackgroundForReduceTransparencyIfNecessary
{
  if ([(PLExpandedPlatterView *)self isHeaderEnabled] && !self->_headerBackgroundView)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    headerBackgroundView = self->_headerBackgroundView;
    self->_headerBackgroundView = v3;

    double v5 = self->_headerBackgroundView;
    double v6 = [MEMORY[0x1E4F428B8] _systemBackgroundColor];
    [(UIView *)v5 setBackgroundColor:v6];

    double v7 = [(UIView *)self->_headerBackgroundView layer];
    [v7 setMaskedCorners:3];

    [(UIView *)self->_headerBackgroundView _setContinuousCornerRadius:13.0];
    [(PLExpandedPlatterView *)self _configureHeaderContainerViewIfNecessary];
    headerContainerView = self->_headerContainerView;
    double v9 = self->_headerBackgroundView;
    if (self->_headerContentView) {
      -[UIView insertSubview:belowSubview:](headerContainerView, "insertSubview:belowSubview:", v9);
    }
    else {
      [(UIView *)headerContainerView addSubview:v9];
    }
    double v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    headerKeyLineView = self->_headerKeyLineView;
    self->_headerKeyLineView = v10;

    double v12 = self->_headerKeyLineView;
    double v13 = [MEMORY[0x1E4F428B8] separatorColor];
    [(UIView *)v12 setBackgroundColor:v13];

    [(PLExpandedPlatterView *)self _updateHeaderKeyLineAlphaIfNecessaryAnimated:0];
    [(UIView *)self->_headerContainerView addSubview:self->_headerKeyLineView];
    [(UIView *)self->_headerTintView removeFromSuperview];
    headerTintView = self->_headerTintView;
    self->_headerTintView = 0;
  }
}

- (void)_configureHeaderBackgroundViewsIfNecessary
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [(PLExpandedPlatterView *)self _configureHeaderBackgroundForReduceTransparencyIfNecessary];
  }
  else
  {
    [(PLExpandedPlatterView *)self _configureHeaderBackgroundDefaultIfNecessary];
  }
}

- (void)_invalidateHeaderBackgroundViews
{
  [(UIView *)self->_headerBackgroundView removeFromSuperview];
  headerBackgroundView = self->_headerBackgroundView;
  self->_headerBackgroundView = 0;

  [(UIView *)self->_headerTintView removeFromSuperview];
  headerTintView = self->_headerTintView;
  self->_headerTintView = 0;

  [(UIView *)self->_headerKeyLineView removeFromSuperview];
  headerKeyLineView = self->_headerKeyLineView;
  self->_headerKeyLineView = 0;
}

- (void)_configureHeaderBackgroundViewsIfCanScroll
{
  [(UIScrollView *)self->_scrollView contentOffset];
  double v4 = v3;
  [(PLExpandedPlatterView *)self minimumScrollViewContentInsets];
  if (v4 <= -v5
    && ([(UIScrollView *)self->_scrollView frame],
        double Height = CGRectGetHeight(v10),
        [(UIScrollView *)self->_scrollView contentSize],
        Height >= v7))
  {
    [(PLExpandedPlatterView *)self _invalidateHeaderBackgroundViews];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PLExpandedPlatterView__configureHeaderBackgroundViewsIfCanScroll__block_invoke;
    v8[3] = &unk_1E6B5F800;
    v8[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
  }
}

uint64_t __67__PLExpandedPlatterView__configureHeaderBackgroundViewsIfCanScroll__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureHeaderBackgroundViewsIfNecessary];
}

- (void)_configureHeaderContentViewIfNecessary
{
  if ([(PLExpandedPlatterView *)self isHeaderEnabled] && !self->_headerContentView)
  {
    double v3 = objc_alloc_init(PLExpandedPlatterHeaderContentView);
    headerContentView = self->_headerContentView;
    self->_headerContentView = &v3->super;

    double v5 = [(PLPlatterHeaderContentView *)self->_headerContentView layer];
    [v5 setMaskedCorners:3];

    [(PLPlatterHeaderContentView *)self->_headerContentView _setContinuousCornerRadius:13.0];
    [(PLExpandedPlatterView *)self _configureHeaderContainerViewIfNecessary];
    headerContainerView = self->_headerContainerView;
    double v7 = self->_headerContentView;
    [(UIView *)headerContainerView addSubview:v7];
  }
}

- (void)_configureScrollViewIfNecessary
{
  if (!self->_scrollView)
  {
    double v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4F42DB0]);
    scrollView = self->_scrollView;
    self->_scrollView = v3;

    double v5 = [(UIScrollView *)self->_scrollView layer];
    [v5 setMaskedCorners:3];

    [(UIScrollView *)self->_scrollView _setContinuousCornerRadius:13.0];
    [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)self->_scrollView setKeyboardDismissMode:0];
    [(UIScrollView *)self->_scrollView setDelegate:self];
    [(PLExpandedPlatterView *)self insertSubview:self->_scrollView atIndex:0];
    double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    topRubberbandingView = self->_topRubberbandingView;
    self->_topRubberbandingView = v6;

    uint64_t v8 = [(UIView *)self->_topRubberbandingView layer];
    [v8 setMaskedCorners:3];

    [(UIView *)self->_topRubberbandingView _setContinuousCornerRadius:13.0];
    double v9 = self->_topRubberbandingView;
    CGRect v10 = [MEMORY[0x1E4F428B8] _systemBackgroundColor];
    [(UIView *)v9 setBackgroundColor:v10];

    double v11 = self->_scrollView;
    double v12 = self->_topRubberbandingView;
    [(UIScrollView *)v11 addSubview:v12];
  }
}

- (void)_configureScrollViewContentViewIfNecessary
{
  if (!self->_scrollViewContentView)
  {
    [(PLExpandedPlatterView *)self _configureScrollViewIfNecessary];
    double v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    scrollViewContentView = self->_scrollViewContentView;
    self->_scrollViewContentView = v3;

    double v5 = [(UIView *)self->_scrollViewContentView layer];
    [v5 setMaskedCorners:3];

    [(UIView *)self->_scrollViewContentView _setContinuousCornerRadius:13.0];
    scrollView = self->_scrollView;
    double v7 = self->_scrollViewContentView;
    [(UIScrollView *)scrollView addSubview:v7];
  }
}

- (void)_configureCustomContentViewIfNecessary
{
  if (!self->_customContentView)
  {
    [(PLExpandedPlatterView *)self customContentSize];
    if (v4 != 0.0 || v3 != 0.0)
    {
      [(PLExpandedPlatterView *)self _configureCustomContentView];
    }
  }
}

- (void)_configureActionsBackgroundViewIfNecessaryWithActions:(id)a3
{
  if (!self->_actionsBackgroundView && [a3 count])
  {
    [(PLExpandedPlatterView *)self _configureScrollViewContentViewIfNecessary];
    double v4 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:1 options:1];
    double v5 = NSString;
    double v6 = (objc_class *)objc_opt_class();
    double v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"%@.actions", v7];
    [v4 setGroupNameBase:v8];

    [v4 _setContinuousCornerRadius:13.0];
    actionsBackgroundView = self->_actionsBackgroundView;
    self->_actionsBackgroundView = (MTMaterialView *)v4;
    id v10 = v4;

    [(UIView *)self->_scrollViewContentView addSubview:self->_actionsBackgroundView];
  }
}

- (void)_configureActionViewIfNecessaryWithActions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (self->_actionsView || ![v4 count])
  {
    if (![v5 count])
    {
      [(MTMaterialView *)self->_actionsBackgroundView removeFromSuperview];
      [(PLInterfaceActionGroupView *)self->_actionsView removeFromSuperview];
      actionsBackgroundView = self->_actionsBackgroundView;
      self->_actionsBackgroundView = 0;

      actionsView = self->_actionsView;
      self->_actionsView = 0;
    }
  }
  else
  {
    double v18 = v5;
    [(PLExpandedPlatterView *)self _configureActionsBackgroundViewIfNecessaryWithActions:v5];
    uint64_t v8 = objc_alloc_init(PLInterfaceActionGroupView);
    double v9 = self->_actionsView;
    self->_actionsView = v8;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = [(PLInterfaceActionGroupView *)self->_actionsView requiredVisualStyleCategories];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * v14) integerValue];
          double v16 = self->_actionsView;
          double v17 = [(MTMaterialView *)self->_actionsBackgroundView visualStylingProviderForCategory:v15];
          [(PLInterfaceActionGroupView *)v16 setVisualStylingProvider:v17 forCategory:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(PLInterfaceActionGroupView *)self->_actionsView setCornerRadius:13.0];
    double v5 = v18;
    [(PLInterfaceActionGroupView *)self->_actionsView setActions:v18];
    [(UIView *)self->_scrollViewContentView insertSubview:self->_actionsView aboveSubview:self->_actionsBackgroundView];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__PLExpandedPlatterView__configureActionViewIfNecessaryWithActions___block_invoke;
    v19[3] = &unk_1E6B5F800;
    v19[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v19];
  }
}

uint64_t __68__PLExpandedPlatterView__configureActionViewIfNecessaryWithActions___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutActionsView];
  double v2 = *(void **)(*(void *)(a1 + 32) + 480);
  return [v2 layoutIfNeeded];
}

- (void)_layoutDismissControl
{
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled])
  {
    [(PLExpandedPlatterView *)self bounds];
    uint64_t v4 = v3;
    uint64_t v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[UIControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", v7, v9);
    BSRectWithSize();
    CGFloat v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    int v19 = [(PLExpandedPlatterView *)self _shouldReverseLayoutDirection];
    uint64_t v20 = v4;
    uint64_t v21 = v6;
    double v22 = v8;
    double v23 = v10;
    if (v19)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v20);
      double v25 = 12.0;
      if (self->_dismissControlPosition == 1) {
        double v25 = 0.0;
      }
      double v26 = MinX + v25;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v20);
      v32.origin.double x = v12;
      v32.origin.double y = v14;
      v32.size.double width = v16;
      v32.size.double height = v18;
      double v28 = MaxX - CGRectGetWidth(v32);
      double v29 = 12.0;
      if (self->_dismissControlPosition == 1) {
        double v29 = 0.0;
      }
      double v26 = v28 - v29;
    }
    dismissControl = self->_dismissControl;
    -[UIControl setFrame:](dismissControl, "setFrame:", v26, v14, v16, v18);
  }
}

- (CGRect)_headerFrame
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  double v4 = v3;
  double v6 = v5;
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", v7, v8);
  BSRectWithSize();
  double v10 = v9;
  double v12 = v11;
  if (!self->_dismissControlPosition)
  {
    [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
    double v6 = v6 + v13;
  }
  double v14 = v4;
  double v15 = v6;
  double v16 = v10;
  double v17 = v12;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_layoutHeaderContainerViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PLExpandedPlatterView *)self isHeaderEnabled])
  {
    headerContainerView = self->_headerContainerView;
    -[UIView setFrame:](headerContainerView, "setFrame:", x, y, width, height);
  }
}

- (void)_layoutHeaderContentViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PLExpandedPlatterView *)self isHeaderEnabled]) {
    -[PLPlatterHeaderContentView setFrame:](self->_headerContentView, "setFrame:", x, y, width, height);
  }
  if ([(PLExpandedPlatterView *)self isDismissControlEnabled])
  {
    headerContentView = self->_headerContentView;
    double MidX = 0.0;
    if (!self->_dismissControlPosition)
    {
      [(UIControl *)self->_dismissControl frame];
      double MidX = CGRectGetMidX(v11);
    }
    [(PLPlatterHeaderContentView *)headerContentView _setUtilityButtonHorizontalLayoutReference:MidX];
  }
}

- (void)_layoutHeaderBackgroundViewsWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PLExpandedPlatterView *)self isHeaderEnabled])
  {
    headerBackgroundView = self->_headerBackgroundView;
    if (headerBackgroundView)
    {
      -[UIView setFrame:](headerBackgroundView, "setFrame:", x, y, width, height);
      -[UIView setFrame:](self->_headerTintView, "setFrame:", x, y, width, height);
      if (self->_headerKeyLineView)
      {
        v15.origin.double x = x;
        v15.origin.double y = y;
        v15.size.double width = width;
        v15.size.double height = height;
        double MinX = CGRectGetMinX(v15);
        v16.origin.double x = x;
        v16.origin.double y = y;
        v16.size.double width = width;
        v16.size.double height = height;
        double MaxY = CGRectGetMaxY(v16);
        v17.origin.double x = x;
        v17.origin.double y = y;
        v17.size.double width = width;
        v17.size.double height = height;
        double v11 = CGRectGetWidth(v17);
        double v12 = PLMainScreenScale();
        headerKeyLineView = self->_headerKeyLineView;
        -[UIView setFrame:](headerKeyLineView, "setFrame:", MinX, MaxY, v11, 1.0 / v12);
      }
    }
  }
}

- (CGRect)_scrollViewContentViewFrame
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  double v4 = v3;
  double v6 = v5;
  [(PLExpandedPlatterView *)self _contentViewSize];
  BSRectWithSize();
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  double v7 = [(PLExpandedPlatterView *)self _headerContentView];
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (void)_layoutScrollView
{
  [(PLExpandedPlatterView *)self scrollViewFrame];
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  scrollView = self->_scrollView;
  [(PLExpandedPlatterView *)self minimumScrollViewContentInsets];
  -[UIScrollView setContentInset:](scrollView, "setContentInset:");
}

- (void)_layoutTopRubberbandingView
{
  if ([(PLExpandedPlatterView *)self isHeaderEnabled])
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    [(UIScrollView *)self->_scrollView contentSize];
    PLMainScreenScale();
    UIRectIntegralWithScale();
    topRubberbandingView = self->_topRubberbandingView;
    -[UIView setFrame:](topRubberbandingView, "setFrame:");
  }
}

- (void)_layoutScrollViewContentView
{
  [(PLExpandedPlatterView *)self _scrollViewContentViewFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_scrollViewContentView, "setFrame:");
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v8, v10);
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  [(PLExpandedPlatterView *)self scrollViewFrame];
  double Height = CGRectGetHeight(v22);
  [(PLExpandedPlatterView *)self minimumScrollViewContentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v23.origin.double x = v4;
  v23.origin.double y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  CGFloat v18 = CGRectGetHeight(v23);
  double contentBottomInset = 0.0;
  if (v18 > Height) {
    double contentBottomInset = self->_contentBottomInset;
  }
  scrollView = self->_scrollView;
  -[UIScrollView setContentInset:](scrollView, "setContentInset:", v13, v15, contentBottomInset, v17);
}

- (void)_layoutMainContentView
{
  mainContentView = self->_mainContentView;
  [(PLExpandedPlatterView *)self _effectiveMainContentViewFrame];
  -[UIView setFrame:](mainContentView, "setFrame:");
}

- (void)_layoutActionsView
{
  if (self->_actionsView)
  {
    [(PLExpandedPlatterView *)self _actionsViewFrame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[MTMaterialView setFrame:](self->_actionsBackgroundView, "setFrame:");
    actionsView = self->_actionsView;
    -[PLInterfaceActionGroupView setFrame:](actionsView, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)_reduceTransparencyDidChange:(id)a3
{
  [(PLExpandedPlatterView *)self _invalidateHeaderBackgroundViews];
  [(PLExpandedPlatterView *)self setNeedsLayout];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLExpandedPlatterView;
  if (-[PLExpandedPlatterView respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    char v5 = 1;
  }
  else if ([(UIView *)self pl_isScrollViewDelegateMethod:a3])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  if (-[UIView pl_isScrollViewDelegateMethod:](self, "pl_isScrollViewDelegateMethod:", [v4 selector]))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 invokeWithTarget:WeakRetained];
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)PLExpandedPlatterView;
      [(PLExpandedPlatterView *)&v6 forwardInvocation:v4];
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  [(PLExpandedPlatterView *)self _configureHeaderBackgroundViewsIfCanScroll];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PLExpandedPlatterView_scrollViewDidScroll___block_invoke;
  v10[3] = &unk_1E6B5F800;
  v10[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v10];
  [(PLExpandedPlatterView *)self _layoutTopRubberbandingView];
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  [v4 setClipsToBounds:v6 > -v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = [WeakRetained associatedViewControllerDidAppearForExpandedPlatterView:self];
  }
  else {
    uint64_t v9 = 0;
  }
  [(PLExpandedPlatterView *)self _updateHeaderKeyLineAlphaIfNecessaryAnimated:v9];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidScroll:v4];
  }
}

uint64_t __45__PLExpandedPlatterView_scrollViewDidScroll___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  [v1[51] bounds];
  return objc_msgSend(v1, "_layoutHeaderBackgroundViewsWithFrame:");
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v4) {
    [v7 setClipsToBounds:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained scrollViewDidEndDragging:v7 willDecelerate:v4];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  return [(PLPlatterHeaderContentView *)headerContentView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLExpandedPlatterView *)self _configureHeaderContentViewIfNecessary];
  headerContentView = self->_headerContentView;
  [(PLPlatterHeaderContentView *)headerContentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(PLPlatterHeaderContentView *)self->_headerContentView adjustForContentSizeCategoryChange];
  if (v3) {
    [(PLExpandedPlatterView *)self setNeedsLayout];
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self->_dismissControl];
  id v5 = [MEMORY[0x1E4F42CA8] effectWithPreview:v4];
  double v6 = [MEMORY[0x1E4F42CC0] styleWithEffect:v5 shape:0];

  return v6;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (CGSize)customContentSize
{
  double width = self->_customContentSize.width;
  double height = self->_customContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isActionsHidden
{
  return self->_actionsHidden;
}

- (BOOL)clipsVisibleContentToBounds
{
  return self->_clipsVisibleContentToBounds;
}

- (void)setClipsVisibleContentToBounds:(BOOL)a3
{
  self->_clipsVisibleContentToBounds = a3;
}

- (double)contentBottomInset
{
  return self->_contentBottomInset;
}

- (void)setContentBottomInset:(double)a3
{
  self->_double contentBottomInset = a3;
}

- (int64_t)dismissControlPosition
{
  return self->_dismissControlPosition;
}

- (BOOL)isDismissControlEnabled
{
  return self->_dismissControlEnabled;
}

- (BOOL)isHeaderEnabled
{
  return self->_headerEnabled;
}

- (PLExpandedPlatterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLExpandedPlatterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)_mainContentView
{
  return self->_mainContentView;
}

- (void)setMainContentView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainContentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissControl, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_actionsView, 0);
  objc_storeStrong((id *)&self->_actionsBackgroundView, 0);
  objc_storeStrong((id *)&self->_customContentView, 0);
  objc_storeStrong((id *)&self->_topRubberbandingView, 0);
  objc_storeStrong((id *)&self->_scrollViewContentView, 0);
  objc_storeStrong((id *)&self->_headerContentView, 0);
  objc_storeStrong((id *)&self->_headerTintView, 0);
  objc_storeStrong((id *)&self->_headerKeyLineView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerContainerView, 0);
}

- (void)_configureMainContentViewIfNecessary
{
  if (!self->_mainContentView)
  {
    [(PLExpandedPlatterView *)self _configureScrollViewContentViewIfNecessary];
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    mainContentView = self->_mainContentView;
    self->_mainContentView = v3;

    id v5 = self->_mainContentView;
    double v6 = [MEMORY[0x1E4F428B8] _systemBackgroundColor];
    [(UIView *)v5 setBackgroundColor:v6];

    id v7 = [(UIView *)self->_mainContentView layer];
    [v7 setMaskedCorners:12];

    [(UIView *)self->_mainContentView _setContinuousCornerRadius:13.0];
    scrollViewContentView = self->_scrollViewContentView;
    uint64_t v9 = self->_mainContentView;
    [(UIView *)scrollViewContentView addSubview:v9];
  }
}

- (void)_configureCustomContentView
{
  [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
  BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
  customContentView = self->_customContentView;
  self->_customContentView = v3;

  id v5 = self->_customContentView;
  double v6 = [MEMORY[0x1E4F428B8] _systemBackgroundColor];
  [(UIView *)v5 setBackgroundColor:v6];

  [(UIView *)self->_customContentView setClipsToBounds:1];
  [(UIView *)self->_customContentView setAutoresizesSubviews:1];
  id v7 = [(UIView *)self->_customContentView layer];
  [v7 setMaskedCorners:12];

  [(UIView *)self->_customContentView _setContinuousCornerRadius:13.0];
  mainContentView = self->_mainContentView;
  uint64_t v9 = self->_customContentView;
  [(UIView *)mainContentView addSubview:v9];
}

- (CGRect)_actionsViewFrame
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 0, v7, v9);
  BSRectWithSize();
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(PLExpandedPlatterView *)self customContentSize];
  double v20 = v14 + v19 + 8.0;
  if (self->_clipsVisibleContentToBounds)
  {
    v26.origin.double x = v12;
    v26.origin.double y = v20;
    v26.size.double width = v16;
    v26.size.double height = v18;
    CGRectGetMinY(v26);
    v27.origin.double x = v4;
    v27.origin.double y = v6;
    v27.size.double width = v8;
    v27.size.double height = v10;
    CGRectGetHeight(v27);
    v28.origin.double x = v12;
    v28.origin.double y = v20;
    v28.size.double width = v16;
    v28.size.double height = v18;
    CGRectGetHeight(v28);
  }
  PLMainScreenScale();
  UIRectIntegralWithScale();
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)_mainContentViewFrame
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  CGRectGetWidth(v16);
  BSRectWithSize();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PLExpandedPlatterView *)self customContentSize];
  double v12 = v10 + v11;
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  result.size.double height = v12;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGSize)_contentViewSize
{
  [(PLExpandedPlatterView *)self _boundsInsetHorizontallyFromDismissControlIfNecessary];
  double width = v15.size.width;
  double height = v15.size.height;
  CGFloat v5 = CGRectGetWidth(v15);
  [(PLExpandedPlatterView *)self customContentSize];
  double v7 = v6 + 0.0;
  if (self->_actionsView)
  {
    -[PLExpandedPlatterView actionsSizeThatFits:](self, "actionsSizeThatFits:", width, height);
    double v7 = v7 + v8;
  }
  [(PLExpandedPlatterView *)self minimumScrollViewContentInsets];
  double v10 = v7 + v9;
  [(PLExpandedPlatterView *)self minimumScrollViewContentInsets];
  double v12 = v10 + v11;
  double v13 = v5;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)_layoutCustomContentView
{
  if (self->_customContentView)
  {
    [(PLExpandedPlatterView *)self _layoutMainContentViewIfNecessary];
    double v3 = [(PLExpandedPlatterView *)self _mainContentView];
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    v18.origin.double x = v5;
    v18.origin.double y = v7;
    v18.size.double width = v9;
    v18.size.double height = v11;
    CGRectGetWidth(v18);
    [(PLExpandedPlatterView *)self customContentSize];
    BSRectWithSize();
    if (self->_clipsVisibleContentToBounds)
    {
      CGRectGetHeight(*(CGRect *)&v12);
      [(PLExpandedPlatterView *)self bounds];
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    }
    customContentView = self->_customContentView;
    PLMainScreenScale();
    UIRectIntegralWithScale();
    -[UIView setFrame:](customContentView, "setFrame:");
  }
}

- (UIView)_headerContentView
{
  return (UIView *)self->_headerContentView;
}

- (CGRect)_effectiveMainContentViewFrame
{
  [(PLExpandedPlatterView *)self _mainContentViewFrame];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  if (self->_clipsVisibleContentToBounds)
  {
    double Height = CGRectGetHeight(*(CGRect *)&v3);
    [(PLExpandedPlatterView *)self bounds];
    -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    if (Height <= v11) {
      double v6 = Height;
    }
    else {
      double v6 = v11;
    }
  }
  double v12 = v7;
  double v13 = v8;
  double v14 = v9;
  result.size.double height = v6;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGSize)_flexibleAreaSizeForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(PLExpandedPlatterView *)self _dismissControlTotalOutset];
  double v7 = v6;
  -[PLPlatterHeaderContentView sizeThatFits:](self->_headerContentView, "sizeThatFits:", width, height);
  double v9 = v8;
  -[PLExpandedPlatterView _actionsSizeThatFits:includingPadding:](self, "_actionsSizeThatFits:includingPadding:", 1, width, height);
  double v11 = height - (v7 + v9 + v10);
  double v12 = width;
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (void)_layoutMainContentViewIfNecessary
{
  double v3 = [(UIView *)self->_mainContentView layer];
  int v4 = [v3 needsLayout];

  if (v4)
  {
    [(PLExpandedPlatterView *)self _layoutMainContentView];
  }
}

@end