@interface FTMutableTextToSpeechRequestProsodyTransferConfig
- (FTMutableTextToSpeechRequestProsodyTransferConfig)init;
- (FTTextToSpeechSpeechFeatureInputWave)wave_data;
- (FTTextToSpeechUserVoiceProfile)user_voice_profile;
- (NSString)user_voice_profile_url;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUser_voice_profile:(id)a3;
- (void)setUser_voice_profile_url:(id)a3;
- (void)setWave_data:(id)a3;
@end

@implementation FTMutableTextToSpeechRequestProsodyTransferConfig

- (FTMutableTextToSpeechRequestProsodyTransferConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechRequestProsodyTransferConfig;
  v2 = [(FTMutableTextToSpeechRequestProsodyTransferConfig *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FTTextToSpeechSpeechFeatureInputWave)wave_data
{
  return (FTTextToSpeechSpeechFeatureInputWave *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"wave_data"];
}

- (void)setWave_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechUserVoiceProfile)user_voice_profile
{
  return (FTTextToSpeechUserVoiceProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_voice_profile"];
}

- (void)setUser_voice_profile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)user_voice_profile_url
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_voice_profile_url"];
}

- (void)setUser_voice_profile_url:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end