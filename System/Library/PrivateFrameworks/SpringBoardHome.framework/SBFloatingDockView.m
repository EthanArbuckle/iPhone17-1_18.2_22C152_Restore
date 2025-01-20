@interface SBFloatingDockView
+ (CGSize)maximumIconSizeWithIconImageInfo:(SBIconImageInfo *)a3;
+ (double)_referenceInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3;
+ (double)contentHeightForBounds:(CGRect)a3 mainPlatterViewFrame:(CGRect)a4;
+ (double)maximumDockContinuousCornerRadiusWithIconImageInfo:(SBIconImageInfo *)a3;
+ (double)maximumInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3;
+ (double)maximumPlatterHeightWithIconImageInfo:(SBIconImageInfo *)a3;
+ (double)minimumPlatterMargin;
+ (void)getMetrics:(id *)a3 forBounds:(CGRect)a4 layoutScale:(double)a5 numberOfUserIcons:(unint64_t)a6 numberOfRecentIcons:(unint64_t)a7 displayAccessoryIconView:(BOOL)a8 paddingEdgeInsets:(UIEdgeInsets)a9 referenceIconSize:(CGSize)a10 maximumIconSize:(CGSize)a11 referenceInterIconSpacing:(double)a12 maximumInterIconSpacing:(double)a13 platterVerticalMargin:(double)a14 editing:(double)a15;
- (BOOL)_shouldDisplayAccessoryIconView;
- (BOOL)hasPlatterShadow;
- (BOOL)isAccessoryIconViewVisible;
- (BOOL)isEditing;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)platterFrame;
- (CGSize)maximumEditingIconSize;
- (CGSize)maximumIconSize;
- (SBDockIconListView)recentIconListView;
- (SBDockIconListView)userIconListView;
- (SBFloatingDockPlatterView)mainPlatterView;
- (SBFloatingDockView)initWithFrame:(CGRect)a3;
- (SBFloatingDockViewDelegate)delegate;
- (SBIconImageInfo)_iconImageInfo;
- (SBIconView)accessoryIconView;
- (UIEdgeInsets)paddingEdgeInsets;
- (UIEdgeInsets)platterShadowOutsets;
- (UIEdgeInsets)platterShadowOutsetsForBounds:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)dividerView;
- (UIView)touchReceivingView;
- (double)_referenceInterIconSpacing;
- (double)contentHeight;
- (double)contentHeightForBounds:(CGRect)a3;
- (double)currentDockContinuousCornerRadius;
- (double)iconContentScale;
- (double)iconContentScaleForNumberOfUserIcons:(unint64_t)a3;
- (double)interIconSpacing;
- (double)maximumDockContinuousCornerRadius;
- (double)maximumInterIconSpacing;
- (double)maximumPlatterHeight;
- (double)platterVerticalMargin;
- (unint64_t)minimumUserIconSpaces;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)bounce;
- (void)getMetrics:(id *)a3 forBounds:(CGRect)a4;
- (void)layoutSubviews;
- (void)setAccessoryIconView:(id)a3;
- (void)setAccessoryIconViewVisible:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerView:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHasPlatterShadow:(BOOL)a3;
- (void)setIconContentScale:(double)a3;
- (void)setMainPlatterView:(id)a3;
- (void)setMaximumEditingIconSize:(CGSize)a3;
- (void)setMinimumUserIconSpaces:(unint64_t)a3;
- (void)setPaddingEdgeInsets:(UIEdgeInsets)a3;
- (void)setPlatterVerticalMargin:(double)a3;
- (void)setRecentIconListView:(id)a3;
- (void)setTouchReceivingView:(id)a3;
- (void)setUserIconListView:(id)a3;
- (void)updateDividerVisualStyling;
- (void)updateMainPlatterMetrics;
@end

@implementation SBFloatingDockView

- (SBIconImageInfo)_iconImageInfo
{
  v4 = [(SBFloatingDockView *)self userIconListView];
  v5 = [v4 iconLocation];
  v6 = [v4 layoutProvider];
  v7 = [v6 layoutForIconLocation:v5];
  [v7 iconImageInfo];
  v8 = [(SBFloatingDockView *)self traitCollection];
  [v8 displayScale];

  return result;
}

+ (double)_referenceInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3
{
  UIFloorToScale();
  return result;
}

- (double)_referenceInterIconSpacing
{
  [(SBFloatingDockView *)self _iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = objc_opt_class();
  objc_msgSend(v10, "_referenceInterIconSpacingWithIconImageInfo:", v3, v5, v7, v9);
  return result;
}

- (BOOL)_shouldDisplayAccessoryIconView
{
  return self->_accessoryIconView && self->_accessoryIconViewVisible;
}

+ (double)maximumDockContinuousCornerRadiusWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v4 = v3;
  [a1 maximumInterIconSpacingWithIconImageInfo:a3];
  return v4 + v5;
}

