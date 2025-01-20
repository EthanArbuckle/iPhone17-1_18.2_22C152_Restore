@interface CLHawkeyeConfigureSeparatedStateTask
- (CLFindMyAccessoryAbsoluteWildConfiguration)configuration;
- (CLHawkeyeConfigureSeparatedStateTask)initWithConfiguration:(id)a3 currentIndex:(unsigned int)a4;
- (unsigned)currentIndex;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setCurrentIndex:(unsigned int)a3;
@end

@implementation CLHawkeyeConfigureSeparatedStateTask

- (CLHawkeyeConfigureSeparatedStateTask)initWithConfiguration:(id)a3 currentIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)CLHawkeyeConfigureSeparatedStateTask;
  v6 = [(CLDurianTask *)&v11 initWithCommand:+[CLDurianCommand commandWithOpcode:208 payload:0] desiredLatency:-6 expectsResponse:0 completeOnPreemption:0 requiresMutex:0];
  if (v6)
  {
    [objc_msgSend(a3, "desiredKeyRollDate") timeIntervalSinceDate:[NSDate date]];
    unsigned int v8 = (v7 * 1000.0);
    unsigned int v9 = [a3 nextWildIndex];
    [(CLHawkeyeConfigureSeparatedStateTask *)v6 setCurrentIndex:v4];
    [(CLHawkeyeTask *)v6 setServiceUUID:+[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID]];
    [(CLHawkeyeTask *)v6 setCharacteristicUUID:+[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID]];
    [(CLHawkeyeTask *)v6 setHawkeyeOpcode:517];
    v12[0] = 1;
    v12[1] = [(CLHawkeyeTask *)v6 hawkeyeOpcode];
    v12[2] = [(CLHawkeyeTask *)v6 hawkeyeOpcode] >> 8;
    unsigned int v13 = v8;
    unsigned int v14 = v9;
    [(CLHawkeyeTask *)v6 setHawkeyePayload:+[NSData dataWithBytes:v12 length:11]];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHawkeyeConfigureSeparatedStateTask;
  [(CLHawkeyeTask *)&v3 dealloc];
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unsigned)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unsigned int)a3
{
  self->_currentIndex = a3;
}

@end