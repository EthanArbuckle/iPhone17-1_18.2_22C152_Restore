@interface PKPeerPaymentSenderRemoteAlertViewController
- (BOOL)_canShowWhileLocked;
- (int64_t)nearbyContext;
@end

@implementation PKPeerPaymentSenderRemoteAlertViewController

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (int64_t)nearbyContext
{
  return 1;
}

@end