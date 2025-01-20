@interface OADNullFill
+ (id)defaultProperties;
+ (id)nullFill;
- (OADNullFill)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation OADNullFill

+ (id)nullFill
{
  v2 = objc_alloc_init(OADNullFill);
  return v2;
}

- (OADNullFill)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADNullFill;
  return [(OADProperties *)&v3 initWithDefaults];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = +[OADNullFill allocWithZone:a3];
  return [(OADNullFill *)v3 initWithDefaults];
}

+ (id)defaultProperties
{
  if (+[OADNullFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADNullFill defaultProperties]::once, &__block_literal_global_55);
  }
  v2 = (void *)+[OADNullFill defaultProperties]::defaultProperties;
  return v2;
}

void __32__OADNullFill_defaultProperties__block_invoke()
{
  v0 = [[OADNullFill alloc] initWithDefaults];
  v1 = (void *)+[OADNullFill defaultProperties]::defaultProperties;
  +[OADNullFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

@end