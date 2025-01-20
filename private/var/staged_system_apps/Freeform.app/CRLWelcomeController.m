@interface CRLWelcomeController
+ (BOOL)didShowForAnyVersion:(int64_t)a3;
+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4;
+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4 userDefaultsVersion:(unsigned int *)a5;
+ (NSUserDefaults)userDefaults;
+ (id)keyForWelcomeType:(int64_t)a3;
+ (int64_t)firstLaunchActionForVersion:(unsigned int)a3 userDefaultsVersion:(unsigned int *)a4;
+ (unsigned)currentVersion;
+ (unsigned)makeVersionForMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4;
+ (void)deleteUserDefaultsVersion:(int64_t)a3;
+ (void)setUserDefaultsVersion:(unsigned int)a3 forType:(int64_t)a4;
+ (void)updateUserDefaultsVersion:(int64_t)a3;
@end

@implementation CRLWelcomeController

+ (NSUserDefaults)userDefaults
{
  return +[NSUserDefaults standardUserDefaults];
}

+ (unsigned)currentVersion
{
  return 65539;
}

+ (unsigned)makeVersionForMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  return (unsigned __int16)a4 | ((unsigned __int16)a3 << 16);
}

+ (id)keyForWelcomeType:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"CRLWelcomeVersion";
  }
}

+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4
{
  return [a1 shouldShow:a3 forVersion:*(void *)&a4 userDefaultsVersion:0];
}

+ (BOOL)didShowForAnyVersion:(int64_t)a3
{
  v4 = [a1 keyForWelcomeType:a3];
  v5 = [a1 userDefaults];
  v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

+ (int64_t)firstLaunchActionForVersion:(unsigned int)a3 userDefaultsVersion:(unsigned int *)a4
{
  unsigned int v8 = 0;
  unsigned int v6 = [a1 shouldShow:0 forVersion:*(void *)&a3 userDefaultsVersion:&v8];
  int64_t result = 0;
  if (v6)
  {
    if (HIWORD(v8) < HIWORD(a3)) {
      int64_t result = 1;
    }
    else {
      int64_t result = 2;
    }
  }
  if (a4) {
    *a4 = v8;
  }
  return result;
}

+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4 userDefaultsVersion:(unsigned int *)a5
{
  unsigned int v8 = [a1 keyForWelcomeType:a3];
  v9 = [a1 userDefaults];
  v10 = [v9 objectForKey:v8];
  unsigned int v11 = [v10 unsignedIntValue];

  if (a5) {
    *a5 = v11;
  }
  unsigned __int8 v12 = v11 < a4;
  if (v11 < a4 && a4 == 65539 && v11 == 65538) {
    unsigned __int8 v12 = +[CRLFeatureFlagGroup isGenerativePlaygroundEnabled];
  }

  return v12;
}

+ (void)setUserDefaultsVersion:(unsigned int)a3 forType:(int64_t)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = [a1 keyForWelcomeType:a4];
  unsigned int v6 = [a1 userDefaults];
  v7 = +[NSNumber numberWithUnsignedInt:v4];
  [v6 setObject:v7 forKey:v8];
}

+ (void)updateUserDefaultsVersion:(int64_t)a3
{
}

+ (void)deleteUserDefaultsVersion:(int64_t)a3
{
  id v5 = [a1 keyForWelcomeType:a3];
  uint64_t v4 = [a1 userDefaults];
  [v4 removeObjectForKey:v5];
}

@end