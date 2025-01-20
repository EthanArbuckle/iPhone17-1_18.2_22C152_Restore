@interface FBScene(HostingController)
- (id)_uiHostingController;
@end

@implementation FBScene(HostingController)

- (id)_uiHostingController
{
  v1 = [a1 delegate];
  uint64_t v2 = objc_opt_class();
  id v3 = v1;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

@end