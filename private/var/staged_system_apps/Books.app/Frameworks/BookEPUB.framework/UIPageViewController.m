@interface UIPageViewController
- (BOOL)be_areCurlAnimationsInFlightOrPending;
- (id)be_pageCurl;
@end

@implementation UIPageViewController

- (id)be_pageCurl
{
  v3 = (objc_class *)objc_opt_class();
  InstanceVariable = class_getInstanceVariable(v3, "_pageCurl");

  return object_getIvar(self, InstanceVariable);
}

- (BOOL)be_areCurlAnimationsInFlightOrPending
{
  v2 = [(UIPageViewController *)self be_pageCurl];
  unsigned __int8 v3 = [v2 _areAnimationsInFlightOrPending];

  return v3;
}

@end