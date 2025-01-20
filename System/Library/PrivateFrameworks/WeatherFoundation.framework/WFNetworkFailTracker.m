@interface WFNetworkFailTracker
- (BOOL)lastFailTimeExpiredForSettings:(id)a3;
- (double)lastFailTimeInSeconds;
- (int)numConsecutiveFails;
- (void)incrementFailCount;
@end

@implementation WFNetworkFailTracker

- (void)incrementFailCount
{
  self->_lastFailTimeInSeconds = CFAbsoluteTimeGetCurrent();
}

- (BOOL)lastFailTimeExpiredForSettings:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [(WFNetworkFailTracker *)self lastFailTimeInSeconds];
  double v7 = Current - v6;
  unint64_t v8 = [v4 networkSwitchExpirationTimeInSeconds];

  return v7 >= (double)v8;
}

- (int)numConsecutiveFails
{
  return self->_numConsecutiveFails;
}

- (double)lastFailTimeInSeconds
{
  return self->_lastFailTimeInSeconds;
}

@end