@interface OADBackgroundFill
+ (id)defaultProperties;
- (OADBackgroundFill)initWithDefaults;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation OADBackgroundFill

+ (id)defaultProperties
{
  if (+[OADBackgroundFill defaultProperties]::once != -1) {
    dispatch_once(&+[OADBackgroundFill defaultProperties]::once, &__block_literal_global_33_1);
  }
  v2 = (void *)+[OADBackgroundFill defaultProperties]::defaultProperties;
  return v2;
}

- (OADBackgroundFill)initWithDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)OADBackgroundFill;
  result = [(OADProperties *)&v3 initWithDefaults];
  if (result) {
    *((unsigned char *)&result->super.super + 17) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = +[OADBackgroundFill allocWithZone:a3];
  return [(OADBackgroundFill *)v3 initWithDefaults];
}

void __38__OADBackgroundFill_defaultProperties__block_invoke()
{
  v0 = [[OADBackgroundFill alloc] initWithDefaults];
  v1 = (void *)+[OADBackgroundFill defaultProperties]::defaultProperties;
  +[OADBackgroundFill defaultProperties]::defaultProperties = (uint64_t)v0;
}

@end