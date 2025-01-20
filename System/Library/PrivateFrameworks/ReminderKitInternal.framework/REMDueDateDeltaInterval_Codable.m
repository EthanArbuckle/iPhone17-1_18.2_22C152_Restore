@interface REMDueDateDeltaInterval_Codable
+ (BOOL)supportsSecureCoding;
- (REMDueDateDeltaInterval_Codable)init;
- (REMDueDateDeltaInterval_Codable)initWithUnit:(int64_t)a3 count:(int64_t)a4;
- (REMDueDateDeltaInterval_Codable)initWithUnitInteger:(int64_t)a3 count:(int64_t)a4;
@end

@implementation REMDueDateDeltaInterval_Codable

- (REMDueDateDeltaInterval_Codable)initWithUnit:(int64_t)a3 count:(int64_t)a4
{
  return (REMDueDateDeltaInterval_Codable *)sub_1A7510B58(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_initWithUnit_count_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMDueDateDeltaInterval_Codable)initWithUnitInteger:(int64_t)a3 count:(int64_t)a4
{
  result = (REMDueDateDeltaInterval_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (REMDueDateDeltaInterval_Codable)init
{
  result = (REMDueDateDeltaInterval_Codable *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end