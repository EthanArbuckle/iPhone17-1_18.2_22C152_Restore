@interface PFAIDualTableColumn
+ (Class)subreaderClass;
@end

@implementation PFAIDualTableColumn

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end