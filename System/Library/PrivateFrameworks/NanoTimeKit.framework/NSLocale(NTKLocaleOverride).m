@interface NSLocale(NTKLocaleOverride)
+ (id)__userCurrentLocale;
+ (void)__loadSwizzledCurrentLocaleIfNeeded;
+ (void)__setCurrentLocal:()NTKLocaleOverride;
@end

@implementation NSLocale(NTKLocaleOverride)

+ (void)__loadSwizzledCurrentLocaleIfNeeded
{
  if (__loadSwizzledCurrentLocaleIfNeeded_onceToken != -1) {
    dispatch_once(&__loadSwizzledCurrentLocaleIfNeeded_onceToken, &__block_literal_global_119);
  }
}

+ (void)__setCurrentLocal:()NTKLocaleOverride
{
  objc_storeStrong((id *)&__currentLocaleOverride, obj);
  id v4 = obj;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:*MEMORY[0x1E4F1C370] object:__currentLocaleOverride];
}

+ (id)__userCurrentLocale
{
  return (id)__currentLocaleOverride;
}

@end