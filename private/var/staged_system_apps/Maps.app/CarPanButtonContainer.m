@interface CarPanButtonContainer
- (CarPanButton)panDownButton;
- (CarPanButton)panLeftButton;
- (CarPanButton)panRightButton;
- (CarPanButton)panUpButton;
- (CarPanButtonContainer)initWithFrame:(CGRect)a3;
- (NSArray)preferredFocusEnvironments;
- (id)_buttonForDirection:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)lastNudgedDirection;
- (void)layoutSubviews;
- (void)setLastNudgedDirection:(int64_t)a3;
- (void)setPanDownButton:(id)a3;
- (void)setPanLeftButton:(id)a3;
- (void)setPanRightButton:(id)a3;
- (void)setPanUpButton:(id)a3;
@end

@implementation CarPanButtonContainer

- (id)_buttonForDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.super.super.isa + **(&off_1012F8CC0 + a3 - 1));
  }
  return v4;
}

- (NSArray)preferredFocusEnvironments
{
  if (self->_lastNudgedDirection
    && (-[CarPanButtonContainer _buttonForDirection:](self, "_buttonForDirection:"),
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        self->_lastNudgedDirection = 0,
        v3))
  {
    id v4 = (void *)v3;
    uint64_t v8 = v3;
    v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    panRightButton = self->_panRightButton;
    v5 = +[NSArray arrayWithObjects:&panRightButton count:1];
  }

  return (NSArray *)v5;
}

