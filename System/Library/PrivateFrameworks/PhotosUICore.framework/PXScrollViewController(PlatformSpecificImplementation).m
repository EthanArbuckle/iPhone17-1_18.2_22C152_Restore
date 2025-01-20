@interface PXScrollViewController(PlatformSpecificImplementation)
+ (id)platformScrollViewControllerForScrollView:()PlatformSpecificImplementation;
@end

@implementation PXScrollViewController(PlatformSpecificImplementation)

+ (id)platformScrollViewControllerForScrollView:()PlatformSpecificImplementation
{
  v3 = [a3 delegate];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

@end