@interface SiriUIPreferences
+ (id)sharedPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)voiceRequestMadeWhileInCarDND;
- (SiriUIPreferences)init;
- (id)objectForKey:(id)a3;
- (id)previousSiriRequestErrorTimestamp;
- (int64_t)integerForKey:(id)a3;
- (int64_t)numberOfTimesCarDNDSiriCardShown;
- (int64_t)siriRequestErrorCount;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setNumberOfTimesCarDNDSiriCardShown:(int64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPreviousSiriRequestErrorTimestamp:(id)a3;
- (void)setSiriRequestErrorCount:(int64_t)a3;
- (void)setVoiceRequestMadeWhileInCarDND:(BOOL)a3;
@end

@implementation SiriUIPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1) {
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedPreferences_sharedInstance;
  return v2;
}

uint64_t __38__SiriUIPreferences_sharedPreferences__block_invoke()
{
  v0 = objc_alloc_init(SiriUIPreferences);
  uint64_t v1 = sharedPreferences_sharedInstance;
  sharedPreferences_sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUIPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriUIPreferences;
  v2 = [(SiriUIPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.carDND"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;
  }
  return v2;
}

- (id)previousSiriRequestErrorTimestamp
{
  previousSiriRequestErrorTimestamp = self->_previousSiriRequestErrorTimestamp;
  if (!previousSiriRequestErrorTimestamp)
  {
    v4 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"previousSiriRequestErrorTimestamp"];
    v5 = self->_previousSiriRequestErrorTimestamp;
    self->_previousSiriRequestErrorTimestamp = v4;

    previousSiriRequestErrorTimestamp = self->_previousSiriRequestErrorTimestamp;
  }
  return previousSiriRequestErrorTimestamp;
}

- (void)setPreviousSiriRequestErrorTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_previousSiriRequestErrorTimestamp, a3);
  id v5 = a3;
  [(NSUserDefaults *)self->_userDefaults setObject:v5 forKey:@"previousSiriRequestErrorTimestamp"];
}

- (int64_t)siriRequestErrorCount
{
  int64_t result = self->_siriRequestErrorCount;
  if (!result)
  {
    int64_t result = [(NSUserDefaults *)self->_userDefaults integerForKey:@"siriRequestErrorCount"];
    self->_siriRequestErrorCount = result;
  }
  return result;
}

- (void)setSiriRequestErrorCount:(int64_t)a3
{
  self->_siriRequestErrorCount = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (BOOL)voiceRequestMadeWhileInCarDND
{
  if (self->_voiceRequestMadeWhileInCarDND) {
    return 1;
  }
  BOOL result = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"voiceRequestMadeWhileInCarDND"];
  self->_voiceRequestMadeWhileInCarDND = result;
  return result;
}

- (void)setVoiceRequestMadeWhileInCarDND:(BOOL)a3
{
  self->_voiceRequestMadeWhileInCarDND = a3;
  -[NSUserDefaults setBool:forKey:](self->_userDefaults, "setBool:forKey:");
}

- (int64_t)numberOfTimesCarDNDSiriCardShown
{
  int64_t result = self->_numberOfTimesSiriCardShown;
  if (!result)
  {
    int64_t result = [(NSUserDefaults *)self->_userDefaults integerForKey:@"carDNDNumberOfTimesCardShown"];
    self->_numberOfTimesSiriCardShown = result;
  }
  return result;
}

- (void)setNumberOfTimesCarDNDSiriCardShown:(int64_t)a3
{
  self->_numberOfTimesSiriCardShown = a3;
  -[NSUserDefaults setInteger:forKey:](self->_userDefaults, "setInteger:forKey:");
}

- (int64_t)integerForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults integerForKey:a3];
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults BOOLForKey:a3];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
}

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_userDefaults objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSiriRequestErrorTimestamp, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end