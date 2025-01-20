@interface PFScheduledOperationConstants
+ (NSString)reportStorageAnalyticsOperation;
- (PFScheduledOperationConstants)init;
@end

@implementation PFScheduledOperationConstants

+ (NSString)reportStorageAnalyticsOperation
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (PFScheduledOperationConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScheduledOperationConstants();
  return [(PFScheduledOperationConstants *)&v3 init];
}

@end