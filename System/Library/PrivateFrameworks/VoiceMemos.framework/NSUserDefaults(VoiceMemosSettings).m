@interface NSUserDefaults(VoiceMemosSettings)
+ (id)voiceMemosUserDefaults;
+ (uint64_t)_isRunningInVoiceMemos;
+ (uint64_t)sharedSettingsUserDefaults;
- (BOOL)_deletionMatchesWindow:()VoiceMemosSettings;
- (uint64_t)rc_audioQuality;
- (uint64_t)rc_deletionIsImmediate;
- (uint64_t)rc_deletionIsNever;
- (uint64_t)rc_recentlyDeletedWindow;
- (uint64_t)rc_setAudioQuality:()VoiceMemosSettings;
- (uint64_t)rc_setRecentlyDeletedWindow:()VoiceMemosSettings;
- (uint64_t)rc_setUseLocationBasedNaming:()VoiceMemosSettings;
- (uint64_t)rc_setUseStereoRecording:()VoiceMemosSettings;
- (uint64_t)rc_useLocationBasedNaming;
- (uint64_t)rc_useStereoRecording;
- (void)settingsChangedPostNotification;
@end

@implementation NSUserDefaults(VoiceMemosSettings)

+ (uint64_t)sharedSettingsUserDefaults
{
  return [MEMORY[0x1E4F1CB18] voiceMemosUserDefaults];
}

- (BOOL)_deletionMatchesWindow:()VoiceMemosSettings
{
  return objc_msgSend(a1, "rc_recentlyDeletedWindow") == a3;
}

- (uint64_t)rc_recentlyDeletedWindow
{
  v1 = [a1 objectForKey:@"RCVoiceMemosRecentlyDeletedWindowKey"];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 30;
  }

  return v3;
}

- (uint64_t)rc_deletionIsNever
{
  return [a1 _deletionMatchesWindow:-1];
}

- (uint64_t)rc_deletionIsImmediate
{
  return [a1 _deletionMatchesWindow:0];
}

+ (uint64_t)_isRunningInVoiceMemos
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.VoiceMemos"];

  return v2;
}

+ (id)voiceMemosUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NSUserDefaults_VoiceMemosSettings__voiceMemosUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (voiceMemosUserDefaults_onceToken != -1) {
    dispatch_once(&voiceMemosUserDefaults_onceToken, block);
  }
  v1 = (void *)voiceMemosUserDefaults_voiceMemosUserDefaults;
  return v1;
}

- (uint64_t)rc_audioQuality
{
  v1 = [a1 objectForKey:@"RCVoiceMemosAudioQualityKey"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)rc_setRecentlyDeletedWindow:()VoiceMemosSettings
{
  [a1 setInteger:a3 forKey:@"RCVoiceMemosRecentlyDeletedWindowKey"];
  return [a1 settingsChangedPostNotification];
}

- (uint64_t)rc_setAudioQuality:()VoiceMemosSettings
{
  [a1 setInteger:a3 forKey:@"RCVoiceMemosAudioQualityKey"];
  return [a1 settingsChangedPostNotification];
}

- (uint64_t)rc_useLocationBasedNaming
{
  v1 = [a1 objectForKey:@"RCVoiceMemosUseLocationBasedNaming"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)rc_setUseLocationBasedNaming:()VoiceMemosSettings
{
  [a1 setBool:a3 forKey:@"RCVoiceMemosUseLocationBasedNaming"];
  return [a1 settingsChangedPostNotification];
}

- (uint64_t)rc_useStereoRecording
{
  v1 = [a1 objectForKey:@"RCVoiceMemosStereoRecordingKey"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)rc_setUseStereoRecording:()VoiceMemosSettings
{
  [a1 setBool:a3 forKey:@"RCVoiceMemosStereoRecordingKey"];
  return [a1 settingsChangedPostNotification];
}

- (void)settingsChangedPostNotification
{
  id v0 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v0 postNotificationName:@"RCVoiceMemosSettingsDidChangeNotification" object:0 userInfo:0 deliverImmediately:1];
}

@end