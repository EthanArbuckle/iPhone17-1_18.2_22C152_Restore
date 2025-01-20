@interface PKSubcredentialProvisioningFriendPairingTransitionTable
- (BOOL)isValidStartingState:(int64_t)a3;
- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4;
@end

@implementation PKSubcredentialProvisioningFriendPairingTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL result = 0;
  switch(a4)
  {
    case 0:
    case 1:
      return 1;
    case 3:
      BOOL v5 = a3 == 8;
      goto LABEL_12;
    case 4:
      BOOL v5 = a3 == 12;
      goto LABEL_12;
    case 8:
      BOOL v5 = a3 == 2;
      goto LABEL_12;
    case 9:
      BOOL v5 = a3 == 3;
      goto LABEL_12;
    case 10:
      BOOL v5 = a3 == 9;
      goto LABEL_12;
    case 12:
      BOOL v5 = a3 == 10;
      goto LABEL_12;
    case 16:
      BOOL v5 = a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFF7) == 4;
LABEL_12:
      BOOL result = v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)isValidStartingState:(int64_t)a3
{
  return a3 == 2;
}

@end