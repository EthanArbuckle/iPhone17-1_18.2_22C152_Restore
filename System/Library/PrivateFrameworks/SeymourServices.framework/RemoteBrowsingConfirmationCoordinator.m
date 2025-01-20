@interface RemoteBrowsingConfirmationCoordinator
- (_TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator)init;
@end

@implementation RemoteBrowsingConfirmationCoordinator

- (_TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator)init
{
  result = (_TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_remoteBrowsingEnvironmentBuilder);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_state);
  uint64_t v4 = *(void *)&self->lock[OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_state];
  uint64_t v5 = *(void *)&self->platform[OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_state];
  uint64_t v6 = *(void *)&self->remoteBrowsingEnvironmentBuilder[OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_state
                                                        + 7];
  char v7 = self->remoteBrowsingEnvironmentBuilder[OBJC_IVAR____TtC15SeymourServices37RemoteBrowsingConfirmationCoordinator_state
                                            + 15];

  sub_1D6BAE55C(v3, v4, v5, v6, v7);
}

@end