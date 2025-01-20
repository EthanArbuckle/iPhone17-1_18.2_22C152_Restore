@interface SummaryQueueCompleteView
- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithCoder:(id)a3;
- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithFrame:(CGRect)a3;
- (void)doneButtonTapped;
- (void)saveButtonTapped;
@end

@implementation SummaryQueueCompleteView

- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI24SummaryQueueCompleteView *)sub_23A626514(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI24SummaryQueueCompleteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A628538();
}

- (void)doneButtonTapped
{
}

- (void)saveButtonTapped
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalTimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalTimeDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalEnergyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalEnergyDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalDistanceTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_totalDistanceDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_saveButton));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onDoneButtonTapped));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI24SummaryQueueCompleteView_onSaveButtonTapped);

  sub_239C25118(v3);
}

@end