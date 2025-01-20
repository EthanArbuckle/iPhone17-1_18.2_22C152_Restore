@interface FTMutableRequestStatsResponse_BoolStat
- (BOOL)value;
- (FTMutableRequestStatsResponse_BoolStat)init;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setName:(id)a3;
- (void)setValue:(BOOL)a3;
@end

@implementation FTMutableRequestStatsResponse_BoolStat

- (FTMutableRequestStatsResponse_BoolStat)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableRequestStatsResponse_BoolStat;
  v2 = [(FTMutableRequestStatsResponse_BoolStat *)&v6 init];
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

- (NSString)name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"name"];
}

- (void)setName:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)value
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"value"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setValue:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end