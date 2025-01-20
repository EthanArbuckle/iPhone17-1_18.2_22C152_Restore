@interface SXDefaultTwitterEmbedComponentClassification
+ (BOOL)shouldRegister;
+ (id)typeString;
- (Class)componentModelClass;
@end

@implementation SXDefaultTwitterEmbedComponentClassification

+ (BOOL)shouldRegister
{
  return 0;
}

+ (id)typeString
{
  return @"twitter_embed";
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end