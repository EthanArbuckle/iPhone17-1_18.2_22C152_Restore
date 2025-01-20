@interface RCPlatterMinimalViewContainer
- (RCPlatterMinimalViewContainer)initWithFrame:(CGRect)a3 childView:(id)a4;
- (SBUISystemApertureAccessoryView)childView;
- (id)accessibilityLabel;
- (void)_setupChildView:(id)a3;
- (void)setChildView:(id)a3;
@end

@implementation RCPlatterMinimalViewContainer

- (RCPlatterMinimalViewContainer)initWithFrame:(CGRect)a3 childView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RCPlatterMinimalViewContainer;
  v11 = -[RCPlatterMinimalViewContainer initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_childView, a4);
    [(RCPlatterMinimalViewContainer *)v12 _setupChildView:v10];
  }

  return v12;
}

- (void)setChildView:(id)a3
{
  v5 = (SBUISystemApertureAccessoryView *)a3;
  childView = self->_childView;
  if (childView != v5)
  {
    v8 = v5;
    v7 = [(SBUISystemApertureAccessoryView *)childView superview];

    if (v7) {
      [(SBUISystemApertureAccessoryView *)self->_childView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_childView, a3);
    [(RCPlatterMinimalViewContainer *)self _setupChildView:v8];
    v5 = v8;
  }
}

- (void)_setupChildView:(id)a3
{
  id v4 = a3;
  [(RCPlatterMinimalViewContainer *)self addSubview:v4];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [v4 heightAnchor];
  v6 = [(RCPlatterMinimalViewContainer *)self heightAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v10 = [v4 centerXAnchor];

  v8 = [(RCPlatterMinimalViewContainer *)self centerXAnchor];
  v9 = [v10 constraintEqualToAnchor:v8];
  [v9 setActive:1];
}

- (id)accessibilityLabel
{
  return [(SBUISystemApertureAccessoryView *)self->_childView accessibilityLabel];
}

- (SBUISystemApertureAccessoryView)childView
{
  return self->_childView;
}

- (void).cxx_destruct
{
}

@end