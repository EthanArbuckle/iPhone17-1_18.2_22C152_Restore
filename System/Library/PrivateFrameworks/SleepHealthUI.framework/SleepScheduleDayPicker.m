@interface SleepScheduleDayPicker
- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithFrame:(CGRect)a3;
- (id)accessibilityPickerDays;
- (void)didTapDay:(id)a3;
@end

@implementation SleepScheduleDayPicker

- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days) = (Class)MEMORY[0x1E4FBC860];
  id v5 = a3;

  result = (_TtC13SleepHealthUI22SleepScheduleDayPicker *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (id)accessibilityPickerDays
{
  swift_beginAccess();
  type metadata accessor for SleepScheduleDayPickerDay();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AD9DF850();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI22SleepScheduleDayPicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model));
  swift_bridgeObjectRelease();
}

- (void)didTapDay:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD9AE2D0(v4);
}

@end