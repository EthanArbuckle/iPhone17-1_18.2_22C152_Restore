@interface FTMutableStartSpeechTranslationLoggingRequest
- (FTLanguageDetected)detected_locale;
- (FTMutableStartSpeechTranslationLoggingRequest)init;
- (FTTranslationLocalePair)translation_locale_pair;
- (NSArray)senses;
- (NSArray)user_interacted_senses;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)user_selected_locale;
- (NSString)user_selected_sense;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setConversation_id:(id)a3;
- (void)setDetected_locale:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setSenses:(id)a3;
- (void)setTranslation_locale_pair:(id)a3;
- (void)setUser_interacted_senses:(id)a3;
- (void)setUser_selected_locale:(id)a3;
- (void)setUser_selected_sense:(id)a3;
@end

@implementation FTMutableStartSpeechTranslationLoggingRequest

- (FTMutableStartSpeechTranslationLoggingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableStartSpeechTranslationLoggingRequest;
  v2 = [(FTMutableStartSpeechTranslationLoggingRequest *)&v6 init];
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

- (NSString)conversation_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"conversation_id"];
}

- (void)setConversation_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTranslationLocalePair)translation_locale_pair
{
  return (FTTranslationLocalePair *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_locale_pair"];
}

- (void)setTranslation_locale_pair:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTLanguageDetected)detected_locale
{
  return (FTLanguageDetected *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"detected_locale"];
}

- (void)setDetected_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)user_selected_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_selected_locale"];
}

- (void)setUser_selected_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)senses
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"senses"];
}

- (void)setSenses:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)user_selected_sense
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_selected_sense"];
}

- (void)setUser_selected_sense:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)user_interacted_senses
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_interacted_senses"];
}

- (void)setUser_interacted_senses:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end