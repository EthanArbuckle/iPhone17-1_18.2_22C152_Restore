@interface SUUIAppMenuBarDocument
+ (id)featureName;
@end

@implementation SUUIAppMenuBarDocument

+ (id)featureName
{
  return (id)*MEMORY[0x263F4B2B0];
}

@end