@interface SleepScheduleClockCaption
- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithFrame:(CGRect)a3;
- (id)accessibilityClockCaptionMessage;
@end

@implementation SleepScheduleClockCaption

- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleClockCaption_message) = 6;
  id v4 = a3;

  result = (_TtC13SleepHealthUI25SleepScheduleClockCaption *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)accessibilityClockCaptionMessage
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleClockCaption_message);
  if (v2 == 6)
  {
    v3 = 0;
  }
  else
  {
    sub_1AD8B33D4(v2);
    v3 = (void *)sub_1AD9DF6D0();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI25SleepScheduleClockCaption *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end