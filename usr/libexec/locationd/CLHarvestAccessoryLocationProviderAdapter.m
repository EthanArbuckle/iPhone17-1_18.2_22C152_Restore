@interface CLHarvestAccessoryLocationProviderAdapter
- (BOOL)valid;
- (CLHarvestAccessoryLocationProviderAdapter)initWithMonitorGpsExternal:(void *)a3;
- (void)accessoryDidConnect:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLHarvestAccessoryLocationProviderAdapter

- (CLHarvestAccessoryLocationProviderAdapter)initWithMonitorGpsExternal:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLHarvestAccessoryLocationProviderAdapter;
  result = [(CLHarvestAccessoryLocationProviderAdapter *)&v5 init];
  if (result)
  {
    result->_monitorGpsExternal = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)accessoryDidConnect:(id)a3
{
}

- (void)accessoryDidDisconnect:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end