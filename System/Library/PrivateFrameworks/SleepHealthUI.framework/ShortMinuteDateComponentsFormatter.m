@interface ShortMinuteDateComponentsFormatter
- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)init;
- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)initWithCoder:(id)a3;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation ShortMinuteDateComponentsFormatter

- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  id v5 = objc_allocWithZone(NSNumber);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_initWithDouble_, a3);
  swift_beginAccess();
  id v8 = (id)HKTimePeriodString();

  if (v8)
  {
    uint64_t v10 = sub_1AD9DF710();
    uint64_t v12 = v11;

    sub_1AD8D6E0C(v10, v12);
    swift_bridgeObjectRelease();
    v13 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)init
{
  id result = (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end