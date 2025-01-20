@interface CarFocusGuideDebugView
- (CarFocusGuideDebugView)initWithDirection:(unint64_t)a3;
- (id)_colorForDirection:(unint64_t)a3;
- (void)_updateColors;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation CarFocusGuideDebugView

- (CarFocusGuideDebugView)initWithDirection:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)CarFocusGuideDebugView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[CarFocusGuideDebugView initWithFrame:](&v19, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    v7->_direction = a3;
    v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    directionLabel = v8->_directionLabel;
    v8->_directionLabel = v9;

    [(UILabel *)v8->_directionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    if (a3)
    {
      v11 = +[NSMutableString string];
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      char v24 = 0;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1008B3EAC;
      v20[3] = &unk_1012FF430;
      id v12 = v11;
      id v21 = v12;
      v22 = v23;
      v13 = objc_retainBlock(v20);
      v14 = (void (**)(void, void))v13;
      if (a3) {
        ((void (*)(void *, const __CFString *))v13[2])(v13, @"Up");
      }
      if ((a3 & 2) != 0) {
        ((void (**)(void, const __CFString *))v14)[2](v14, @"Down");
      }
      if ((a3 & 4) != 0) {
        ((void (**)(void, const __CFString *))v14)[2](v14, @"Left");
      }
      if ((a3 & 8) != 0) {
        ((void (**)(void, const __CFString *))v14)[2](v14, @"Right");
      }
      if ((a3 & 0x20) != 0) {
        ((void (**)(void, const __CFString *))v14)[2](v14, @"Previous");
      }
      if ((a3 & 0x10) != 0) {
        ((void (**)(void, const __CFString *))v14)[2](v14, @"Next");
      }
      v15 = (__CFString *)v12;

      _Block_object_dispose(v23, 8);
    }
    else
    {
      v15 = @"None";
    }
    [(UILabel *)v8->_directionLabel setText:v15];

    [(UILabel *)v8->_directionLabel setTextAlignment:1];
    [(CarFocusGuideDebugView *)v8 addSubview:v8->_directionLabel];
    v16 = [(UILabel *)v8->_directionLabel _maps_constraintsForCenteringInView:v8];
    +[NSLayoutConstraint activateConstraints:v16];

    [(CarFocusGuideDebugView *)v8 setUserInteractionEnabled:1];
    v17 = [(CarFocusGuideDebugView *)v8 layer];
    [v17 setBorderWidth:1.0];

    [(CarFocusGuideDebugView *)v8 _updateColors];
  }
  return v8;
}

- (void)_updateColors
{
  if ([(CarFocusGuideDebugView *)self isUserInteractionEnabled]) {
    [(CarFocusGuideDebugView *)self _colorForDirection:self->_direction];
  }
  else {
  id v8 = +[UIColor blackColor];
  }
  v3 = [v8 colorWithAlphaComponent:0.200000003];
  [(CarFocusGuideDebugView *)self setBackgroundColor:v3];

  id v4 = [v8 colorWithAlphaComponent:0.300000012];
  id v5 = [v4 CGColor];
  v6 = [(CarFocusGuideDebugView *)self layer];
  [v6 setBorderColor:v5];

  v7 = [v8 colorWithAlphaComponent:0.5];
  [(UILabel *)self->_directionLabel setTextColor:v7];
}

- (id)_colorForDirection:(unint64_t)a3
{
  if (a3) {
    +[UIColor systemDarkPinkColor];
  }
  else {
  v3 = +[UIColor systemDarkPurpleColor];
  }

  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarFocusGuideDebugView;
  [(CarFocusGuideDebugView *)&v4 setUserInteractionEnabled:a3];
  [(CarFocusGuideDebugView *)self _updateColors];
}

- (void).cxx_destruct
{
}

@end