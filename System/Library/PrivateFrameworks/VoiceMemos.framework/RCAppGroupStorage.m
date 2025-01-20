@interface RCAppGroupStorage
+ (RCAppGroupStorage)sharedInstance;
- (BOOL)enableOverdubForAllDevices;
- (BOOL)isRecording;
- (BOOL)transcriptionIsSupported;
- (NSUserDefaults)userDefaults;
- (RCAppGroupStorage)init;
- (void)init;
- (void)setIsRecording:(BOOL)a3;
- (void)setTranscriptionIsSupported:(BOOL)a3;
@end

@implementation RCAppGroupStorage

- (BOOL)transcriptionIsSupported
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"RCTranscriptionIsSupported"];
}

- (void)setIsRecording:(BOOL)a3
{
}

+ (RCAppGroupStorage)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return (RCAppGroupStorage *)v2;
}

uint64_t __35__RCAppGroupStorage_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(RCAppGroupStorage);
  return MEMORY[0x1F41817F8]();
}

- (RCAppGroupStorage)init
{
  v7.receiver = self;
  v7.super_class = (Class)RCAppGroupStorage;
  v2 = [(RCAppGroupStorage *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.VoiceMemos.shared"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    if (!v2->_userDefaults)
    {
      v5 = OSLogForCategory(@"Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[RCAppGroupStorage init](v5);
      }
    }
  }
  return v2;
}

- (void)setTranscriptionIsSupported:(BOOL)a3
{
}

- (BOOL)isRecording
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"RCVoiceMemosIsRecording"];
}

- (BOOL)enableOverdubForAllDevices
{
  int v3 = RCIsInternalInstall();
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

- (void)init
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[RCAppGroupStorage init]";
  _os_log_fault_impl(&dword_1C3964000, log, OS_LOG_TYPE_FAULT, "%s -- app group user defaults are nil", (uint8_t *)&v1, 0xCu);
}

@end