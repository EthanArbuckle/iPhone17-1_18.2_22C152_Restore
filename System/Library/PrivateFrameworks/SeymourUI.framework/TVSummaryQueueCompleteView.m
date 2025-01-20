@interface TVSummaryQueueCompleteView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithCoder:(id)a3;
- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithFrame:(CGRect)a3;
- (void)doneButtonTapped;
- (void)saveButtonTapped;
@end

@implementation TVSummaryQueueCompleteView

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A810430;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_doneButton);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_saveButton);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  sub_23A7FFC98();
  id v6 = v4;
  id v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v8 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v8;
}

- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TVSummaryQueueCompleteView *)sub_23A151724(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TVSummaryQueueCompleteView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A1535CC();
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
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalTimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalTimeDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalEnergyTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalEnergyDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalDistanceTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_totalDistanceDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_saveButton));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onDoneButtonTapped));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI26TVSummaryQueueCompleteView_onSaveButtonTapped);

  sub_239C25118(v3);
}

@end