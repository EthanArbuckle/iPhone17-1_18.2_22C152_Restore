@interface RMPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)supportsOpportunisticAnchoredTracking;
@end

@implementation RMPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_10002C9B0 != -1) {
    dispatch_once(&qword_10002C9B0, &stru_100024E50);
  }
  return byte_10002C9A8;
}

+ (BOOL)supportsOpportunisticAnchoredTracking
{
  if (qword_10002C9C0 != -1) {
    dispatch_once(&qword_10002C9C0, &stru_100024E70);
  }
  return byte_10002C9B8;
}

@end