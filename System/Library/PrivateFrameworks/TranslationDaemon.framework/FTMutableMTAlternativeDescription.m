@interface FTMutableMTAlternativeDescription
- (FTMTAlternativeDescription_MTGenderDescription)gender_description;
- (FTMTAlternativeDescription_MTMeaningDescription)meaning_description;
- (FTMutableMTAlternativeDescription)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alternative_type;
- (void)setAlternative_type:(int64_t)a3;
- (void)setGender_description:(id)a3;
- (void)setMeaning_description:(id)a3;
@end

@implementation FTMutableMTAlternativeDescription

- (FTMutableMTAlternativeDescription)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableMTAlternativeDescription;
  v2 = [(FTMutableMTAlternativeDescription *)&v6 init];
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

- (int64_t)alternative_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"alternative_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setAlternative_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTMTAlternativeDescription_MTGenderDescription)gender_description
{
  return (FTMTAlternativeDescription_MTGenderDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"gender_description"];
}

- (void)setGender_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTMTAlternativeDescription_MTMeaningDescription)meaning_description
{
  return (FTMTAlternativeDescription_MTMeaningDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meaning_description"];
}

- (void)setMeaning_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end