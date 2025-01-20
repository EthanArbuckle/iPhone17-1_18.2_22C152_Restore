@interface NSURLSessionTask(FCOperationIdentifyingSupport)
- (id)longOperationDescription;
- (id)shortOperationDescription;
@end

@implementation NSURLSessionTask(FCOperationIdentifyingSupport)

- (id)longOperationDescription
{
  v2 = NSString;
  v3 = [a1 description];
  [a1 priority];
  v5 = [v2 stringWithFormat:@"<NSURLSessionTask %@, priority=%.2f>", v3, v4];

  return v5;
}

- (id)shortOperationDescription
{
  v1 = NSString;
  v2 = [a1 description];
  v3 = [v1 stringWithFormat:@"<NSURLSessionTask %@>", v2];

  return v3;
}

@end