@interface USDateComponentsValueTransformer
+ (id)allowedTopLevelClasses;
@end

@implementation USDateComponentsValueTransformer

+ (id)allowedTopLevelClasses
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 arrayWithObject:v3];
}

@end