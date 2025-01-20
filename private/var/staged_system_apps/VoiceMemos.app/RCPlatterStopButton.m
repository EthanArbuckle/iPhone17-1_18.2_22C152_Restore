@interface RCPlatterStopButton
- (BOOL)_stopButtonContainsPoint:(CGPoint)a3;
- (BOOL)didSetInitialMicaState;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isAccessibilityElement;
- (RCPlatterStopButton)initWithFrame:(CGRect)a3;
- (RCPlatterStopButtonCAPackageManager)packageManager;
- (RCPlatterStopButtonDelegate)delegate;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unint64_t)state;
- (void)_handleUserTouch:(id)a3;
- (void)_setupCAPackageManager;
- (void)_setupLongPressGestureRecognizer;
- (void)didTapOnStopButton:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDidSetInitialMicaState:(BOOL)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setPackageManager:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)transitionToState:(unint64_t)a3 viaState:(unint64_t)a4 transitionDuration:(double)a5;
@end

@implementation RCPlatterStopButton

- (RCPlatterStopButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlatterStopButton;
  v3 = -[RCPlatterStopButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RCPlatterStopButton *)v3 _setupCAPackageManager];
    [(RCPlatterStopButton *)v4 _setupLongPressGestureRecognizer];
  }
  return v4;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3 || ![(RCPlatterStopButton *)self didSetInitialMicaState])
  {
    self->_state = a3;
    uint64_t v5 = 3;
    if (a3 != 2) {
      uint64_t v5 = 0;
    }
    if (a3 == 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    v7 = [(RCPlatterStopButton *)self packageManager];
    [v7 setMicaState:v6];

    [(RCPlatterStopButton *)self setDidSetInitialMicaState:1];
    [(RCPlatterStopButton *)self setNeedsLayout];
  }
}

- (void)transitionToState:(unint64_t)a3 viaState:(unint64_t)a4 transitionDuration:(double)a5
{
  [(RCPlatterStopButton *)self setState:a4];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000623C8;
  v9[3] = &unk_100221D90;
  v9[4] = self;
  v9[5] = a3;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)didTapOnStopButton:(id)a3
{
  id v4 = [(RCPlatterStopButton *)self delegate];
  [v4 didTapOnStopButton:self];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)RCPlatterStopButton;
  [(RCPlatterStopButton *)&v29 layoutSubviews];
  v3 = [(RCPlatterStopButton *)self packageManager];
  id v4 = [v3 view];
  uint64_t v5 = [v4 superview];

  if (v5 != self)
  {
    uint64_t v6 = [(RCPlatterStopButton *)self packageManager];
    v7 = [v6 view];
    [(RCPlatterStopButton *)self addSubview:v7];
  }
  dispatch_time_t v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v8 platterStopButtonHeight];
  double v10 = v9;

  v11 = [(RCPlatterStopButton *)self packageManager];
  v12 = [v11 view];
  long long v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v28[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v28[1] = v13;
  v28[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v12 setTransform:v28];

  v14 = [(RCPlatterStopButton *)self packageManager];
  v15 = [v14 view];
  [v15 setFrame:0.0, 0.0, v10, v10];

  [(RCPlatterStopButton *)self bounds];
  CGAffineTransformMakeScale(&v27, v16 / v10, v16 / v10);
  v17 = [(RCPlatterStopButton *)self packageManager];
  v18 = [v17 view];
  CGAffineTransform v26 = v27;
  [v18 setTransform:&v26];

  [(RCPlatterStopButton *)self bounds];
  double MidX = CGRectGetMidX(v30);
  [(RCPlatterStopButton *)self bounds];
  double MidY = CGRectGetMidY(v31);
  v21 = [(RCPlatterStopButton *)self packageManager];
  v22 = [v21 view];
  [v22 setCenter:MidX, MidY];

  if ([(RCPlatterStopButton *)self didSetInitialMicaState])
  {
    [(RCPlatterStopButton *)self bounds];
    if (v23 == 0.0 || ([(RCPlatterStopButton *)self bounds], v24 == 0.0))
    {
      v25 = [(RCPlatterStopButton *)self packageManager];
      [v25 pauseAnimations];
    }
    else
    {
      v25 = [(RCPlatterStopButton *)self packageManager];
      [v25 resumeAnimations];
    }
  }
}

