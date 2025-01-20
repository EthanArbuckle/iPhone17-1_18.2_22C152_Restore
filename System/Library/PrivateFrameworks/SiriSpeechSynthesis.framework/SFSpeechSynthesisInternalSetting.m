@interface SFSpeechSynthesisInternalSetting
+ (id)sharedInstance;
- (BOOL)disableCaching;
- (NSString)deviceId;
- (NSString)ospreyEndpointURL;
- (NSUserDefaults)defaults;
- (SFSpeechSynthesisInternalSetting)init;
- (id)ospreyEndpointURLByType:(int64_t)a3;
- (void)setDefaults:(id)a3;
@end

@implementation SFSpeechSynthesisInternalSetting

- (void).cxx_destruct
{
}

- (void)setDefaults:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (BOOL)disableCaching
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"disableCaching"];
}

- (NSString)deviceId
{
  v3 = [(NSUserDefaults *)self->_defaults stringForKey:@"deviceId"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    id v5 = [v6 UUIDString];

    [(NSUserDefaults *)self->_defaults setObject:v5 forKey:@"deviceId"];
    [(NSUserDefaults *)self->_defaults synchronize];
  }

  return (NSString *)v5;
}

- (id)ospreyEndpointURLByType:(int64_t)a3
{
  int64_t v3 = a3 - 1;
  if (unint64_t)(a3 - 1) < 7 && ((0x5Fu >> v3))
  {
    v4 = off_26489EAA0[v3];
  }
  else
  {
    v4 = [(SFSpeechSynthesisInternalSetting *)self ospreyEndpointURL];
  }
  return v4;
}

- (NSString)ospreyEndpointURL
{
  v2 = [(NSUserDefaults *)self->_defaults stringForKey:@"ospreyEndpointUrl"];
  int64_t v3 = v2;
  if (v2 && [v2 length])
  {
    v4 = v3;
  }
  else if (+[SFSpeechSynthesisUtils isInternalBuild])
  {
    v4 = @"https://carry-dejavu.siri.apple.com";
  }
  else
  {
    v4 = @"https://dejavu.apple.com";
  }

  return (NSString *)v4;
}

- (SFSpeechSynthesisInternalSetting)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFSpeechSynthesisInternalSetting;
  v2 = [(SFSpeechSynthesisInternalSetting *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.speech.speechsynthesis"];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1775 != -1) {
    dispatch_once(&sharedInstance_onceToken_1775, &__block_literal_global_1776);
  }
  v2 = (void *)sharedInstance___standardInstance;
  return v2;
}

uint64_t __50__SFSpeechSynthesisInternalSetting_sharedInstance__block_invoke()
{
  sharedInstance___standardInstance = objc_alloc_init(SFSpeechSynthesisInternalSetting);
  return MEMORY[0x270F9A758]();
}

@end