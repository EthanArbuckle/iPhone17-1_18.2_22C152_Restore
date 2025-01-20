@interface CRLStepper
- (BOOL)continuous;
- (BOOL)downButtonDepressed;
- (BOOL)upButtonDepressed;
- (CRLStepper)init;
- (NSTimer)timer;
- (UIButton)downButton;
- (UIButton)upButton;
- (UIViewController)crlaxDefaultViewControllerForLargeContent;
- (UIViewController)crlaxPreferredViewControllerForLargeContent;
- (double)currentValue;
- (double)increment;
- (double)maxValue;
- (double)minValue;
- (id)i_downButton;
- (id)i_upButton;
- (id)viewControllerForLargeContentViewerInteraction:(id)a3;
- (int64_t)continuousCounter;
- (int64_t)continuousDifference;
- (void)dealloc;
- (void)handleDownButtonTouchDownEvent:(id)a3;
- (void)handleDownButtonTouchUpInsideEvent:(id)a3;
- (void)handleUpButtonTouchDownEvent:(id)a3;
- (void)handleUpButtonTouchUpInsideEvent:(id)a3;
- (void)p_handleDownButtonTimer:(id)a3;
- (void)p_handleUpButtonTimer:(id)a3;
- (void)p_updateContinuousDifference:(BOOL)a3;
- (void)setContinuous:(BOOL)a3;
- (void)setContinuousCounter:(int64_t)a3;
- (void)setContinuousDifference:(int64_t)a3;
- (void)setCrlaxDefaultViewControllerForLargeContent:(id)a3;
- (void)setCrlaxPreferredViewControllerForLargeContent:(id)a3;
- (void)setCurrentValue:(double)a3;
- (void)setDownButtonDepressed:(BOOL)a3;
- (void)setIncrement:(double)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setTimer:(id)a3;
- (void)setUpButtonDepressed:(BOOL)a3;
@end

@implementation CRLStepper

