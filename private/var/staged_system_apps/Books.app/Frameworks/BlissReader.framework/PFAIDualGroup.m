@interface PFAIDualGroup
+ (Class)subreaderClass;
@end

@implementation PFAIDualGroup

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end