@interface MTATimerPickerCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (MTATimerIntervalPickerView)picker;
- (MTATimerPickerCell)initWithPicker:(id)a3 timeView:(id)a4 expectedTimeView:(id)a5 countdownView:(id)a6 reuseIdentifier:(id)a7;
- (MTUIGlyphTimeView)expectedTimeView;
- (MTUITimerCountdownView)countdownView;
- (UILabel)timeView;
- (unint64_t)state;
- (void)layoutSubviews;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation MTATimerPickerCell

- (MTATimerPickerCell)initWithPicker:(id)a3 timeView:(id)a4 expectedTimeView:(id)a5 countdownView:(id)a6 reuseIdentifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MTATimerPickerCell;
  v17 = [(MTATimerPickerCell *)&v26 initWithStyle:0 reuseIdentifier:a7];
  v18 = v17;
  if (v17)
  {
    [(MTATimerPickerCell *)v17 setSelectionStyle:0];
    v19 = [(MTATimerPickerCell *)v18 contentView];
    objc_storeStrong((id *)&v18->_picker, a3);
    objc_storeStrong((id *)&v18->_timeView, a4);
    objc_storeStrong((id *)&v18->_countdownView, a6);
    objc_storeStrong((id *)&v18->_expectedTimeView, a5);
    v20 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    pickerBackgroundView = v18->_pickerBackgroundView;
    v18->_pickerBackgroundView = v20;

    v22 = v18->_pickerBackgroundView;
    v23 = +[UIColor clearColor];
    [(UIView *)v22 setBackgroundColor:v23];

    [v19 addSubview:v18->_pickerBackgroundView];
    v24 = +[UIColor mtui_foregroundColor];
    [(MTATimerPickerCell *)v18 setBackgroundColor:v24];
  }
  return v18;
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_state = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100053B24;
  v7[3] = &unk_1000A2038;
  v7[4] = self;
  v7[5] = a3;
  v5 = objc_retainBlock(v7);
  v6 = v5;
  if (v4) {
    +[UIView animateWithDuration:v5 animations:0.2];
  }
  else {
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)setState:(unint64_t)a3
{
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width = a3.width;
  +[UIPickerView defaultSizeForCurrentOrientation];
  double v7 = width;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)MTATimerPickerCell;
  [(MTATimerPickerCell *)&v30 layoutSubviews];
  v3 = [(MTATimerPickerCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_pickerBackgroundView, "setFrame:", v5, v7, v9, v11);
  v12 = [(MTATimerIntervalPickerView *)self->_picker superview];
  id v13 = [(MTATimerPickerCell *)self contentView];

  if (v12 == v13)
  {
    [(MTATimerIntervalPickerView *)self->_picker frame];
    [(UIView *)self->_pickerBackgroundView bounds];
    UIRectCenteredIntegralRect();
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    UIRoundToViewScale();
    -[MTATimerIntervalPickerView setFrame:](self->_picker, "setFrame:", v15, v22 + v17, v19, v21);
  }
  v23 = [(UILabel *)self->_timeView superview];
  v24 = [(MTATimerPickerCell *)self contentView];

  if (v23 == v24)
  {
    [(UILabel *)self->_timeView sizeToFit];
    [(UILabel *)self->_timeView frame];
    CGFloat v26 = v25;
    double v28 = v27;
    v31.origin.x = v5;
    v31.origin.y = v7;
    v31.size.CGFloat width = v9;
    v31.size.height = v11;
    CGRectGetHeight(v31);
    v32.origin.x = 16.0;
    v32.origin.y = v26;
    v32.size.CGFloat width = v9 + -32.0;
    v32.size.height = v28;
    CGRectGetHeight(v32);
    UIRoundToViewScale();
    -[UILabel setFrame:](self->_timeView, "setFrame:", 16.0, v29, v9 + -32.0, v28);
  }
}

- (MTATimerIntervalPickerView)picker
{
  return self->_picker;
}

- (UILabel)timeView
{
  return self->_timeView;
}

- (MTUITimerCountdownView)countdownView
{
  return self->_countdownView;
}

- (MTUIGlyphTimeView)expectedTimeView
{
  return self->_expectedTimeView;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedTimeView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_picker, 0);

  objc_storeStrong((id *)&self->_pickerBackgroundView, 0);
}

@end