- (CRLStepper)init
{
  v39.receiver = self;
  v39.super_class = (Class)CRLStepper;
  v2 = -[CRLStepper initWithFrame:](&v39, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = v2;
  if (v2)
  {
    v2->_currentValue = 0.0;
    v2->_increment = 1.0;
    v2->_minValue = 2.22507386e-308;
    v2->_maxValue = 1.79769313e308;
    v2->_continuousDifference = 1;
    v4 = [(CRLStepper *)v2 layer];
    [v4 setCornerRadius:6.0];

    v5 = [(CRLStepper *)v3 layer];
    [v5 setMasksToBounds:1];

    v6 = [(CRLStepper *)v3 layer];
    [v6 setCornerCurve:kCACornerCurveContinuous];

    v7 = +[UIColor clearColor];
    [(CRLStepper *)v3 setBackgroundColor:v7];

    v8 = +[UIImage systemImageNamed:@"plus"];
    v9 = +[UIColor labelColor];
    v10 = +[UIColor labelColor];
    LOBYTE(v37) = 0;
    uint64_t v11 = +[CRLiOSMiniFormatterBuilder makeSmallButtonWith:v8 title:0 action:0 backgroundColor:0 pressedBackgroundColor:0 foregroundColor:v9 pressedForegroundColor:0.0 cornerRadius:v10 italicTitle:v37];
    upButton = v3->_upButton;
    v3->_upButton = (UIButton *)v11;

    [(UIButton *)v3->_upButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_upButton setExclusiveTouch:1];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Increment" value:0 table:0];
    [(UIButton *)v3->_upButton setAccessibilityLabel:v14];

    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Increment" value:0 table:0];
    [(UIButton *)v3->_upButton setLargeContentTitle:v16];

    v17 = v3->_upButton;
    id v18 = [objc_alloc((Class)UILargeContentViewerInteraction) initWithDelegate:v3];
    [(UIButton *)v17 addInteraction:v18];

    [(CRLStepper *)v3 addSubview:v3->_upButton];
    v19 = +[UIImage systemImageNamed:@"minus"];
    v20 = +[UIColor labelColor];
    v21 = +[UIColor labelColor];
    LOBYTE(v38) = 0;
    uint64_t v22 = +[CRLiOSMiniFormatterBuilder makeSmallButtonWith:v19 title:0 action:0 backgroundColor:0 pressedBackgroundColor:0 foregroundColor:v20 pressedForegroundColor:0.0 cornerRadius:v21 italicTitle:v38];
    downButton = v3->_downButton;
    v3->_downButton = (UIButton *)v22;

    [(UIButton *)v3->_downButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v3->_downButton setExclusiveTouch:1];
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"Decrement" value:0 table:0];
    [(UIButton *)v3->_downButton setAccessibilityLabel:v25];

    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"Decrement" value:0 table:0];
    [(UIButton *)v3->_downButton setLargeContentTitle:v27];

    v28 = v3->_downButton;
    id v29 = [objc_alloc((Class)UILargeContentViewerInteraction) initWithDelegate:v3];
    [(UIButton *)v28 addInteraction:v29];

    [(CRLStepper *)v3 addSubview:v3->_downButton];
    [(UIButton *)v3->_upButton addTarget:v3 action:"handleUpButtonTouchDownEvent:" forControlEvents:1];
    [(UIButton *)v3->_upButton addTarget:v3 action:"handleUpButtonTouchUpInsideEvent:" forControlEvents:448];
    [(UIButton *)v3->_downButton addTarget:v3 action:"handleDownButtonTouchDownEvent:" forControlEvents:1];
    [(UIButton *)v3->_downButton addTarget:v3 action:"handleDownButtonTouchUpInsideEvent:" forControlEvents:448];
    v30 = _NSDictionaryOfVariableBindings(@"_upButton, _downButton", v3->_upButton, v3->_downButton, 0);
    CFStringRef v40 = @"buttonHeight";
    +[CRLiOSMiniFormatterBuilder defaultRowHeight];
    v31 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v41 = v31;
    v32 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];

    v33 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[_downButton]-1-[_upButton(==_downButton)]|", 0, v32, v30);
    +[NSLayoutConstraint activateConstraints:v33];

    v34 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_upButton(>=buttonHeight)]|" options:0 metrics:v32 views:v30];
    +[NSLayoutConstraint activateConstraints:v34];

    v35 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_downButton(>=buttonHeight)]|" options:0 metrics:v32 views:v30];
    +[NSLayoutConstraint activateConstraints:v35];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(CRLStepper *)self timer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRLStepper;
  [(CRLStepper *)&v4 dealloc];
}

- (void)p_updateContinuousDifference:(BOOL)a3
{
  int64_t v3 = self->_continuousCounter + 1;
  self->_continuousCounter = v3;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * v3 + 0x1999999999999998, 1) <= 0x1999999999999998uLL)
  {
    int64_t continuousDifference = self->_continuousDifference;
    switch(continuousDifference)
    {
      case 1:
        uint64_t v6 = 2;
        break;
      case 5:
        uint64_t v6 = 10;
        break;
      case 2:
        uint64_t v6 = 5;
        break;
      default:
        if (10 * continuousDifference <= continuousDifference) {
          uint64_t v6 = self->_continuousDifference;
        }
        else {
          uint64_t v6 = 10 * continuousDifference;
        }
        break;
    }
    if (a3)
    {
      [(CRLStepper *)self maxValue];
      double v8 = v7;
      [(CRLStepper *)self currentValue];
    }
    else
    {
      [(CRLStepper *)self currentValue];
      double v8 = v10;
      [(CRLStepper *)self minValue];
    }
    double v11 = v8 - v9;
    [(CRLStepper *)self increment];
    if (v11 / (v12 * (double)v6) > 1.0) {
      self->_int64_t continuousDifference = v6;
    }
    self->_continuousCounter = 0;
  }
}

