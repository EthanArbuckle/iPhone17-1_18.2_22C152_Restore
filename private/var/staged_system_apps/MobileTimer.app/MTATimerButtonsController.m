@interface MTATimerButtonsController
- (BOOL)shouldEnableStartButton;
- (MTACircleButton)cancelButton;
- (MTACircleButton)startStopButton;
- (MTATimerButtonsController)initWithTarget:(id)a3;
- (TimerControlsTarget)target;
- (unint64_t)buttonSize;
- (unint64_t)state;
- (void)_cancelButtonTapped:(id)a3;
- (void)_startStopButtonTapped:(id)a3;
- (void)handleContentSizeChange;
- (void)setButtonSize:(unint64_t)a3;
- (void)setShouldEnableStartButton:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation MTATimerButtonsController

- (MTATimerButtonsController)initWithTarget:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTATimerButtonsController;
  v5 = [(MTATimerButtonsController *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_target, v4);
    v6->_shouldEnableStartButton = 1;
    v7 = objc_alloc_init(MTACircleButton);
    startStopButton = v6->_startStopButton;
    v6->_startStopButton = v7;

    v9 = +[UIColor clearColor];
    [(MTACircleButton *)v6->_startStopButton setBackgroundColor:v9];

    [(MTACircleButton *)v6->_startStopButton addTarget:v6 action:"_startStopButtonTapped:" forControlEvents:64];
    v10 = +[UIShape circleShape];
    v11 = [(MTACircleButton *)v6->_startStopButton hoverStyle];
    [v11 setShape:v10];

    v12 = objc_alloc_init(MTACircleButton);
    cancelButton = v6->_cancelButton;
    v6->_cancelButton = v12;

    v14 = +[UIColor clearColor];
    [(MTACircleButton *)v6->_cancelButton setBackgroundColor:v14];

    [(MTACircleButton *)v6->_cancelButton addTarget:v6 action:"_cancelButtonTapped:" forControlEvents:64];
    v15 = +[UIShape circleShape];
    v16 = [(MTACircleButton *)v6->_cancelButton hoverStyle];
    [v16 setShape:v15];

    v17 = v6->_cancelButton;
    v18 = +[UIColor mtui_buttonBackgroundColor];
    [(MTACircleButton *)v17 setTintColor:v18];
  }
  return v6;
}

- (void)handleContentSizeChange
{
  [(MTACircleButton *)self->_startStopButton handleContentSizeChange];
  cancelButton = self->_cancelButton;

  [(MTACircleButton *)cancelButton handleContentSizeChange];
}

- (void)setButtonSize:(unint64_t)a3
{
  self->_buttonSize = a3;
  -[MTACircleButton setButtonCircleSize:](self->_startStopButton, "setButtonCircleSize:");
  [(MTACircleButton *)self->_cancelButton setButtonCircleSize:a3];
  unint64_t state = self->_state;

  [(MTATimerButtonsController *)self setState:state];
}

- (void)setShouldEnableStartButton:(BOOL)a3
{
  if (self->_shouldEnableStartButton != a3)
  {
    self->_shouldEnableStartButton = a3;
    [(MTATimerButtonsController *)self setState:self->_state];
  }
}

