@interface UIWindowScene(SBWindowScene)
- (id)_sbDisplayConfiguration;
- (id)_sbWindowScene;
@end

@implementation UIWindowScene(SBWindowScene)

- (id)_sbDisplayConfiguration
{
  v1 = [a1 _FBSScene];
  v2 = [v1 settings];
  v3 = [v2 displayConfiguration];

  return v3;
}

- (id)_sbWindowScene
{
  uint64_t v2 = objc_opt_class();
  id v3 = a1;
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