- (void)p_handleUpButtonTimer:(id)a3
{
  id v12 = a3;
  id v4 = [(CRLStepper *)self timer];

  if (v4 == v12)
  {
    [(CRLStepper *)self currentValue];
    double v6 = v5;
    [(CRLStepper *)self currentValue];
    double v8 = v7;
    double continuousDifference = (double)self->_continuousDifference;
    [(CRLStepper *)self increment];
    [(CRLStepper *)self setCurrentValue:v8 + continuousDifference * v10];
    [(CRLStepper *)self p_updateContinuousDifference:1];
    [(CRLStepper *)self currentValue];
    if (v6 != v11) {
      [(CRLStepper *)self sendActionsForControlEvents:4096];
    }
  }
  else
  {
    [v12 invalidate];
  }
}

- (void)p_handleDownButtonTimer:(id)a3
{
  id v12 = a3;
  id v4 = [(CRLStepper *)self timer];

  if (v4 == v12)
  {
    [(CRLStepper *)self currentValue];
    double v6 = v5;
    [(CRLStepper *)self currentValue];
    double v8 = v7;
    double continuousDifference = (double)self->_continuousDifference;
    [(CRLStepper *)self increment];
    [(CRLStepper *)self setCurrentValue:v8 - continuousDifference * v10];
    [(CRLStepper *)self p_updateContinuousDifference:0];
    [(CRLStepper *)self currentValue];
    if (v6 != v11) {
      [(CRLStepper *)self sendActionsForControlEvents:4096];
    }
  }
  else
  {
    [v12 invalidate];
  }
}

- (void)handleUpButtonTouchDownEvent:(id)a3
{
  if ([(CRLStepper *)self continuous] && [(CRLStepper *)self isEnabled])
  {
    id v4 = [(CRLStepper *)self timer];

    if (v4)
    {
      double v5 = [(CRLStepper *)self timer];
      [v5 invalidate];
    }
    self->_upButtonDepressed = 1;
    dispatch_time_t v6 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10042A3E8;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    [(CRLStepper *)self setCurrentValue:self->_currentValue + self->_increment];
    [(CRLStepper *)self sendActionsForControlEvents:1];
    [(CRLStepper *)self sendActionsForControlEvents:4096];
  }
}

- (void)handleUpButtonTouchUpInsideEvent:(id)a3
{
  if ([(CRLStepper *)self continuous] && [(CRLStepper *)self isEnabled])
  {
    self->_upButtonDepressed = 0;
    id v4 = [(CRLStepper *)self timer];
    [v4 invalidate];

    [(CRLStepper *)self setTimer:0];
    self->_double continuousDifference = 1;
    self->_continuousCounter = 0;
  }
  else
  {
    if (![(CRLStepper *)self isEnabled]) {
      return;
    }
    [(CRLStepper *)self setCurrentValue:self->_currentValue + self->_increment];
    [(CRLStepper *)self sendActionsForControlEvents:4096];
  }

  [(CRLStepper *)self sendActionsForControlEvents:64];
}