- (double)maximumDockContinuousCornerRadius
{
  [(SBFloatingDockView *)self _iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = objc_opt_class();
  objc_msgSend(v10, "maximumDockContinuousCornerRadiusWithIconImageInfo:", v3, v5, v7, v9);
  return result;
}

- (double)currentDockContinuousCornerRadius
{
  double v2 = [(SBFloatingDockView *)self mainPlatterView];
  [v2 currentContinuousCornerRadius];
  double v4 = v3;

  return v4;
}

+ (double)maximumInterIconSpacingWithIconImageInfo:(SBIconImageInfo *)a3
{
  [a1 _referenceInterIconSpacingWithIconImageInfo:a3];
  UIFloorToScale();
  return result;
}

- (double)maximumInterIconSpacing
{
  [(SBFloatingDockView *)self _iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v10 = objc_opt_class();
  objc_msgSend(v10, "maximumInterIconSpacingWithIconImageInfo:", v3, v5, v7, v9);
  return result;
}

+ (double)maximumPlatterHeightWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  [a1 maximumInterIconSpacingWithIconImageInfo:a3];
  double v13 = v12;
  objc_msgSend(a1, "maximumIconSizeWithIconImageInfo:", v10, v9, v8, v7);
  return v13 + v13 + v14;
}

- (double)maximumPlatterHeight
{
  [(SBFloatingDockView *)self _iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = objc_opt_class();
  objc_msgSend(v10, "maximumPlatterHeightWithIconImageInfo:", v3, v5, v7, v9);
  return result;
}

+ (double)minimumPlatterMargin
{
  return 22.0;
}

+ (CGSize)maximumIconSizeWithIconImageInfo:(SBIconImageInfo *)a3
{
  UIFloorToScale();
  double v4 = v3;
  UIFloorToScale();
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)maximumIconSize
{
  [(SBFloatingDockView *)self _iconImageInfo];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(SBFloatingDockView *)self isEditing])
  {
    [(SBFloatingDockView *)self maximumEditingIconSize];
    if (v11 != *MEMORY[0x1E4F1DB30] || v12 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v4 = v11;
      double v6 = v12;
    }
  }
  double v13 = objc_opt_class();
  objc_msgSend(v13, "maximumIconSizeWithIconImageInfo:", v4, v6, v8, v10);
  result.height = v15;
  result.width = v14;
  return result;
}

- (SBFloatingDockView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SBFloatingDockView;
  double v3 = -[SBFloatingDockView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_iconContentScale = 1.0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    touchReceivingView = v4->_touchReceivingView;
    v4->_touchReceivingView = (UIView *)v10;

    double v12 = v4->_touchReceivingView;
    double v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v12 setBackgroundColor:v13];

    double v14 = [(UIView *)v4->_touchReceivingView layer];
    [v14 setHitTestsAsOpaque:1];

    [(SBFloatingDockView *)v4 addSubview:v4->_touchReceivingView];
    double v15 = objc_alloc_init(SBFloatingDockPlatterView);
    mainPlatterView = v4->_mainPlatterView;
    v4->_mainPlatterView = v15;

    [(SBFloatingDockView *)v4 addSubview:v4->_mainPlatterView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v6, v7, v8, v9);
    [(SBFloatingDockPlatterView *)v4->_mainPlatterView addSubview:v17];
    dividerView = v4->_dividerView;
    v4->_dividerView = (UIView *)v17;

    v4->_accessoryIconViewVisible = 1;
    [(SBFloatingDockView *)v4 updateDividerVisualStyling];
    v19 = [(SBFloatingDockView *)v4 layer];
    [v19 setAllowsGroupBlending:0];

    [(SBFloatingDockView *)v4 setAccessibilityIdentifier:@"Multitasking Dock"];
  }
  return v4;
}

- (void)setUserIconListView:(id)a3
{
  id v5 = (SBDockIconListView *)a3;
  userIconListView = self->_userIconListView;
  if (userIconListView != v5)
  {
    double v8 = v5;
    [(SBDockIconListView *)userIconListView removeFromSuperview];
    [(SBIconListView *)self->_userIconListView removeLayoutObserver:self];
    objc_storeStrong((id *)&self->_userIconListView, a3);
    if (v8)
    {
      [(SBDockIconListView *)v8 setAccessibilityIdentifier:@"user icon list view"];
      [(SBIconListView *)v8 setLayoutInsetsMode:2];
      [(SBIconListView *)v8 setAutomaticallyAdjustsLayoutMetricsToFit:0];
      [(SBIconListView *)v8 addLayoutObserver:self];
      double v7 = [(SBFloatingDockView *)self mainPlatterView];
      [v7 addSubview:v8];

      [(SBFloatingDockView *)self setNeedsLayout];
    }
    [(SBFloatingDockView *)self updateMainPlatterMetrics];
    id v5 = v8;
  }
}

- (void)updateMainPlatterMetrics
{
  mainPlatterView = self->_mainPlatterView;
  [(SBFloatingDockView *)self maximumPlatterHeight];
  -[SBFloatingDockPlatterView setReferenceHeight:](mainPlatterView, "setReferenceHeight:");
  double v4 = self->_mainPlatterView;
  [(SBFloatingDockView *)self maximumDockContinuousCornerRadius];
  -[SBFloatingDockPlatterView setMaximumContinuousCornerRadius:](v4, "setMaximumContinuousCornerRadius:");
}

