@interface ShorterDateComponentsFormatter
- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)init;
- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)initWithCoder:(id)a3;
- (id)stringFromDateComponents:(id)a3;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation ShorterDateComponentsFormatter

- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI30ShorterDateComponentsFormatter *)sub_1AD9E0140();
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
    sub_1AD9DF710();

    v9 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v9 = 0;
  }
  return v9;
}

- (id)stringFromDateComponents:(id)a3
{
  return sub_1AD8D7C70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AD8D7B98);
}

- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)init
{
  result = (_TtC13SleepHealthUI30ShorterDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end