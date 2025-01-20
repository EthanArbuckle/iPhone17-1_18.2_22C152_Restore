@interface PFAIDualReviewWidget
+ (Class)subreaderClass;
@end

@implementation PFAIDualReviewWidget

+ (Class)subreaderClass
{
  return (Class)objc_opt_class();
}

@end