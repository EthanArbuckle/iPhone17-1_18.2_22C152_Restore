@interface PXZoomableInlineHeaderView
+ (CGSize)sizeWithConfiguration:(id)a3;
+ (double)_heightForStyle:(unint64_t)a3;
+ (double)_titleBaselineDistanceForFont:(id)a3;
+ (id)_titleFontForStyle:(unint64_t)a3;
- (CGRect)clippingRect;
- (PXZoomableInlineHeaderView)initWithFrame:(CGRect)a3;
- (PXZoomableInlineHeaderViewConfiguration)userData;
- (id)_tintViewBackgroundColor;
- (void)_configureViews;
- (void)_setEffectViewCornerRadius:(double)a3;
- (void)_setupBackgroundView;
- (void)_setupViews;
- (void)_updateButtonWithConfiguration:(id)a3;
- (void)_updateConfiguration;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setUserData:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXZoomableInlineHeaderView

+ (CGSize)sizeWithConfiguration:(id)a3
{
  objc_msgSend(a1, "_heightForStyle:", objc_msgSend(a3, "style"));
  double v4 = v3;
  double v5 = 200.0;
  result.height = v4;
  result.width = v5;
  return result;
}

+ (double)_heightForStyle:(unint64_t)a3
{
  if (a3 == 1) {
    return 34.0;
  }
  if (a3)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
    [v12 handleFailureInMethod:a2 object:a1 file:@"PXZoomableInlineHeaderView.m" lineNumber:136 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 28.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (PXZoomableInlineHeaderViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_tintViewBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

- (void)_setEffectViewCornerRadius:(double)a3
{
}

- (void)_setupBackgroundView
{
  uint64_t v3 = +[PXZoomablePhotosSettings sharedInstance];
  int v4 = [v3 enableHeaderBlur];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1F00]);
    [(PXZoomableInlineHeaderView *)self bounds];
    uint64_t v6 = (UIVisualEffectView *)objc_msgSend(v5, "initWithFrame:");
    uint64_t v7 = [MEMORY[0x1E4FB14C8] _effectWithBlurRadius:20.0 scale:0.25];
    [(UIVisualEffectView *)v6 setEffect:v7];

    [(UIVisualEffectView *)v6 _setGroupName:@"PXZoomableInlineHeaderGroupName"];
    effectView = self->_effectView;
    self->_effectView = v6;
    v9 = v6;

    uint64_t v13 = v9;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PXZoomableInlineHeaderView *)self bounds];
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    [(UIView *)v11 setAutoresizingMask:18];
    tintView = self->_tintView;
    self->_tintView = v11;
    uint64_t v13 = v11;

    v9 = self->_tintView;
  }
  [(PXZoomableInlineHeaderView *)self addSubview:v9];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(PXZoomableInlineHeaderView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  uint64_t v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    [(PXZoomableInlineHeaderView *)self _updateConfiguration];
  }
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)PXZoomableInlineHeaderView;
  [(PXZoomableInlineHeaderView *)&v32 layoutSubviews];
  if (([(PXZoomableInlineHeaderView *)self isHidden] & 1) == 0)
  {
    uint64_t v3 = [(PXZoomableInlineHeaderView *)self userData];
    [(PXZoomableInlineHeaderView *)self effectiveUserInterfaceLayoutDirection];
    id v4 = self->_titleLabel;
    self->_subtitleLabel;
    [(PXZoomableInlineHeaderView *)self bounds];
    double v6 = v5 + -20.0;
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v8);
    double v10 = v9;
    double v12 = v11;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v7, v8);
    if (v10 >= v6) {
      CGFloat v15 = v6;
    }
    else {
      CGFloat v15 = v10;
    }
    if (v13 >= v6) {
      double v13 = v6;
    }
    CGFloat v30 = v13;
    CGFloat v31 = v14;
    [(id)objc_opt_class() _heightForStyle:v3];
    double v17 = v16 * 0.5 - v12 * 0.5;
    v33.origin.double x = 10.0;
    v33.origin.double y = v17;
    v33.size.double width = v15;
    v33.size.double height = v12;
    double MaxX = CGRectGetMaxX(v33);
    [(PXZoomableInlineHeaderView *)self px_screenScale];
    effectView = self->_effectView;
    if (!effectView) {
      effectView = (UIVisualEffectView *)self->_tintView;
    }
    v20 = effectView;
    v21 = [(UILabel *)self->_subtitleLabel text];
    uint64_t v22 = [v21 length];

    double v23 = v12;
    CGFloat v24 = v15;
    double v25 = v17;
    double v26 = 10.0;
    if (v22)
    {
      double v27 = v17;
      CGFloat v28 = v15;
      double v29 = v12;
      v34.origin.double x = MaxX + 4.0;
      v34.origin.double y = v17;
      v34.size.double width = v30;
      v34.size.double height = v31;
      *(CGRect *)&double v26 = CGRectUnion(*(CGRect *)&v26, v34);
    }
    CGRectGetMaxX(*(CGRect *)&v26);
    PXRectRoundToPixel();
  }
}

