@interface PaceFormatter
- (_TtC10FitnessApp13PaceFormatter)init;
- (_TtC10FitnessApp13PaceFormatter)initWithCoder:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation PaceFormatter

- (id)stringForObjectValue:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  sub_1003353C0((uint64_t)v10);
  uint64_t v7 = v6;

  sub_10008DB18((uint64_t)v10, &qword_100955A00);
  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

- (_TtC10FitnessApp13PaceFormatter)init
{
  return (_TtC10FitnessApp13PaceFormatter *)sub_100335A1C();
}

- (_TtC10FitnessApp13PaceFormatter)initWithCoder:(id)a3
{
  return (_TtC10FitnessApp13PaceFormatter *)sub_100335B84(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp13PaceFormatter_minutesFormatter);
}

@end