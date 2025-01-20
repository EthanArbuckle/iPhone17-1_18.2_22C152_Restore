@interface KTFetchCloudOperation
- (BOOL)shouldRetry;
@end

@implementation KTFetchCloudOperation

- (BOOL)shouldRetry
{
  return self->_shouldRetry;
}

@end