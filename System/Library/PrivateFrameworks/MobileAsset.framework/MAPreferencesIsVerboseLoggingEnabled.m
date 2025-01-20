@interface MAPreferencesIsVerboseLoggingEnabled
@end

@implementation MAPreferencesIsVerboseLoggingEnabled

void ___MAPreferencesIsVerboseLoggingEnabled_block_invoke()
{
  if (_MAPreferencesIsInternalAllowed_onceToken != -1) {
    dispatch_once(&_MAPreferencesIsInternalAllowed_onceToken, &__block_literal_global_1168);
  }
  if (_MAPreferencesIsInternalAllowed__isAppleInternal)
  {
    char v1 = 0;
    char AppBooleanValue = _MAPreferencesGetAppBooleanValue(@"EnableVerboseLogging", &v1);
    if (v1) {
      _MAPreferencesIsVerboseLoggingEnabled__verboseLoggingEnabled = AppBooleanValue;
    }
  }
}

@end