- (CarPanButtonContainer)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CarPanButtonContainer;
  uint64_t v3 = -[CarPanButtonContainer initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CarPanButtonContainer *)v3 setAccessibilityIdentifier:@"CarPanButtonContainer"];
    v5 = [[CarPanButton alloc] initWithDirection:1];
    panUpButton = v4->_panUpButton;
    v4->_panUpButton = v5;

    [(CarPanButton *)v4->_panUpButton setContentHorizontalAlignment:0];
    [(CarPanButton *)v4->_panUpButton setContentVerticalAlignment:0];
    [(CarPanButtonContainer *)v4 addSubview:v4->_panUpButton];
    v7 = [[CarPanButton alloc] initWithDirection:3];
    panLeftButton = v4->_panLeftButton;
    v4->_panLeftButton = v7;

    [(CarPanButton *)v4->_panLeftButton setContentHorizontalAlignment:0];
    [(CarPanButton *)v4->_panLeftButton setContentVerticalAlignment:0];
    [(CarPanButtonContainer *)v4 addSubview:v4->_panLeftButton];
    v9 = [[CarPanButton alloc] initWithDirection:4];
    panRightButton = v4->_panRightButton;
    v4->_panRightButton = v9;

    [(CarPanButton *)v4->_panRightButton setContentHorizontalAlignment:0];
    [(CarPanButton *)v4->_panRightButton setContentVerticalAlignment:0];
    [(CarPanButtonContainer *)v4 addSubview:v4->_panRightButton];
    v11 = [[CarPanButton alloc] initWithDirection:2];
    panDownButton = v4->_panDownButton;
    v4->_panDownButton = v11;

    [(CarPanButton *)v4->_panDownButton setContentHorizontalAlignment:0];
    [(CarPanButton *)v4->_panDownButton setContentVerticalAlignment:0];
    [(CarPanButtonContainer *)v4 addSubview:v4->_panDownButton];
  }
  return v4;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)CarPanButtonContainer;
  [(CarPanButtonContainer *)&v31 layoutSubviews];
  [(CarPanButtonContainer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CarPanButtonContainer *)self safeAreaInsets];
  CGFloat v12 = v4 + v11;
  CGFloat v14 = v6 + v13;
  CGFloat v16 = v8 - (v11 + v15);
  CGFloat v18 = v10 - (v13 + v17);
  v32.origin.x = v4 + v11;
  v32.origin.y = v14;
  v32.size.width = v16;
  v32.size.height = v18;
  CGRectGetMidX(v32);
  UIRoundToViewScale();
  double v20 = v19;
  v33.origin.x = v12;
  v33.origin.y = v14;
  v33.size.width = v16;
  v33.size.height = v18;
  CGRectGetMinY(v33);
  UIRoundToViewScale();
  -[CarPanButton setFrame:](self->_panUpButton, "setFrame:", v20, v21, 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panUpButton, "setTouchInsets:", v18 / -12.0, v16 / -12.0, v18 / -12.0, v16 / -12.0);
  v34.origin.x = v12;
  v34.origin.y = v14;
  v34.size.width = v16;
  v34.size.height = v18;
  CGRectGetMinX(v34);
  UIRoundToViewScale();
  double v23 = v22;
  v35.origin.x = v12;
  v35.origin.y = v14;
  v35.size.width = v16;
  v35.size.height = v18;
  CGRectGetMidY(v35);
  UIRoundToViewScale();
  -[CarPanButton setFrame:](self->_panLeftButton, "setFrame:", v23, v24, 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panLeftButton, "setTouchInsets:", v16 / -12.0, v18 / -12.0, v16 / -12.0, v18 / -12.0);
  v36.origin.x = v12;
  v36.origin.y = v14;
  v36.size.width = v16;
  v36.size.height = v18;
  CGRectGetMaxX(v36);
  UIRoundToViewScale();
  double v26 = v25;
  v37.origin.x = v12;
  v37.origin.y = v14;
  v37.size.width = v16;
  v37.size.height = v18;
  CGRectGetMidY(v37);
  UIRoundToViewScale();
  -[CarPanButton setFrame:](self->_panRightButton, "setFrame:", v26, v27, 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panRightButton, "setTouchInsets:", v16 / -12.0, v18 / -12.0, v16 / -12.0, v18 / -12.0);
  v38.origin.x = v12;
  v38.origin.y = v14;
  v38.size.width = v16;
  v38.size.height = v18;
  CGRectGetMidX(v38);
  UIRoundToViewScale();
  double v29 = v28;
  v39.origin.x = v12;
  v39.origin.y = v14;
  v39.size.width = v16;
  v39.size.height = v18;
  CGRectGetMaxY(v39);
  UIRoundToViewScale();
  -[CarPanButton setFrame:](self->_panDownButton, "setFrame:", v29, v30, 28.0, 28.0);
  -[CarFocusableControl setTouchInsets:](self->_panDownButton, "setTouchInsets:", v18 / -12.0, v16 / -12.0, v18 / -12.0, v16 / -12.0);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CarPanButtonContainer;
  -[CarPanButtonContainer hitTest:withEvent:](&v9, "hitTest:withEvent:", a4, a3.x, a3.y);
  double v5 = (CarPanButtonContainer *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v7 = 0;
  }
  else {
    double v7 = v5;
  }

  return v7;
}

- (int64_t)lastNudgedDirection
{
  return self->_lastNudgedDirection;
}

- (void)setLastNudgedDirection:(int64_t)a3
{
  self->_lastNudgedDirection = a3;
}

- (CarPanButton)panUpButton
{
  return self->_panUpButton;
}

- (void)setPanUpButton:(id)a3
{
}

- (CarPanButton)panLeftButton
{
  return self->_panLeftButton;
}

- (void)setPanLeftButton:(id)a3
{
}

- (CarPanButton)panRightButton
{
  return self->_panRightButton;
}

- (void)setPanRightButton:(id)a3
{
}

- (CarPanButton)panDownButton
{
  return self->_panDownButton;
}

- (void)setPanDownButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_panDownButton, 0);
  objc_storeStrong((id *)&self->_panRightButton, 0);
  objc_storeStrong((id *)&self->_panLeftButton, 0);

  objc_storeStrong((id *)&self->_panUpButton, 0);
}

@end