- (void)_startStopButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    int v8 = 138543618;
    v9 = self;
    __int16 v10 = 2050;
    unint64_t v11 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ start/stop button tapped with state: %{public}lu", (uint8_t *)&v8, 0x16u);
  }

  switch(self->_state)
  {
    case 0uLL:
    case 4uLL:
      NSLog(@"Attempting to start/stop timer in an unknown state");
      break;
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained startTimer:v4];
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained pauseResumeTimer:v4];
LABEL_7:

      break;
    default:
      break;
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t state = self->_state;
    int v9 = 138543618;
    __int16 v10 = self;
    __int16 v11 = 2050;
    unint64_t v12 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel button tapped with state: %{public}lu", (uint8_t *)&v9, 0x16u);
  }

  unint64_t v7 = self->_state;
  if (v7 <= 4)
  {
    if (((1 << v7) & 0x13) != 0)
    {
      NSLog(@"Attempting to cancel a timer in a stopped or unknown state");
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained cancelTimer:v4];
    }
  }
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
  if (a3 == 3)
  {
    startStopButton = self->_startStopButton;
    __int16 v11 = +[NSBundle mainBundle];
    unint64_t v12 = [v11 localizedStringForKey:@"PAUSE_TIMER" value:&stru_1000A2560 table:0];
    [(MTACircleButton *)startStopButton setTitle:v12 forState:0];

    v13 = self->_startStopButton;
    v14 = +[UIColor mtui_pauseButtonTextColor];
    [(MTACircleButton *)v13 setTitleColor:v14 forState:0];

    v15 = self->_startStopButton;
    uint64_t v16 = +[UIColor mtui_pauseButtonTintColor];
LABEL_8:
    v22 = (void *)v16;
    [(MTACircleButton *)v15 setTintColor:v16];

    cancelButton = self->_cancelButton;
    LODWORD(v22) = MTUIIsPhoneIdiom();
    v24 = +[NSBundle mainBundle];
    v25 = v24;
    if (v22) {
      CFStringRef v26 = @"CANCEL_TIMER";
    }
    else {
      CFStringRef v26 = @"CANCEL";
    }
    v27 = [v24 localizedStringForKey:v26 value:&stru_1000A2560 table:0];
    [(MTACircleButton *)cancelButton setTitle:v27 forState:0];

    v28 = self->_cancelButton;
    uint64_t v29 = +[UIColor mtui_primaryColor];
    goto LABEL_17;
  }
  if (a3 == 2)
  {
    v17 = self->_startStopButton;
    v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"RESUME_TIMER" value:&stru_1000A2560 table:0];
    [(MTACircleButton *)v17 setTitle:v19 forState:0];

    objc_super v20 = self->_startStopButton;
    v21 = +[UIColor mtui_startResumeButtonTextColor];
    [(MTACircleButton *)v20 setTitleColor:v21 forState:0];

    v15 = self->_startStopButton;
    uint64_t v16 = +[UIColor mtui_startResumeButtonTintColor];
    goto LABEL_8;
  }
  if (a3 != 1) {
    goto LABEL_18;
  }
  id v4 = self->_startStopButton;
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"START_TIMER" value:&stru_1000A2560 table:0];
  [(MTACircleButton *)v4 setTitle:v6 forState:0];

  unint64_t v7 = self->_startStopButton;
  int v8 = +[UIColor mtui_startResumeButtonTextColor];
  [(MTACircleButton *)v7 setTitleColor:v8 forState:0];

  int v9 = self->_startStopButton;
  if (self->_shouldEnableStartButton) {
    +[UIColor mtui_startResumeButtonTintColor];
  }
  else {
  v30 = +[UIColor mtui_disabledStartButtonTintColor];
  }
  [(MTACircleButton *)v9 setTintColor:v30];

  v31 = self->_cancelButton;
  LODWORD(v30) = MTUIIsPhoneIdiom();
  v32 = +[NSBundle mainBundle];
  v33 = v32;
  if (v30) {
    CFStringRef v34 = @"CANCEL_TIMER";
  }
  else {
    CFStringRef v34 = @"CANCEL";
  }
  v35 = [v32 localizedStringForKey:v34 value:&stru_1000A2560 table:0];
  [(MTACircleButton *)v31 setTitle:v35 forState:0];

  v28 = self->_cancelButton;
  uint64_t v29 = +[UIColor mtui_tertiaryColor];
LABEL_17:
  v36 = (void *)v29;
  [(MTACircleButton *)v28 setTitleColor:v29 forState:0];

LABEL_18:
  [(MTACircleButton *)self->_startStopButton setEnabled:self->_shouldEnableStartButton];
  [(MTACircleButton *)self->_startStopButton cancelTrackingWithEvent:0];
  v37 = self->_cancelButton;

  [(MTACircleButton *)v37 cancelTrackingWithEvent:0];
}

- (TimerControlsTarget)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (TimerControlsTarget *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (MTACircleButton)startStopButton
{
  return self->_startStopButton;
}

- (MTACircleButton)cancelButton
{
  return self->_cancelButton;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)buttonSize
{
  return self->_buttonSize;
}

- (BOOL)shouldEnableStartButton
{
  return self->_shouldEnableStartButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);

  objc_destroyWeak((id *)&self->_target);
}

@end