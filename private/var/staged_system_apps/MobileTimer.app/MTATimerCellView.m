@interface MTATimerCellView
+ (double)estimatedHeightForTimerWithTitle:(id)a3;
- (MTATimerCellView)initWithDelegate:(id)a3;
- (MTATimerCellView)initWithFrame:(CGRect)a3;
- (MTATimerCellViewDelegate)delegate;
- (MTUITimerCountdownView)countDownView;
- (UIButton)controlButton;
- (UILabel)countDownLabel;
- (UILabel)durationLabel;
- (unint64_t)state;
- (void)didTapPauseResumeButton:(id)a3;
- (void)localSetup;
- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7;
- (void)setControlButton:(id)a3;
- (void)setCountDownLabel:(id)a3;
- (void)setCountDownView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDurationLabel:(id)a3;
- (void)setDurationWithInterval:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animate:(BOOL)a4;
- (void)setupControlButton;
- (void)setupCountdownLabel;
- (void)setupCountdownView;
- (void)setupDurationLabel;
- (void)setupLayoutConstraints;
- (void)tickWithTimer:(id)a3;
- (void)updateControlButtonWithState:(unint64_t)a3;
- (void)updateLabelColorForState:(unint64_t)a3;
@end

@implementation MTATimerCellView

+ (double)estimatedHeightForTimerWithTitle:(id)a3
{
  NSAttributedStringKey v20 = NSFontAttributeName;
  id v3 = a3;
  v4 = +[UIFont mtui_thinTimeFont];
  v21 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  [@"09:58" sizeWithAttributes:v5];
  double v7 = v6;

  v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v10 = v9 + 16.0 * -2.0 - 64.0 + 16.0 * -0.5;

  NSAttributedStringKey v18 = NSFontAttributeName;
  v11 = +[UIFont systemFontOfSize:17.0];
  v19 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v13 = objc_opt_new();
  [v3 boundingRectWithSize:1 options:v12 attributes:v13 context:1.79769313e308];
  double v15 = v14;

  float v16 = v7 + v15 + 8.0 * 2.0;
  return ceilf(v16);
}

- (MTATimerCellView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTATimerCellView;
  v5 = [(MTATimerCellView *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(MTATimerCellView *)v5 setDelegate:v4];
  }

  return v6;
}

- (MTATimerCellView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerCellView;
  id v3 = -[MTATimerCellView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(MTATimerCellView *)v3 localSetup];
  }
  return v4;
}

- (void)localSetup
{
  [(MTATimerCellView *)self setupCountdownLabel];
  [(MTATimerCellView *)self setupDurationLabel];
  [(MTATimerCellView *)self setupCountdownView];
  [(MTATimerCellView *)self setupControlButton];
  [(MTATimerCellView *)self setupLayoutConstraints];
  id v3 = [(MTATimerCellView *)self countDownLabel];
  [v3 setText:@"5:00"];

  id v4 = [(MTATimerCellView *)self durationLabel];
  [v4 setText:@"15:00"];
}

