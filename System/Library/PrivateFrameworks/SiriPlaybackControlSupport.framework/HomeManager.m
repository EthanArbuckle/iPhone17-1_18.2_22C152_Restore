@interface HomeManager
- (_TtC26SiriPlaybackControlSupport11HomeManager)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeManager

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235B315CC(v4);
}

- (_TtC26SiriPlaybackControlSupport11HomeManager)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData);
  id v4 = *(void **)&self->homeManagerRefreshTimeout[OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData];
  v5 = *(void **)&self->hmHomeManager[OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v6 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homekitInitSignpostID;
  uint64_t v7 = sub_235B7D4F0();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homekitRefreshSignpostID, v7);

  swift_release();
  swift_release();
}

@end