@interface TSUCutting
+ (BOOL)isCutting;
+ (void)beginCutting;
+ (void)endCutting;
@end

@implementation TSUCutting

+ (void)beginCutting
{
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  ++sIsCuttingLevel;
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (void)endCutting
{
  if (!sIsCuttingLevel)
  {
    v2 = [NSString stringWithUTF8String:"+[TSUCutting endCutting]"];
    v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCutting.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:31 isFatal:0 description:"Mismatched beginCutting / endCutting calls"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sCuttingLevelLock);
  if (sIsCuttingLevel) {
    --sIsCuttingLevel;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sCuttingLevelLock);
}

+ (BOOL)isCutting
{
  return sIsCuttingLevel != 0;
}

@end