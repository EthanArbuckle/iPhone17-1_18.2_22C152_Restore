@interface REMICloudIsOffDataViewConfigurationsInvocationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithCoder:(id)a3;
- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithTimeIntervalSinceLastPrompt:(double)a3;
- (double)timeIntervalSinceLastPrompt;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMICloudIsOffDataViewConfigurationsInvocationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithTimeIntervalSinceLastPrompt:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMICloudIsOffDataViewConfigurationsInvocationResult;
  result = [(REMStoreInvocationValueStorage *)&v5 init];
  if (result) {
    result->_timeIntervalSinceLastPrompt = a3;
  }
  return result;
}

- (REMICloudIsOffDataViewConfigurationsInvocationResult)initWithCoder:(id)a3
{
  [a3 decodeDoubleForKey:@"timeIntervalSinceLastPrompt"];

  return -[REMICloudIsOffDataViewConfigurationsInvocationResult initWithTimeIntervalSinceLastPrompt:](self, "initWithTimeIntervalSinceLastPrompt:");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(REMICloudIsOffDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastPrompt];
  objc_msgSend(v4, "encodeDouble:forKey:", @"timeIntervalSinceLastPrompt");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(REMICloudIsOffDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastPrompt];
    double v6 = v5;
    [v4 timeIntervalSinceLastPrompt];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  [(REMICloudIsOffDataViewConfigurationsInvocationResult *)self timeIntervalSinceLastPrompt];
  return (unint64_t)v2;
}

- (double)timeIntervalSinceLastPrompt
{
  return self->_timeIntervalSinceLastPrompt;
}

@end