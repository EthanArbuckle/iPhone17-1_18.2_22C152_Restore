@interface ScheduleOccurrenceTitleView
- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithFrame:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ScheduleOccurrenceTitleView

- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD9CCE70();
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    v7 = self;
    id v4 = a3;
    objc_msgSend(v4, sel_bounds);
    sub_1AD9CC9F0(v5, v6);
  }
}

- (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView)initWithFrame:(CGRect)a3
{
  result = (_TtC13SleepHealthUI27ScheduleOccurrenceTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint);
}

@end