@interface QSSMutableUserDataEntity
- (NSArray)attributes;
- (QSSMutableUserDataEntity)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAttributes:(id)a3;
@end

@implementation QSSMutableUserDataEntity

- (void)setAttributes:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)attributes
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"attributes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableUserDataEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableUserDataEntity;
  v2 = [(QSSMutableUserDataEntity *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end