- (void)_setupCAPackageManager
{
  id v3 = +[RCPlatterStopButtonCAPackageManager stopButtonPackageManager];
  [(RCPlatterStopButton *)self setPackageManager:v3];
}

- (void)_setupLongPressGestureRecognizer
{
  id v3 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:self action:"_handleUserTouch:"];
  [(RCPlatterStopButton *)self setLongPressRecognizer:v3];

  id v4 = [(RCPlatterStopButton *)self longPressRecognizer];
  [(RCPlatterStopButton *)self addGestureRecognizer:v4];

  uint64_t v5 = [(RCPlatterStopButton *)self longPressRecognizer];
  [v5 setMinimumPressDuration:0.0];

  id v6 = [(RCPlatterStopButton *)self longPressRecognizer];
  [v6 setDelegate:self];
}

- (void)_handleUserTouch:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  id v9 = [v4 state];

  switch((unint64_t)v9)
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      if (!-[RCPlatterStopButton _stopButtonContainsPoint:](self, "_stopButtonContainsPoint:", v6, v8)) {
        return;
      }
LABEL_3:
      double v10 = [(RCPlatterStopButton *)self packageManager];
      id v12 = v10;
      uint64_t v11 = 2;
      goto LABEL_8;
    case 3uLL:
      if (!-[RCPlatterStopButton _stopButtonContainsPoint:](self, "_stopButtonContainsPoint:", v6, v8)) {
        goto LABEL_7;
      }
      id v12 = [(RCPlatterStopButton *)self delegate];
      [v12 didTapOnStopButton:self];
      goto LABEL_9;
    case 4uLL:
LABEL_7:
      double v10 = [(RCPlatterStopButton *)self packageManager];
      id v12 = v10;
      uint64_t v11 = 1;
LABEL_8:
      [v10 setMicaState:v11];
LABEL_9:

      break;
    default:
      return;
  }
}

- (BOOL)_stopButtonContainsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(RCPlatterStopButton *)self bounds];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = [(RCPlatterStopButton *)self longPressRecognizer];

  return v6 != v5 || (id)[(RCPlatterStopButton *)self state] == (id)1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ((id)[(RCPlatterStopButton *)self state] == (id)1)
  {
    id v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"STOP";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_100228BC8 table:0];

    goto LABEL_7;
  }
  if ((id)[(RCPlatterStopButton *)self state] == (id)2)
  {
    id v3 = +[NSBundle mainBundle];
    id v4 = v3;
    CFStringRef v5 = @"AX_RECORDING_STOPPED";
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)RCPlatterStopButton;
  unint64_t v3 = [(RCPlatterStopButton *)&v6 accessibilityTraits];
  if ((id)[(RCPlatterStopButton *)self state] == (id)1)
  {
    id v4 = &UIAccessibilityTraitButton;
LABEL_5:
    v3 |= *v4;
    return v3;
  }
  if ((id)[(RCPlatterStopButton *)self state] == (id)2)
  {
    id v4 = &UIAccessibilityTraitImage;
    goto LABEL_5;
  }
  return v3;
}

- (RCPlatterStopButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCPlatterStopButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (RCPlatterStopButtonCAPackageManager)packageManager
{
  return self->_packageManager;
}

- (void)setPackageManager:(id)a3
{
}

- (BOOL)didSetInitialMicaState
{
  return self->_didSetInitialMicaState;
}

- (void)setDidSetInitialMicaState:(BOOL)a3
{
  self->_didSetInitialMicaState = a3;
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_packageManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end