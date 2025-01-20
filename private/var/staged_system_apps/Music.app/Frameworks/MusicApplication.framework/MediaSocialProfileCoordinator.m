@interface MediaSocialProfileCoordinator
- (_TtC16MusicApplication29MediaSocialProfileCoordinator)init;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)handleProfileDidExpire:(id)a3;
@end

@implementation MediaSocialProfileCoordinator

- (_TtC16MusicApplication29MediaSocialProfileCoordinator)init
{
  return (_TtC16MusicApplication29MediaSocialProfileCoordinator *)sub_3B1D14();
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3B7198((uint64_t)&unk_CEB368, (uint64_t)sub_3B7AB4, (uint64_t)&block_descriptor_103_2);
}

- (void)handleProfileDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3B54C8(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_accessQueue));
  swift_release();
  sub_3B6ED0((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_lastAuthenticationAttempt);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_profileInvalidationTimer));
  sub_3B6CE8((uint64_t)self + OBJC_IVAR____TtC16MusicApplication29MediaSocialProfileCoordinator_state, (uint64_t)v3);
  sub_3B77F0(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_3B6D20);
}

@end