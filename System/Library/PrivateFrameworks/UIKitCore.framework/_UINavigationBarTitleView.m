@interface _UINavigationBarTitleView
- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange;
- (BOOL)_hideNavigationBarBackButton;
- (BOOL)_hideNavigationBarCenterBarButtons;
- (BOOL)_hideNavigationBarLeadingBarButtons;
- (BOOL)_hideNavigationBarStandardTitle;
- (BOOL)_hideNavigationBarTrailingBarButtons;
- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight;
- (BOOL)_wantsTwoPartTransition;
- (BOOL)heightShouldBeIncreasedByTabBarHeight;
- (BOOL)hideBackButton;
- (BOOL)hideCenterBarButtons;
- (BOOL)hideLeadingBarButtons;
- (BOOL)hideStandardTitle;
- (BOOL)hideTrailingBarButtons;
- (BOOL)underlayBarContent;
- (NSArray)contentOverlayRects;
- (NSString)description;
- (UIMenu)backButtonMenu;
- (UINavigationItem)navigationItem;
- (_UINavigationBarTitleView)initWithCoder:(id)a3;
- (_UINavigationBarTitleView)initWithFrame:(CGRect)a3;
- (_UINavigationBarTitleViewOverlayRects)overlays;
- (double)_navigationBarBackButtonAlpha;
- (double)_navigationBarBackButtonMaximumWidth;
- (double)_navigationBarContentHeight;
- (double)_navigationBarContentHeightExtension;
- (double)_navigationBarLeadingBarButtonsAlpha;
- (double)_navigationBarTrailingBarButtonsAlpha;
- (double)backButtonAlpha;
- (double)backButtonMaximumWidth;
- (double)contentBaseHeight;
- (double)contentBaselineOffsetFromTop;
- (double)floatingTabBarHeight;
- (double)height;
- (double)heightExtension;
- (double)largeTitleHeight;
- (double)leadingBarAlpha;
- (double)trailingBarAlpha;
- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3;
- (int64_t)_preferredAlignment;
- (int64_t)leadingOverlayCount;
- (int64_t)preferredContentAlignment;
- (int64_t)preferredContentSizeForSize:(int64_t)a3;
- (int64_t)titleLocation;
- (int64_t)trailingOverlayCount;
- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5;
- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)preferredContentSizeDidChange;
- (void)setBackButtonAlpha:(double)a3;
- (void)setBackButtonMaximumWidth:(double)a3;
- (void)setHeight:(double)a3;
- (void)setHeightExtension:(double)a3;
- (void)setHeightShouldBeIncreasedByTabBarHeight:(BOOL)a3;
- (void)setHideBackButton:(BOOL)a3;
- (void)setHideCenterBarButtons:(BOOL)a3;
- (void)setHideLeadingBarButtons:(BOOL)a3;
- (void)setHideStandardTitle:(BOOL)a3;
- (void)setHideTrailingBarButtons:(BOOL)a3;
- (void)setLeadingBarAlpha:(double)a3;
- (void)setPreferredContentAlignment:(int64_t)a3;
- (void)setTrailingBarAlpha:(double)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4;
- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4;
@end

@implementation _UINavigationBarTitleView

- (BOOL)_navigationBarHeightShouldBeIncreasedByTabBarHeight
{
  return self->_heightShouldBeIncreasedByTabBarHeight;
}

- (double)_navigationBarContentHeight
{
  return self->_height;
}

- (double)_navigationBarContentHeightExtension
{
  return self->_heightExtension;
}

- (int64_t)_preferredAlignment
{
  return self->_preferredContentAlignment;
}

- (int64_t)preferredContentSizeForSize:(int64_t)a3
{
  return a3;
}

- (double)_navigationBarBackButtonMaximumWidth
{
  return self->_backButtonMaximumWidth;
}

- (double)_navigationBarTrailingBarButtonsAlpha
{
  return self->_trailingBarAlpha;
}

- (double)_navigationBarLeadingBarButtonsAlpha
{
  return self->_leadingBarAlpha;
}

- (double)_navigationBarBackButtonAlpha
{
  return self->_backButtonAlpha;
}

- (BOOL)_hideNavigationBarTrailingBarButtons
{
  return self->_hideTrailingBarButtons;
}

- (BOOL)_hideNavigationBarStandardTitle
{
  return self->_hideStandardTitle;
}

- (BOOL)_hideNavigationBarLeadingBarButtons
{
  return self->_hideLeadingBarButtons;
}

- (void)_setDataSource:(id)a3 navigationItem:(id)a4 titleLocation:(int64_t)a5
{
  p_dataSource = &self->_dataSource;
  id v9 = a4;
  objc_storeWeak((id *)p_dataSource, a3);
  objc_storeWeak((id *)&self->_navigationItem, v9);

  self->_titleLocation = a5;
}

- (BOOL)_hideNavigationBarBackButton
{
  return self->_hideBackButton;
}

