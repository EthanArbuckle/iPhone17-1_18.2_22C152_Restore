@interface AudiobookNowPlayingDataManager
- (BOOL)coverEffectsNightMode;
- (_TtC5Books30AudiobookNowPlayingDataManager)init;
- (id)coverEffectRTLOverride;
- (unint64_t)coverEffectsContent;
- (void)audiobookBuyButtonProgressDidChangeTo:(double)a3;
- (void)audiobookCoverWillChangeTo:(CGImage *)a3;
- (void)audiobookIsStreamingDidChangeTo:(BOOL)a3;
- (void)audiobookPreorderStateChangedTo:(BOOL)a3;
- (void)audiobookProductProfileDidChangeTo:(id)a3;
- (void)audiobookStoreIDDidChangeTo:(id)a3;
- (void)dealloc;
- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5;
- (void)player:(id)a3 artworkDidChange:(CGImage *)a4;
- (void)player:(id)a3 audiobookDidChange:(id)a4;
- (void)player:(id)a3 bufferedPositionsDidChangeInChapter:(unint64_t)a4 bufferInfo:(id)a5;
- (void)player:(id)a3 chapterDidChange:(id)a4;
- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6;
- (void)player:(id)a3 failedWithError:(id)a4;
- (void)player:(id)a3 isScrubbing:(BOOL)a4;
- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5;
- (void)player:(id)a3 playbackRateDidChange:(float)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)player:(id)a3 volumeDidChange:(float)a4;
- (void)skipController:(id)a3 updatedCumulativeDelta:(double)a4;
- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4;
- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4;
- (void)skipControllerSettingsDidChange:(id)a3;
- (void)sleepTimer:(id)a3 remainingTimeDidUpdate:(double)a4;
- (void)sleepTimerCanceled:(id)a3;
- (void)sleepTimerDidExpire:(id)a3;
- (void)sleepTimerEnabled:(id)a3;
@end

@implementation AudiobookNowPlayingDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  v5 = self;
  [v4 removeObserver:v5];
  id v6 = [*(id *)((char *)&v5->super.isa+ OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_libraryItemStateProvider) stateCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(AudiobookNowPlayingDataManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_persistenceController));

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_logger;
  uint64_t v4 = sub_1007F6BC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC5Books30AudiobookNowPlayingDataManager)init
{
  result = (_TtC5Books30AudiobookNowPlayingDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)audiobookBuyButtonProgressDidChangeTo:(double)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)(Strong + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_buyButtonPresenter);
    swift_beginAccess();
    uint64_t v7 = v6[3];
    if (v7)
    {
      sub_10005DA74(v6, v7);
      sub_10004A860(0, (unint64_t *)&qword_100B235A0);
      uint64_t v8 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v8;
      *(double *)(v9 + 24) = a3;
      v10 = self;
      swift_retain();
      sub_1007FE6C0();

      swift_unknownObjectRelease();
      swift_release();
      swift_release();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

- (void)audiobookCoverWillChangeTo:(CGImage *)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    if (a3)
    {
      v5 = a3;
      id v6 = self;
      sub_10030BF38(a3);
    }
    swift_unknownObjectRelease();
  }
}

- (void)audiobookIsStreamingDidChangeTo:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_streaming) = a3;
}

- (void)audiobookProductProfileDidChangeTo:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1007FDA70();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1004B3A60(v4);

  swift_bridgeObjectRelease();
}

- (void)audiobookStoreIDDidChangeTo:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1007FDC70();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_storeID);
  *id v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (void)audiobookPreorderStateChangedTo:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  sub_1004B3BD0(v3);
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
}

- (void)player:(id)a3 artworkDidChange:(CGImage *)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = a4;
  uint64_t v8 = self;
  sub_1004B4074((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  swift_unknownObjectRetain();
  v11 = self;
  sub_1004B446C((uint64_t)a3, a5, a4, a6);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 bufferedPositionsDidChangeInChapter:(unint64_t)a4 bufferInfo:(id)a5
{
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1004B4614(a3, (char **)a4, v9);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  swift_unknownObjectRetain();
  id v8 = a4;
  uint64_t v7 = self;
  sub_1004B4ABC((uint64_t)a3, (uint64_t)v8);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
}

- (void)player:(id)a3 isScrubbing:(BOOL)a4
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1004B5AFC((uint64_t)a3, a4);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  swift_unknownObjectRetain();
  id v8 = self;
  sub_1004B73B4((uint64_t)a3, a5);
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 volumeDidChange:(float)a4
{
}

- (void)player:(id)a3 isStalling:(BOOL)a4 isLoadingResources:(BOOL)a5
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1004B5F3C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)sleepTimerEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004B74A4((uint64_t)&unk_100A5CD88, (uint64_t)sub_1004B7EC8, (uint64_t)&unk_100A5CDA0);
}

- (void)sleepTimerDidExpire:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004B74A4((uint64_t)&unk_100A5CD38, (uint64_t)sub_1004B81BC, (uint64_t)&unk_100A5CD50);
}

- (void)sleepTimerCanceled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004B74A4((uint64_t)&unk_100A5CCE8, (uint64_t)sub_1004B7EAC, (uint64_t)&unk_100A5CD00);
}

- (void)sleepTimer:(id)a3 remainingTimeDidUpdate:(double)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1004B7778(a4);
}

- (void)skipController:(id)a3 willBeginSkippingInDirection:(unint64_t)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      id v6 = a3;
      uint64_t v7 = self;
      sub_1005AB330(1u);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)skipController:(id)a3 updatedCumulativeDelta:(double)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v7 = *(void **)(Strong + 16);
      swift_getKeyPath();
      swift_getKeyPath();
      id v8 = a3;
      id v9 = self;
      id v10 = v7;
      sub_1007F7860();

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

- (void)skipControllerDidEndSkipping:(id)a3 actionSource:(unint64_t)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    if (swift_unknownObjectWeakLoadStrong())
    {
      id v6 = a3;
      uint64_t v7 = self;
      sub_1005AB330(0);

      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
  }
}

- (void)skipControllerSettingsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1004B6884(v4);
}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  return 0;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5
{
  uint64_t v8 = sub_1007FDC70();
  uint64_t v10 = v9;
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  sub_1004B7A68((uint64_t)a4, v8, v10);

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end