- (void)setAccessoryIconView:(id)a3
{
  id v5 = (SBIconView *)a3;
  accessoryIconView = self->_accessoryIconView;
  if (accessoryIconView != v5)
  {
    [(SBIconView *)accessoryIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryIconView, a3);
    if (v5)
    {
      [(SBIconView *)v5 setAccessibilityIdentifier:@"Dock accessory icon view"];
      double v7 = [(SBFloatingDockView *)self mainPlatterView];
      [v7 addSubview:v5];

      if ([(SBFloatingDockView *)self _shouldDisplayAccessoryIconView])
      {
        -[SBFloatingDockView bounds](self, "bounds", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0);
        -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v8);
        [(SBIconView *)v5 setIconContentScale:0.001];
        UIRectGetCenter();
        -[SBIconView setCenter:](v5, "setCenter:");
      }
    }
    [(SBFloatingDockView *)self setNeedsLayout];
  }
}

- (void)setAccessoryIconViewVisible:(BOOL)a3
{
  if (self->_accessoryIconViewVisible != a3)
  {
    self->_accessoryIconViewVisible = a3;
    if ([(SBFloatingDockView *)self _shouldDisplayAccessoryIconView])
    {
      accessoryIconView = self->_accessoryIconView;
      long long v7 = 0u;
      id v5 = accessoryIconView;
      [(SBFloatingDockView *)self bounds];
      -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v6);
      [(SBIconView *)v5 setIconContentScale:*(double *)&v7];
      UIRectGetCenter();
      -[SBIconView setCenter:](v5, "setCenter:");
    }
    [(SBFloatingDockView *)self setNeedsLayout];
  }
}

- (void)setRecentIconListView:(id)a3
{
  id v5 = (SBDockIconListView *)a3;
  recentIconListView = self->_recentIconListView;
  if (recentIconListView != v5)
  {
    long long v8 = v5;
    [(SBDockIconListView *)recentIconListView removeFromSuperview];
    objc_storeStrong((id *)&self->_recentIconListView, a3);
    id v5 = v8;
    if (v8)
    {
      [(SBDockIconListView *)v8 setAccessibilityIdentifier:@"Recent icon list view"];
      [(SBIconListView *)v8 setLayoutInsetsMode:2];
      [(SBIconListView *)v8 setAutomaticallyAdjustsLayoutMetricsToFit:0];
      long long v7 = [(SBFloatingDockView *)self mainPlatterView];
      [v7 addSubview:v8];

      [(SBFloatingDockView *)self setNeedsLayout];
      id v5 = v8;
    }
  }
}

- (UIView)backgroundView
{
  return [(SBFloatingDockPlatterView *)self->_mainPlatterView backgroundView];
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setMinimumUserIconSpaces:(unint64_t)a3
{
  if (self->_minimumUserIconSpaces != a3)
  {
    self->_minimumUserIconSpaces = a3;
    [(SBFloatingDockView *)self setNeedsLayout];
  }
}

- (void)setPaddingEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_paddingEdgeInsets.left != a3.left
    || self->_paddingEdgeInsets.top != a3.top
    || self->_paddingEdgeInsets.right != a3.right
    || self->_paddingEdgeInsets.bottom != a3.bottom)
  {
    self->_paddingEdgeInsets = a3;
    [(SBFloatingDockView *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    [(SBFloatingDockView *)self setNeedsLayout];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    self->_editing = a3;
    [(SBFloatingDockView *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __42__SBFloatingDockView_setEditing_animated___block_invoke;
      v6[3] = &unk_1E6AAC810;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.3];
    }
  }
}

uint64_t __42__SBFloatingDockView_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  if (a3.width != self->_maximumEditingIconSize.width || a3.height != self->_maximumEditingIconSize.height)
  {
    self->_maximumEditingIconSize = a3;
    if ([(SBFloatingDockView *)self isEditing])
    {
      [(SBFloatingDockView *)self setNeedsLayout];
    }
  }
}

- (CGRect)platterFrame
{
  double v2 = [(SBFloatingDockView *)self mainPlatterView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)hasPlatterShadow
{
  double v2 = [(SBFloatingDockView *)self mainPlatterView];
  char v3 = [v2 hasShadow];

  return v3;
}

- (void)setHasPlatterShadow:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBFloatingDockView *)self mainPlatterView];
  [v4 setHasShadow:v3];
}

