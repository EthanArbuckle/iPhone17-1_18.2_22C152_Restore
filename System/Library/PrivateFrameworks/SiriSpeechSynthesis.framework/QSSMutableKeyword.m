@interface QSSMutableKeyword
- (NSString)keyword_orthography;
- (QSSMutableKeyword)init;
- (double)posterior;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setKeyword_orthography:(id)a3;
- (void)setPosterior:(double)a3;
@end

@implementation QSSMutableKeyword

- (void)setPosterior:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)posterior
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"posterior"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setKeyword_orthography:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)keyword_orthography
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"keyword_orthography"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableKeyword)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableKeyword;
  v2 = [(QSSMutableKeyword *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end