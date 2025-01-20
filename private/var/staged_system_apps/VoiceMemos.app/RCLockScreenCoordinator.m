@interface RCLockScreenCoordinator
- (BOOL)lockscreenWillDismissAfterRecording;
- (RCLockScreenCoordinator)init;
- (void)lockScreenRecordingViewControllerWantsUnlockFromControl:(BOOL)a3;
- (void)lockScreenRecordingViewWillPauseRecording;
@end

@implementation RCLockScreenCoordinator

- (BOOL)lockscreenWillDismissAfterRecording
{
  return (*((unsigned char *)&self->super.isa + OBJC_IVAR___RCLockScreenCoordinator_willPauseForRecording) & 1) == 0;
}

- (RCLockScreenCoordinator)init
{
  return (RCLockScreenCoordinator *)sub_1000E8400();
}

- (void)lockScreenRecordingViewControllerWantsUnlockFromControl:(BOOL)a3
{
}

- (void)lockScreenRecordingViewWillPauseRecording
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___RCLockScreenCoordinator_willPauseForRecording) = 1;
}

- (void).cxx_destruct
{
}

@end