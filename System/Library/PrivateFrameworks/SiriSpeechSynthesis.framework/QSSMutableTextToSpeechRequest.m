@interface QSSMutableTextToSpeechRequest
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (NSString)voice_name;
- (QSSMutableTextToSpeechRequest)init;
- (QSSTTSRequestFeatureFlags)feature_flags;
- (QSSTextToSpeechRequestContext)context;
- (QSSTextToSpeechRequestDebug)debug;
- (QSSTextToSpeechRequestDevConfig)dev_config;
- (QSSTextToSpeechRequestExperiment)experiment;
- (QSSTextToSpeechRequestMeta)meta_info;
- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config;
- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config;
- (QSSTextToSpeechUserProfile)profile;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)audio_type;
- (int64_t)preferred_voice_type;
- (void)setAudio_type:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setContext_info:(id)a3;
- (void)setDebug:(id)a3;
- (void)setDev_config:(id)a3;
- (void)setEnable_word_timing_info:(BOOL)a3;
- (void)setExperiment:(id)a3;
- (void)setFeature_flags:(id)a3;
- (void)setGender:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMeta_info:(id)a3;
- (void)setPreferred_voice_type:(int64_t)a3;
- (void)setProfile:(id)a3;
- (void)setProsody_config:(id)a3;
- (void)setProsody_control_config:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setText:(id)a3;
- (void)setVoice_name:(id)a3;
@end

@implementation QSSMutableTextToSpeechRequest

- (void)setProsody_control_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  return (QSSTextToSpeechRequestProsodyControlConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_control_config"];
}

- (void)setProsody_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  return (QSSTextToSpeechRequestProsodyTransferConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_config"];
}

- (void)setDev_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestDevConfig)dev_config
{
  return (QSSTextToSpeechRequestDevConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"dev_config"];
}

- (void)setProfile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechUserProfile)profile
{
  return (QSSTextToSpeechUserProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile"];
}

- (void)setDebug:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestDebug)debug
{
  return (QSSTextToSpeechRequestDebug *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"debug"];
}

- (void)setFeature_flags:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTTSRequestFeatureFlags)feature_flags
{
  return (QSSTTSRequestFeatureFlags *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"feature_flags"];
}

- (void)setExperiment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestExperiment)experiment
{
  return (QSSTextToSpeechRequestExperiment *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"experiment"];
}

- (void)setContext:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestContext)context
{
  return (QSSTextToSpeechRequestContext *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context"];
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechRequestMeta)meta_info
{
  return (QSSTextToSpeechRequestMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setPreferred_voice_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)preferred_voice_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"preferred_voice_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setContext_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)context_info
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context_info"];
}

- (void)setVoice_name:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)voice_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"voice_name"];
}

- (void)setEnable_word_timing_info:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_word_timing_info
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_word_timing_info"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAudio_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)audio_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setGender:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)gender
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"gender"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechRequest;
  v2 = [(QSSMutableTextToSpeechRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end