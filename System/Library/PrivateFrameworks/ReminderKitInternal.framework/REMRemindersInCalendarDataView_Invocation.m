@interface REMRemindersInCalendarDataView_Invocation
+ (BOOL)supportsSecureCoding;
- (REMRemindersInCalendarDataView_Invocation)initWithCoder:(id)a3;
- (REMRemindersInCalendarDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3;
@end

@implementation REMRemindersInCalendarDataView_Invocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRemindersInCalendarDataView_Invocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithFetchResultTokenToDiffAgainst:a3];
}

- (REMRemindersInCalendarDataView_Invocation)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMStoreSwiftInvocation *)&v5 initWithCoder:a3];
}

@end