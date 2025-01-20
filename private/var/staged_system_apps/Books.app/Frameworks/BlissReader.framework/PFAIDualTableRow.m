@interface PFAIDualTableRow
+ (Class)subreaderClass;
@end

@implementation PFAIDualTableRow

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end