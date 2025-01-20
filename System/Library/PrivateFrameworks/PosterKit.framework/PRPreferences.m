@interface PRPreferences
+ (PRPreferences)sharedPreferences;
- (BOOL)isAlternateCalendarEnabled;
@end

@implementation PRPreferences

+ (PRPreferences)sharedPreferences
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PRPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferences_once != -1) {
    dispatch_once(&sharedPreferences_once, block);
  }
  v2 = (void *)sharedPreferences_sharedPreferences;
  return (PRPreferences *)v2;
}

uint64_t __34__PRPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (BOOL)isAlternateCalendarEnabled
{
  uint64_t v2 = [MEMORY[0x1E4F57C00] sharedPreferences];
  v3 = [v2 overlayCalendarID];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

@end