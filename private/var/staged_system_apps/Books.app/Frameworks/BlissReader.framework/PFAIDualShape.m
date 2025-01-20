@interface PFAIDualShape
+ (Class)subreaderClass;
@end

@implementation PFAIDualShape

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end