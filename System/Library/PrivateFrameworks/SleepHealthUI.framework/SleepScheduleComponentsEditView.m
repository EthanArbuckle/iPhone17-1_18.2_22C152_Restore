@interface SleepScheduleComponentsEditView
- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithFrame:(CGRect)a3;
- (id)accessibilityClock;
- (id)accessibilityClockCaption;
- (id)accessibilityComponentsHeader;
- (id)accessibilityTimeInBedLabel;
- (void)clockDidChange:(id)a3;
- (void)editingDidChange:(id)a3;
- (void)editingDidEnd:(id)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SleepScheduleComponentsEditView

- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD898AF8();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD89560C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD895B28();
}

- (void)clockDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AD896578((uint64_t)v4);
}

- (void)editingDidChange:(id)a3
{
}

- (void)editingDidEnd:(id)a3
{
}

- (id)accessibilityComponentsHeader
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_componentsHeader));
}

- (id)accessibilityClock
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clock));
}

- (id)accessibilityClockCaption
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockCaption));
}

- (id)accessibilityTimeInBedLabel
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_timeInBed));
}

- (_TtC13SleepHealthUI31SleepScheduleComponentsEditView)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI31SleepScheduleComponentsEditView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD898C98((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_model);
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_componentsHeader));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clock));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_timeInBed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockCaption));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_clockWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView_captionTopConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI31SleepScheduleComponentsEditView____lazy_storage___formatter);
}

@end