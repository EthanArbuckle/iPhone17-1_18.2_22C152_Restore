@interface HairlineView
- (BOOL)autoUpdateTheme;
- (BOOL)vertical;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)result;
- (HairlineView)init;
- (HairlineView)initWithCoder:(id)a3;
- (HairlineView)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)leadingMarginConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (double)leadingMargin;
- (double)trailingMargin;
- (void)customInit;
- (void)didMoveToWindow;
- (void)setAutoUpdateTheme:(BOOL)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setLeadingMarginConstraint:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)setVertical:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HairlineView

- (void)traitCollectionDidChange:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)HairlineView;
  id v4 = a3;
  [(HairlineView *)&v19 traitCollectionDidChange:v4];
  v5 = [(HairlineView *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9)
  {
    v10 = self;
    v11 = [(HairlineView *)v10 window];
    v12 = [v11 screen];
    if (v12)
    {
      v13 = [(HairlineView *)v10 window];
      v14 = [v13 screen];
      [v14 nativeScale];
      double v16 = v15;
    }
    else
    {
      v13 = +[UIScreen mainScreen];
      [v13 nativeScale];
      double v16 = v17;
    }

    if (v16 <= 0.0) {
      double v18 = 1.0;
    }
    else {
      double v18 = 1.0 / v16;
    }

    v10->_intrinsicThickness = v18;
    [(HairlineView *)v10 invalidateIntrinsicContentSize];
  }
}

- (HairlineView)init
{
  v5.receiver = self;
  v5.super_class = (Class)HairlineView;
  v2 = -[HairlineView initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2) {
    [(HairlineView *)v2 customInit];
  }
  return v3;
}

- (void)customInit
{
  v2 = self;
  v3 = [(HairlineView *)v2 window];
  id v4 = [v3 screen];
  if (v4)
  {
    objc_super v5 = [(HairlineView *)v2 window];
    double v6 = [v5 screen];
    [v6 nativeScale];
    double v8 = v7;
  }
  else
  {
    objc_super v5 = +[UIScreen mainScreen];
    [v5 nativeScale];
    double v8 = v9;
  }

  if (v8 <= 0.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = 1.0 / v8;
  }

  v2->_intrinsicThickness = v10;
  LODWORD(v11) = 1148846080;
  [(HairlineView *)v2 setContentHuggingPriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(HairlineView *)v2 setContentCompressionResistancePriority:1 forAxis:v12];
  v2->_autoUpdateTheme = 1;

  [(HairlineView *)v2 infoCardThemeChanged];
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  return self->_trailingMarginConstraint;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (void)setLeadingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingMarginConstraint
{
  return self->_leadingMarginConstraint;
}

- (void)didMoveToWindow
{
  v12.receiver = self;
  v12.super_class = (Class)HairlineView;
  [(HairlineView *)&v12 didMoveToWindow];
  v3 = self;
  id v4 = [(HairlineView *)v3 window];
  objc_super v5 = [v4 screen];
  if (v5)
  {
    double v6 = [(HairlineView *)v3 window];

    double v7 = [v6 screen];
    [v7 nativeScale];
    double v9 = v8;
  }
  else
  {
    double v6 = +[UIScreen mainScreen];

    [v6 nativeScale];
    double v9 = v10;
  }

  double v11 = 1.0;
  if (v9 > 0.0) {
    double v11 = 1.0 / v9;
  }
  if (v11 != v3->_intrinsicThickness)
  {
    v3->_intrinsicThickness = v11;
    [(HairlineView *)v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  p_intrinsicThickness = &self->_intrinsicThickness;
  if (self->_vertical) {
    v3 = &self->_intrinsicThickness;
  }
  else {
    v3 = (double *)&UIViewNoIntrinsicMetric;
  }
  if (self->_vertical) {
    p_intrinsicThickness = (double *)&UIViewNoIntrinsicMetric;
  }
  double v4 = *p_intrinsicThickness;
  double v5 = *v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (HairlineView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HairlineView;
  v3 = -[HairlineView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(HairlineView *)v3 customInit];
  }
  return v4;
}

- (HairlineView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HairlineView;
  v3 = [(HairlineView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(HairlineView *)v3 customInit];
  }
  return v4;
}

- (void)setLeadingMargin:(double)a3
{
  id v4 = [(HairlineView *)self leadingMarginConstraint];
  [v4 setConstant:a3];
}

- (double)leadingMargin
{
  v2 = [(HairlineView *)self leadingMarginConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setTrailingMargin:(double)a3
{
  id v4 = [(HairlineView *)self trailingMarginConstraint];
  [v4 setConstant:a3];
}

- (double)trailingMargin
{
  v2 = [(HairlineView *)self trailingMarginConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setVertical:(BOOL)a3
{
  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    if (a3) {
      *(float *)&double v3 = 1000.0;
    }
    else {
      *(float *)&double v3 = 250.0;
    }
    if (a3) {
      float v5 = 250.0;
    }
    else {
      float v5 = 1000.0;
    }
    if (a3) {
      float v6 = 1000.0;
    }
    else {
      float v6 = 750.0;
    }
    if (a3) {
      float v7 = 750.0;
    }
    else {
      float v7 = 1000.0;
    }
    [(HairlineView *)self setContentHuggingPriority:0 forAxis:v3];
    *(float *)&double v8 = v5;
    [(HairlineView *)self setContentHuggingPriority:1 forAxis:v8];
    *(float *)&double v9 = v6;
    [(HairlineView *)self setContentCompressionResistancePriority:0 forAxis:v9];
    *(float *)&double v10 = v7;
    [(HairlineView *)self setContentCompressionResistancePriority:1 forAxis:v10];
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->_vertical) {
    result.height = self->_intrinsicThickness;
  }
  else {
    result.width = self->_intrinsicThickness;
  }
  return result;
}

- (BOOL)autoUpdateTheme
{
  return self->_autoUpdateTheme;
}

- (void)setAutoUpdateTheme:(BOOL)a3
{
  self->_autoUpdateTheme = a3;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingMarginConstraint, 0);

  objc_storeStrong((id *)&self->_leadingMarginConstraint, 0);
}

@end