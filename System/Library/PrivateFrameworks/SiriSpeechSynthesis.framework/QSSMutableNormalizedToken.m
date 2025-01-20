@interface QSSMutableNormalizedToken
- (NSArray)nbest_variants;
- (NSString)original_token;
- (QSSMutableNormalizedToken)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setNbest_variants:(id)a3;
- (void)setOriginal_token:(id)a3;
@end

@implementation QSSMutableNormalizedToken

- (void)setNbest_variants:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)nbest_variants
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"nbest_variants"];
}

- (void)setOriginal_token:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)original_token
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original_token"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableNormalizedToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableNormalizedToken;
  v2 = [(QSSMutableNormalizedToken *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end