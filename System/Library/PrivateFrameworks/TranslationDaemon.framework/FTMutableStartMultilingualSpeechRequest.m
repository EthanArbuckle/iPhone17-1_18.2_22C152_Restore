@interface FTMutableStartMultilingualSpeechRequest
- (FTMutableStartMultilingualSpeechRequest)init;
- (FTStartSpeechRequest)start_speech_request;
- (NSArray)language_parameters_by_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguage_parameters_by_id:(id)a3;
- (void)setStart_speech_request:(id)a3;
@end

@implementation FTMutableStartMultilingualSpeechRequest

- (FTMutableStartMultilingualSpeechRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableStartMultilingualSpeechRequest;
  v2 = [(FTMutableStartMultilingualSpeechRequest *)&v6 init];
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

- (FTStartSpeechRequest)start_speech_request
{
  return (FTStartSpeechRequest *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_speech_request"];
}

- (void)setStart_speech_request:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)language_parameters_by_id
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language_parameters_by_id"];
}

- (void)setLanguage_parameters_by_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end