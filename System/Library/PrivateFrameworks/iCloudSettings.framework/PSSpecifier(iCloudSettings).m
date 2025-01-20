@interface PSSpecifier(iCloudSettings)
- (BOOL)ics_startSpinner;
- (BOOL)ics_stopSpinner;
- (SEL)_ics_selectorForKey:()iCloudSettings;
- (id)ics_performSuperGetter;
- (void)ics_overrideAccessorsWithTarget:()iCloudSettings getter:setter:;
- (void)ics_performSuperSetterWithValue:()iCloudSettings;
@end

@implementation PSSpecifier(iCloudSettings)

- (BOOL)ics_startSpinner
{
  return +[ICSPSSpecifier _startSpinnerWithSpecifier:a1];
}

- (BOOL)ics_stopSpinner
{
  return +[ICSPSSpecifier _stopSpinnerWithSpecifier:a1];
}

- (void)ics_overrideAccessorsWithTarget:()iCloudSettings getter:setter:
{
  id v16 = a3;
  v8 = [a1 propertyForKey:@"_ics_overridenTarget"];
  if (!v8)
  {
    v9 = [a1 target];
    [a1 setProperty:v9 forKey:@"_ics_overridenTarget"];
  }
  v10 = [a1 propertyForKey:@"_ics_overridenGetter"];
  v11 = (int *)MEMORY[0x263F5FE28];
  if (!v10)
  {
    v12 = NSStringFromSelector(*(SEL *)&a1[*MEMORY[0x263F5FE28]]);
    [a1 setProperty:v12 forKey:@"_ics_overridenGetter"];
  }
  v13 = [a1 propertyForKey:@"_ics_overridenSetter"];
  v14 = (int *)MEMORY[0x263F5FE38];
  if (!v13)
  {
    v15 = NSStringFromSelector(*(SEL *)&a1[*MEMORY[0x263F5FE38]]);
    [a1 setProperty:v15 forKey:@"_ics_overridenSetter"];
  }
  [a1 setTarget:v16];
  *(void *)&a1[*v11] = a4;
  *(void *)&a1[*v14] = a5;
}

- (id)ics_performSuperGetter
{
  v2 = [a1 propertyForKey:@"_ics_overridenTarget"];
  uint64_t v3 = objc_msgSend(a1, "_ics_selectorForKey:", @"_ics_overridenGetter");
  if (v3 && (uint64_t v4 = v3, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v5 = ((void (*)(void *, uint64_t, void *))[v2 methodForSelector:v4])(v2, v4, a1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)ics_performSuperSetterWithValue:()iCloudSettings
{
  id v7 = a3;
  uint64_t v4 = [a1 propertyForKey:@"_ics_overridenTarget"];
  uint64_t v5 = objc_msgSend(a1, "_ics_selectorForKey:", @"_ics_overridenSetter");
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_opt_respondsToSelector()) {
      ((void (*)(void *, uint64_t, id, void *))[v4 methodForSelector:v6])(v4, v6, v7, a1);
    }
  }
}

- (SEL)_ics_selectorForKey:()iCloudSettings
{
  objc_msgSend(a1, "propertyForKey:");
  v1 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SEL v2 = NSSelectorFromString(v1);
  }
  else {
    SEL v2 = 0;
  }

  return v2;
}

@end