@interface CLFenceAnalyticsCommon
+ (id)masqueradeBundleId:(id)a3;
+ (unint64_t)fenceCategoryForFence:(Fence *)a3;
+ (unint64_t)fenceEventType:(int)a3;
+ (unint64_t)fenceSizeForFence:(Fence *)a3;
+ (unint64_t)motionTypeFromCLMotionActivity:(CLMotionActivity *)a3;
+ (unint64_t)motionTypeFromMotionActivity:(id)a3;
@end

@implementation CLFenceAnalyticsCommon

+ (unint64_t)fenceSizeForFence:(Fence *)a3
{
  double v3 = *((double *)&a3[2].var0.__r_.__value_.var0.var1 + 2);
  if (v3 <= 400.0
    && !LOBYTE(a3[4].var0.__r_.var1)
    && *((_DWORD *)&a3[4].var0.__r_.__value_.var0.var1 + 5) != 2
    && a3[5].var0.var0 == *(void *)&a3[5].var0.__r_.var0
    && (a3[4].var0.__r_.__value_.var0.var0.__data_[0] & 0x20) == 0)
  {
    return 1;
  }
  if (v3 > 400.0 && v3 < 7000.0) {
    return 2;
  }
  if (v3 < 7000.0) {
    return 0;
  }
  return 3;
}

+ (unint64_t)fenceCategoryForFence:(Fence *)a3
{
  if (a3[5].var0.var0 != *(void *)&a3[5].var0.__r_.var0) {
    return 2;
  }
  if (a3[4].var0.__r_.__value_.var0.var0.__data_[16]) {
    return 3;
  }
  if (a3[4].var0.__r_.__value_.var0.var0.__data_[0] < 0) {
    return 1;
  }
  return 4;
}

+ (unint64_t)fenceEventType:(int)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (id)masqueradeBundleId:(id)a3
{
  if ([a3 containsString:@"apple"]) {
    return a3;
  }
  else {
    return @"GeoGenericBundleId";
  }
}

+ (unint64_t)motionTypeFromMotionActivity:(id)a3
{
  if ([a3 automotive]) {
    return 4;
  }
  if ([a3 running]) {
    return 3;
  }
  if ([a3 walking]) {
    return 2;
  }
  if ([a3 stationary]) {
    return 1;
  }
  if ([a3 unknown]) {
    return 0;
  }
  if ([a3 cycling]) {
    return 5;
  }
  return 7;
}

+ (unint64_t)motionTypeFromCLMotionActivity:(CLMotionActivity *)a3
{
  if (CLMotionActivity::isCycling(a3)) {
    return 5;
  }
  if (CLMotionActivity::isDriving(a3)) {
    return 6;
  }
  if (CLMotionActivity::isInVehicle(a3)) {
    return 4;
  }
  if (CLMotionActivity::isRunning(a3)) {
    return 3;
  }
  if (CLMotionActivity::isWalking(a3)) {
    return 2;
  }
  if (CLMotionActivity::isStatic(a3)) {
    return 1;
  }
  if (CLMotionActivity::isMoving(a3)) {
    return 7;
  }
  return 0;
}

@end