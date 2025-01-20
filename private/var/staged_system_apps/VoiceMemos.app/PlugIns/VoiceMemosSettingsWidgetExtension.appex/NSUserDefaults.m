@interface NSUserDefaults
+ (BOOL)_isRunningInVoiceMemos;
+ (id)sharedSettingsUserDefaults;
+ (id)voiceMemosUserDefaults;
- (BOOL)_deletionMatchesWindow:(int64_t)a3;
- (BOOL)rc_deletionIsImmediate;
- (BOOL)rc_deletionIsNever;
- (BOOL)rc_useLocationBasedNaming;
- (BOOL)rc_useStereoRecording;
- (int64_t)rc_audioQuality;
- (int64_t)rc_recentlyDeletedWindow;
- (void)rc_setAudioQuality:(int64_t)a3;
- (void)rc_setRecentlyDeletedWindow:(int64_t)a3;
- (void)rc_setUseLocationBasedNaming:(BOOL)a3;
- (void)rc_setUseStereoRecording:(BOOL)a3;
- (void)settingsChangedPostNotification;
@end

@implementation NSUserDefaults

+ (id)sharedSettingsUserDefaults
{
  return +[NSUserDefaults voiceMemosUserDefaults];
}

- (BOOL)rc_deletionIsImmediate
{
  return [(NSUserDefaults *)self _deletionMatchesWindow:0];
}

- (BOOL)rc_deletionIsNever
{
  return [(NSUserDefaults *)self _deletionMatchesWindow:-1];
}

- (BOOL)_deletionMatchesWindow:(int64_t)a3
{
  return [(NSUserDefaults *)self rc_recentlyDeletedWindow] == a3;
}

- (int64_t)rc_recentlyDeletedWindow
{
  v2 = [(NSUserDefaults *)self objectForKey:@"RCVoiceMemosRecentlyDeletedWindowKey"];
  v3 = v2;
  if (v2) {
    int64_t v4 = (int64_t)[v2 integerValue];
  }
  else {
    int64_t v4 = 30;
  }

  return v4;
}

- (void)rc_setRecentlyDeletedWindow:(int64_t)a3
{
  [(NSUserDefaults *)self setInteger:a3 forKey:@"RCVoiceMemosRecentlyDeletedWindowKey"];

  [(NSUserDefaults *)self settingsChangedPostNotification];
}

- (int64_t)rc_audioQuality
{
  v2 = [(NSUserDefaults *)self objectForKey:@"RCVoiceMemosAudioQualityKey"];
  v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (void)rc_setAudioQuality:(int64_t)a3
{
  [(NSUserDefaults *)self setInteger:a3 forKey:@"RCVoiceMemosAudioQualityKey"];

  [(NSUserDefaults *)self settingsChangedPostNotification];
}

- (BOOL)rc_useLocationBasedNaming
{
  v2 = [(NSUserDefaults *)self objectForKey:@"RCVoiceMemosUseLocationBasedNaming"];
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)rc_setUseLocationBasedNaming:(BOOL)a3
{
  [(NSUserDefaults *)self setBool:a3 forKey:@"RCVoiceMemosUseLocationBasedNaming"];

  [(NSUserDefaults *)self settingsChangedPostNotification];
}

- (BOOL)rc_useStereoRecording
{
  v2 = [(NSUserDefaults *)self objectForKey:@"RCVoiceMemosStereoRecordingKey"];
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)rc_setUseStereoRecording:(BOOL)a3
{
  [(NSUserDefaults *)self setBool:a3 forKey:@"RCVoiceMemosStereoRecordingKey"];

  [(NSUserDefaults *)self settingsChangedPostNotification];
}

- (void)settingsChangedPostNotification
{
  id v2 = +[NSDistributedNotificationCenter defaultCenter];
  [v2 postNotificationName:@"RCVoiceMemosSettingsDidChangeNotification" object:0 userInfo:0 deliverImmediately:1];
}

+ (BOOL)_isRunningInVoiceMemos
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 bundleIdentifier];
  unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.VoiceMemos"];

  return v4;
}

+ (id)voiceMemosUserDefaults
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004740;
  block[3] = &unk_100020D50;
  block[4] = a1;
  if (qword_100024F28 != -1) {
    dispatch_once(&qword_100024F28, block);
  }
  id v2 = (void *)qword_100024F20;

  return v2;
}

@end