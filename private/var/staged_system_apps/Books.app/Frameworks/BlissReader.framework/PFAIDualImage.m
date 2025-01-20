@interface PFAIDualImage
+ (Class)subreaderClass;
@end

@implementation PFAIDualImage

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end