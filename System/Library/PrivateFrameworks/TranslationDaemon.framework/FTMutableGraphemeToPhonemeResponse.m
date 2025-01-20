@interface FTMutableGraphemeToPhonemeResponse
- (BOOL)is_pron_guessed;
- (FTMutableGraphemeToPhonemeResponse)init;
- (NSArray)aot_token_prons;
- (NSArray)jit_token_prons;
- (NSArray)phonemes;
- (NSString)g2p_model_version;
- (NSString)g2p_version;
- (NSString)phoneset_version;
- (NSString)return_str;
- (NSString)session_id;
- (id)copyWithZone:(_NSZone *)a3;
- (int)return_code;
- (void)setAot_token_prons:(id)a3;
- (void)setG2p_model_version:(id)a3;
- (void)setG2p_version:(id)a3;
- (void)setIs_pron_guessed:(BOOL)a3;
- (void)setJit_token_prons:(id)a3;
- (void)setPhonemes:(id)a3;
- (void)setPhoneset_version:(id)a3;
- (void)setReturn_code:(int)a3;
- (void)setReturn_str:(id)a3;
- (void)setSession_id:(id)a3;
@end

@implementation FTMutableGraphemeToPhonemeResponse

- (FTMutableGraphemeToPhonemeResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableGraphemeToPhonemeResponse;
  v2 = [(FTMutableGraphemeToPhonemeResponse *)&v6 init];
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

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)return_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_code"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setReturn_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)return_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_str"];
}

- (void)setReturn_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)phonemes
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phonemes"];
}

- (void)setPhonemes:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_pron_guessed
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_pron_guessed"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIs_pron_guessed:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)g2p_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"g2p_version"];
}

- (void)setG2p_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)g2p_model_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"g2p_model_version"];
}

- (void)setG2p_model_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)phoneset_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"phoneset_version"];
}

- (void)setPhoneset_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)aot_token_prons
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"aot_token_prons"];
}

- (void)setAot_token_prons:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)jit_token_prons
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"jit_token_prons"];
}

- (void)setJit_token_prons:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end