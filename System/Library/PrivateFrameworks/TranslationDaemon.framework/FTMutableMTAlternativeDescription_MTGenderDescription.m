@interface FTMutableMTAlternativeDescription_MTGenderDescription
- (FTMutableMTAlternativeDescription_MTGenderDescription)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)default_gender;
- (int64_t)gender;
- (void)setDefault_gender:(int64_t)a3;
- (void)setGender:(int64_t)a3;
@end

@implementation FTMutableMTAlternativeDescription_MTGenderDescription

- (FTMutableMTAlternativeDescription_MTGenderDescription)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableMTAlternativeDescription_MTGenderDescription;
  v2 = [(FTMutableMTAlternativeDescription_MTGenderDescription *)&v6 init];
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

- (int64_t)gender
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"gender"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setGender:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)default_gender
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"default_gender"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setDefault_gender:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end