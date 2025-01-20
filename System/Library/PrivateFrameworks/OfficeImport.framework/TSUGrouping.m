@interface TSUGrouping
+ (BOOL)isGrouping;
+ (void)beginGrouping;
+ (void)endGrouping;
@end

@implementation TSUGrouping

+ (void)beginGrouping
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  ++sIsGroupingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (void)endGrouping
{
  if (!sIsGroupingLevel)
  {
    v2 = [NSString stringWithUTF8String:"+[TSUGrouping endGrouping]"];
    v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCutting.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:56 isFatal:0 description:"Mismatched beginGrouping / endGrouping calls"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  if (sIsGroupingLevel) {
    --sIsGroupingLevel;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (BOOL)isGrouping
{
  return sIsGroupingLevel != 0;
}

@end