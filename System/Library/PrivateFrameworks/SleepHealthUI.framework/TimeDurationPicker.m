@interface TimeDurationPicker
- (_TtC13SleepHealthUI18TimeDurationPicker)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI18TimeDurationPicker)initWithFrame:(CGRect)a3;
- (id)accessibilityDurationLabel;
- (void)decrease;
- (void)increase;
@end

@implementation TimeDurationPicker

- (_TtC13SleepHealthUI18TimeDurationPicker)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD9ACCB4();
}

- (void)decrease
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
  if (v2)
  {
    BOOL v3 = __OFSUB__(v2, 1);
    v4 = (objc_class *)(v2 - 1);
    if (v3)
    {
      __break(1u);
    }
    else
    {
      *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex) = v4;
      v5 = self;
      sub_1AD9AC29C();
    }
  }
}

- (void)increase
{
  uint64_t v2 = self;
  sub_1AD9AC8B4();
}

- (id)accessibilityDurationLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel));
}

- (_TtC13SleepHealthUI18TimeDurationPicker)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI18TimeDurationPicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_plusButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_minusButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel);
}

@end