- (UIEdgeInsets)platterShadowOutsets
{
  double v2 = [(SBFloatingDockView *)self mainPlatterView];
  [v2 shadowOutsets];
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

- (UIEdgeInsets)platterShadowOutsetsForBounds:(CGRect)a3
{
  memset(v25, 0, sizeof(v25));
  -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", v25, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BSRectWithSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SBFloatingDockView *)self mainPlatterView];
  objc_msgSend(v12, "shadowOutsetsForBounds:", v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

+ (double)contentHeightForBounds:(CGRect)a3 mainPlatterViewFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MaxY = CGRectGetMaxY(a3);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  return MaxY - CGRectGetMinY(v10);
}

- (double)contentHeight
{
  double v3 = objc_opt_class();
  [(SBFloatingDockView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SBFloatingDockView *)self mainPlatterView];
  [v12 frame];
  objc_msgSend(v3, "contentHeightForBounds:mainPlatterViewFrame:", v5, v7, v9, v11, v13, v14, v15, v16);
  double v18 = v17;

  return v18;
}

- (double)contentHeightForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  [(SBFloatingDockView *)self getMetrics:v8 forBounds:a3.origin.x];
  objc_msgSend((id)objc_opt_class(), "contentHeightForBounds:mainPlatterViewFrame:", x, y, width, height, v9, v10);
  return result;
}

- (double)iconContentScaleForNumberOfUserIcons:(unint64_t)a3
{
  double v5 = [(SBFloatingDockView *)self recentIconListView];
  double v6 = [v5 displayedModel];
  uint64_t v7 = [v6 numberOfIcons];

  double v8 = [(SBFloatingDockView *)self traitCollection];
  [v8 displayScale];
  double v35 = v9;

  long long v37 = 0u;
  memset(v36, 0, sizeof(v36));
  long long v10 = objc_opt_class();
  [(SBFloatingDockView *)self bounds];
  double v33 = v12;
  double v34 = v11;
  double v32 = v13;
  double v15 = v14;
  BOOL v16 = [(SBFloatingDockView *)self _shouldDisplayAccessoryIconView];
  [(SBFloatingDockView *)self _referenceIconSize];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  [(SBFloatingDockView *)self maximumIconSize];
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  [(SBFloatingDockView *)self _referenceInterIconSpacing];
  uint64_t v26 = v25;
  [(SBFloatingDockView *)self maximumInterIconSpacing];
  uint64_t v28 = v27;
  [(SBFloatingDockView *)self platterVerticalMargin];
  objc_msgSend(v10, "getMetrics:forBounds:layoutScale:numberOfUserIcons:numberOfRecentIcons:displayAccessoryIconView:paddingEdgeInsets:referenceIconSize:maximumIconSize:referenceInterIconSpacing:maximumInterIconSpacing:platterVerticalMargin:editing:", v36, a3, v7, v16, -[SBFloatingDockView isEditing](self, "isEditing"), v34, v33, v32, v15, v35, *(void *)&self->_paddingEdgeInsets.top, *(void *)&self->_paddingEdgeInsets.left, *(void *)&self->_paddingEdgeInsets.bottom, *(void *)&self->_paddingEdgeInsets.right, v18, v20,
    v22,
    v24,
    v26,
    v28,
    v29);
  double v30 = *(double *)&v37;

  return v30;
}

- (double)interIconSpacing
{
  [(SBFloatingDockView *)self iconContentScale];
  double v4 = v3;
  [(SBFloatingDockView *)self maximumInterIconSpacing];
  double v6 = v5;
  if (BSFloatIsOne()) {
    return v6;
  }
  v7.n128_f64[0] = v4 * v6;
  MEMORY[0x1F4166C10](self, v7);
  return result;
}

- (void)getMetrics:(id *)a3 forBounds:(CGRect)a4
{
  double v35 = [(SBFloatingDockView *)self userIconListView];
  double v6 = [(SBFloatingDockView *)self recentIconListView];
  __n128 v7 = [v35 displayedModel];
  unint64_t v8 = [v7 numberOfIcons];

  unint64_t v9 = [(SBFloatingDockView *)self minimumUserIconSpaces];
  if (v8 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  double v11 = [v6 displayedModel];
  uint64_t v12 = [v11 numberOfIcons];

  BOOL v13 = [(SBFloatingDockView *)self _shouldDisplayAccessoryIconView];
  CGFloat top = self->_paddingEdgeInsets.top;
  long long v32 = *(_OWORD *)&self->_paddingEdgeInsets.left;
  CGFloat right = self->_paddingEdgeInsets.right;
  [(SBFloatingDockView *)self _referenceIconSize];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  [(SBFloatingDockView *)self _referenceInterIconSpacing];
  uint64_t v19 = v18;
  [(SBFloatingDockView *)self maximumIconSize];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  [(SBFloatingDockView *)self maximumInterIconSpacing];
  uint64_t v25 = v24;
  [(SBFloatingDockView *)self platterVerticalMargin];
  uint64_t v27 = v26;
  uint64_t v28 = [(SBFloatingDockView *)self traitCollection];
  [v28 displayScale];
  double v30 = v29;

  objc_msgSend((id)objc_opt_class(), "getMetrics:forBounds:layoutScale:numberOfUserIcons:numberOfRecentIcons:displayAccessoryIconView:paddingEdgeInsets:referenceIconSize:maximumIconSize:referenceInterIconSpacing:maximumInterIconSpacing:platterVerticalMargin:editing:", a3, v10, v12, v13, -[SBFloatingDockView isEditing](self, "isEditing"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, v30, *(void *)&top, v32, *(void *)&right, v15, v17, v21,
    v23,
    v19,
    v25,
    v27);
}

+ (void)getMetrics:(id *)a3 forBounds:(CGRect)a4 layoutScale:(double)a5 numberOfUserIcons:(unint64_t)a6 numberOfRecentIcons:(unint64_t)a7 displayAccessoryIconView:(BOOL)a8 paddingEdgeInsets:(UIEdgeInsets)a9 referenceIconSize:(CGSize)a10 maximumIconSize:(CGSize)a11 referenceInterIconSpacing:(double)a12 maximumInterIconSpacing:(double)a13 platterVerticalMargin:(double)a14 editing:(double)a15
{
  BOOL v15 = a8;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v24 = a15;
  double v25 = a12;
  IsEmptCGFloat y = CGRectIsEmpty(a4);
  uint64_t v27 = MEMORY[0x1E4F1DB28];
  if (IsEmpty)
  {
    CGFloat v132 = *MEMORY[0x1E4F1DB28];
    CGFloat v28 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v127 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v129 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  }
  else
  {
    [a1 minimumPlatterMargin];
    CGFloat v30 = v29;
    v145.origin.CGFloat x = x;
    v145.origin.CGFloat y = y;
    v145.size.CGFloat width = width;
    v145.size.CGFloat height = height;
    CGRect v146 = CGRectInset(v145, v30, 0.0);
    CGFloat v132 = v146.origin.x;
    CGFloat v127 = v146.size.height;
    CGFloat v129 = v146.origin.y;
    CGFloat v28 = v146.size.width;
  }
  BOOL v31 = a6 != 0;
  if (a6) {
    unint64_t v32 = a6 - 1;
  }
  else {
    unint64_t v32 = 0;
  }
  if (a7) {
    unint64_t v33 = a7 - 1;
  }
  else {
    unint64_t v33 = 0;
  }
  if (a7) {
    int v34 = 1;
  }
  else {
    int v34 = v15;
  }
  uint64_t v35 = 1;
  if (a7)
  {
    uint64_t v35 = 2;
    unsigned int v36 = v15;
  }
  else
  {
    unsigned int v36 = 0;
  }
  if ((v31 & v34) != 0) {
    unint64_t v37 = v35;
  }
  else {
    unint64_t v37 = 0;
  }
  double v38 = 1.0;
  if (v31 && a7 != 0) {
    double v39 = 1.0;
  }
  else {
    double v39 = 0.0;
  }
  CGFloat v136 = v28;
  if (BSFloatGreaterThanFloat())
  {
    UIFloorToScale();
    double v25 = v40;
    goto LABEL_25;
  }
  if (a11.width > a12)
  {
LABEL_25:
    double v38 = v25 / a11.width;
    double v138 = v25;
    if (v25 / a11.width == 1.0)
    {
      double v38 = 1.0;
    }
    else
    {
      UIFloorToScale();
      double v24 = v41;
    }
    goto LABEL_29;
  }
  double v138 = a12;
LABEL_29:
  if (a6) {
    double v42 = v24 * (double)v32 + (double)a6 * v138;
  }
  else {
    double v42 = 0.0;
  }
  if (a7) {
    double v43 = v24 * (double)v33 + (double)a7 * v138;
  }
  else {
    double v43 = 0.0;
  }
  if (v15) {
    double v44 = v138 * (double)v15;
  }
  else {
    double v44 = 0.0;
  }
  int v45 = BSFloatGreaterThanFloat();
  int v46 = BSFloatGreaterThanFloat();
  int v47 = BSFloatGreaterThanFloat();
  int v48 = v46 | v47;
  double v49 = -0.0;
  if (v46) {
    double v49 = v39;
  }
  double v50 = v42 + v49 + (double)v37 * v24;
  CGFloat v123 = v42;
  if ((v45 & v48) == 0) {
    double v50 = v42;
  }
  double v134 = v38;
  double v131 = v43;
  if (v46 && (double v50 = v43 + v50, v47))
  {
    double v51 = v24;
    double v50 = v50 + (double)v36 * v24;
  }
  else
  {
    double v51 = v24;
  }
  CGFloat v52 = v132;
  double v53 = -0.0;
  CGFloat v133 = v44;
  if (v47) {
    double v53 = v44;
  }
  double v54 = v53 + v50;
  v147.origin.CGFloat x = v52;
  v147.origin.CGFloat y = v129;
  v147.size.CGFloat width = v136;
  v147.size.CGFloat height = v127;
  CGRectGetMidX(v147);
  UIRoundToScale();
  CGFloat v56 = v55;
  v148.origin.CGFloat x = v52;
  v148.origin.CGFloat y = v129;
  v148.size.CGFloat width = v136;
  v148.size.CGFloat height = v127;
  double v57 = v51;
  double v58 = CGRectGetMaxY(v148) - v138 - v51;
  double v59 = v144;
  if (v144 <= 0.0) {
    double v59 = v51;
  }
  v149.origin.CGFloat y = v58 - v59;
  v149.origin.CGFloat x = v56;
  v149.size.CGFloat width = v54;
  v149.size.CGFloat height = v138;
  CGRect v150 = CGRectInset(v149, -v51, -v51);
  CGFloat v60 = v150.origin.x;
  CGFloat v61 = v150.origin.y;
  CGFloat v62 = v150.size.width;
  CGFloat v63 = v150.size.height;
  double v130 = v54;
  if (BSFloatLessThanFloat())
  {
    v151.origin.CGFloat x = v60;
    v151.origin.CGFloat y = v61;
    v151.size.CGFloat width = v62;
    v151.size.CGFloat height = v63;
    double v64 = (v57 * 6.0 + v138 * 4.0 + 1.0 - CGRectGetWidth(v151)) * 0.5;
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    CGFloat v125 = v66;
    CGFloat v126 = v65;
    CGFloat v120 = v67;
    CGFloat v128 = v68;
  }
  else
  {
    CGFloat v125 = v61;
    CGFloat v126 = v60;
    CGFloat v128 = v63;
    CGFloat v120 = v62;
    double v64 = 0.0;
  }
  CGFloat v135 = v64;
  uint64_t v69 = objc_msgSend((id)*MEMORY[0x1E4FB2608], "userInterfaceLayoutDirection", *(void *)&v120);
  memset(&slice, 0, sizeof(slice));
  CGRectEdge v70 = 2 * (v69 == 1);
  memset(&remainder, 0, sizeof(remainder));
  v152.origin.CGFloat x = v57 + v64;
  v152.origin.CGFloat y = v57;
  v152.size.CGFloat width = v130;
  v152.size.CGFloat height = v138;
  CGRectDivide(v152, &slice, &remainder, v123, v70);
  CGFloat MinY = CGRectGetMinY(slice);
  CGFloat v124 = CGRectGetHeight(slice);
  if (v46) {
    double v71 = v57;
  }
  else {
    double v71 = v57 / 3.0;
  }
  double v72 = v138 + v57;
  CGFloat v73 = slice.origin.x;
  CGFloat v74 = slice.origin.y;
  CGFloat v75 = slice.size.width;
  CGFloat v76 = slice.size.height;
  if (v69 == 1)
  {
    CGRectEdge v77 = CGRectMinXEdge;
    double v137 = CGRectGetMinX(*(CGRect *)&v73) - v71 + -1.0;
  }
  else
  {
    double v137 = v71 + CGRectGetMaxX(*(CGRect *)&v73);
    CGRectEdge v77 = CGRectMaxXEdge;
  }
  double v78 = v57 + v72;
  CGSize v79 = *(CGSize *)(v27 + 16);
  v141.origin = *(CGPoint *)v27;
  v141.CGSize size = v79;
  double v80 = v57 + v64;
  v79.CGFloat width = v57;
  double v81 = v130;
  double v82 = v138;
  CGRectDivide(*(CGRect *)((char *)&v79 - 8), &v141, &remainder, v133, v77);
  memset(&v140, 0, sizeof(v140));
  if (v131 <= 0.0)
  {
    CGFloat v92 = slice.origin.x;
    CGFloat v93 = slice.origin.y;
    CGFloat v94 = slice.size.width;
    CGFloat v95 = slice.size.height;
    double v83 = 2.0;
    if (v69 == 1) {
      double MinX = CGRectGetMinX(*(CGRect *)&v92);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v92);
    }
    CGFloat v97 = MinX;
    v154.size.CGFloat width = v57 + v57 + v130;
    double v84 = MinY;
    double v85 = v124;
    double v86 = -1.0;
    v154.origin.CGFloat y = 0.0;
    v154.origin.CGFloat x = v64;
    v154.size.CGFloat height = v78;
    v140.origin.CGFloat x = v97;
    v140.origin.CGFloat y = 0.0;
    v140.size.CGFloat width = 0.0;
    v140.size.CGFloat height = CGRectGetHeight(v154);
  }
  else
  {
    v153.size.CGFloat width = v57 + v57 + v130;
    double v83 = 2.0;
    v153.origin.CGFloat y = 0.0;
    v153.origin.CGFloat x = v64;
    v153.size.CGFloat height = v57 + v72;
    CGRectDivide(v153, &v140, &remainder, v57 + v57 + v131, v77);
    double v84 = MinY;
    double v85 = v124;
    double v86 = -1.0;
    if (v133 > 0.0)
    {
      CGFloat v87 = v141.origin.x;
      CGFloat v88 = v141.origin.y;
      CGFloat v89 = v141.size.width;
      CGFloat v90 = v141.size.height;
      if (v69 == 1)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v87);
      }
      else
      {
        double v98 = CGRectGetMinX(*(CGRect *)&v87);
        double MaxX = v98 - CGRectGetWidth(v140);
      }
      v140.origin.CGFloat x = MaxX;
    }
  }
  double v99 = v84 + v86;
  double v100 = v85 + v83;
  memset(&v139, 0, sizeof(v139));
  if (v48)
  {
    CGFloat v101 = 1.0;
    CGFloat v102 = v137;
    CGFloat v103 = v99;
    CGFloat v104 = v100;
    if ((v45 & 1) == 0)
    {
      CGFloat v102 = v140.origin.x;
      CGFloat v103 = v140.origin.y;
      CGFloat v101 = v140.size.width;
      CGFloat v104 = v140.size.height;
    }
    if (v69 == 1)
    {
      if ((v46 & 1) == 0)
      {
        CGFloat v102 = v141.origin.x;
        CGFloat v103 = v141.origin.y;
        CGFloat v101 = v141.size.width;
        CGFloat v104 = v141.size.height;
      }
      double v105 = CGRectGetMaxX(*(CGRect *)&v102);
      v155.origin.CGFloat y = 0.0;
      double v106 = v57 + v57 + v130;
      v155.origin.CGFloat x = v135;
      v155.size.CGFloat width = v106;
      v155.size.CGFloat height = v78;
      double v107 = CGRectGetMaxX(v155) - v105;
      double v64 = v135;
    }
    else
    {
      if ((v46 & 1) == 0)
      {
        CGFloat v102 = v141.origin.x;
        CGFloat v103 = v141.origin.y;
        CGFloat v101 = v141.size.width;
        CGFloat v104 = v141.size.height;
      }
      double v108 = CGRectGetMinX(*(CGRect *)&v102);
      v157.origin.CGFloat y = 0.0;
      double v106 = v57 + v57 + v130;
      v157.origin.CGFloat x = v64;
      v157.size.CGFloat width = v106;
      v157.size.CGFloat height = v78;
      double v107 = v108 - CGRectGetMinX(v157);
    }
  }
  else
  {
    v156.origin.CGFloat y = 0.0;
    v156.origin.CGFloat x = v64;
    double v106 = v57 + v57 + v130;
    v156.size.CGFloat width = v106;
    v156.size.CGFloat height = v78;
    double v107 = CGRectGetWidth(v156);
  }
  v158.origin.CGFloat x = v64;
  v158.origin.CGFloat y = 0.0;
  v158.size.CGFloat width = v106;
  v158.size.CGFloat height = v78;
  CGRectDivide(v158, &v139, &remainder, v107, v70);
  double v109 = CGRectGetMinY(slice);
  CGFloat v110 = v109 - CGRectGetMinY(v139);
  double v111 = CGRectGetMinX(slice);
  CGFloat v112 = v111 - CGRectGetMinX(v139);
  double MaxY = CGRectGetMaxY(v139);
  CGFloat v114 = MaxY - CGRectGetMaxY(slice);
  double v115 = CGRectGetMaxX(v139);
  CGFloat v116 = CGRectGetMaxX(slice);
  CGSize size = v139.size;
  a3->var0.origin = v139.origin;
  a3->var0.CGSize size = size;
  a3->var1.CGFloat top = v110;
  a3->var1.left = v112;
  a3->var1.bottom = v114;
  a3->var1.CGFloat right = v115 - v116;
  CGSize v118 = v140.size;
  a3->var2.origin = v140.origin;
  a3->var2.CGSize size = v118;
  CGSize v119 = v141.size;
  a3->var3.origin = v141.origin;
  a3->var3.CGSize size = v119;
  a3->var4.origin.CGFloat x = v137;
  a3->var4.origin.CGFloat y = v99;
  a3->var4.size.CGFloat width = 1.0;
  a3->var4.size.CGFloat height = v100;
  a3->var5.origin.CGFloat x = v126;
  a3->var5.origin.CGFloat y = v125;
  a3->var5.size.CGFloat width = v121;
  a3->var5.size.CGFloat height = v128;
  a3->var6 = v134;
  a3->var7 = v57;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)SBFloatingDockView;
  if (-[SBFloatingDockView pointInside:withEvent:](&v8, sel_pointInside_withEvent_, a4)) {
    return 1;
  }
  [(UIView *)self->_touchReceivingView frame];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  return CGRectContainsPoint(v10, v9);
}

