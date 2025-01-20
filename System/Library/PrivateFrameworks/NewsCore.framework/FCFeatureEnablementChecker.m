@interface FCFeatureEnablementChecker
+ (BOOL)enabledForCurrentLevel:(unint64_t)a3;
+ (BOOL)enabledInConfig:(id)a3 forKey:(id)a4 withDefaultLevel:(unint64_t)a5;
+ (unint64_t)currentSeedTestBit;
@end

@implementation FCFeatureEnablementChecker

+ (BOOL)enabledForCurrentLevel:(unint64_t)a3
{
  int v5 = a3 & NFInternalBuild();
  if (NFSeedBuild() && (v5 & 1) == 0) {
    LOBYTE(v5) = ([a1 currentSeedTestBit] & a3) != 0;
  }
  if ((NFInternalBuild() & 1) == 0 && (NFSeedBuild() & 1) == 0) {
    LOBYTE(v5) = (a3 & 2) != 0;
  }
  return v5;
}

+ (BOOL)enabledInConfig:(id)a3 forKey:(id)a4 withDefaultLevel:(unint64_t)a5
{
  uint64_t v6 = FCAppConfigurationIntegerValue(a3, (uint64_t)a4, a5);
  return [a1 enabledForCurrentLevel:v6];
}

+ (unint64_t)currentSeedTestBit
{
  return 4;
}

@end