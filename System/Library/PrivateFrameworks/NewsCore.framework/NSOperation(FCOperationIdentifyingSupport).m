@interface NSOperation(FCOperationIdentifyingSupport)
- (id)longOperationDescription;
- (uint64_t)shortOperationDescription;
@end

@implementation NSOperation(FCOperationIdentifyingSupport)

- (uint64_t)shortOperationDescription
{
  return [NSString stringWithFormat:@"<%@>", objc_opt_class()];
}

- (id)longOperationDescription
{
  v2 = FCStringFromQualityOfService([a1 qualityOfService]);
  v3 = FCStringFromQueuePriority([a1 queuePriority]);
  v4 = [NSString stringWithFormat:@"<%@ qos=%@, priority=%@>", objc_opt_class(), v2, v3];

  return v4;
}

@end