@interface PFAIDualSceneWidget
+ (Class)subreaderClass;
@end

@implementation PFAIDualSceneWidget

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end