- (void)handleDownButtonTouchDownEvent:(id)a3
{
  if ([(CRLStepper *)self continuous] && [(CRLStepper *)self isEnabled])
  {
    id v4 = [(CRLStepper *)self timer];

    if (v4)
    {
      double v5 = [(CRLStepper *)self timer];
      [v5 invalidate];
    }
    self->_downButtonDepressed = 1;
    dispatch_time_t v6 = dispatch_time(0, 200000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10042A684;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    [(CRLStepper *)self setCurrentValue:self->_currentValue - self->_increment];
    [(CRLStepper *)self sendActionsForControlEvents:1];
    [(CRLStepper *)self sendActionsForControlEvents:4096];
  }
}

- (void)handleDownButtonTouchUpInsideEvent:(id)a3
{
  if ([(CRLStepper *)self continuous] && [(CRLStepper *)self isEnabled])
  {
    self->_downButtonDepressed = 0;
    id v4 = [(CRLStepper *)self timer];
    [v4 invalidate];

    [(CRLStepper *)self setTimer:0];
    self->_double continuousDifference = 1;
    self->_continuousCounter = 0;
  }
  else
  {
    if (![(CRLStepper *)self isEnabled]) {
      return;
    }
    [(CRLStepper *)self setCurrentValue:self->_currentValue - self->_increment];
    [(CRLStepper *)self sendActionsForControlEvents:4096];
  }

  [(CRLStepper *)self sendActionsForControlEvents:64];
}

- (void)setCurrentValue:(double)a3
{
  [(CRLStepper *)self minValue];
  double v6 = v5;
  [(CRLStepper *)self maxValue];
  double v8 = v7;
  [(CRLStepper *)self increment];
  long double v10 = v9;
  [(CRLStepper *)self maxValue];
  sub_10042A8E8(a3, v6, v8, v10);
  self->_currentValue = v11;
  [(UIButton *)self->_upButton setEnabled:v11 < self->_maxValue];
  BOOL v12 = self->_currentValue > self->_minValue;
  downButton = self->_downButton;

  [(UIButton *)downButton setEnabled:v12];
}

- (void)setIncrement:(double)a3
{
  if (a3 > 0.0) {
    self->_increment = a3;
  }
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
  [(CRLStepper *)self currentValue];
  upButton = self->_upButton;

  [(UIButton *)upButton setEnabled:v5 < a3];
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
  [(CRLStepper *)self currentValue];
  downButton = self->_downButton;

  [(UIButton *)downButton setEnabled:v5 > a3];
}

- (id)i_upButton
{
  return self->_upButton;
}

- (id)i_downButton
{
  return self->_downButton;
}

- (id)viewControllerForLargeContentViewerInteraction:(id)a3
{
  id v4 = [(CRLStepper *)self crlaxPreferredViewControllerForLargeContent];
  if (v4) {
    [(CRLStepper *)self crlaxPreferredViewControllerForLargeContent];
  }
  else {
  double v5 = [(CRLStepper *)self crlaxDefaultViewControllerForLargeContent];
  }

  return v5;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (double)increment
{
  return self->_increment;
}

- (double)minValue
{
  return self->_minValue;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (BOOL)continuous
{
  return self->_continuous;
}

- (void)setContinuous:(BOOL)a3
{
  self->_continuous = a3;
}

- (UIViewController)crlaxDefaultViewControllerForLargeContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_crlaxDefaultViewControllerForLargeContent);

  return (UIViewController *)WeakRetained;
}

- (void)setCrlaxDefaultViewControllerForLargeContent:(id)a3
{
}

- (UIViewController)crlaxPreferredViewControllerForLargeContent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_crlaxPreferredViewControllerForLargeContent);

  return (UIViewController *)WeakRetained;
}

- (void)setCrlaxPreferredViewControllerForLargeContent:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (UIButton)downButton
{
  return self->_downButton;
}

- (UIButton)upButton
{
  return self->_upButton;
}

- (int64_t)continuousCounter
{
  return self->_continuousCounter;
}

- (void)setContinuousCounter:(int64_t)a3
{
  self->_continuousCounter = a3;
}

- (int64_t)continuousDifference
{
  return self->_continuousDifference;
}

- (void)setContinuousDifference:(int64_t)a3
{
  self->_double continuousDifference = a3;
}

- (BOOL)upButtonDepressed
{
  return self->_upButtonDepressed;
}

- (void)setUpButtonDepressed:(BOOL)a3
{
  self->_upButtonDepressed = a3;
}

- (BOOL)downButtonDepressed
{
  return self->_downButtonDepressed;
}

- (void)setDownButtonDepressed:(BOOL)a3
{
  self->_downButtonDepressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upButton, 0);
  objc_storeStrong((id *)&self->_downButton, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_crlaxPreferredViewControllerForLargeContent);

  objc_destroyWeak((id *)&self->_crlaxDefaultViewControllerForLargeContent);
}

@end