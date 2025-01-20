@interface SessionCastingPresenter
- (_TtC9SeymourUI23SessionCastingPresenter)init;
@end

@implementation SessionCastingPresenter

- (_TtC9SeymourUI23SessionCastingPresenter)init
{
  result = (_TtC9SeymourUI23SessionCastingPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onExitButtonTapped));
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onAirplayButtonTapped));
  sub_239C25118(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_onStartIntentExpressed));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_sessionClient);
  swift_release();
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23SessionCastingPresenter_workoutDeviceConnection, (uint64_t *)&unk_268A12200);
}

@end