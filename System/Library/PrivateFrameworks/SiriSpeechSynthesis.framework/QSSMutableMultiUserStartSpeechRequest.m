@interface QSSMutableMultiUserStartSpeechRequest
- (NSArray)user_parameters;
- (NSString)primary_speech_id;
- (QSSMutableMultiUserStartSpeechRequest)init;
- (QSSStartSpeechRequest)start_speech_request;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPrimary_speech_id:(id)a3;
- (void)setStart_speech_request:(id)a3;
- (void)setUser_parameters:(id)a3;
@end

@implementation QSSMutableMultiUserStartSpeechRequest

- (void)setPrimary_speech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)primary_speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"primary_speech_id"];
}

- (void)setUser_parameters:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)user_parameters
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_parameters"];
}

- (void)setStart_speech_request:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSStartSpeechRequest)start_speech_request
{
  return (QSSStartSpeechRequest *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_speech_request"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableMultiUserStartSpeechRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableMultiUserStartSpeechRequest;
  v2 = [(QSSMutableMultiUserStartSpeechRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end