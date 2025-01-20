@interface NSLocale(MNExtras)
+ (id)_localeOverridesForLocaleWithCountryCode:()MNExtras;
- (id)_navigation_objectForKey:()MNExtras;
- (uint64_t)_navigation_distanceUsesMetricSystem;
- (uint64_t)_navigation_useYardsForShortDistances;
@end

@implementation NSLocale(MNExtras)

- (uint64_t)_navigation_distanceUsesMetricSystem
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F1C440]];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F1C448]];

  return v2;
}

- (uint64_t)_navigation_useYardsForShortDistances
{
  v1 = [a1 objectForKey:*MEMORY[0x1E4F1C440]];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F1C450]];

  return v2;
}

+ (id)_localeOverridesForLocaleWithCountryCode:()MNExtras
{
  id v3 = a3;
  if (v3)
  {
    if (qword_1EB59C180 != -1) {
      dispatch_once(&qword_1EB59C180, &__block_literal_global_12);
    }
    v4 = [(id)_MergedGlobals_32 objectForKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_navigation_objectForKey:()MNExtras
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA20];
  v6 = [a1 countryCode];
  v7 = [v5 _localeOverridesForLocaleWithCountryCode:v6];
  v8 = [v7 objectForKey:v4];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [a1 objectForKey:v4];
  }
  v10 = v9;

  return v10;
}

@end