- (id)_traitCollectionOverridesForNavigationBarTraitCollection:(id)a3
{
  return 0;
}

- (NSArray)contentOverlayRects
{
  v2 = [(_UINavigationBarTitleView *)self overlays];
  v3 = [v2 asArray];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v5 = v3;

  return v5;
}

- (_UINavigationBarTitleViewOverlayRects)overlays
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    overlayRects = self->_overlayRects;
    if (!overlayRects)
    {
      v5 = objc_alloc_init(_UINavigationBarTitleViewOverlayRects);
      v6 = self->_overlayRects;
      self->_overlayRects = v5;

      overlayRects = self->_overlayRects;
    }
    [WeakRetained titleView:self needsUpdatedContentOverlayRects:overlayRects];
    v7 = self->_overlayRects;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UINavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_UINavigationBarTitleView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_trailingBarAlpha = 1.0;
    v4->_leadingBarAlpha = 1.0;
    v4->_backButtonAlpha = 1.0;
  }
  return v4;
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  if (a3)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTitleView.m" lineNumber:175 description:@"_UINavigationBarTitleView does not support setting translatesAutoresizingMaskIntoConstraints=YES"];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  [(UIView *)&v6 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)setHeightShouldBeIncreasedByTabBarHeight:(BOOL)a3
{
  if (self->_heightShouldBeIncreasedByTabBarHeight != a3)
  {
    self->_heightShouldBeIncreasedByTabBarHeight = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedTabBarSizingDisposition:self];
  }
}

- (double)trailingBarAlpha
{
  return self->_trailingBarAlpha;
}

- (void)setHeight:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_height != a3)
  {
    self->_height = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedHeight:self];
  }
}

- (void)setTrailingBarAlpha:(double)a3
{
  if (self->_trailingBarAlpha != a3)
  {
    self->_trailingBarAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedDisplayItemAlpha:self];
  }
}

- (void)setHideCenterBarButtons:(BOOL)a3
{
  if (self->_hideCenterBarButtons != a3)
  {
    self->_hideCenterBarButtons = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedStandardDisplayItems:self];
  }
}

- (void)setHideBackButton:(BOOL)a3
{
  if (self->_hideBackButton != a3)
  {
    self->_hideBackButton = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedStandardDisplayItems:self];
  }
}

- (void)setHideTrailingBarButtons:(BOOL)a3
{
  if (self->_hideTrailingBarButtons != a3)
  {
    self->_hideTrailingBarButtons = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedStandardDisplayItems:self];
  }
}

- (void)setHideStandardTitle:(BOOL)a3
{
  if (self->_hideStandardTitle != a3)
  {
    self->_hideStandardTitle = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedStandardDisplayItems:self];
  }
}

- (void)setHideLeadingBarButtons:(BOOL)a3
{
  if (self->_hideLeadingBarButtons != a3)
  {
    self->_hideLeadingBarButtons = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedStandardDisplayItems:self];
  }
}

- (_UINavigationBarTitleView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarTitleView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(_UINavigationBarTitleView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_trailingBarAlpha = 1.0;
    v4->_leadingBarAlpha = 1.0;
    v4->_backButtonAlpha = 1.0;
  }
  return v4;
}

- (void)setPreferredContentAlignment:(int64_t)a3
{
  if (self->_preferredContentAlignment != a3)
  {
    self->_preferredContentAlignment = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedLayout:self];
  }
}

- (UIMenu)backButtonMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = [WeakRetained titleViewBackButtonMenu:self];

  return (UIMenu *)v4;
}

- (void)setHeightExtension:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_heightExtension != a3)
  {
    self->_heightExtension = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedHeight:self];
  }
}

- (void)setBackButtonMaximumWidth:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (self->_backButtonMaximumWidth != a3)
  {
    self->_backButtonMaximumWidth = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedMaximumBackButtonWidth:self];
  }
}

- (BOOL)_hideNavigationBarCenterBarButtons
{
  return self->_hideCenterBarButtons;
}

- (void)setBackButtonAlpha:(double)a3
{
  if (self->_backButtonAlpha != a3)
  {
    self->_backButtonAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedDisplayItemAlpha:self];
  }
}

- (void)setLeadingBarAlpha:(double)a3
{
  if (self->_leadingBarAlpha != a3)
  {
    self->_leadingBarAlpha = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    [WeakRetained titleViewChangedDisplayItemAlpha:self];
  }
}

- (int64_t)leadingOverlayCount
{
  [(_UINavigationBarTitleViewOverlayRects *)self->_overlayRects leadingStaticItemRect];
  BOOL v3 = !CGRectIsNull(v6);
  [(_UINavigationBarTitleViewOverlayRects *)self->_overlayRects backButtonRect];
  BOOL v4 = !CGRectIsNull(v7) + v3;
  [(_UINavigationBarTitleViewOverlayRects *)self->_overlayRects leadingItemsRect];
  return v4 + !CGRectIsNull(v8);
}

