@interface NSUserDefaults(TelephonyUtilities)
+ (id)sb_defaults;
+ (id)tu_defaults;
- (uint64_t)BOOLForKey:()TelephonyUtilities withDefault:;
@end

@implementation NSUserDefaults(TelephonyUtilities)

+ (id)tu_defaults
{
  if (tu_defaults_onceToken != -1) {
    dispatch_once(&tu_defaults_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)tu_defaults_tu_defaults;

  return v0;
}

+ (id)sb_defaults
{
  if (sb_defaults_onceToken != -1) {
    dispatch_once(&sb_defaults_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)sb_defaults_sb_defaults;

  return v0;
}

- (uint64_t)BOOLForKey:()TelephonyUtilities withDefault:
{
  id v6 = a3;
  v7 = [a1 objectForKey:v6];

  if (v7) {
    a4 = [a1 BOOLForKey:v6];
  }

  return a4;
}

@end