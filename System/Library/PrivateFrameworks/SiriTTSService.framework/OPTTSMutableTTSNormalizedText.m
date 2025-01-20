@interface OPTTSMutableTTSNormalizedText
- (NSString)text;
- (OPTTSMutableTTSNormalizedText)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setText:(id)a3;
@end

@implementation OPTTSMutableTTSNormalizedText

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableTTSNormalizedText)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableTTSNormalizedText;
  v2 = [(OPTTSMutableTTSNormalizedText *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end