- (void)layoutSubviews
{
  [(SBFloatingDockView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (BSFloatGreaterThanFloat())
  {
    if (BSFloatGreaterThanFloat())
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      memset(&v25, 0, sizeof(v25));
      long long v23 = 0u;
      memset(&v22, 0, sizeof(v22));
      -[SBFloatingDockView getMetrics:forBounds:](self, "getMetrics:forBounds:", &v22, v4, v6, v8, v10);
      if (BSFloatGreaterThanFloat())
      {
        double v11 = [(SBFloatingDockView *)self mainPlatterView];
        objc_msgSend(v11, "sbf_setBoundsAndPositionFromFrame:", v30, v31);
        -[UIView sbf_setBoundsAndPositionFromFrame:](self->_touchReceivingView, "sbf_setBoundsAndPositionFromFrame:", *(double *)&v30 + self->_paddingEdgeInsets.left, *((double *)&v30 + 1) + self->_paddingEdgeInsets.top, *(double *)&v31 - (self->_paddingEdgeInsets.left + self->_paddingEdgeInsets.right), *((double *)&v31 + 1) - (self->_paddingEdgeInsets.top + self->_paddingEdgeInsets.bottom));
        uint64_t v12 = [(SBFloatingDockView *)self dividerView];
        objc_msgSend(v12, "sbf_setBoundsAndPositionFromFrame:", v28, v29);
        double v13 = *((double *)&v32 + 1);
        uint64_t v14 = [(SBFloatingDockView *)self userIconListView];
        [v14 setIconContentScale:*(double *)&v32];
        objc_msgSend(v14, "setIconSpacing:", v13, v13);
        objc_msgSend(v14, "sbf_setBoundsAndPositionFromFrame:", *(_OWORD *)&v22.origin, *(_OWORD *)&v22.size);
        BOOL v15 = [(SBFloatingDockView *)self recentIconListView];
        [v15 setIconContentScale:*(double *)&v32];
        objc_msgSend(v15, "setIconSpacing:", v13, v13);
        objc_msgSend(v15, "sbf_setBoundsAndPositionFromFrame:", *(_OWORD *)&v25.origin, *(_OWORD *)&v25.size);
        uint64_t v16 = [(SBFloatingDockView *)self accessoryIconView];
        [v16 setIconContentScale:*(double *)&v32];
        UIRectGetCenter();
        objc_msgSend(v16, "setCenter:");
        if (v15) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = v14;
        }
        objc_msgSend(v17, "cursorHitTestingInsetsForIconSpacing:", v13, v13);
        objc_msgSend(v16, "setCursorHitTestPadding:");
        CGRectGetWidth(v22);
        int v18 = BSFloatGreaterThanFloat();
        CGRectGetWidth(v25);
        int v19 = BSFloatGreaterThanFloat();
        double v20 = 1.0;
        if ((v18 & v19) == 0) {
          double v20 = 0.0;
        }
        [v12 setAlpha:v20];
        [(SBFloatingDockView *)self setIconContentScale:*(double *)&v32];
        uint64_t v21 = [(SBFloatingDockView *)self delegate];
        [v21 floatingDockViewMainPlatterDidChangeFrame:self];
      }
    }
  }
}

