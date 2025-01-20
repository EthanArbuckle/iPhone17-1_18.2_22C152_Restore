@interface OPTTSMutableTTSReplacement
- (NSString)original;
- (NSString)replacement;
- (OPTTSMutableTTSReplacement)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setOriginal:(id)a3;
- (void)setReplacement:(id)a3;
@end

@implementation OPTTSMutableTTSReplacement

- (void)setReplacement:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)replacement
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"replacement"];
}

- (void)setOriginal:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)original
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTTSReplacement)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTTSReplacement;
  v2 = [(OPTTSMutableTTSReplacement *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end