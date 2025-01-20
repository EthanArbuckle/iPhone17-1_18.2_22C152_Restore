@interface QSSMutableStartSpeechTranslationRequest
- (BOOL)restricted_mode;
- (BOOL)streaming_mode;
- (NSArray)text_to_speech_requests;
- (NSArray)translation_locale_pairs;
- (NSString)app_id;
- (NSString)conversation_id;
- (NSString)request_id;
- (QSSMutableStartSpeechTranslationRequest)init;
- (QSSStartSpeechRequest)start_speech_request;
- (QSSTranslationRequest)translation_request;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)opt_in_status;
- (void)setApp_id:(id)a3;
- (void)setConversation_id:(id)a3;
- (void)setOpt_in_status:(int64_t)a3;
- (void)setRequest_id:(id)a3;
- (void)setRestricted_mode:(BOOL)a3;
- (void)setStart_speech_request:(id)a3;
- (void)setStreaming_mode:(BOOL)a3;
- (void)setText_to_speech_requests:(id)a3;
- (void)setTranslation_locale_pairs:(id)a3;
- (void)setTranslation_request:(id)a3;
@end

@implementation QSSMutableStartSpeechTranslationRequest

- (void)setStreaming_mode:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)streaming_mode
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"streaming_mode"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setOpt_in_status:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)opt_in_status
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"opt_in_status"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setApp_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)app_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"app_id"];
}

- (void)setRestricted_mode:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)restricted_mode
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"restricted_mode"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setText_to_speech_requests:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)text_to_speech_requests
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text_to_speech_requests"];
}

- (void)setTranslation_request:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTranslationRequest)translation_request
{
  return (QSSTranslationRequest *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_request"];
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

- (void)setTranslation_locale_pairs:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)translation_locale_pairs
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_locale_pairs"];
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

- (QSSMutableStartSpeechTranslationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableStartSpeechTranslationRequest;
  v2 = [(QSSMutableStartSpeechTranslationRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end