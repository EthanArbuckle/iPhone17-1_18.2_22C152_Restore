@interface REMReminderFetchOptions_Codable
- (REMReminderFetchOptions_Codable)init;
- (REMReminderFetchOptions_Codable)initWithIncludeConcealed:(BOOL)a3 includeDueDateDeltaAlerts:(BOOL)a4;
@end

@implementation REMReminderFetchOptions_Codable

- (REMReminderFetchOptions_Codable)initWithIncludeConcealed:(BOOL)a3 includeDueDateDeltaAlerts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(REMReminderFetchOptions *)&v7 initWithIncludeConcealed:v5 includeDueDateDeltaAlerts:v4];
}

- (REMReminderFetchOptions_Codable)init
{
  result = (REMReminderFetchOptions_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end