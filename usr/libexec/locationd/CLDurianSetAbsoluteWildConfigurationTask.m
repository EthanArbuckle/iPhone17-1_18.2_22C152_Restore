@interface CLDurianSetAbsoluteWildConfigurationTask
- (CLDurianSetAbsoluteWildConfigurationTask)initWithConfiguration:(id)a3;
- (CLFindMyAccessoryAbsoluteWildConfiguration)configuration;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)willStart;
@end

@implementation CLDurianSetAbsoluteWildConfigurationTask

- (CLDurianSetAbsoluteWildConfigurationTask)initWithConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianSetAbsoluteWildConfigurationTask;
  v4 = [(CLDurianTask *)&v6 initWithCommand:0 desiredLatency:-6 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v4) {
    v4->_configuration = (CLFindMyAccessoryAbsoluteWildConfiguration *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianSetAbsoluteWildConfigurationTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (void)willStart
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianSetAbsoluteWildConfigurationTask;
  [(CLDurianTask *)&v3 willStart];
  [(CLDurianTask *)self setCommand:+[CLDurianCommand commandWithOpcode:45 payload:[(CLFindMyAccessoryAbsoluteWildConfiguration *)self->_configuration encodeConfiguration]]];
}

- (CLFindMyAccessoryAbsoluteWildConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

@end