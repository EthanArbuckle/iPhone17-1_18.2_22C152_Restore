@interface OADRoundLineJoin
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
- (OADRoundLineJoin)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation OADRoundLineJoin

+ (id)defaultProperties
{
  if (+[OADRoundLineJoin defaultProperties]::once != -1) {
    dispatch_once(&+[OADRoundLineJoin defaultProperties]::once, &__block_literal_global_109);
  }
  v2 = (void *)+[OADRoundLineJoin defaultProperties]::defaultProperties;
  return v2;
}

- (OADRoundLineJoin)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADRoundLineJoin;
  return [(OADProperties *)&v3 initWithDefaults];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 initWithDefaults];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

void __37__OADRoundLineJoin_defaultProperties__block_invoke()
{
  v0 = [[OADRoundLineJoin alloc] initWithDefaults];
  v1 = (void *)+[OADRoundLineJoin defaultProperties]::defaultProperties;
  +[OADRoundLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)OADRoundLineJoin;
  return [(OADProperties *)&v3 hash];
}

@end