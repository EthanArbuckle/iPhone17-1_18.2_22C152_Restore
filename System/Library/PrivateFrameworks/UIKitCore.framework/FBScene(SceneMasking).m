@interface FBScene(SceneMasking)
- (id)_sceneMaskingDelegate;
- (id)_sceneMaskingHostProvider;
- (void)_setSceneMaskingDelegate:()SceneMasking;
@end

@implementation FBScene(SceneMasking)

- (void)_setSceneMaskingDelegate:()SceneMasking
{
  id v4 = a3;
  id v5 = [a1 _sceneMaskingHostProvider];
  objc_msgSend(v5, "set_sceneMaskingHost:", v4);
}

- (id)_sceneMaskingHostProvider
{
  uint64_t v2 = objc_opt_class();
  v3 = [a1 componentForExtension:v2 ofClass:objc_opt_class()];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_sceneMaskingDelegate
{
  v1 = [a1 _sceneMaskingHostProvider];
  uint64_t v2 = [v1 _sceneMaskingHost];

  return v2;
}

@end