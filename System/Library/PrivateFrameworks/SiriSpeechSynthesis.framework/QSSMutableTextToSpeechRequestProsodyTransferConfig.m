@interface QSSMutableTextToSpeechRequestProsodyTransferConfig
- (NSString)user_voice_profile_url;
- (QSSMutableTextToSpeechRequestProsodyTransferConfig)init;
- (QSSTextToSpeechSpeechFeatureInputWave)wave_data;
- (QSSTextToSpeechUserVoiceProfile)user_voice_profile;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setUser_voice_profile:(id)a3;
- (void)setUser_voice_profile_url:(id)a3;
- (void)setWave_data:(id)a3;
@end

@implementation QSSMutableTextToSpeechRequestProsodyTransferConfig

- (void)setUser_voice_profile_url:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)user_voice_profile_url
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_voice_profile_url"];
}

- (void)setUser_voice_profile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechUserVoiceProfile)user_voice_profile
{
  return (QSSTextToSpeechUserVoiceProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_voice_profile"];
}

- (void)setWave_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechSpeechFeatureInputWave)wave_data
{
  return (QSSTextToSpeechSpeechFeatureInputWave *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"wave_data"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechRequestProsodyTransferConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechRequestProsodyTransferConfig;
  v2 = [(QSSMutableTextToSpeechRequestProsodyTransferConfig *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end