- (void)_updateButtonWithConfiguration:(id)a3
{
  id v15 = a3;
  if (self->_effectView)
  {
    [(PXZoomableInlineHeaderView *)self _setEffectViewCornerRadius:5.0];
  }
  else
  {
    id v4 = [(UIView *)self->_tintView layer];
    [v4 setCornerRadius:5.0];
    [v4 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  }
  uint64_t v5 = [v15 style];
  double v6 = [(id)objc_opt_class() _titleFontForStyle:v5];
  p_titleLabel = &self->_titleLabel;
  [(UILabel *)self->_titleLabel setFont:v6];

  double v8 = [(id)objc_opt_class() _subtitleFontForStyle:v5];
  p_subtitleLabel = &self->_subtitleLabel;
  [(UILabel *)self->_subtitleLabel setFont:v8];

  double v10 = [v15 subtitle];
  -[UILabel setHidden:](*p_subtitleLabel, "setHidden:", [v10 length] == 0);

  if ([v15 swapTitleAndSubtitle]
    && ([(UILabel *)*p_subtitleLabel isHidden] & 1) == 0)
  {
    double v14 = [v15 subtitle];
    [(UILabel *)*p_titleLabel setText:v14];

    double v12 = [v15 title];
    double v13 = (id *)p_titleLabel;
    p_titleLabel = p_subtitleLabel;
  }
  else
  {
    double v11 = [v15 title];
    [(UILabel *)*p_titleLabel setText:v11];

    double v12 = [v15 subtitle];
    double v13 = (id *)p_subtitleLabel;
  }
  [(UILabel *)*p_subtitleLabel setText:v12];

  [*v13 setAlpha:0.5];
  [(UILabel *)*p_titleLabel setAlpha:1.0];
}

- (void)_configureViews
{
  if (self->_tintView)
  {
    uint64_t v3 = [(PXZoomableInlineHeaderView *)self _tintViewBackgroundColor];
    [(UIView *)self->_tintView setBackgroundColor:v3];

    id v4 = +[PXZoomablePhotosSettings sharedInstance];
    [v4 zoomingHeaderTintOpacity];
    -[UIView setAlpha:](self->_tintView, "setAlpha:");
  }
  uint64_t v5 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v5];

  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v6];
}

- (void)_setupViews
{
  uint64_t v3 = [(PXZoomableInlineHeaderView *)self layer];
  [v3 setAllowsGroupOpacity:0];

  [(PXZoomableInlineHeaderView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PXZoomableInlineHeaderView *)self _setupBackgroundView];
  double v12 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v7, v9, v11);
  double v13 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)v12 setTextColor:v13];

  [(UILabel *)v12 setLineBreakMode:4];
  [(UILabel *)v12 setTextAlignment:0];
  [(UILabel *)v12 setNumberOfLines:1];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;
  id v15 = v12;

  [(PXZoomableInlineHeaderView *)self addSubview:v15];
  double v16 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v7, v9, v11);
  double v17 = [MEMORY[0x1E4FB1618] blackColor];
  [(UILabel *)v16 setTextColor:v17];

  [(UILabel *)v16 setLineBreakMode:4];
  [(UILabel *)v16 setTextAlignment:0];
  [(UILabel *)v16 setNumberOfLines:1];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v16;
  v19 = v16;

  [(PXZoomableInlineHeaderView *)self addSubview:v19];
  [(PXZoomableInlineHeaderView *)self _platformSpecificViewSetup];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXZoomableInlineHeaderView *)self isHidden] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PXZoomableInlineHeaderView;
    [(PXZoomableInlineHeaderView *)&v5 setHidden:v3];
    [(PXZoomableInlineHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateConfiguration
{
  [(PXZoomableInlineHeaderView *)self _configureViews];
  BOOL v3 = [(PXZoomableInlineHeaderView *)self userData];
  [(PXZoomableInlineHeaderView *)self _updateButtonWithConfiguration:v3];

  [(PXZoomableInlineHeaderView *)self setNeedsLayout];
}

- (void)setUserData:(id)a3
{
  objc_super v5 = (PXZoomableInlineHeaderViewConfiguration *)a3;
  if (self->_userData != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    [(PXZoomableInlineHeaderView *)self _updateConfiguration];
    objc_super v5 = v6;
  }
}

- (PXZoomableInlineHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXZoomableInlineHeaderView;
  BOOL v3 = -[PXZoomableInlineHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXZoomableInlineHeaderView *)v3 setBackgroundColor:v4];

    [(PXZoomableInlineHeaderView *)v3 _setupViews];
  }
  return v3;
}

+ (double)_titleBaselineDistanceForFont:(id)a3
{
  [a3 _scaledValueForValue:21.0];
  return result;
}

+ (id)_titleFontForStyle:(unint64_t)a3
{
  if (PXTitleFontForInlineHeaderStyle_onceToken != -1) {
    dispatch_once(&PXTitleFontForInlineHeaderStyle_onceToken, &__block_literal_global_104574);
  }
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  objc_super v5 = [(id)PXTitleFontForInlineHeaderStyle_fontCache objectForKey:v4];
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v7 = [v6 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v7);

    double v9 = (void *)MEMORY[0x1E4FB27B0];
    if (!IsAccessibilityCategory) {
      double v9 = (void *)MEMORY[0x1E4FB27C0];
    }
    objc_super v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *v9, 32770);
    [(id)PXTitleFontForInlineHeaderStyle_fontCache setObject:v5 forKey:v4];
  }

  return v5;
}

@end