@interface PKSubcredentialProvisioningOwnerPairingTransitionTable
- (BOOL)isValidStartingState:(int64_t)a3;
- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4;
@end

@implementation PKSubcredentialProvisioningOwnerPairingTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  BOOL result = 0;
  switch(a4)
  {
    case 0:
    case 1:
      return 1;
    case 5:
      BOOL v5 = a3 == 8;
      goto LABEL_11;
    case 6:
      BOOL v5 = a3 == 5;
      goto LABEL_11;
    case 7:
      BOOL v5 = a3 == 6;
      goto LABEL_11;
    case 8:
      BOOL v5 = a3 == 2;
      goto LABEL_11;
    case 9:
      BOOL v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
      goto LABEL_11;
    case 10:
    case 11:
      BOOL v5 = a3 == 9;
      goto LABEL_11;
    case 12:
      BOOL v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 10;
      goto LABEL_11;
    case 16:
      BOOL v5 = a3 == 12;
LABEL_11:
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