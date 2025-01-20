@interface FTMutableTextToSpeechResponse
- (FTAudioDescription)decoder_description;
- (FTAudioDescription)playback_description;
- (FTMutableTextToSpeechResponse)init;
- (FTTextToSpeechFeature)feature;
- (FTTextToSpeechMeta)meta_info;
- (FTTextToSpeechResponseDevData)dev_data;
- (NSArray)word_timing_info;
- (NSData)audio;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error_code;
- (int)sample_rate;
- (int64_t)audio_type;
- (void)audio:(id)a3;
- (void)setAudio:(id)a3;
- (void)setAudio_type:(int64_t)a3;
- (void)setDecoder_description:(id)a3;
- (void)setDev_data:(id)a3;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setFeature:(id)a3;
- (void)setMeta_info:(id)a3;
- (void)setPlayback_description:(id)a3;
- (void)setSample_rate:(int)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setWord_timing_info:(id)a3;
@end

@implementation FTMutableTextToSpeechResponse

- (FTMutableTextToSpeechResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTextToSpeechResponse;
  v2 = [(FTMutableTextToSpeechResponse *)&v6 init];
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

- (int)error_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_code"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setError_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)error_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_str"];
}

- (void)setError_str:(id)a3
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

- (int)sample_rate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sample_rate"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setSample_rate:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)audio
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio"];
}

- (void)setAudio:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)audio:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableTextToSpeechResponse *)self audio];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableTextToSpeechResponse *)self audio];
  v7[2](v7, v5, [v6 length]);
}

- (FTAudioDescription)decoder_description
{
  return (FTAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"decoder_description"];
}

- (void)setDecoder_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTAudioDescription)playback_description
{
  return (FTAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"playback_description"];
}

- (void)setPlayback_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)word_timing_info
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word_timing_info"];
}

- (void)setWord_timing_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechMeta)meta_info
{
  return (FTTextToSpeechMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechFeature)feature
{
  return (FTTextToSpeechFeature *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"feature"];
}

- (void)setFeature:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTextToSpeechResponseDevData)dev_data
{
  return (FTTextToSpeechResponseDevData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"dev_data"];
}

- (void)setDev_data:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end