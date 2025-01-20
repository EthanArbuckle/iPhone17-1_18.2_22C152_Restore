@interface SoundDetectionNotificationViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (void)didReceiveNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation SoundDetectionNotificationViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)SoundDetectionNotificationViewController;
  [(SoundDetectionNotificationViewController *)&v2 viewDidLoad];
}

- (void)didReceiveNotification:(id)a3
{
  id v3 = a3;
  v4 = AXLogUltron();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000039C8((uint64_t)v3, v4);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

@end