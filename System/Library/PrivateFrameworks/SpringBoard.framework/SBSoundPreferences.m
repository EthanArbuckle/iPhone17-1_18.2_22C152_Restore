@interface SBSoundPreferences
+ (BOOL)vibrateWhenRinging;
+ (BOOL)vibrateWhenSilent;
+ (id)_soundDefaults;
+ (id)calendarAlarmPath;
+ (id)ringtoneIdentifier;
+ (id)ringtonePath;
@end

@implementation SBSoundPreferences

+ (id)_soundDefaults
{
  if (_soundDefaults___once != -1) {
    dispatch_once(&_soundDefaults___once, &__block_literal_global_33);
  }
  v2 = (void *)_soundDefaults___instance;
  return v2;
}

void __36__SBSoundPreferences__soundDefaults__block_invoke()
{
  id v2 = +[SBDefaults localDefaults];
  uint64_t v0 = [v2 soundDefaults];
  v1 = (void *)_soundDefaults___instance;
  _soundDefaults___instance = v0;
}

+ (id)calendarAlarmPath
{
  id v2 = [a1 _soundDefaults];
  v3 = [v2 calendarAlarmPath];

  return v3;
}

+ (id)ringtoneIdentifier
{
  id v2 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
  v3 = [v2 currentToneIdentifierForAlertType:1];

  return v3;
}

+ (id)ringtonePath
{
  id v2 = +[SBSoundPreferences ringtoneIdentifier];
  v3 = [MEMORY[0x1E4FAF5F0] sharedToneManager];
  v4 = [v3 filePathForToneIdentifier:v2];

  return v4;
}

+ (BOOL)vibrateWhenRinging
{
  id v2 = [a1 _soundDefaults];
  char v3 = [v2 vibrateWhenRinging];

  return v3;
}

+ (BOOL)vibrateWhenSilent
{
  id v2 = [a1 _soundDefaults];
  char v3 = [v2 vibrateWhenSilent];

  return v3;
}

@end