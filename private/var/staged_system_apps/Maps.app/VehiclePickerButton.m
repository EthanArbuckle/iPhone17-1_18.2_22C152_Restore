@interface VehiclePickerButton
- (BOOL)isActive;
- (BOOL)needsOutlineStroke;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (UIEdgeInsets)colorViewInsets;
- (UIImageView)colorView;
- (UIView)highlightView;
- (VehiclePickerButton)initWithFrame:(CGRect)a3;
- (id)accessibilityIdentifier;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setColorView:(id)a3;
- (void)setColorViewInsets:(UIEdgeInsets)a3;
- (void)setHighlightView:(id)a3;
- (void)setNeedsOutlineStroke:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation VehiclePickerButton

- (VehiclePickerButton)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)VehiclePickerButton;
  v3 = -[VehiclePickerButton initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(VehiclePickerButton *)v3 highlightView];
    [(VehiclePickerButton *)v4 addSubview:v5];

    v6 = [(VehiclePickerButton *)v4 colorView];
    [(VehiclePickerButton *)v4 addSubview:v6];

    v7 = [(VehiclePickerButton *)v4 colorView];
    v8 = [v7 leadingAnchor];
    v9 = [(VehiclePickerButton *)v4 leadingAnchor];
    uint64_t v10 = [v8 constraintEqualToAnchor:v9];
    leadingConstraint = v4->_leadingConstraint;
    v4->_leadingConstraint = (NSLayoutConstraint *)v10;

    v12 = [(VehiclePickerButton *)v4 colorView];
    v13 = [v12 trailingAnchor];
    v14 = [(VehiclePickerButton *)v4 trailingAnchor];
    uint64_t v15 = [v13 constraintEqualToAnchor:v14];
    trailingConstraint = v4->_trailingConstraint;
    v4->_trailingConstraint = (NSLayoutConstraint *)v15;

    v17 = [(VehiclePickerButton *)v4 colorView];
    v18 = [v17 topAnchor];
    v19 = [(VehiclePickerButton *)v4 topAnchor];
    uint64_t v20 = [v18 constraintEqualToAnchor:v19];
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v20;

    v22 = [(VehiclePickerButton *)v4 colorView];
    v23 = [v22 bottomAnchor];
    v24 = [(VehiclePickerButton *)v4 bottomAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24];
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v25;

    v46[0] = v4->_leadingConstraint;
    v46[1] = v4->_trailingConstraint;
    v46[2] = v4->_topConstraint;
    v46[3] = v4->_bottomConstraint;
    v44 = [(VehiclePickerButton *)v4 highlightView];
    v43 = [v44 leadingAnchor];
    v42 = [(VehiclePickerButton *)v4 leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v46[4] = v41;
    v40 = [(VehiclePickerButton *)v4 highlightView];
    v39 = [v40 trailingAnchor];
    v38 = [(VehiclePickerButton *)v4 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v46[5] = v37;
    v27 = [(VehiclePickerButton *)v4 highlightView];
    v28 = [v27 topAnchor];
    v29 = [(VehiclePickerButton *)v4 topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v46[6] = v30;
    v31 = [(VehiclePickerButton *)v4 highlightView];
    v32 = [v31 bottomAnchor];
    v33 = [(VehiclePickerButton *)v4 bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v46[7] = v34;
    v35 = +[NSArray arrayWithObjects:v46 count:8];
    +[NSLayoutConstraint activateConstraints:v35];
  }
  return v4;
}

- (UIView)highlightView
{
  highlightView = self->_highlightView;
  if (!highlightView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_highlightView;
    self->_highlightView = v4;

    [(UIView *)self->_highlightView setUserInteractionEnabled:0];
    [(UIView *)self->_highlightView setHidden:1];
    [(UIView *)self->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(UIView *)self->_highlightView layer];
    [v6 setBorderWidth:3.0];

    id v7 = +[UIColor systemGray3Color];
    id v8 = [v7 CGColor];
    v9 = [(UIView *)self->_highlightView layer];
    [v9 setBorderColor:v8];

    highlightView = self->_highlightView;
  }

  return highlightView;
}

- (UIImageView)colorView
{
  colorView = self->_colorView;
  if (!colorView)
  {
    v4 = (UIImageView *)objc_opt_new();
    v5 = self->_colorView;
    self->_colorView = v4;

    [(UIImageView *)self->_colorView setUserInteractionEnabled:0];
    [(UIImageView *)self->_colorView setTranslatesAutoresizingMaskIntoConstraints:0];
    colorView = self->_colorView;
  }

  return colorView;
}

- (void)setColorViewInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_colorViewInsets.top;
  if (self->_colorViewInsets.left != a3.left
    || v7 != top
    || self->_colorViewInsets.right != a3.right
    || self->_colorViewInsets.bottom != a3.bottom)
  {
    self->_colorViewInsets.double top = top;
    self->_colorViewInsets.double left = a3.left;
    self->_colorViewInsets.double bottom = a3.bottom;
    self->_colorViewInsets.double right = a3.right;
    v12 = [(VehiclePickerButton *)self leadingConstraint];
    [v12 setConstant:left];

    v13 = [(VehiclePickerButton *)self trailingConstraint];
    [v13 setConstant:-right];

    v14 = [(VehiclePickerButton *)self topConstraint];
    [v14 setConstant:top];

    uint64_t v15 = [(VehiclePickerButton *)self bottomConstraint];
    [v15 setConstant:-bottom];

    [(VehiclePickerButton *)self setNeedsLayout];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    BOOL v4 = !a3;
    v5 = [(VehiclePickerButton *)self highlightView];
    [v5 setHidden:v4];

    [(VehiclePickerButton *)self setNeedsLayout];
  }
}

- (void)setNeedsOutlineStroke:(BOOL)a3
{
  if (self->_needsOutlineStroke != a3)
  {
    BOOL v3 = a3;
    self->_needsOutlineStroke = a3;
    v5 = [(VehiclePickerButton *)self colorView];
    v6 = [v5 layer];
    double v7 = v6;
    if (v3)
    {
      [v6 setBorderWidth:1.0];

      id v8 = +[UIColor systemGray3Color];
      id v9 = [v8 CGColor];
      uint64_t v10 = [(VehiclePickerButton *)self colorView];
      v11 = [v10 layer];
      [v11 setBorderColor:v9];
    }
    else
    {
      [v6 setBorderWidth:0.0];

      id v8 = [(VehiclePickerButton *)self colorView];
      uint64_t v10 = [v8 layer];
      [v10 setBorderColor:0];
    }

    [(VehiclePickerButton *)self setNeedsDisplay];
  }
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)VehiclePickerButton;
  [(VehiclePickerButton *)&v27 layoutSubviews];
  BOOL v3 = [(VehiclePickerButton *)self colorView];
  [v3 frame];
  double Width = CGRectGetWidth(v28);
  v5 = [(VehiclePickerButton *)self colorView];
  [v5 frame];
  double Height = CGRectGetHeight(v29);
  double v7 = [(VehiclePickerButton *)self colorView];
  [v7 frame];
  if (Width >= Height) {
    double v12 = CGRectGetHeight(*(CGRect *)&v8);
  }
  else {
    double v12 = CGRectGetWidth(*(CGRect *)&v8);
  }
  double v13 = v12 * 0.5;
  v14 = [(VehiclePickerButton *)self colorView];
  [v14 _setCornerRadius:v13];

  uint64_t v15 = [(VehiclePickerButton *)self highlightView];
  [v15 frame];
  double v16 = CGRectGetWidth(v30);
  v17 = [(VehiclePickerButton *)self highlightView];
  [v17 frame];
  double v18 = CGRectGetHeight(v31);
  v19 = [(VehiclePickerButton *)self highlightView];
  [v19 frame];
  if (v16 < v18) {
    double v24 = CGRectGetWidth(*(CGRect *)&v20);
  }
  else {
    double v24 = CGRectGetHeight(*(CGRect *)&v20);
  }
  double v25 = v24 * 0.5;
  v26 = [(VehiclePickerButton *)self highlightView];
  [v26 _setCornerRadius:v25];
}

