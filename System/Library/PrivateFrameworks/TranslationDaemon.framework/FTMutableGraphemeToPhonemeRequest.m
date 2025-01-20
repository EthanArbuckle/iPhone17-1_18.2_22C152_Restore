@interface FTMutableGraphemeToPhonemeRequest
- (FTContextWithPronHints)context_with_pron_hints;
- (FTMutableGraphemeToPhonemeRequest)init;
- (NSString)language;
- (NSString)orthography;
- (NSString)session_id;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContext_with_pron_hints:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setSession_id:(id)a3;
@end

@implementation FTMutableGraphemeToPhonemeRequest

- (FTMutableGraphemeToPhonemeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableGraphemeToPhonemeRequest;
  v2 = [(FTMutableGraphemeToPhonemeRequest *)&v6 init];
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

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"orthography"];
}

- (void)setOrthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTContextWithPronHints)context_with_pron_hints
{
  return (FTContextWithPronHints *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context_with_pron_hints"];
}

- (void)setContext_with_pron_hints:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end