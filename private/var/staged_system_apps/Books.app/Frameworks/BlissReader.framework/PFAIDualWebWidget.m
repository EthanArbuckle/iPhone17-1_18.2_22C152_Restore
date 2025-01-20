@interface PFAIDualWebWidget
+ (Class)subreaderClass;
@end

@implementation PFAIDualWebWidget

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end