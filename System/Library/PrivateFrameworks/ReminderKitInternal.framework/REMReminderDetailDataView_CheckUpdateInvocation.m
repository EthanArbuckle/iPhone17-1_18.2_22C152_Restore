@interface REMReminderDetailDataView_CheckUpdateInvocation
+ (BOOL)supportsSecureCoding;
- (REMReminderDetailDataView_CheckUpdateInvocation)initWithCoder:(id)a3;
- (REMReminderDetailDataView_CheckUpdateInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMReminderDetailDataView_CheckUpdateInvocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderDetailDataView_CheckUpdateInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMReminderDetailDataView_CheckUpdateInvocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end