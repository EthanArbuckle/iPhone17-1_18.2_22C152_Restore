@interface SBIconContinuityAccessoryView
+ (id)_imageForContinuityItem:(id)a3 highlighted:(BOOL)a4;
- (BOOL)displayingAccessory;
- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3;
- (CGPoint)layoutOffset;
- (CGSize)badgeSize;
- (SBHomeScreenMaterialView)foregroundView;
- (SBIconContinuityAccessoryView)init;
- (SBIconContinuityItem)continuityItem;
- (SBIconListLayout)listLayout;
- (UIView)backgroundView;
- (double)badgeContentScale;
- (void)configureForIcon:(id)a3 infoProvider:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryBrightness:(double)a3;
- (void)setLegibilityStyle:(int64_t)a3;
- (void)setListLayout:(id)a3;
@end

@implementation SBIconContinuityAccessoryView

- (SBIconContinuityAccessoryView)init
{
  v13.receiver = self;
  v13.super_class = (Class)SBIconContinuityAccessoryView;
  v2 = [(SBIconContinuityAccessoryView *)&v13 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    [(SBIconContinuityAccessoryView *)v2 addSubview:v2->_backgroundView];
    v5 = [(SBIconContinuityAccessoryView *)v2 traitCollection];
    v6 = +[SBIconView componentBackgroundViewOfType:1 compatibleWithTraitCollection:v5 initialWeighting:1.0];

    v7 = [SBHomeScreenMaterialView alloc];
    uint64_t v8 = -[SBHomeScreenMaterialView initWithFrame:backgroundView:foregroundImage:](v7, "initWithFrame:backgroundView:foregroundImage:", v6, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    foregroundView = v2->_foregroundView;
    v2->_foregroundView = (SBHomeScreenMaterialView *)v8;

    v10 = v2->_foregroundView;
    v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(SBHomeScreenMaterialView *)v10 setTintColor:v11];

    [(UIView *)v2->_backgroundView addSubview:v2->_foregroundView];
  }
  return v2;
}

- (CGPoint)layoutOffset
{
  v2 = [(SBIconContinuityAccessoryView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessoryOffset(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)badgeSize
{
  v2 = [(SBIconContinuityAccessoryView *)self listLayout];
  double v3 = SBHIconListLayoutIconAccessorySize(v2);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)SBIconContinuityAccessoryView;
  [(SBIconContinuityAccessoryView *)&v16 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(SBIconContinuityAccessoryView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  double v4 = [(SBIconContinuityAccessoryView *)self listLayout];

  if (v4)
  {
    [(SBIconContinuityAccessoryView *)self badgeSize];
    [(SBIconContinuityAccessoryView *)self badgeContentScale];
    uint64_t v6 = v5;
    BSRectWithSize();
    CGRectInset(v17, 1.0, 1.0);
    [(UIView *)self->_backgroundView bounds];
    uint64_t v15 = v6;
    UIRectCenteredIntegralRectScale();
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    -[SBHomeScreenMaterialView setContentMode:](self->_foregroundView, "setContentMode:", 4, v15);
    -[SBHomeScreenMaterialView setFrame:](self->_foregroundView, "setFrame:", v8, v10, v12, v14);
  }
}

- (double)badgeContentScale
{
  double v3 = [(SBIconContinuityAccessoryView *)self listLayout];
  if (v3)
  {
    double v4 = [(SBIconContinuityAccessoryView *)self listLayout];
    [v4 iconImageInfo];
    double v6 = v5;
  }
  else
  {
    double v4 = [(SBIconContinuityAccessoryView *)self traitCollection];
    [v4 displayScale];
    double v6 = v7;
  }

  return v6;
}

- (void)configureForIcon:(id)a3 infoProvider:(id)a4
{
  id v5 = a4;
  double v6 = [v5 continuityItem];
  uint64_t v7 = [v5 isHighlighted];

  continuityItem = self->_continuityItem;
  self->_continuityItem = v6;
  double v9 = v6;

  id v11 = [(id)objc_opt_class() _imageForContinuityItem:v9 highlighted:v7];

  double v10 = [(SBIconContinuityAccessoryView *)self foregroundView];
  [v10 setForegroundImage:v11];

  [(SBIconContinuityAccessoryView *)self setNeedsLayout];
  [(SBIconContinuityAccessoryView *)self layoutIfNeeded];
}

- (BOOL)displayingAccessory
{
  return 1;
}

- (void)prepareForReuse
{
  id v2 = [(SBIconContinuityAccessoryView *)self foregroundView];
  [v2 setForegroundImage:0];
}

- (CGPoint)accessoryCenterForIconBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SBIconContinuityAccessoryView *)self layoutOffset];
  double v9 = v8;
  double v11 = v10;
  [(SBIconContinuityAccessoryView *)self badgeSize];
  double v13 = v12;
  double v15 = v14;
  char v16 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  double v17 = SBIconBadgeViewCalculateAccessoryCenter(v16, x, y, width, height, v13, v15, v9, v11);
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

- (void)setAccessoryBrightness:(double)a3
{
  id v5 = [(SBIconContinuityAccessoryView *)self backgroundView];
  double v4 = objc_msgSend(v5, "sbh_darkener");
  [v4 setBrightness:a3];
}

- (void)setLegibilityStyle:(int64_t)a3
{
  id v4 = [(SBIconContinuityAccessoryView *)self foregroundView];
  [v4 setLegibilityStyle:a3];
}

+ (id)_imageForContinuityItem:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = SBLogContinuity();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "---->\tCreating continuity image for '%@', highlighted: '%{BOOL}u'", (uint8_t *)&v11, 0x12u);
  }

  uint64_t v7 = [v5 systemImageName];
  if (v7)
  {
    double v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:6 weight:12.0];
    double v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:v7 withConfiguration:v8];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
}

- (SBIconContinuityItem)continuityItem
{
  return self->_continuityItem;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SBHomeScreenMaterialView)foregroundView
{
  return self->_foregroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_continuityItem, 0);
  objc_storeStrong((id *)&self->_listLayout, 0);
}

@end