@interface FLTMutableCDMCATIBloomFilters
- (FLTCDMCATISwiftBloomFilter)general_bf;
- (FLTMutableCDMCATIBloomFilters)init;
- (NSArray)array_bf;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setArray_bf:(id)a3;
- (void)setGeneral_bf:(id)a3;
@end

@implementation FLTMutableCDMCATIBloomFilters

- (void)setArray_bf:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)array_bf
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"array_bf"];
}

- (void)setGeneral_bf:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FLTCDMCATISwiftBloomFilter)general_bf
{
  return (FLTCDMCATISwiftBloomFilter *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"general_bf"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableCDMCATIBloomFilters)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableCDMCATIBloomFilters;
  v2 = [(FLTMutableCDMCATIBloomFilters *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end