@interface SleepScheduleComponentsHeader
- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityBedtimeTimeLabel;
- (id)accessibilityWakeUpTimeLabel;
- (void)tintColorDidChange;
@end

@implementation SleepScheduleComponentsHeader

- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD92EDB0();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SleepScheduleComponentsHeader *)&v3 tintColorDidChange];
  sub_1AD92B790();
}

- (id)accessibilityBedtimeTimeLabel
{
  id v2 = self;
  id v3 = sub_1AD92C0B8(&OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTimeLabel, (uint64_t (*)(uint64_t))sub_1AD92C638);

  return v3;
}

- (id)accessibilityWakeUpTimeLabel
{
  id v2 = self;
  id v3 = sub_1AD92C2F0(&OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTimeLabel, (uint64_t (*)(void))sub_1AD92C74C);

  return v3;
}

- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI29SleepScheduleComponentsHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD898C98((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeDayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpDayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader_sizingTimeLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end