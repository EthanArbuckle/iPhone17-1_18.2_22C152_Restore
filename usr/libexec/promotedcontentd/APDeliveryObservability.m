@interface APDeliveryObservability
- (APDeliveryObservability)initWithTransmitter:(id)a3;
- (APDeliveryObservabilityTransmitter)transmitter;
- (int64_t)backoffIndex;
- (int64_t)successCount;
- (void)recordFailure:(int64_t)a3;
- (void)recordSuccess;
- (void)setBackoffIndex:(int64_t)a3;
- (void)setSuccessCount:(int64_t)a3;
- (void)setTransmitter:(id)a3;
@end

@implementation APDeliveryObservability

- (APDeliveryObservability)initWithTransmitter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDeliveryObservability;
  v6 = [(APDeliveryObservability *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transmitter, a3);
    v7->_successCount = 0;
    v7->_backoffIndex = 0;
  }

  return v7;
}

- (void)recordSuccess
{
  [(APDeliveryObservability *)self setSuccessCount:(char *)[(APDeliveryObservability *)self successCount] + 1];

  [(APDeliveryObservability *)self setBackoffIndex:0];
}

- (void)recordFailure:(int64_t)a3
{
  id v5 = [(APDeliveryObservability *)self transmitter];
  [v5 sendDeliveryEventWithError:a3 successCount:[self successCount] backoffIndex:[self backoffIndex]];

  [(APDeliveryObservability *)self setSuccessCount:0];
  v6 = (char *)[(APDeliveryObservability *)self backoffIndex] + 1;

  [(APDeliveryObservability *)self setBackoffIndex:v6];
}

- (APDeliveryObservabilityTransmitter)transmitter
{
  return self->_transmitter;
}

- (void)setTransmitter:(id)a3
{
}

- (int64_t)successCount
{
  return self->_successCount;
}

- (void)setSuccessCount:(int64_t)a3
{
  self->_successCount = a3;
}

- (int64_t)backoffIndex
{
  return self->_backoffIndex;
}

- (void)setBackoffIndex:(int64_t)a3
{
  self->_backoffIndex = a3;
}

- (void).cxx_destruct
{
}

@end