@interface OADLineProperties
+ (id)defaultProperties;
@end

@implementation OADLineProperties

+ (id)defaultProperties
{
  if (+[OADLineProperties defaultProperties]::once != -1) {
    dispatch_once(&+[OADLineProperties defaultProperties]::once, &__block_literal_global_59);
  }
  v2 = (void *)+[OADLineProperties defaultProperties]::defaultProperties;
  return v2;
}

void __38__OADLineProperties_defaultProperties__block_invoke()
{
  v0 = [(OADGraphicProperties *)[OADLineProperties alloc] initWithDefaults];
  v1 = (void *)+[OADLineProperties defaultProperties]::defaultProperties;
  +[OADLineProperties defaultProperties]::defaultProperties = (uint64_t)v0;
}

@end