@interface NotificationCommandsSettingsChanged
@end

@implementation NotificationCommandsSettingsChanged

void ___NotificationCommandsSettingsChanged_block_invoke()
{
  v0 = (void *)MEMORY[0x263F8C6D0];
  v1 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 cancelPreviousPerformRequestsWithTarget:v1 selector:sel__rebuildCommandRecognizers object:0];

  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 performSelector:sel__rebuildCommandRecognizers withObject:0 afterDelay:1.0];
}

@end