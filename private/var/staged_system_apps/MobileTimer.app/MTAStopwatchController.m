@interface MTAStopwatchController
- (MTACircleButton)lapControlButton;
- (MTACircleButton)startStopButton;
- (MTAStopwatchController)initWithTarget:(id)a3;
- (MTAStopwatchControlsTarget)target;
- (unint64_t)mode;
- (void)_lapControlButtonDown:(id)a3;
- (void)_startStopButtonDown:(id)a3;
- (void)setButtonSize:(unint64_t)a3;
- (void)setMode:(unint64_t)a3;
- (void)setMode:(unint64_t)a3 force:(BOOL)a4;
@end

@implementation MTAStopwatchController

- (MTAStopwatchController)initWithTarget:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTAStopwatchController;
  v5 = [(MTAStopwatchController *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_target, v4);
    v7 = objc_alloc_init(MTACircleButton);
    startStopButton = v6->_startStopButton;
    v6->_startStopButton = v7;

    v9 = v6->_startStopButton;
    v10 = +[UIColor clearColor];
    [(MTACircleButton *)v9 setBackgroundColor:v10];

    [(MTACircleButton *)v6->_startStopButton addTarget:v6 action:"_startStopButtonDown:" forControlEvents:64];
    [(MTACircleButton *)v6->_startStopButton setButtonCircleSize:0];
    v11 = +[UIShape circleShape];
    v12 = [(MTACircleButton *)v6->_startStopButton hoverStyle];
    [v12 setShape:v11];

    v13 = objc_alloc_init(MTACircleButton);
    lapControlButton = v6->_lapControlButton;
    v6->_lapControlButton = v13;

    v15 = v6->_lapControlButton;
    v16 = +[UIColor clearColor];
    [(MTACircleButton *)v15 setBackgroundColor:v16];

    [(MTACircleButton *)v6->_lapControlButton addTarget:v6 action:"_lapControlButtonDown:" forControlEvents:64];
    [(MTACircleButton *)v6->_lapControlButton setButtonCircleSize:0];
    v17 = +[UIShape circleShape];
    v18 = [(MTACircleButton *)v6->_lapControlButton hoverStyle];
    [v18 setShape:v17];
  }
  return v6;
}

- (void)setButtonSize:(unint64_t)a3
{
  -[MTACircleButton setButtonCircleSize:](self->_startStopButton, "setButtonCircleSize:");
  lapControlButton = self->_lapControlButton;

  [(MTACircleButton *)lapControlButton setButtonCircleSize:a3];
}

- (void)_startStopButtonDown:(id)a3
{
  id v4 = a3;
  unint64_t mode = self->_mode;
  switch(mode)
  {
    case 3uLL:
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained resumeLapTimer];
      break;
    case 2uLL:
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained pauseLapTimer];
      break;
    case 1uLL:
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained startLapTimer];
      break;
    default:
      goto LABEL_8;
  }

  id v4 = v7;
LABEL_8:
}

- (void)_lapControlButtonDown:(id)a3
{
  id v4 = a3;
  unint64_t mode = self->_mode;
  if (mode != 3)
  {
    if (mode == 2)
    {
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
      [WeakRetained lapLapTimer];
      goto LABEL_6;
    }
    if (mode != 1) {
      goto LABEL_7;
    }
  }
  id v7 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained resetLapTimer];
LABEL_6:

  id v4 = v7;
LABEL_7:
}

- (void)setMode:(unint64_t)a3
{
}

- (void)setMode:(unint64_t)a3 force:(BOOL)a4
{
  if (!a4 && self->_mode == a3) {
    return;
  }
  self->_unint64_t mode = a3;
  switch(a3)
  {
    case 3uLL:
      startStopButton = self->_startStopButton;
      objc_super v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"RESUME_STOPWATCH" value:&stru_1000A2560 table:0];
      [(MTACircleButton *)startStopButton setTitle:v21 forState:0];

      v22 = self->_startStopButton;
      v23 = +[UIColor mtui_startResumeButtonTextColor];
      [(MTACircleButton *)v22 setTitleColor:v23 forState:0];

      v24 = self->_startStopButton;
      v25 = +[UIColor mtui_startResumeButtonTintColor];
      [(MTACircleButton *)v24 setTintColor:v25];

      lapControlButton = self->_lapControlButton;
      v27 = +[NSBundle mainBundle];
      v28 = v27;
      CFStringRef v29 = @"RESET_STOPWATCH";
      break;
    case 2uLL:
      v30 = self->_startStopButton;
      v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"PAUSE_STOPWATCH" value:&stru_1000A2560 table:0];
      [(MTACircleButton *)v30 setTitle:v32 forState:0];

      v33 = self->_startStopButton;
      v34 = +[UIColor mtui_stopButtonTextColor];
      [(MTACircleButton *)v33 setTitleColor:v34 forState:0];

      v35 = self->_startStopButton;
      v36 = +[UIColor mtui_stopButtonTintColor];
      [(MTACircleButton *)v35 setTintColor:v36];

      lapControlButton = self->_lapControlButton;
      v27 = +[NSBundle mainBundle];
      v28 = v27;
      CFStringRef v29 = @"MARK_LAP_STOPWATCH";
      break;
    case 1uLL:
      v5 = self->_startStopButton;
      v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"START_STOPWATCH" value:&stru_1000A2560 table:0];
      [(MTACircleButton *)v5 setTitle:v7 forState:0];

      v8 = self->_startStopButton;
      v9 = +[UIColor mtui_startResumeButtonTextColor];
      [(MTACircleButton *)v8 setTitleColor:v9 forState:0];

      v10 = self->_startStopButton;
      v11 = +[UIColor mtui_startResumeButtonTintColor];
      [(MTACircleButton *)v10 setTintColor:v11];

      v12 = self->_lapControlButton;
      v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"MARK_LAP_STOPWATCH" value:&stru_1000A2560 table:0];
      [(MTACircleButton *)v12 setTitle:v14 forState:0];

      v15 = self->_lapControlButton;
      v16 = +[UIColor mtui_disabledTextColor];
      [(MTACircleButton *)v15 setTitleColor:v16 forState:0];

      v17 = self->_lapControlButton;
      uint64_t v18 = +[UIColor mtui_disabledButtonTintColor];
      goto LABEL_11;
    default:
      return;
  }
  v37 = [v27 localizedStringForKey:v29 value:&stru_1000A2560 table:0];
  [(MTACircleButton *)lapControlButton setTitle:v37 forState:0];

  v38 = self->_lapControlButton;
  v39 = +[UIColor mtui_primaryColor];
  [(MTACircleButton *)v38 setTitleColor:v39 forState:0];

  v17 = self->_lapControlButton;
  uint64_t v18 = +[UIColor mtui_lapResetButtonTintColor];
LABEL_11:
  id v40 = (id)v18;
  [(MTACircleButton *)v17 setTintColor:v18];
}

- (MTAStopwatchControlsTarget)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MTAStopwatchControlsTarget *)WeakRetained;
}

- (MTACircleButton)startStopButton
{
  return self->_startStopButton;
}

- (MTACircleButton)lapControlButton
{
  return self->_lapControlButton;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lapControlButton, 0);
  objc_storeStrong((id *)&self->_startStopButton, 0);

  objc_destroyWeak((id *)&self->_target);
}

@end