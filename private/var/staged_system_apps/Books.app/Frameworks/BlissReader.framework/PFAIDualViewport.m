@interface PFAIDualViewport
+ (Class)subreaderClass;
@end

@implementation PFAIDualViewport

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end