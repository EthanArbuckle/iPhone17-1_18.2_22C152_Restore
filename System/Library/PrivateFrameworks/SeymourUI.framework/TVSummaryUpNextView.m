@interface TVSummaryUpNextView
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI19TVSummaryUpNextView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19TVSummaryUpNextView)initWithFrame:(CGRect)a3;
- (void)doneButtonTapped;
- (void)startButtonTapped;
@end

@implementation TVSummaryUpNextView

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A810430;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_startButton);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_doneButton);
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

- (_TtC9SeymourUI19TVSummaryUpNextView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19TVSummaryUpNextView *)sub_23A00854C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19TVSummaryUpNextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A00A368();
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
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_gymKitIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_workoutSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_summaryQueueCountView));

  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onStartButtonTapped));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI19TVSummaryUpNextView_onDoneButtonTapped);

  sub_239C25118(v3);
}

@end