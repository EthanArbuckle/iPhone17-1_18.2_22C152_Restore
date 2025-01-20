@interface TRIBaseTask
- (BOOL)isEqual:(id)a3;
- (NSArray)dependencies;
- (NSArray)tags;
- (NSDate)startTime;
- (NSString)taskName;
- (TRITaskQueueStateProviding)stateProvider;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requiredCapabilities;
- (void)setStartTime:(id)a3;
- (void)setStateProvider:(id)a3;
@end

@implementation TRIBaseTask

- (NSString)taskName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSArray)tags
{
  return 0;
}

- (NSArray)dependencies
{
  return 0;
}

- (unint64_t)requiredCapabilities
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRIBaseTask *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v2 = [(TRIBaseTask *)self taskName];
  unint64_t v3 = [v2 hash] + 629;

  return v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@:%p>", objc_opt_class(), self];
  return v2;
}

- (NSDate)startTime
{
  return self->startTime;
}

- (void)setStartTime:(id)a3
{
}

- (TRITaskQueueStateProviding)stateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateProvider);
  return (TRITaskQueueStateProviding *)WeakRetained;
}

- (void)setStateProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateProvider);
  objc_storeStrong((id *)&self->startTime, 0);
}

@end