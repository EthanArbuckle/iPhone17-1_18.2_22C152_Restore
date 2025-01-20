@interface OADBevelLineJoin
+ (id)defaultProperties;
- (BOOL)isEqual:(id)a3;
- (OADBevelLineJoin)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation OADBevelLineJoin

+ (id)defaultProperties
{
  if (+[OADBevelLineJoin defaultProperties]::once != -1) {
    dispatch_once(&+[OADBevelLineJoin defaultProperties]::once, &__block_literal_global_85_0);
  }
  v2 = (void *)+[OADBevelLineJoin defaultProperties]::defaultProperties;
  return v2;
}

- (OADBevelLineJoin)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADBevelLineJoin;
  return [(OADProperties *)&v3 initWithDefaults];
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[OADBevelLineJoin allocWithZone:a3];
  return [(OADBevelLineJoin *)v3 initWithDefaults];
}

void __37__OADBevelLineJoin_defaultProperties__block_invoke()
{
  v0 = [[OADBevelLineJoin alloc] initWithDefaults];
  v1 = (void *)+[OADBevelLineJoin defaultProperties]::defaultProperties;
  +[OADBevelLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)OADBevelLineJoin;
  return [(OADProperties *)&v3 hash];
}

@end