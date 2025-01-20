@interface RelativeWeekdayFormatter
- (_TtC13SleepHealthUI24RelativeWeekdayFormatter)init;
- (_TtC13SleepHealthUI24RelativeWeekdayFormatter)initWithCoder:(id)a3;
- (id)stringFromDate:(id)a3;
@end

@implementation RelativeWeekdayFormatter

- (id)stringFromDate:(id)a3
{
  uint64_t v4 = sub_1AD9DCC70();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCC40();
  v9 = self;
  sub_1AD942474((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v10 = (void *)sub_1AD9DF6D0();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC13SleepHealthUI24RelativeWeekdayFormatter)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___relativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___nonRelativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___weekdayFormatter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RelativeWeekdayFormatter();
  return [(RelativeWeekdayFormatter *)&v3 init];
}

- (_TtC13SleepHealthUI24RelativeWeekdayFormatter)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___relativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___nonRelativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___weekdayFormatter) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RelativeWeekdayFormatter();
  return [(RelativeWeekdayFormatter *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___relativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___nonRelativeDateFormatter));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI24RelativeWeekdayFormatter____lazy_storage___weekdayFormatter);
}

@end