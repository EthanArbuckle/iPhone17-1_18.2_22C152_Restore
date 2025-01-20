@interface PFAIDualTable
+ (Class)subreaderClass;
@end

@implementation PFAIDualTable

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end