- (void)bounce
{
  v14[2] = *MEMORY[0x1E4F143B8];
  double v2 = [(SBFloatingDockView *)self mainPlatterView];
  double v3 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v3 setAdditive:1];
  [v3 setFromValue:&unk_1F300F0C0];
  [v3 setToValue:&unk_1F300F0D0];
  [v3 setMass:3.0];
  [v3 setStiffness:1560.0];
  [v3 setDamping:600.0];
  [v3 setDuration:0.4];
  uint64_t v4 = *MEMORY[0x1E4F39FA8];
  [v3 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v3 setRemovedOnCompletion:0];
  double v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform.scale.xy"];
  [v5 setAdditive:1];
  [v5 setFromValue:&unk_1F300F0C0];
  [v5 setToValue:&unk_1F300F0E0];
  [v5 setMass:2.0];
  [v5 setStiffness:300.0];
  [v5 setDamping:400.0];
  [v5 setBeginTime:0.07];
  [v5 setDuration:0.91];
  [v5 setFillMode:v4];
  double v6 = [MEMORY[0x1E4F39B38] animation];
  v14[0] = v3;
  v14[1] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v6 setAnimations:v7];

  [v3 duration];
  double v9 = v8;
  [v5 beginTime];
  double v11 = v10;
  [v5 duration];
  double v13 = v11 + v12;
  if (v9 >= v13) {
    double v13 = v9;
  }
  [v6 setDuration:v13];
  [v2 addAnimation:v6 forKey:@"SBFloatingDockView-bounce"];
}

