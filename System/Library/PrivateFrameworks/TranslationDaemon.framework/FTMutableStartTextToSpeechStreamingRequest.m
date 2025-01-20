@interface FTMutableStartTextToSpeechStreamingRequest
- (BOOL)enable_word_timing_info;
- (FTMutableStartTextToSpeechStreamingRequest)init;
- (FTTTSRequestFeatureFlags)feature_flags;
- (FTTextToSpeechRequestContext)context;
- (FTTextToSpeechRequestDebug)debug;
- (FTTextToSpeechRequestDevConfig)dev_config;
- (FTTextToSpeechRequestExperiment)experiment;
- (FTTextToSpeechRequestMeta)meta_info;
- (FTTextToSpeechRequestProsodyControlConfig)prosody_control_config;
- (FTTextToSpeechRequestProsodyTransferConfig)prosody_config;
- (FTTextToSpeechUserProfile)profile;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (NSString)text;
- (NSString)voice_name;
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
- (void)setStream_id:(id)a3;
- (void)setText:(id)a3;
- (void)setVoice_name:(id)a3;
@end

@implementation FTMutableStartTextToSpeechStreamingRequest

- (FTMutableStartTextToSpeechStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableStartTextToSpeechStreamingRequest;
  v2 = [(FTMutableStartTextToSpeechStreamingRequest *)&v6 init];
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

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)stream_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_id"];
}

- (void)setStream_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)gender
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"gender"];
}

- (void)setGender:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)audio_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setAudio_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_word_timing_info
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_word_timing_info"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnable_word_timing_info:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)voice_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"voice_name"];
}

- (void)setVoice_name:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)context_info
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context_info"];
}

- (void)setContext_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)preferred_voice_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"preferred_voice_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setPreferred_voice_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestMeta)meta_info
{
  return (FTTextToSpeechRequestMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestContext)context
{
  return (FTTextToSpeechRequestContext *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context"];
}

- (void)setContext:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestExperiment)experiment
{
  return (FTTextToSpeechRequestExperiment *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"experiment"];
}

- (void)setExperiment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTTSRequestFeatureFlags)feature_flags
{
  return (FTTTSRequestFeatureFlags *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"feature_flags"];
}

- (void)setFeature_flags:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestDebug)debug
{
  return (FTTextToSpeechRequestDebug *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"debug"];
}

- (void)setDebug:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechUserProfile)profile
{
  return (FTTextToSpeechUserProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile"];
}

- (void)setProfile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestDevConfig)dev_config
{
  return (FTTextToSpeechRequestDevConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"dev_config"];
}

- (void)setDev_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  return (FTTextToSpeechRequestProsodyTransferConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_config"];
}

- (void)setProsody_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  return (FTTextToSpeechRequestProsodyControlConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_control_config"];
}

- (void)setProsody_control_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end