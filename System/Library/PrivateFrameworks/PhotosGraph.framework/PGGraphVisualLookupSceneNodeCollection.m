@interface PGGraphVisualLookupSceneNodeCollection
+ (Class)nodeClass;
@end

@implementation PGGraphVisualLookupSceneNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end