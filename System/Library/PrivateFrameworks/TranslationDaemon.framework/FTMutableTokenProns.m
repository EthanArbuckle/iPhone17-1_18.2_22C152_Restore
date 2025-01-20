@interface FTMutableTokenProns
- (FTMutableTokenProns)init;
- (NSArray)normalized_prons;
- (NSArray)prons;
- (NSArray)sanitized_sequences;
- (NSString)orthography;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setNormalized_prons:(id)a3;
- (void)setOrthography:(id)a3;
- (void)setProns:(id)a3;
- (void)setSanitized_sequences:(id)a3;
@end

@implementation FTMutableTokenProns

- (FTMutableTokenProns)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTokenProns;
  v2 = [(FTMutableTokenProns *)&v6 init];
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

- (NSString)orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"orthography"];
}

- (void)setOrthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)sanitized_sequences
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sanitized_sequences"];
}

- (void)setSanitized_sequences:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)prons
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"prons"];
}

- (void)setProns:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)normalized_prons
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"normalized_prons"];
}

- (void)setNormalized_prons:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end