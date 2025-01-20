@interface SimpleSignView
- (BOOL)isHighlighted;
- (GuidanceManeuverView)maneuverView;
- (SignStyle)style;
- (SimpleSignView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)maneuverViewEdgeInsets;
- (UIImage)shieldImage;
- (UIImageView)shieldImageView;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setManeuverViewEdgeInsets:(UIEdgeInsets)a3;
- (void)setShieldImage:(id)a3;
- (void)setStyle:(id)a3;
- (void)updateStyleForTheme;
@end

@implementation SimpleSignView

- (SimpleSignView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SimpleSignView;
  v3 = -[SimpleSignView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(SimpleSignView *)v3 setAccessibilityIdentifier:v5];

    id v6 = objc_alloc((Class)UIImageView);
    [(SimpleSignView *)v3 bounds];
    v7 = [v6 initWithFrame:];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v7;

    [(UIImageView *)v3->_backgroundView setAutoresizingMask:18];
    [(SimpleSignView *)v3 addSubview:v3->_backgroundView];
  }
  return v3;
}

- (void)setStyle:(id)a3
{
  id v6 = (SignStyle *)a3;
  if (self->_style != v6)
  {
    objc_storeStrong((id *)&self->_style, a3);
    v5 = [(SignStyle *)v6 squareSignImage];
    [(UIImageView *)self->_backgroundView setImage:v5];

    [(SimpleSignView *)self updateStyleForTheme];
  }
}

- (void)updateStyleForTheme
{
  if ([(SimpleSignView *)self isHighlighted])
  {
    v3 = +[UIColor systemWhiteColor];
    p_maneuverView = &self->_maneuverView;
    [(GuidanceManeuverView *)self->_maneuverView setArrowColor:v3];
  }
  else
  {
    v3 = [(SimpleSignView *)self style];
    v5 = [v3 foregroundColor];
    p_maneuverView = &self->_maneuverView;
    [(GuidanceManeuverView *)self->_maneuverView setArrowColor:v5];
  }
  if ([(SimpleSignView *)self isHighlighted])
  {
    id v6 = +[UIColor systemWhiteColor];
    [v6 colorWithAlphaComponent:0.800000012];
  }
  else
  {
    id v6 = [(SimpleSignView *)self style];
    [v6 accentColor];
  v7 = };
  [(GuidanceManeuverView *)*p_maneuverView setAccentColor:v7];

  v8 = [(SimpleSignView *)self style];

  if (v8)
  {
    v9 = [(SimpleSignView *)self style];
    objc_super v10 = objc_opt_class();
    if (v10) {
      [v10 arrowMetricsForStyle:0];
    }
    else {
      memset(v24, 0, sizeof(v24));
    }
    v13 = *p_maneuverView;
    memcpy(v23, v24, sizeof(v23));
    [(GuidanceManeuverView *)v13 setArrowMetrics:v23];

    v14 = [(SimpleSignView *)self style];
    v15 = objc_opt_class();
    if (v15) {
      [v15 junctionArrowMetricsForStyle:0];
    }
    else {
      memset(v22, 0, sizeof(v22));
    }
    v16 = *p_maneuverView;
    memcpy(v21, v22, sizeof(v21));
    [(GuidanceManeuverView *)v16 setJunctionArrowMetrics:v21];
  }
  else
  {
    MKDefaultGuidanceManeuverMetrics();
    v11 = *p_maneuverView;
    memcpy(__dst, __src, sizeof(__dst));
    [(GuidanceManeuverView *)v11 setArrowMetrics:__dst];
    MKDefaultJunctionManeuverMetrics();
    v12 = *p_maneuverView;
    memcpy(v17, v18, sizeof(v17));
    [(GuidanceManeuverView *)v12 setJunctionArrowMetrics:v17];
  }
}

