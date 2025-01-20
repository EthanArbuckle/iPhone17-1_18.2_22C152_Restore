@interface NIPlatformInfo
+ (BOOL)isInternalBuild;
+ (BOOL)supportsARKit;
+ (BOOL)supportsAoA;
+ (BOOL)supportsNBAMMS;
+ (BOOL)supportsSyntheticAperture;
+ (BOOL)supportsUWB;
@end

@implementation NIPlatformInfo

+ (BOOL)isInternalBuild
{
  if (qword_1008A3480 != -1) {
    dispatch_once(&qword_1008A3480, &stru_100855A78);
  }
  return byte_1008A3478;
}

+ (BOOL)supportsUWB
{
  if (qword_1008A3490 != -1) {
    dispatch_once(&qword_1008A3490, &stru_100855A98);
  }
  return byte_1008A3488;
}

+ (BOOL)supportsAoA
{
  if (qword_1008A34A0 != -1) {
    dispatch_once(&qword_1008A34A0, &stru_100855AB8);
  }
  return byte_1008A3498;
}

+ (BOOL)supportsSyntheticAperture
{
  if (qword_1008A34B0 != -1) {
    dispatch_once(&qword_1008A34B0, &stru_100855AD8);
  }
  return byte_1008A34A8;
}

+ (BOOL)supportsARKit
{
  if (qword_1008A34C0 != -1) {
    dispatch_once(&qword_1008A34C0, &stru_100855AF8);
  }
  return byte_1008A34B8;
}

+ (BOOL)supportsNBAMMS
{
  if (qword_1008A34D0 != -1) {
    dispatch_once(&qword_1008A34D0, &stru_100855B18);
  }
  return byte_1008A34C8;
}

@end