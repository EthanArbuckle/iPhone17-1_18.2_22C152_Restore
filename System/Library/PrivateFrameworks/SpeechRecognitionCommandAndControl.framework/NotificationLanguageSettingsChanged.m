@interface NotificationLanguageSettingsChanged
@end

@implementation NotificationLanguageSettingsChanged

void ___NotificationLanguageSettingsChanged_block_invoke()
{
  id v0 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v0 _handleLanguageChange];
}

@end