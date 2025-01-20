@interface FTMutableFinalTextToSpeechStreamingResponse
- (FTMutableFinalTextToSpeechStreamingResponse)init;
- (FTTextToSpeechResponseDevData)dev_data;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)stream_id;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error_code;
- (int)total_pkt_number;
- (void)setDev_data:(id)a3;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setStream_id:(id)a3;
- (void)setTotal_pkt_number:(int)a3;
@end

@implementation FTMutableFinalTextToSpeechStreamingResponse

- (FTMutableFinalTextToSpeechStreamingResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableFinalTextToSpeechStreamingResponse;
  v2 = [(FTMutableFinalTextToSpeechStreamingResponse *)&v6 init];
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

- (NSString)stream_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_id"];
}

- (void)setStream_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)total_pkt_number
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"total_pkt_number"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setTotal_pkt_number:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
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