- (void)traitCollectionDidChange:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VehiclePickerButton;
  id v4 = a3;
  [(VehiclePickerButton *)&v16 traitCollectionDidChange:v4];
  v5 = [(VehiclePickerButton *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    if ([(VehiclePickerButton *)self needsOutlineStroke])
    {
      id v8 = +[UIColor systemGray3Color];
      id v9 = [v8 CGColor];
      uint64_t v10 = [(VehiclePickerButton *)self colorView];
      v11 = [v10 layer];
      [v11 setBorderColor:v9];
    }
    id v12 = +[UIColor systemGray3Color];
    id v13 = [v12 CGColor];
    v14 = [(VehiclePickerButton *)self highlightView];
    uint64_t v15 = [v14 layer];
    [v15 setBorderColor:v13];
  }
}

- (id)accessibilityIdentifier
{
  return @"VehiclePickerButton";
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setHighlightView:(id)a3
{
}

- (void)setColorView:(id)a3
{
}

- (UIEdgeInsets)colorViewInsets
{
  double top = self->_colorViewInsets.top;
  double left = self->_colorViewInsets.left;
  double bottom = self->_colorViewInsets.bottom;
  double right = self->_colorViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)needsOutlineStroke
{
  return self->_needsOutlineStroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);

  objc_storeStrong((id *)&self->_leadingConstraint, 0);
}

@end