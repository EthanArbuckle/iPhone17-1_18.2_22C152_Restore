@interface RCAppGroupStorage
+ (RCAppGroupStorage)sharedInstance;
- (BOOL)enableOverdubForAllDevices;
- (BOOL)isRecording;
- (BOOL)transcriptionIsSupported;
- (NSUserDefaults)userDefaults;
- (RCAppGroupStorage)init;
- (void)setIsRecording:(BOOL)a3;
- (void)setTranscriptionIsSupported:(BOOL)a3;
@end

@implementation RCAppGroupStorage

+ (RCAppGroupStorage)sharedInstance
{
  if (qword_100024F50 != -1) {
    dispatch_once(&qword_100024F50, &stru_100020DD8);
  }
  v2 = (void *)qword_100024F58;

  return (RCAppGroupStorage *)v2;
}

- (RCAppGroupStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)RCAppGroupStorage;
  v2 = [(RCAppGroupStorage *)&v7 init];
  if (v2)
  {
    v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"group.com.apple.VoiceMemos.shared"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v3;

    if (!v2->_userDefaults)
    {
      v5 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_100017DDC(v5);
      }
    }
  }
  return v2;
}

- (BOOL)transcriptionIsSupported
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"RCTranscriptionIsSupported"];
}

- (void)setTranscriptionIsSupported:(BOOL)a3
{
}

- (BOOL)isRecording
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"RCVoiceMemosIsRecording"];
}

- (void)setIsRecording:(BOOL)a3
{
}

- (BOOL)enableOverdubForAllDevices
{
  int v3 = sub_1000047A4();
  if (v3)
  {
    userDefaults = self->_userDefaults;
    LOBYTE(v3) = [(NSUserDefaults *)userDefaults BOOLForKey:@"RCEnableOverdubForAllDevices"];
  }
  return v3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

@end