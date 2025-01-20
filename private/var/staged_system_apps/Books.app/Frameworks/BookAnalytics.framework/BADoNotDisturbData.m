@interface BADoNotDisturbData
- (BADoNotDisturbData)init;
- (BADoNotDisturbData)initWithStartStatus:(int64_t)a3 endStatus:(int64_t)a4;
@end

@implementation BADoNotDisturbData

- (BADoNotDisturbData)initWithStartStatus:(int64_t)a3 endStatus:(int64_t)a4
{
  return (BADoNotDisturbData *)sub_E2790((char *)self, (uint64_t)a2, a3, a4, &OBJC_IVAR___BADoNotDisturbData_startStatus, &OBJC_IVAR___BADoNotDisturbData_endStatus, type metadata accessor for BridgedDoNotDisturbData);
}

- (BADoNotDisturbData)init
{
  result = (BADoNotDisturbData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end