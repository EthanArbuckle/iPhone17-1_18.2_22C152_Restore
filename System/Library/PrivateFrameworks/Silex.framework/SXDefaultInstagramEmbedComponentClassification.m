@interface SXDefaultInstagramEmbedComponentClassification
+ (BOOL)shouldRegister;
+ (id)typeString;
- (Class)componentModelClass;
@end

@implementation SXDefaultInstagramEmbedComponentClassification

+ (BOOL)shouldRegister
{
  return 0;
}

+ (id)typeString
{
  return @"instagram_embed";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end