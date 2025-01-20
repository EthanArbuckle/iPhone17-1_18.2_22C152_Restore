@interface FTServerBag
- (BOOL)isMomentsDisabled;
- (BOOL)isQuickRelaySupported;
- (double)momentsRequestTimeout;
@end

@implementation FTServerBag

- (BOOL)isQuickRelaySupported
{
  v2 = self;
  BOOL v3 = FTServerBag.isQuickRelaySupported.getter();

  return v3;
}

- (BOOL)isMomentsDisabled
{
  v2 = self;
  unsigned __int8 v3 = FTServerBag.isMomentsDisabled.getter();

  return v3 & 1;
}

- (double)momentsRequestTimeout
{
  v2 = self;
  double v3 = FTServerBag.momentsRequestTimeout.getter();

  return v3;
}

@end