@interface QSSMutableSpeechTranslationMtResponse
- (BOOL)is_final;
- (NSArray)n_best_translated_phrases;
- (NSString)conversation_id;
- (NSString)request_id;
- (NSString)return_str;
- (QSSMutableSpeechTranslationMtResponse)init;
- (QSSTranslationLocalePair)translation_locale_pair;
- (id)copyWithZone:(_NSZone *)a3;
- (int)return_code;
- (void)setConversation_id:(id)a3;
- (void)setIs_final:(BOOL)a3;
- (void)setN_best_translated_phrases:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setReturn_code:(int)a3;
- (void)setReturn_str:(id)a3;
- (void)setTranslation_locale_pair:(id)a3;
@end

@implementation QSSMutableSpeechTranslationMtResponse

- (void)setIs_final:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_final
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_final"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setN_best_translated_phrases:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)n_best_translated_phrases
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"n_best_translated_phrases"];
}

- (void)setTranslation_locale_pair:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTranslationLocalePair)translation_locale_pair
{
  return (QSSTranslationLocalePair *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_locale_pair"];
}

- (void)setReturn_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)return_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_str"];
}

- (void)setReturn_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)return_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_code"];
  int v3 = [v2 intValue];

  return v3;
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

- (QSSMutableSpeechTranslationMtResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSpeechTranslationMtResponse;
  v2 = [(QSSMutableSpeechTranslationMtResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end