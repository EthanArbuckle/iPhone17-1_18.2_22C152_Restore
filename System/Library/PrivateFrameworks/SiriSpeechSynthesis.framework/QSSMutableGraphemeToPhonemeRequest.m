@interface QSSMutableGraphemeToPhonemeRequest
- (NSString)language;
- (NSString)orthography;
- (NSString)session_id;
- (QSSContextWithPronHints)context_with_pron_hints;
- (QSSMutableGraphemeToPhonemeRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContext_with_pron_hints:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setSession_id:(id)a3;
@end

@implementation QSSMutableGraphemeToPhonemeRequest

- (void)setContext_with_pron_hints:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSContextWithPronHints)context_with_pron_hints
{
  return (QSSContextWithPronHints *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"context_with_pron_hints"];
}

- (void)setOrthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"orthography"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableGraphemeToPhonemeRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableGraphemeToPhonemeRequest;
  v2 = [(QSSMutableGraphemeToPhonemeRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end