@interface OADGroupFill
+ (id)defaultProperties;
- (OADGroupFill)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation OADGroupFill

+ (id)defaultProperties
{
  if (+[OADGroupFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADGroupFill defaultProperties]::once, &__block_literal_global_41);
  }
  v2 = (void *)+[OADGroupFill defaultProperties]::defaultProperties;
  return v2;
}

- (OADGroupFill)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADGroupFill;
  return [(OADProperties *)&v3 initWithDefaults];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = +[OADGroupFill allocWithZone:a3];
  return [(OADGroupFill *)v3 initWithDefaults];
}

void __33__OADGroupFill_defaultProperties__block_invoke()
{
  v0 = [[OADGroupFill alloc] initWithDefaults];
  v1 = (void *)+[OADGroupFill defaultProperties]::defaultProperties;
  +[OADGroupFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

@end