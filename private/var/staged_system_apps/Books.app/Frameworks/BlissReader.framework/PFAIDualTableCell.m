@interface PFAIDualTableCell
+ (Class)subreaderClass;
@end

@implementation PFAIDualTableCell

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end