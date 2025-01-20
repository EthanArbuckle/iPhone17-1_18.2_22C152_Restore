@interface BriefOneHourIsSixtyMinDateComponentsFormatter
- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)init;
- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)initWithCoder:(id)a3;
- (id)stringFromDateComponents:(id)a3;
- (id)stringFromTimeInterval:(double)a3;
@end

@implementation BriefOneHourIsSixtyMinDateComponentsFormatter

- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter();
  v2 = [(ForceDoubleZerosDateComponentsFormatter *)&v4 init];
  [(NSDateComponentsFormatter *)v2 setZeroFormattingBehavior:0x10000];
  [(NSDateComponentsFormatter *)v2 setUnitsStyle:5];

  return v2;
}

- (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter)initWithCoder:(id)a3
{
  result = (_TtC13SleepHealthUI45BriefOneHourIsSixtyMinDateComponentsFormatter *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  if (a3 > 3600.0) {
    uint64_t v4 = 96;
  }
  else {
    uint64_t v4 = 64;
  }
  v5 = self;
  [(NSDateComponentsFormatter *)v5 setAllowedUnits:v4];
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter();
  id v6 = [(ForceDoubleZerosDateComponentsFormatter *)&v10 stringFromTimeInterval:a3];
  if (v6)
  {
    v7 = v6;
    sub_1AD9DF710();

    v8 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }
  return v8;
}

- (id)stringFromDateComponents:(id)a3
{
  return sub_1AD8D7C70(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1AD8D7784);
}

@end