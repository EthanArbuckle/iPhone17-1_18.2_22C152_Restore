@interface RCLockScreenRecordingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isLockScreenController;
- (Class)_viewClass;
- (RCLockScreenRecordingViewControllerDelegate)delegate;
- (void)actionActivated:(int64_t)a3;
- (void)lockScreenRecordingViewDidTapControl;
- (void)lockScreenRecordingViewDidTapDone;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation RCLockScreenRecordingViewController

- (Class)_viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCLockScreenRecordingViewController;
  [(RCRecordingViewController *)&v4 viewDidLoad];
  v3 = [(RCLockScreenRecordingViewController *)self view];
  [v3 setControlInteractionDelegate:self];
}

- (void)actionActivated:(int64_t)a3
{
  if (a3 == 2)
  {
    v5 = [(RCLockScreenRecordingViewController *)self delegate];
    [v5 lockScreenRecordingViewWillPauseRecording];
  }
  v6.receiver = self;
  v6.super_class = (Class)RCLockScreenRecordingViewController;
  [(RCRecordingViewController *)&v6 actionActivated:a3];
}

- (void)lockScreenRecordingViewDidTapDone
{
  id v2 = [(RCLockScreenRecordingViewController *)self delegate];
  [v2 lockScreenRecordingViewControllerWantsUnlockFromControl:1];
}

- (void)lockScreenRecordingViewDidTapControl
{
  id v2 = [(RCLockScreenRecordingViewController *)self delegate];
  [v2 lockScreenRecordingViewControllerWantsUnlockFromControl:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isLockScreenController
{
  return 1;
}

- (RCLockScreenRecordingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCLockScreenRecordingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end