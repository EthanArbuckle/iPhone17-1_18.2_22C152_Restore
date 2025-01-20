@interface PFAIDualShapeWithText
+ (Class)subreaderClass;
@end

@implementation PFAIDualShapeWithText

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end