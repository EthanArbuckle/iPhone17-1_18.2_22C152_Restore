@interface PKSubcredentialProvisioningRemoteDeviceProvisioningTransitionTable
- (BOOL)isValidStartingState:(int64_t)a3;
- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4;
@end

@implementation PKSubcredentialProvisioningRemoteDeviceProvisioningTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL v4 = a3 == 15;
  BOOL v5 = a3 == 14;
  if (a4 != 15) {
    BOOL v5 = 0;
  }
  if (a4 != 16) {
    BOOL v4 = v5;
  }
  return (unint64_t)a4 < 2 || v4;
}

- (BOOL)isValidStartingState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 14;
}

@end