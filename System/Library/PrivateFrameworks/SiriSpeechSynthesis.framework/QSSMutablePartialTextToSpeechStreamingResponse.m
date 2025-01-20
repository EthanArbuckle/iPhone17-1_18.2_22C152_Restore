@interface QSSMutablePartialTextToSpeechStreamingResponse
- (NSArray)word_timing_info;
- (NSData)audio;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (QSSMutablePartialTextToSpeechStreamingResponse)init;
- (QSSTextToSpeechFeature)feature;
- (id)copyWithZone:(_NSZone *)a3;
- (int)current_pkt_number;
- (int)error_code;
- (void)audio:(id)a3;
- (void)setAudio:(id)a3;
- (void)setCurrent_pkt_number:(int)a3;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setFeature:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setStream_id:(id)a3;
- (void)setWord_timing_info:(id)a3;
@end

@implementation QSSMutablePartialTextToSpeechStreamingResponse

- (void)setFeature:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechFeature)feature
{
  return (QSSTextToSpeechFeature *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"feature"];
}

- (void)setWord_timing_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)word_timing_info
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word_timing_info"];
}

- (void)audio:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutablePartialTextToSpeechStreamingResponse *)self audio];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutablePartialTextToSpeechStreamingResponse *)self audio];
  v7[2](v7, v5, [v6 length]);
}

- (void)setAudio:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)audio
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio"];
}

- (void)setCurrent_pkt_number:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)current_pkt_number
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"current_pkt_number"];
  int v3 = [v2 intValue];

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
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutablePartialTextToSpeechStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutablePartialTextToSpeechStreamingResponse;
  v2 = [(QSSMutablePartialTextToSpeechStreamingResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end