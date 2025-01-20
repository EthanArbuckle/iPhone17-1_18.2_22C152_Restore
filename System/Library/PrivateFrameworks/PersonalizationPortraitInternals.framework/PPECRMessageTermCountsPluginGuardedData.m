@interface PPECRMessageTermCountsPluginGuardedData
- (PPECRMessageTermCountsPluginGuardedData)init;
@end

@implementation PPECRMessageTermCountsPluginGuardedData

- (void).cxx_destruct
{
}

- (PPECRMessageTermCountsPluginGuardedData)init
{
  v3.receiver = self;
  v3.super_class = (Class)PPECRMessageTermCountsPluginGuardedData;
  result = [(PPECRMessageTermCountsPluginGuardedData *)&v3 init];
  if (result) {
    result->_eventCount = 0;
  }
  return result;
}

@end