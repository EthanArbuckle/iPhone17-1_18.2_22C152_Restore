@interface CLRunningFormHealthKitWriter
- (CLRunningFormHealthKitWriter)init;
- (void)dealloc;
@end

@implementation CLRunningFormHealthKitWriter

- (CLRunningFormHealthKitWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRunningFormHealthKitWriter;
  return [(CLRunningHealthKitWriter *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLRunningFormHealthKitWriter;
  [(CLRunningHealthKitWriter *)&v2 dealloc];
}

@end