- (int64_t)trailingOverlayCount
{
  [(_UINavigationBarTitleViewOverlayRects *)self->_overlayRects trailingItemsRect];
  BOOL v3 = !CGRectIsNull(v5);
  [(_UINavigationBarTitleViewOverlayRects *)self->_overlayRects trailingStaticItemRect];
  return !CGRectIsNull(v6) + v3;
}

- (double)largeTitleHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewLargeTitleHeight:self];
  double v5 = v4;

  return v5;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)largeTitleHeightRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewLargeTitleHeightRange:self];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.var1 = v9;
  result.var0 = v8;
  return result;
}

- (double)floatingTabBarHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewFloatingTabBarHeight:self];
  double v5 = v4;

  return v5;
}

- (double)contentBaselineOffsetFromTop
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewContentBaselineOffsetFromTop:self];
  double v5 = v4;

  return v5;
}

- (double)contentBaseHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewContentBaseHeight:self];
  double v5 = v4;

  return v5;
}

- (void)preferredContentSizeDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained titleViewChangedPreferredDisplaySize:self];
}

- (BOOL)_wantsTwoPartTransition
{
  return 0;
}

- (void)transitionWillBegin:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4 = 1.0;
  if (a4) {
    double v4 = 0.0;
  }
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)performTransition:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
  double v4 = 0.0;
  if (a4) {
    double v4 = 1.0;
  }
  -[UIView setAlpha:](self, "setAlpha:", a3, v4);
}

- (void)transitionCompleted:(int64_t)a3 willBeDisplayed:(BOOL)a4
{
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)_UINavigationBarTitleView;
  BOOL v3 = [(UIView *)&v10 description];
  double v4 = (void *)[v3 mutableCopy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v4, "appendFormat:", @" navigationItem=%p dataSource=%p", WeakRetained, v6);

  [v4 appendString:@" titleLocation="];
  int64_t titleLocation = self->_titleLocation;
  switch(titleLocation)
  {
    case 0:
      double v8 = @"offscreen";
      goto LABEL_7;
    case 2:
      double v8 = @"large";
      goto LABEL_7;
    case 1:
      double v8 = @"inline";
LABEL_7:
      [v4 appendString:v8];
      goto LABEL_9;
  }
  objc_msgSend(v4, "appendFormat:", @"unknown(%li)", self->_titleLocation);
LABEL_9:
  if (self->_height > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" height=%f", *(void *)&self->_height);
  }
  if (self->_heightExtension > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" heightExtension=%f", *(void *)&self->_heightExtension);
  }
  if (self->_backButtonMaximumWidth > 0.0) {
    objc_msgSend(v4, "appendFormat:", @" backButtonMaximumWidth=%f", *(void *)&self->_backButtonMaximumWidth);
  }
  if (self->_hideBackButton) {
    [v4 appendString:@" hidesBackButton"];
  }
  if (self->_hideLeadingBarButtons) {
    [v4 appendString:@" hideLeadingBarButtons"];
  }
  if (self->_hideStandardTitle) {
    [v4 appendString:@" hideStandardTitle"];
  }
  if (self->_hideCenterBarButtons) {
    [v4 appendString:@" hideCenterBarButtons"];
  }
  if (self->_hideTrailingBarButtons) {
    [v4 appendString:@" hideTrailingBarButtons"];
  }
  return (NSString *)v4;
}

- (UINavigationItem)navigationItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationItem);
  return (UINavigationItem *)WeakRetained;
}

- (int64_t)titleLocation
{
  return self->_titleLocation;
}

- (BOOL)underlayBarContent
{
  return self->_underlayBarContent;
}

- (double)height
{
  return self->_height;
}

- (double)heightExtension
{
  return self->_heightExtension;
}

- (double)backButtonMaximumWidth
{
  return self->_backButtonMaximumWidth;
}

- (BOOL)hideBackButton
{
  return self->_hideBackButton;
}

- (BOOL)hideLeadingBarButtons
{
  return self->_hideLeadingBarButtons;
}

- (BOOL)hideStandardTitle
{
  return self->_hideStandardTitle;
}

- (BOOL)hideCenterBarButtons
{
  return self->_hideCenterBarButtons;
}

- (BOOL)hideTrailingBarButtons
{
  return self->_hideTrailingBarButtons;
}

- (double)backButtonAlpha
{
  return self->_backButtonAlpha;
}

- (double)leadingBarAlpha
{
  return self->_leadingBarAlpha;
}

- (BOOL)heightShouldBeIncreasedByTabBarHeight
{
  return self->_heightShouldBeIncreasedByTabBarHeight;
}

- (int64_t)preferredContentAlignment
{
  return self->_preferredContentAlignment;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationItem);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_overlayRects, 0);
}

@end