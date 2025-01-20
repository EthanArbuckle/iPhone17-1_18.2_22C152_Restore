@interface OPTTSMutableStartTextToSpeechStreamingRequest
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (NSString)text;
- (NSString)voice_name;
- (OPTTSMutableStartTextToSpeechStreamingRequest)init;
- (OPTTSTTSRequestFeatureFlags)feature_flags;
- (OPTTSTextToSpeechRequestContext)context;
- (OPTTSTextToSpeechRequestDebug)debug;
- (OPTTSTextToSpeechRequestDevConfig)dev_config;
- (OPTTSTextToSpeechRequestExperiment)experiment;
- (OPTTSTextToSpeechRequestMeta)meta_info;
- (OPTTSTextToSpeechRequestProsodyControlConfig)prosody_control_config;
- (OPTTSTextToSpeechRequestProsodyTransferConfig)prosody_config;
- (OPTTSTextToSpeechUserProfile)profile;
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

@implementation OPTTSMutableStartTextToSpeechStreamingRequest

- (void)setProsody_control_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestProsodyControlConfig)prosody_control_config
{
  return (OPTTSTextToSpeechRequestProsodyControlConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_control_config"];
}

- (void)setProsody_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestProsodyTransferConfig)prosody_config
{
  return (OPTTSTextToSpeechRequestProsodyTransferConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prosody_config"];
}

- (void)setDev_config:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestDevConfig)dev_config
{
  return (OPTTSTextToSpeechRequestDevConfig *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"dev_config"];
}

- (void)setProfile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechUserProfile)profile
{
  return (OPTTSTextToSpeechUserProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"profile"];
}

- (void)setDebug:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestDebug)debug
{
  return (OPTTSTextToSpeechRequestDebug *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"debug"];
}

- (void)setFeature_flags:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTTSRequestFeatureFlags)feature_flags
{
  return (OPTTSTTSRequestFeatureFlags *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"feature_flags"];
}

- (void)setExperiment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestExperiment)experiment
{
  return (OPTTSTextToSpeechRequestExperiment *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"experiment"];
}

- (void)setContext:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestContext)context
{
  return (OPTTSTextToSpeechRequestContext *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context"];
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (OPTTSTextToSpeechRequestMeta)meta_info
{
  return (OPTTSTextToSpeechRequestMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
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

- (void)setStream_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)stream_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_id"];
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

- (OPTTSMutableStartTextToSpeechStreamingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableStartTextToSpeechStreamingRequest;
  v2 = [(OPTTSMutableStartTextToSpeechStreamingRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end