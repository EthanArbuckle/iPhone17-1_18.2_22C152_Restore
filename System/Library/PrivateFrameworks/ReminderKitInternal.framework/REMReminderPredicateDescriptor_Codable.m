@interface REMReminderPredicateDescriptor_Codable
+ (BOOL)supportsSecureCoding;
- (REMReminderPredicateDescriptor_Codable)initWithCoder:(id)a3;
- (REMReminderPredicateDescriptor_Codable)initWithReminderPredicateDescriptor:(id)a3;
- (REMReminderPredicateDescriptor_Codable)initWithType:(int64_t)a3;
@end

@implementation REMReminderPredicateDescriptor_Codable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderPredicateDescriptor_Codable)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMReminderPredicateDescriptor *)&v5 initWithCoder:a3];
}

- (REMReminderPredicateDescriptor_Codable)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(REMReminderPredicateDescriptor *)&v5 initWithType:a3];
}

- (REMReminderPredicateDescriptor_Codable)initWithReminderPredicateDescriptor:(id)a3
{
  id v3 = a3;
  result = (REMReminderPredicateDescriptor_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end