@interface SummaryUpNextView
- (_TtC9SeymourUI17SummaryUpNextView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17SummaryUpNextView)initWithFrame:(CGRect)a3;
- (void)doneButtonTapped;
- (void)startButtonTapped;
@end

@implementation SummaryUpNextView

- (_TtC9SeymourUI17SummaryUpNextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17SummaryUpNextView *)sub_23A3241A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17SummaryUpNextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A325CE0();
}

- (void)startButtonTapped
{
}

- (void)doneButtonTapped
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_gymKitIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_workoutSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_summaryQueueCountView));

  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onStartButtonTapped));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI17SummaryUpNextView_onDoneButtonTapped);

  sub_239C25118(v3);
}

@end