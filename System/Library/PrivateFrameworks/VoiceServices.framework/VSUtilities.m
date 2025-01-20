@interface VSUtilities
+ (BOOL)hasAMX;
+ (BOOL)hasANE;
+ (BOOL)isH12Platform;
+ (BOOL)isHomeHub;
+ (BOOL)isHomePod;
+ (BOOL)isInternalBuild;
+ (BOOL)isSeedBuild;
+ (BOOL)isWatch;
@end

@implementation VSUtilities

+ (BOOL)isH12Platform
{
  if (isH12Platform_onceToken != -1) {
    dispatch_once(&isH12Platform_onceToken, &__block_literal_global_9);
  }
  return isH12Platform_isH12Platform;
}

void __28__VSUtilities_isH12Platform__block_invoke()
{
  id v0 = (id)MGGetStringAnswer();
  isH12Platform_isH12Platform = [v0 isEqualToString:@"t8030"];
}

+ (BOOL)isInternalBuild
{
  return MEMORY[0x270F95FB8](@"InternalBuild", a2);
}

+ (BOOL)isSeedBuild
{
  return 0;
}

+ (BOOL)hasAMX
{
  return +[VSNeuralTTSUtils hasAMX];
}

+ (BOOL)hasANE
{
  return +[VSNeuralTTSUtils hasANE];
}

+ (BOOL)isWatch
{
  return 0;
}

+ (BOOL)isHomeHub
{
  return 0;
}

+ (BOOL)isHomePod
{
  if (isHomePod_onceToken != -1) {
    dispatch_once(&isHomePod_onceToken, &__block_literal_global_545);
  }
  return isHomePod___isHomePod;
}

uint64_t __24__VSUtilities_isHomePod__block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  isHomePod___isHomePod = result == 7;
  return result;
}

@end