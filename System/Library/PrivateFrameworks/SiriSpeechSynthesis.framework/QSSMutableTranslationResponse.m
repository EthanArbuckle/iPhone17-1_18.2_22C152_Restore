@interface QSSMutableTranslationResponse
- (BOOL)final_message;
- (NSArray)engine_output;
- (NSArray)n_best_translated_phrases;
- (NSString)engine_input;
- (NSString)request_id;
- (NSString)return_string;
- (NSString)sequence_id;
- (NSString)speech_id;
- (QSSMutableTranslationResponse)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)return_code;
- (void)setEngine_input:(id)a3;
- (void)setEngine_output:(id)a3;
- (void)setFinal_message:(BOOL)a3;
- (void)setN_best_translated_phrases:(id)a3;
- (void)setRequest_id:(id)a3;
- (void)setReturn_code:(int)a3;
- (void)setReturn_string:(id)a3;
- (void)setSequence_id:(id)a3;
- (void)setSpeech_id:(id)a3;
@end

@implementation QSSMutableTranslationResponse

- (void)setFinal_message:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)final_message
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"final_message"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setSequence_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)sequence_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sequence_id"];
}

- (void)setEngine_output:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)engine_output
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_output"];
}

- (void)setEngine_input:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)engine_input
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"engine_input"];
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

- (void)setReturn_string:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)return_string
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_string"];
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

- (QSSMutableTranslationResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTranslationResponse;
  v2 = [(QSSMutableTranslationResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end