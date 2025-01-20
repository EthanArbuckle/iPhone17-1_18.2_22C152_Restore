@interface TKVibrationRecorderViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBeShownFromSuspendedState;
- (TKVibrationRecorderViewController)initWithVibratorController:(id)a3;
- (TKVibrationRecorderViewControllerDelegate)vibrationRecorderViewControllerDelegate;
- (void)dealloc;
- (void)setVibrationRecorderViewControllerDelegate:(id)a3;
@end

@implementation TKVibrationRecorderViewController

- (TKVibrationRecorderViewController)initWithVibratorController:(id)a3
{
  id v4 = a3;
  v5 = [[TKVibrationRecorderContentViewController alloc] initWithVibratorController:v4];

  v6 = [(TKVibrationRecorderViewController *)self initWithRootViewController:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vibrationRecorderContentViewController, v5);
    [(TKVibrationRecorderContentViewController *)v7->_vibrationRecorderContentViewController setParentVibrationRecorderViewController:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(TKVibrationRecorderContentViewController *)self->_vibrationRecorderContentViewController setParentVibrationRecorderViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderViewController;
  [(TKVibrationRecorderViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TKVibrationRecorderViewControllerDelegate)vibrationRecorderViewControllerDelegate
{
  return [(TKVibrationRecorderContentViewController *)self->_vibrationRecorderContentViewController delegate];
}

- (void)setVibrationRecorderViewControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

@end