- (void)updateDividerVisualStyling
{
  double v3 = (void *)MEMORY[0x1E4F743E8];
  uint64_t v4 = [(SBFloatingDockView *)self traitCollection];
  objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 3, 2, objc_msgSend(v4, "userInterfaceStyle"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  dividerView = self->_dividerView;
  double v6 = [v7 _visualStylingForStyle:5];
  [(UIView *)dividerView mt_replaceVisualStyling:v6];

  [(UIView *)self->_dividerView setAlpha:0.5];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockView;
  [(SBFloatingDockView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(SBFloatingDockView *)self updateDividerVisualStyling];
}

- (SBFloatingDockViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFloatingDockViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFloatingDockPlatterView)mainPlatterView
{
  return self->_mainPlatterView;
}

- (void)setMainPlatterView:(id)a3
{
}

- (SBDockIconListView)userIconListView
{
  return self->_userIconListView;
}

- (SBDockIconListView)recentIconListView
{
  return self->_recentIconListView;
}

- (SBIconView)accessoryIconView
{
  return self->_accessoryIconView;
}

- (BOOL)isAccessoryIconViewVisible
{
  return self->_accessoryIconViewVisible;
}

- (UIEdgeInsets)paddingEdgeInsets
{
  double top = self->_paddingEdgeInsets.top;
  double left = self->_paddingEdgeInsets.left;
  double bottom = self->_paddingEdgeInsets.bottom;
  double right = self->_paddingEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)platterVerticalMargin
{
  return self->_platterVerticalMargin;
}

- (void)setPlatterVerticalMargin:(double)a3
{
  self->_platterVerticalMargin = a3;
}

- (unint64_t)minimumUserIconSpaces
{
  return self->_minimumUserIconSpaces;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (CGSize)maximumEditingIconSize
{
  double width = self->_maximumEditingIconSize.width;
  double height = self->_maximumEditingIconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (void)setDividerView:(id)a3
{
}

- (UIView)touchReceivingView
{
  return self->_touchReceivingView;
}

- (void)setTouchReceivingView:(id)a3
{
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (void)setIconContentScale:(double)a3
{
  self->_iconContentScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchReceivingView, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_accessoryIconView, 0);
  objc_storeStrong((id *)&self->_recentIconListView, 0);
  objc_storeStrong((id *)&self->_userIconListView, 0);
  objc_storeStrong((id *)&self->_mainPlatterView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end