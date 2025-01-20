@interface RENoContentRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (RENoContentRelevanceProvider)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
@end

@implementation RENoContentRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"no_content";
}

- (id)dictionaryEncoding
{
  return (id)MEMORY[0x263EFFA78];
}

- (RENoContentRelevanceProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)RENoContentRelevanceProvider;
  return [(RERelevanceProvider *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RENoContentRelevanceProvider;
  return [(RERelevanceProvider *)&v4 copyWithZone:a3];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (RENoContentRelevanceProvider *)a3;
  BOOL v5 = 1;
  if (v4 != self)
  {
    v7.receiver = self;
    v7.super_class = (Class)RENoContentRelevanceProvider;
    if (![(RERelevanceProvider *)&v7 isEqual:v4]
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_hash
{
  v3.receiver = self;
  v3.super_class = (Class)RENoContentRelevanceProvider;
  return [(RERelevanceProvider *)&v3 _hash];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)RENoContentRelevanceProvider;
  v2 = [(RENoContentRelevanceProvider *)&v4 description];
  return v2;
}

@end