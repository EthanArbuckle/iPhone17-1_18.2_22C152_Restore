@interface FLTMutableSSUIntentParameter
- (FLTMutableSSUIntentParameter)init;
- (NSString)example_value;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setExample_value:(id)a3;
- (void)setName:(id)a3;
@end

@implementation FLTMutableSSUIntentParameter

- (void)setExample_value:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)example_value
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"example_value"];
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"name"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableSSUIntentParameter)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableSSUIntentParameter;
  v2 = [(FLTMutableSSUIntentParameter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end