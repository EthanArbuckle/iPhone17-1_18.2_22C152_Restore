@interface QSSMutableBeginTextToSpeechStreamingResponse
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (QSSAudioDescription)decoder_description;
- (QSSAudioDescription)playback_description;
- (QSSMutableBeginTextToSpeechStreamingResponse)init;
- (QSSTextToSpeechMeta)meta_info;
- (float)streaming_playback_buffer_size_in_seconds;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error_code;
- (int64_t)audio_type;
- (void)setAudio_type:(int64_t)a3;
- (void)setDecoder_description:(id)a3;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setMeta_info:(id)a3;
- (void)setPlayback_description:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setStream_id:(id)a3;
- (void)setStreaming_playback_buffer_size_in_seconds:(float)a3;
@end

@implementation QSSMutableBeginTextToSpeechStreamingResponse

- (void)setStreaming_playback_buffer_size_in_seconds:(float)a3
{
  id v5 = objc_alloc(NSNumber);
  *(float *)&double v6 = a3;
  id v7 = (id)[v5 initWithFloat:v6];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (float)streaming_playback_buffer_size_in_seconds
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"streaming_playback_buffer_size_in_seconds"];
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechMeta)meta_info
{
  return (QSSTextToSpeechMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (void)setPlayback_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAudioDescription)playback_description
{
  return (QSSAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"playback_description"];
}

- (void)setDecoder_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAudioDescription)decoder_description
{
  return (QSSAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"decoder_description"];
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

- (void)setStream_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)stream_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_id"];
}

- (void)setError_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)error_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_str"];
}

- (void)setError_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)error_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"error_code"];
  int v3 = [v2 intValue];

  return v3;
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
  double v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableBeginTextToSpeechStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableBeginTextToSpeechStreamingResponse;
  v2 = [(QSSMutableBeginTextToSpeechStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end