@interface UIInternalPreferencesListener
@end

@implementation UIInternalPreferencesListener

void _UIInternalPreferencesListener___COUNTER___block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"_UIVisualEffectViewPreferenceUpdate" object:0];
}

void _UIInternalPreferencesListener___COUNTER___block_invoke_0()
{
  if (_os_feature_enabled_impl())
  {
    id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v0 postNotificationName:@"_UIFocusBehaviorDidChangeNotification" object:0];
  }
}

@end