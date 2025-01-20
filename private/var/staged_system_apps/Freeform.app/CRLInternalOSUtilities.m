@interface CRLInternalOSUtilities
+ (BOOL)isInternalOSInstall;
@end

@implementation CRLInternalOSUtilities

+ (BOOL)isInternalOSInstall
{
  if (qword_1016A9548 != -1) {
    dispatch_once(&qword_1016A9548, &stru_1014E6610);
  }
  return byte_1016A9540;
}

@end