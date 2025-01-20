@interface RCLockScreenRecordingView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldEnableDoneButtonWhileRecording;
- (RCLockScreenRecordingViewControlInteractionDelegate)controlInteractionDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setControlInteractionDelegate:(id)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation RCLockScreenRecordingView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RCLockScreenRecordingView;
  -[RCLockScreenRecordingView hitTest:withEvent:](&v18, "hitTest:withEvent:", v7, x, y);
  v8 = (RCLockScreenRecordingView *)objc_claimAutoreleasedReturnValue();
  v9 = [(RCRecordingView *)self recordButton];

  v10 = v8;
  if (v8 != v9)
  {
    uint64_t v11 = [(RCRecordingView *)self doneButton];
    if (v8 == (RCLockScreenRecordingView *)v11)
    {
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(RCRecordingView *)self doneEditingButton];

      if (v8 != v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_10;
        }
        BOOL v14 = 0;
LABEL_9:
        [v7 timestamp];
        self->_lastInterceptedEventTimeStamp = v15;
        self->_didTapDone = v14;
LABEL_10:
        v10 = self;
        goto LABEL_11;
      }
    }
    BOOL v14 = 1;
    goto LABEL_9;
  }
LABEL_11:
  v16 = v10;

  return v16;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  [a4 timestamp:a3];
  if (vabdd_f64(v5, self->_lastInterceptedEventTimeStamp) < 0.5)
  {
    BOOL didTapDone = self->_didTapDone;
    id v7 = [(RCLockScreenRecordingView *)self controlInteractionDelegate];
    id v8 = v7;
    if (didTapDone) {
      [v7 lockScreenRecordingViewDidTapDone];
    }
    else {
      [v7 lockScreenRecordingViewDidTapControl];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 0;
}

- (void)setDisplayStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RCLockScreenRecordingView;
  [(RCRecordingView *)&v3 setDisplayStyle:3];
}

- (BOOL)shouldEnableDoneButtonWhileRecording
{
  return 0;
}

- (RCLockScreenRecordingViewControlInteractionDelegate)controlInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlInteractionDelegate);

  return (RCLockScreenRecordingViewControlInteractionDelegate *)WeakRetained;
}

- (void)setControlInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end