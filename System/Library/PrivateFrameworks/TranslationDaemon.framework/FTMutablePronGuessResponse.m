@interface FTMutablePronGuessResponse
- (FTMutablePronGuessResponse)init;
- (FTVocToken)voc_token;
- (NSArray)human_readable_prons;
- (NSArray)tts_pronunciations;
- (NSString)apg_id;
- (NSString)error_str;
- (NSString)session_id;
- (NSString)speech_id;
- (id)copyWithZone:(_NSZone *)a3;
- (int)error_code;
- (void)setApg_id:(id)a3;
- (void)setError_code:(int)a3;
- (void)setError_str:(id)a3;
- (void)setHuman_readable_prons:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setTts_pronunciations:(id)a3;
- (void)setVoc_token:(id)a3;
@end

@implementation FTMutablePronGuessResponse

- (FTMutablePronGuessResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutablePronGuessResponse;
  v2 = [(FTMutablePronGuessResponse *)&v6 init];
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

- (NSString)apg_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"apg_id"];
}

- (void)setApg_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTVocToken)voc_token
{
  return (FTVocToken *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"voc_token"];
}

- (void)setVoc_token:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)tts_pronunciations
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tts_pronunciations"];
}

- (void)setTts_pronunciations:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)human_readable_prons
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"human_readable_prons"];
}

- (void)setHuman_readable_prons:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end