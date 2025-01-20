@interface OPTTSMutableTextToSpeechRequest
+ (id)genderStringFromGender:(int64_t)a3;
+ (id)requestFromVSRequest:(id)a3;
- (BOOL)enable_word_timing_info;
- (NSArray)context_info;
- (NSString)gender;
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)text;
- (NSString)voice_name;
- (OPTTSMutableTextToSpeechRequest)init;
- (OPTTSTTSRequestFeatureFlags)feature_flags;
- (OPTTSTextToSpeechRequestContext)context;
- (OPTTSTextToSpeechRequestExperiment)experiment;
- (OPTTSTextToSpeechRequestMeta)meta_info;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)audio_type;
- (int64_t)preferred_voice_type;
- (void)setAudio_type:(int64_t)a3;
- (void)setContext:(id)a3;
- (void)setContext_info:(id)a3;
- (void)setEnable_word_timing_info:(BOOL)a3;
- (void)setExperiment:(id)a3;
- (void)setFeature_flags:(id)a3;
- (void)setGender:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMeta_info:(id)a3;
- (void)setPreferred_voice_type:(int64_t)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setText:(id)a3;
- (void)setVoice_name:(id)a3;
@end

@implementation OPTTSMutableTextToSpeechRequest

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

- (OPTTSMutableTextToSpeechRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTextToSpeechRequest;
  v2 = [(OPTTSMutableTextToSpeechRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)requestFromVSRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(OPTTSMutableTextToSpeechRequest);
  objc_super v6 = [v4 languageCode];
  v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  [(OPTTSMutableTextToSpeechRequest *)v5 setLanguage:v7];

  v8 = objc_msgSend(a1, "genderStringFromGender:", objc_msgSend(v4, "gender"));
  [(OPTTSMutableTextToSpeechRequest *)v5 setGender:v8];

  v9 = [v4 utterance];
  [v4 volume];
  if (v10 != *MEMORY[0x263F84F00])
  {
    [v4 volume];
    if (v11 != 0.0)
    {
      v12 = NSString;
      [v4 volume];
      uint64_t v14 = [v12 stringWithFormat:@"\x1B\\vol=%d\\%@", (int)(v13 * 100.0), v9];

      v9 = (void *)v14;
    }
  }
  [v4 rate];
  if (v15 != *MEMORY[0x263F84EF8])
  {
    [v4 rate];
    if (v16 != 0.0)
    {
      v17 = NSString;
      [v4 rate];
      uint64_t v19 = [v17 stringWithFormat:@"\x1B\\rate=%d\\%@", (int)(v18 * 100.0), v9];

      v9 = (void *)v19;
    }
  }
  [v4 pitch];
  if (v20 != *MEMORY[0x263F84EF0])
  {
    [v4 pitch];
    if (v21 != 0.0)
    {
      v22 = NSString;
      [v4 pitch];
      uint64_t v24 = [v22 stringWithFormat:@"\x1B\\pitch=%d\\%@", (int)(v23 * 100.0), v9];

      v9 = (void *)v24;
    }
  }
  [(OPTTSMutableTextToSpeechRequest *)v5 setText:v9];
  [(OPTTSMutableTextToSpeechRequest *)v5 setAudio_type:1];
  [(OPTTSMutableTextToSpeechRequest *)v5 setEnable_word_timing_info:1];
  v25 = [v4 voiceName];
  [(OPTTSMutableTextToSpeechRequest *)v5 setVoice_name:v25];

  v26 = objc_alloc_init(OPTTSMutableTextToSpeechRequestMeta);
  v27 = [v4 clientBundleIdentifier];
  [(OPTTSMutableTextToSpeechRequestMeta *)v26 setApp_id:v27];

  [(OPTTSMutableTextToSpeechRequestMeta *)v26 setChannel_type:2];
  [(OPTTSMutableTextToSpeechRequest *)v5 setMeta_info:v26];

  return v5;
}

+ (id)genderStringFromGender:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return &stru_26DAD0E18;
  }
  else {
    return off_2647DCEF8[a3 - 1];
  }
}

@end