- (void)setupCountdownLabel
{
  id v3 = objc_opt_new();
  [(MTATimerCellView *)self setCountDownLabel:v3];

  id v4 = [(MTATimerCellView *)self countDownLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = +[UIColor whiteColor];
  objc_super v6 = [(MTATimerCellView *)self countDownLabel];
  [v6 setTextColor:v5];

  double v7 = +[UIFont mtui_thinTimeFont];
  objc_super v8 = [(MTATimerCellView *)self countDownLabel];
  [v8 setFont:v7];

  id v9 = [(MTATimerCellView *)self countDownLabel];
  [(MTATimerCellView *)self addSubview:v9];
}

- (void)setupDurationLabel
{
  id v3 = objc_opt_new();
  [(MTATimerCellView *)self setDurationLabel:v3];

  id v4 = [(MTATimerCellView *)self durationLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = +[UIColor secondaryLabelColor];
  objc_super v6 = [(MTATimerCellView *)self durationLabel];
  [v6 setTextColor:v5];

  double v7 = [(MTATimerCellView *)self durationLabel];
  [v7 setNumberOfLines:0];

  objc_super v8 = [(MTATimerCellView *)self durationLabel];
  [v8 setLineBreakMode:0];

  id v9 = [(MTATimerCellView *)self durationLabel];
  [v9 setAdjustsFontSizeToFitWidth:0];

  id v10 = [(MTATimerCellView *)self durationLabel];
  [(MTATimerCellView *)self addSubview:v10];
}

- (void)setupCountdownView
{
  id v8 = +[UIColor colorWithRed:0.470588235 green:0.470588235 blue:0.501960784 alpha:0.32];
  id v3 = objc_alloc((Class)MTUITimerCountdownView);
  id v4 = +[UIColor systemOrangeColor];
  id v5 = [v3 initWithBarColor:v4 backgroundBarColor:v8 barWidth:4.0];
  [(MTATimerCellView *)self setCountDownView:v5];

  objc_super v6 = [(MTATimerCellView *)self countDownView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v7 = [(MTATimerCellView *)self countDownView];
  [(MTATimerCellView *)self addSubview:v7];
}

- (void)setupControlButton
{
  id v3 = +[UIButton buttonWithType:0];
  [(MTATimerCellView *)self setControlButton:v3];

  id v4 = [(MTATimerCellView *)self controlButton];
  [v4 _setTouchInsets:-30.0, -30.0, -30.0, -30.0];

  id v5 = [(MTATimerCellView *)self controlButton];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(MTATimerCellView *)self updateControlButtonWithState:3];
  objc_super v6 = [(MTATimerCellView *)self controlButton];
  [v6 addTarget:self action:"didTapPauseResumeButton:" forControlEvents:64];

  id v7 = [(MTATimerCellView *)self controlButton];
  [(MTATimerCellView *)self addSubview:v7];
}

- (void)setupLayoutConstraints
{
  id v106 = (id)objc_opt_new();
  id v3 = objc_opt_new();
  [v3 setIdentifier:@"leftLayoutGuide"];
  [(MTATimerCellView *)self addLayoutGuide:v3];
  id v4 = objc_opt_new();
  [v4 setIdentifier:@"rightLayoutGuide"];
  id v5 = v4;
  [(MTATimerCellView *)self addLayoutGuide:v4];
  objc_super v6 = objc_opt_new();
  [v6 setIdentifier:@"cellContentLayoutGuide"];
  [(MTATimerCellView *)self addLayoutGuide:v6];
  id v7 = [v6 leadingAnchor];
  id v8 = [(MTATimerCellView *)self leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:16.0];
  [v106 addObject:v9];

  id v10 = [v6 trailingAnchor];
  v11 = [(MTATimerCellView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:-((84.0 - 64.0) * 0.5 + 16.0)];
  [v106 addObject:v12];

  v13 = [v6 topAnchor];
  double v14 = [(MTATimerCellView *)self topAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14 constant:8.0];
  [v106 addObject:v15];

  float v16 = [v6 bottomAnchor];
  v17 = [(MTATimerCellView *)self bottomAnchor];
  NSAttributedStringKey v18 = [v16 constraintEqualToAnchor:v17 constant:-8.0];
  [v106 addObject:v18];

  v19 = [v3 leadingAnchor];
  NSAttributedStringKey v20 = [v6 leadingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v106 addObject:v21];

  v22 = [v3 centerYAnchor];
  v23 = [v6 centerYAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  [v106 addObject:v24];

  v25 = [v3 trailingAnchor];
  v26 = v5;
  v27 = [v5 leadingAnchor];
  v28 = [v25 constraintEqualToAnchor:v27 constant:16.0 * -0.5];
  [v106 addObject:v28];

  v29 = [v5 centerYAnchor];
  v30 = [v6 centerYAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v106 addObject:v31];

  v32 = [v5 trailingAnchor];
  v33 = [v6 trailingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v106 addObject:v34];

  v35 = [(MTATimerCellView *)self countDownLabel];
  v36 = [v35 leadingAnchor];
  v37 = [v3 leadingAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v106 addObject:v38];

  v39 = [(MTATimerCellView *)self countDownLabel];
  v40 = [v39 topAnchor];
  v41 = [v3 topAnchor];
  v42 = [v40 constraintEqualToAnchor:v41];
  [v106 addObject:v42];

  v43 = [(MTATimerCellView *)self countDownLabel];
  v44 = [v43 bottomAnchor];
  v45 = [(MTATimerCellView *)self durationLabel];
  v46 = [v45 topAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v106 addObject:v47];

  v48 = [(MTATimerCellView *)self durationLabel];
  v49 = [v48 leadingAnchor];
  v50 = [v3 leadingAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  [v106 addObject:v51];

  v52 = [(MTATimerCellView *)self durationLabel];
  v53 = [v52 trailingAnchor];
  v105 = v3;
  v54 = [v3 trailingAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  [v106 addObject:v55];

  v56 = [(MTATimerCellView *)self durationLabel];
  v57 = [v56 bottomAnchor];
  v58 = [v3 bottomAnchor];
  v59 = [v57 constraintEqualToAnchor:v58];
  [v106 addObject:v59];

  v60 = [(MTATimerCellView *)self countDownView];
  v61 = [v60 heightAnchor];
  v62 = [v61 constraintEqualToConstant:64.0];
  [v106 addObject:v62];

  v63 = [(MTATimerCellView *)self countDownView];
  v64 = [v63 widthAnchor];
  v65 = [(MTATimerCellView *)self countDownView];
  v66 = [v65 heightAnchor];
  v67 = [v64 constraintEqualToAnchor:v66];
  [v106 addObject:v67];

  v68 = [(MTATimerCellView *)self countDownView];
  v69 = [v68 leadingAnchor];
  v70 = v26;
  v71 = [v26 leadingAnchor];
  v72 = [v69 constraintEqualToAnchor:v71];
  [v106 addObject:v72];

  v73 = [(MTATimerCellView *)self countDownView];
  v74 = [v73 trailingAnchor];
  v75 = [v26 trailingAnchor];
  v76 = [v74 constraintEqualToAnchor:v75];
  [v106 addObject:v76];

  v77 = [(MTATimerCellView *)self countDownView];
  v78 = [v77 topAnchor];
  v79 = [(MTATimerCellView *)self countDownLabel];
  v80 = [v79 firstBaselineAnchor];
  v81 = [(MTATimerCellView *)self countDownLabel];
  v82 = [v81 font];
  [v82 capHeight];
  v84 = [v78 constraintEqualToAnchor:v80 constant:-(v83 + 2.0)];
  [v106 addObject:v84];

  v85 = [(MTATimerCellView *)self countDownView];
  v86 = [v85 bottomAnchor];
  v87 = [v70 bottomAnchor];
  v88 = [v86 constraintEqualToAnchor:v87];
  [v106 addObject:v88];

  v89 = [(MTATimerCellView *)self controlButton];
  v90 = [v89 heightAnchor];
  v91 = [v90 constraintEqualToConstant:30.0];
  [v106 addObject:v91];

  v92 = [(MTATimerCellView *)self controlButton];
  v93 = [v92 widthAnchor];
  v94 = [v93 constraintEqualToConstant:30.0];
  [v106 addObject:v94];

  v95 = [(MTATimerCellView *)self controlButton];
  v96 = [v95 centerXAnchor];
  v97 = [(MTATimerCellView *)self countDownView];
  v98 = [v97 centerXAnchor];
  v99 = [v96 constraintEqualToAnchor:v98];
  [v106 addObject:v99];

  v100 = [(MTATimerCellView *)self controlButton];
  v101 = [v100 centerYAnchor];
  v102 = [(MTATimerCellView *)self countDownView];
  v103 = [v102 centerYAnchor];
  v104 = [v101 constraintEqualToAnchor:v103];
  [v106 addObject:v104];

  +[NSLayoutConstraint activateConstraints:v106];
}

- (void)setEditing:(BOOL)a3
{
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  id v5 = [(MTATimerCellView *)self countDownView];
  [v5 setAlpha:v4];

  id v6 = [(MTATimerCellView *)self controlButton];
  [v6 setAlpha:v4];
}

- (void)tickWithTimer:(id)a3
{
  id v4 = a3;
  [v4 remainingTime];
  [v4 state];

  FormatTime();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(MTATimerCellView *)self countDownLabel];
  [v5 setText:v6];
}

- (void)setRemainingTime:(double)a3 duration:(double)a4 state:(unint64_t)a5 title:(id)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  v13 = MTLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544898;
    v19 = self;
    __int16 v20 = 2048;
    double v21 = a3;
    __int16 v22 = 2048;
    double v23 = a4;
    __int16 v24 = 2048;
    unint64_t v25 = a5;
    __int16 v26 = 2048;
    unint64_t v27 = [(MTATimerCellView *)self state];
    __int16 v28 = 2114;
    id v29 = v12;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setRemainingTime: %f, duration: %f, new state: %li, currentState: %li, title: %{public}@, forceRefresh: %i", (uint8_t *)&v18, 0x44u);
  }

  [(MTATimerCellView *)self processCountdownState:a5 previousState:[(MTATimerCellView *)self state] remainingTime:v7 duration:a3 forceRefresh:a4];
  double v14 = [(MTATimerCellView *)self countDownView];
  [v14 setNeedsLayout];

  [(MTATimerCellView *)self setState:a5];
  [(MTATimerCellView *)self updateControlButtonWithState:a5];
  [(MTATimerCellView *)self updateLabelColorForState:a5];
  if ([v12 length])
  {
    double v15 = [(MTATimerCellView *)self durationLabel];
    [v15 setText:v12];
  }
  else
  {
    [(MTATimerCellView *)self setDurationWithInterval:a4];
  }
  float v16 = FormatTime();
  v17 = [(MTATimerCellView *)self countDownLabel];
  [v17 setText:v16];
}

- (void)setDurationWithInterval:(double)a3
{
  id v5 = +[MTAUtilities durationStringFromInterval:a3];
  id v4 = [(MTATimerCellView *)self durationLabel];
  [v4 setText:v5];
}

- (void)processCountdownState:(unint64_t)a3 previousState:(unint64_t)a4 remainingTime:(double)a5 duration:(double)a6 forceRefresh:(BOOL)a7
{
  BOOL v7 = a7;
  v13 = [(MTATimerCellView *)self countDownView];
  [v13 duration];
  double v15 = v14;

  if (a3 != a4 || (v15 == a6 ? (BOOL v16 = !v7) : (BOOL v16 = 0), !v16))
  {
    switch(a3)
    {
      case 1uLL:
        id v23 = [(MTATimerCellView *)self countDownView];
        [v23 stop];
        break;
      case 3uLL:
        if (a4 == 3 && !v7)
        {
          if (v15 == a6) {
            return;
          }
          goto LABEL_21;
        }
        if (a4 < 2 || a4 == 3)
        {
LABEL_21:
          __int16 v20 = [(MTATimerCellView *)self countDownView];
          [v20 setAnimationRemainingTime:a5 totalTime:a6];

          double v21 = [(MTATimerCellView *)self countDownView];
          id v23 = v21;
LABEL_22:
          [v21 start];
          break;
        }
        if (a4 != 2) {
          return;
        }
        v17 = [(MTATimerCellView *)self countDownView];
        [v17 setAnimationRemainingTime:a5 totalTime:a6];

        int v18 = [(MTATimerCellView *)self countDownView];
        unsigned int v19 = [v18 isStarted];

        id v23 = [(MTATimerCellView *)self countDownView];
        if (!v19)
        {
          double v21 = v23;
          goto LABEL_22;
        }
        [v23 resume];
        break;
      case 2uLL:
        if (a4 >= 3)
        {
          if (a4 != 3) {
            return;
          }
          __int16 v22 = [(MTATimerCellView *)self countDownView];
          [v22 setAnimationRemainingTime:a5 totalTime:a6];

          id v23 = [(MTATimerCellView *)self countDownView];
          [v23 pause];
        }
        else
        {
          id v23 = [(MTATimerCellView *)self countDownView];
          [v23 setAnimationRemainingTime:a5 totalTime:a6];
        }
        break;
      default:
        return;
    }
  }
}

- (void)updateControlButtonWithState:(unint64_t)a3
{
  if (a3 == 3) {
    CFStringRef v3 = @"pause.fill";
  }
  else {
    CFStringRef v3 = @"play.fill";
  }
  id v6 = [(MTATimerCellView *)self controlButton];
  id v4 = +[UIColor systemOrangeColor];
  id v5 = +[UIImage mtui_imageWithSymbolName:v3 pointSize:v4 color:24.0];
  [v6 setImage:v5 forState:0];
}

- (void)setState:(unint64_t)a3 animate:(BOOL)a4
{
  self->_state = a3;
  if (a4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100028748;
    v9[3] = &unk_1000A1A28;
    BOOL v10 = a3 == 1;
    v9[4] = self;
    v9[5] = a3;
    +[UIView animateWithDuration:v9 animations:0.2];
  }
  else
  {
    id v6 = [(MTATimerCellView *)self countDownView];
    BOOL v7 = v6;
    double v8 = 1.0;
    if (a3 == 1) {
      double v8 = 0.0;
    }
    [v6 setAlpha:v8];

    [(MTATimerCellView *)self updateLabelColorForState:a3];
  }
}

- (void)updateLabelColorForState:(unint64_t)a3
{
  if (a3 == 2) {
    +[UIColor mtui_disabledTextColor];
  }
  else {
  id v5 = +[UIColor mtui_primaryTextColor];
  }
  id v6 = [(MTATimerCellView *)self countDownLabel];
  [v6 setTextColor:v5];

  if (a3 == 2) {
    +[UIColor mtui_disabledTextColor];
  }
  else {
  id v8 = +[UIColor mtui_primaryTextColor];
  }
  BOOL v7 = [(MTATimerCellView *)self durationLabel];
  [v7 setTextColor:v8];
}

- (void)didTapPauseResumeButton:(id)a3
{
  unint64_t state = self->_state;
  id v4 = [(MTATimerCellView *)self delegate];
  id v5 = v4;
  if (state == 3) {
    [v4 didSendPauseAction];
  }
  else {
    [v4 didSendResumeAction];
  }
}

- (UILabel)countDownLabel
{
  return self->_countDownLabel;
}

- (void)setCountDownLabel:(id)a3
{
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
}

- (MTUITimerCountdownView)countDownView
{
  return self->_countDownView;
}

- (void)setCountDownView:(id)a3
{
}

- (UIButton)controlButton
{
  return self->_controlButton;
}

- (void)setControlButton:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (MTATimerCellViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTATimerCellViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlButton, 0);
  objc_storeStrong((id *)&self->_countDownView, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);

  objc_storeStrong((id *)&self->_countDownLabel, 0);
}

@end