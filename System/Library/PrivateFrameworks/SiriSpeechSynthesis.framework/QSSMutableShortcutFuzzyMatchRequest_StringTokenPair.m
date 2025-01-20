@interface QSSMutableShortcutFuzzyMatchRequest_StringTokenPair
- (NSArray)tokens;
- (NSString)raw_string;
- (QSSMutableShortcutFuzzyMatchRequest_StringTokenPair)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setRaw_string:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation QSSMutableShortcutFuzzyMatchRequest_StringTokenPair

- (void)setTokens:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)tokens
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tokens"];
}

- (void)setRaw_string:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)raw_string
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"raw_string"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableShortcutFuzzyMatchRequest_StringTokenPair)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableShortcutFuzzyMatchRequest_StringTokenPair;
  v2 = [(QSSMutableShortcutFuzzyMatchRequest_StringTokenPair *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end