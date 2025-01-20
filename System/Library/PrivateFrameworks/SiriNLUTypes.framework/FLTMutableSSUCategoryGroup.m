@interface FLTMutableSSUCategoryGroup
- (FLTMutableSSUCategoryGroup)init;
- (NSArray)negative_examples;
- (NSArray)positive_intents;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setName:(id)a3;
- (void)setNegative_examples:(id)a3;
- (void)setPositive_intents:(id)a3;
@end

@implementation FLTMutableSSUCategoryGroup

- (void)setNegative_examples:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)negative_examples
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"negative_examples"];
}

- (void)setPositive_intents:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)positive_intents
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"positive_intents"];
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

- (FLTMutableSSUCategoryGroup)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableSSUCategoryGroup;
  v2 = [(FLTMutableSSUCategoryGroup *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end