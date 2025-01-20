@interface QSSMutableSpeechTranslationTextToSpeechResponse
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)target_locale;
- (QSSMutableSpeechTranslationTextToSpeechResponse)init;
- (QSSTextToSpeechResponse)text_to_speech_response;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConversation_id:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setTarget_locale:(id)a3;
- (void)setText_to_speech_response:(id)a3;
@end

@implementation QSSMutableSpeechTranslationTextToSpeechResponse

- (void)setText_to_speech_response:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechResponse)text_to_speech_response
{
  return (QSSTextToSpeechResponse *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text_to_speech_response"];
}

- (void)setTarget_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)target_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_locale"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setConversation_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)conversation_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"conversation_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableSpeechTranslationTextToSpeechResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpeechTranslationTextToSpeechResponse;
  v2 = [(QSSMutableSpeechTranslationTextToSpeechResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end