- (GuidanceManeuverView)maneuverView
{
  maneuverView = self->_maneuverView;
  if (!maneuverView)
  {
    v4 = [GuidanceManeuverView alloc];
    [(SimpleSignView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(SimpleSignView *)self maneuverViewEdgeInsets];
    v17 = -[GuidanceManeuverView initWithFrame:textureProvider:](v4, "initWithFrame:textureProvider:", 0, v6 + v16, v8 + v13, v10 - (v16 + v14), v12 - (v13 + v15));
    v18 = self->_maneuverView;
    self->_maneuverView = v17;

    [(GuidanceManeuverView *)self->_maneuverView setAutoresizingMask:18];
    v19 = [(SimpleSignView *)self style];

    if (v19)
    {
      v20 = [(SimpleSignView *)self style];
      v21 = objc_opt_class();
      if (v21) {
        [v21 arrowMetricsForStyle:0];
      }
      else {
        memset(__src, 0, sizeof(__src));
      }
      v22 = self->_maneuverView;
      memcpy(__dst, __src, sizeof(__dst));
      [(GuidanceManeuverView *)v22 setArrowMetrics:__dst];

      v23 = [(SimpleSignView *)self style];
      v24 = objc_opt_class();
      if (v24) {
        [v24 junctionArrowMetricsForStyle:0];
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      v25 = self->_maneuverView;
      memcpy(v27, v28, sizeof(v27));
      [(GuidanceManeuverView *)v25 setJunctionArrowMetrics:v27];
    }
    [(SimpleSignView *)self addSubview:self->_maneuverView];
    maneuverView = self->_maneuverView;
  }

  return maneuverView;
}

- (void)setManeuverViewEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  self->_maneuverViewEdgeInsets = a3;
  [(SimpleSignView *)self bounds];
  double v9 = left + v8;
  double v11 = top + v10;
  double v13 = v12 - (left + right);
  double v15 = v14 - (top + bottom);
  id v16 = [(SimpleSignView *)self maneuverView];
  [v16 setFrame:v9, v11, v13, v15];
}

- (UIImageView)shieldImageView
{
  return self->_shieldView;
}

- (UIImage)shieldImage
{
  return [(UIImageView *)self->_shieldView image];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SimpleSignView;
  [(SimpleSignView *)&v10 layoutSubviews];
  [(UIImageView *)self->_shieldView bounds];
  double v4 = v3;
  double v6 = v5;
  [(SimpleSignView *)self bounds];
  CGRectGetMidX(v11);
  UIRoundToViewScale();
  double v8 = v7;
  [(SimpleSignView *)self bounds];
  CGRectGetMidY(v12);
  UIRoundToViewScale();
  -[UIImageView setFrame:](self->_shieldView, "setFrame:", v8, v9, v4, v6);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5 && self->_highlighted != v3)
  {
    self->_highlighted = v3;
    [(SimpleSignView *)self updateStyleForTheme];
  }
}

- (void)setShieldImage:(id)a3
{
  id v11 = a3;
  id v4 = [(UIImageView *)self->_shieldView image];

  double v5 = v11;
  if (v4 != v11)
  {
    shieldView = self->_shieldView;
    if (!shieldView)
    {
      id v7 = objc_alloc((Class)UIImageView);
      [(SimpleSignView *)self bounds];
      double v8 = [v7 initWithFrame:];
      double v9 = self->_shieldView;
      self->_shieldView = v8;

      [(SimpleSignView *)self addSubview:self->_shieldView];
      shieldView = self->_shieldView;
    }
    [(UIImageView *)shieldView setImage:v11];
    objc_super v10 = [(SimpleSignView *)self maneuverView];
    [v10 setHidden:v11 != 0];

    [(UIImageView *)self->_shieldView sizeToFit];
    [(SimpleSignView *)self setNeedsLayout];
    double v5 = v11;
  }
}

- (UIEdgeInsets)maneuverViewEdgeInsets
{
  double top = self->_maneuverViewEdgeInsets.top;
  double left = self->_maneuverViewEdgeInsets.left;
  double bottom = self->_maneuverViewEdgeInsets.bottom;
  double right = self->_maneuverViewEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SignStyle)style
{
  return self->_style;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end