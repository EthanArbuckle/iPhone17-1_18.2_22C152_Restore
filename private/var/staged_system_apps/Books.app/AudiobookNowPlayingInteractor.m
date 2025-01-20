@interface AudiobookNowPlayingInteractor
- (BOOL)isAudiobook;
- (BOOL)isCloud;
- (BOOL)isDownloading;
- (BOOL)isLocal;
- (BOOL)isPreordered;
- (BOOL)isSample;
- (BOOL)isStore;
- (REBuyBookServiceDelegate)serviceDelegate;
- (_TtC5Books29AudiobookNowPlayingInteractor)init;
- (void)buyBookWithCompletion:(id)a3;
- (void)setServiceDelegate:(id)a3;
@end

@implementation AudiobookNowPlayingInteractor

- (REBuyBookServiceDelegate)serviceDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (REBuyBookServiceDelegate *)Strong;
}

- (void)setServiceDelegate:(id)a3
{
}

- (_TtC5Books29AudiobookNowPlayingInteractor)init
{
  result = (_TtC5Books29AudiobookNowPlayingInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_delegate);
  swift_release();
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_currentChapter);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_transferLockController));

  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_lastUserProgressChangeTimestamp, (uint64_t *)&unk_100B2BD50);
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_buyButtonPresenter, (uint64_t *)&unk_100B2BD68);

  v3 = (char *)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_logger;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_serviceDelegate);

  swift_bridgeObjectRelease();
}

- (BOOL)isStore
{
  return 1;
}

- (BOOL)isLocal
{
  return *(unsigned __int16 *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_assetState) == 1;
}

- (BOOL)isDownloading
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_downloadState) == (Class)1;
}

- (BOOL)isCloud
{
  return 0;
}

- (BOOL)isSample
{
  return 1;
}

- (BOOL)isAudiobook
{
  return 1;
}

- (BOOL)isPreordered
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  sub_10005DA74(v3, v3[3]);
  uint64_t v4 = self;
  LOBYTE(v3) = sub_1004B1894();

  return v3 & 1;
}

- (void)buyBookWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100311140((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end