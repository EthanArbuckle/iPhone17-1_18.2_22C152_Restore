@interface ShortHourDateComponentsFormatter
- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)init;
- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)initWithCoder:(id)a3;
- (id)stringFromDateComponents:;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation ShortHourDateComponentsFormatter

- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  v4 = self;
  sub_1AD8D8074(a3);
  uint64_t v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)init
{
  result = (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)stringFromDateComponents:
{
  uint64_t v0 = sub_1AD9DC990();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0, v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DC8C0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 0;
}

@end