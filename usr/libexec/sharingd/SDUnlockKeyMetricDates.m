@interface SDUnlockKeyMetricDates
- (NSDate)confirmationReceived;
- (NSDate)keyExchangeResponseReceived;
- (NSDate)pillUpdated;
- (NSDate)started;
- (void)setConfirmationReceived:(id)a3;
- (void)setKeyExchangeResponseReceived:(id)a3;
- (void)setPillUpdated:(id)a3;
- (void)setStarted:(id)a3;
@end

@implementation SDUnlockKeyMetricDates

- (NSDate)started
{
  return self->_started;
}

- (void)setStarted:(id)a3
{
}

- (NSDate)keyExchangeResponseReceived
{
  return self->_keyExchangeResponseReceived;
}

- (void)setKeyExchangeResponseReceived:(id)a3
{
}

- (NSDate)pillUpdated
{
  return self->_pillUpdated;
}

- (void)setPillUpdated:(id)a3
{
}

- (NSDate)confirmationReceived
{
  return self->_confirmationReceived;
}

- (void)setConfirmationReceived:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationReceived, 0);
  objc_storeStrong((id *)&self->_pillUpdated, 0);
  objc_storeStrong((id *)&self->_keyExchangeResponseReceived, 0);

  objc_storeStrong((id *)&self->_started, 0);
}

@end