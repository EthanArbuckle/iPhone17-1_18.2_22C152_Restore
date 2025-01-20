@interface TTRIDebugDropIndicatorView
- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)updateConstraints;
@end

@implementation TTRIDebugDropIndicatorView

- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore26TTRIDebugDropIndicatorView *)sub_1B975C3B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B975D3FC();
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIDebugDropIndicatorView.layoutSubviews()();
}

- (void)updateConstraints
{
  v2 = self;
  TTRIDebugDropIndicatorView.updateConstraints()();
}

- (void).cxx_destruct
{
  sub_1B975C204((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_currentDropContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_line));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_infoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_info));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_lineYPositionInTargetViewConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_activeDropTargetView);
}

@end