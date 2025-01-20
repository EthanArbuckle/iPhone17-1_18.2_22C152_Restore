@interface PKSubcredentialProvisioningTransitionTable
- (BOOL)isStateFinal:(int64_t)a3;
- (BOOL)isValidStartingState:(int64_t)a3;
- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4;
@end

@implementation PKSubcredentialProvisioningTransitionTable

- (BOOL)isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  return 0;
}

- (BOOL)isStateFinal:(int64_t)a3
{
  return ((unint64_t)a3 < 0x11) & (0x10003u >> a3);
}

- (BOOL)isValidStartingState:(int64_t)a3
{
  return 0;
}

@end