@interface UITabAnalytics
@end

@implementation UITabAnalytics

void __33___UITabAnalytics_sharedInstance__block_invoke()
{
  v0 = [_UITabAnalytics alloc];
  if (v0)
  {
    v15.receiver = v0;
    v15.super_class = (Class)_UITabAnalytics;
    v1 = objc_msgSendSuper2(&v15, sel_init);
    v2 = v1;
    if (v1)
    {
      v1[5] = 0;
      v3 = _UIMainBundleIdentifier();
      if ([v3 hasPrefix:@"com.apple."]) {
        v4 = v3;
      }
      else {
        v4 = &stru_1ED0E84C0;
      }
      v5 = (void *)v2[1];
      v2[1] = v4;

      v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v7 = [v6 objectForKey:@"com.apple.UIKit.TabStatistics"];

      if (v7)
      {
        uint64_t v8 = [v7 objectForKey:@"lastCustomizationDate"];
        v9 = (void *)v2[4];
        v2[4] = v8;

        v10 = [v7 objectForKey:@"numberOfCustomizations"];
        v2[2] = [v10 integerValue];

        v11 = [v7 objectForKey:@"numberOfTabsInBar"];
        v2[3] = [v11 integerValue];
      }
      else
      {
        uint64_t v12 = [MEMORY[0x1E4F1C9C8] distantPast];
        v13 = (void *)v2[4];
        v2[4] = v12;

        v2[2] = 0;
        v2[3] = 0;
      }
    }
  }
  else
  {
    v2 = 0;
  }
  v14 = (void *)_MergedGlobals_974;
  _MergedGlobals_974 = (uint64_t)v2;
}

id __48___UITabAnalytics__sendEvent_additionalPayload___block_invoke(void *a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v2 setObject:v3 forKey:@"eventType"];

  [v2 setObject:a1[4] forKey:@"bundleId"];
  if (a1[5]) {
    objc_msgSend(v2, "addEntriesFromDictionary:");
  }
  return v2;
}

@end