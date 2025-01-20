@interface SILogicalTimestampInternal
- (BOOL)isEqual:(id)a3;
- (NSUUID)clockIdentifier;
- (SILogicalTimestampInternal)init;
- (SILogicalTimestampInternal)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4;
- (unint64_t)nanosecondsSinceBoot;
@end

@implementation SILogicalTimestampInternal

- (NSUUID)clockIdentifier
{
  uint64_t v2 = sub_1AE338228();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LogicalTimestamp.clockIdentifier.getter((uint64_t)v5);
  v6 = (void *)sub_1AE3381D8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)v6;
}

- (unint64_t)nanosecondsSinceBoot
{
  return LogicalTimestamp.nanosecondsSinceBoot.getter();
}

- (SILogicalTimestampInternal)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4
{
  uint64_t v5 = sub_1AE338228();
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AE3381F8();
  return (SILogicalTimestampInternal *)LogicalTimestamp.init(clockIdentifier:nanosecondsSinceBoot:)((uint64_t)v7, a4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1AE3385B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = LogicalTimestamp.isEqual(_:)((uint64_t)v8);

  sub_1ADA776DC((uint64_t)v8, &qword_1EB576AA0);
  return v6;
}

- (SILogicalTimestampInternal)init
{
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR___SILogicalTimestampInternal_clockIdentifier;
  sub_1AE338228();
  OUTLINED_FUNCTION_1_0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

@end