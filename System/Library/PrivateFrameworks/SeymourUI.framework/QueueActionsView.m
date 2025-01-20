@interface QueueActionsView
- (_TtC9SeymourUI16QueueActionsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI16QueueActionsView)initWithFrame:(CGRect)a3;
@end

@implementation QueueActionsView

- (_TtC9SeymourUI16QueueActionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A6CCE9C();
}

- (_TtC9SeymourUI16QueueActionsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI16QueueActionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16QueueActionsView_mediaTagStringBuilder);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16QueueActionsView_totalDurationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16QueueActionsView_workoutsMetadataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16QueueActionsView_actionButtonView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI16QueueActionsView_zeroHeightConstraint);
}

@end