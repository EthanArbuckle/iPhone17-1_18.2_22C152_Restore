@interface AudiobookNowPlayingPresenter
- (AEAssetAudiobookStatus)assetStatus;
- (BOOL)activeMode;
- (BOOL)audiobookTimeRemainingMode;
- (BOOL)isScrubbing;
- (NSArray)playbackRates;
- (float)playbackRate;
- (id)analyticsAssetPropertyProviderFor:(id)a3 actionSource:(id)a4;
- (id)analyticsData;
- (id)contextMenuItemsFor:(id)a3 from:(id)a4 actionSource:(id)a5;
- (int64_t)sleepTimerOption;
- (uint64_t)coverSkipEnd;
- (void)cancelDownload;
- (void)clearAudiobook;
- (void)goToChapterIndex:(int64_t)a3;
- (void)pause;
- (void)play;
- (void)scrubTo:(float)a3 completion:(id)a4;
- (void)setActiveMode:(BOOL)a3;
- (void)setAudiobookTimeRemainingMode:(BOOL)a3;
- (void)setBuyButtonProgress:(double)a3;
- (void)setIsScrubbing:(BOOL)a3;
- (void)setPlaybackRateTo:(float)a3;
- (void)setSleepTimerOption:(int64_t)a3;
- (void)setVolume:(float)a3;
- (void)setWithDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5;
- (void)startDownload;
- (void)startSkipBackwardWithActionSource:(unint64_t)a3;
- (void)startSkipForwardWithActionSource:(unint64_t)a3;
- (void)stop;
- (void)togglePlayPause;
- (void)toolbarStartSkipBackward;
- (void)toolbarStartSkipForward;
- (void)updateFollowingDormantPeriod;
- (void)viewSupplementalContentWithViewController:(id)a3;
@end

@implementation AudiobookNowPlayingPresenter

- (void)cancelDownload
{
}

- (void)clearAudiobook
{
  interactor = self->interactor;
  swift_beginAccess();
  v4 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  sub_10005DA74(v4, v4[3]);
  swift_retain();
  sub_1004B3420();
  swift_release();
}

- (void)setPlaybackRateTo:(float)a3
{
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *sub_10005DA74(interactor, *(void *)&self->interactor[24])
     + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager;
  swift_beginAccess();
  uint64_t v7 = *(void *)(v6 + 24);
  uint64_t v8 = *(void *)(v6 + 32);
  sub_1000782E4(v6, v7);
  v9 = *(void (**)(uint64_t, uint64_t, float))(v8 + 152);
  swift_retain();
  v9(v7, v8, a3);
  swift_endAccess();
  swift_release();
}

- (uint64_t)coverSkipEnd
{
  v2 = (void *)(a1 + 24);
  swift_beginAccess();
  v3 = (void *)(*sub_10005DA74(v2, *(void *)(a1 + 48))
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  v4 = *(void **)(*sub_10005DA74(v3, v3[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  swift_retain();
  objc_msgSend(objc_msgSend(v4, "skipController"), "endSkip");
  swift_release();
  return swift_unknownObjectRelease();
}

- (void)goToChapterIndex:(int64_t)a3
{
  interactor = self->interactor;
  swift_beginAccess();
  sub_10005DA74(interactor, *(void *)&self->interactor[24]);
  swift_retain();
  sub_1003078A0(a3);
  swift_release();
}

- (void)pause
{
}

- (void)play
{
  interactor = self->interactor;
  swift_beginAccess();
  sub_10005DA74(interactor, *(void *)&self->interactor[24]);
  swift_retain();
  sub_100309178(0);
  swift_release();
}

- (void)stop
{
}

- (void)scrubTo:(float)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_100242DB4;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  swift_beginAccess();
  sub_10005DA74(self->interactor, *(void *)&self->interactor[24]);
  swift_retain();
  sub_100307A04((uint64_t)v9, v8, a3);
  sub_10003E138((uint64_t)v9);
  swift_release();
}

- (void)setVolume:(float)a3
{
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *(void *)&self->interactor[24];
  uint64_t v7 = *(void *)&self->interactor[32];
  sub_1000782E4((uint64_t)interactor, v6);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, float))(v7 + 256);
  swift_retain();
  v8(v6, v7, a3);
  swift_endAccess();
  swift_release();
}

- (void)setBuyButtonProgress:(double)a3
{
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  uint64_t v7 = sub_10005DA74(v6, v6[3]);
  sub_10005DA74((void *)(*v7 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider), *(void *)(*v7 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_sharedStateProvider + 24));
  swift_retain();
  sub_1004EF400(a3);
  swift_release();
}

- (void)setWithDownloadState:(int64_t)a3 assetState:(signed __int16)a4 progressValue:(float)a5
{
  interactor = self->interactor;
  swift_beginAccess();
  sub_10005DA74(interactor, *(void *)&self->interactor[24]);
  swift_retain();
  sub_100307D50(a3, a4, a5);
  swift_release();
}

- (void)startDownload
{
}

- (void)startSkipBackwardWithActionSource:(unint64_t)a3
{
}

- (void)startSkipForwardWithActionSource:(unint64_t)a3
{
}

- (void)toolbarStartSkipBackward
{
}

- (void)toolbarStartSkipForward
{
}

- (void)togglePlayPause
{
}

- (void)updateFollowingDormantPeriod
{
  interactor = self->interactor;
  swift_beginAccess();
  sub_10005DA74(interactor, *(void *)&self->interactor[24]);
  swift_retain();
  sub_100309878();
  swift_release();
}

- (void)viewSupplementalContentWithViewController:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1005A9C48(v3);

  swift_release();
}

- (id)contextMenuItemsFor:(id)a3 from:(id)a4 actionSource:(id)a5
{
  sub_1007FDC70();
  swift_beginAccess();
  uint64_t v8 = (void *)(*sub_10005DA74(self->interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  sub_10005DA74(v8, v8[3]);
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_1004B28E0((uint64_t)v9, v10);

  swift_release();
  swift_bridgeObjectRelease();
  sub_1005AC4D0();
  v11.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

- (id)analyticsAssetPropertyProviderFor:(id)a3 actionSource:(id)a4
{
  sub_1007FDC70();
  swift_beginAccess();
  uint64_t v6 = (void *)(*sub_10005DA74(self->interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  uint64_t v7 = sub_10005DA74(v6, v6[3]);
  uint64_t v8 = *v7;
  id v9 = *(void **)(*v7 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  id v10 = a3;
  swift_retain();
  NSArray v11 = (void *)sub_1004B29CC((uint64_t)[v9 currentAudiobook], v10);
  swift_unknownObjectRelease();
  if (v11)
  {
    id v12 = [*(id *)(v8 + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_contextMenuProvider) analyticsAssetPropertyProviderForDataModel:v11];
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    id v12 = 0;
  }

  return v12;
}

- (id)analyticsData
{
  interactor = self->interactor;
  swift_beginAccess();
  v4 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  sub_10005DA74(v4, v4[3]);
  swift_retain();
  v5 = (void *)sub_1004B2B80();
  swift_release();

  return v5;
}

- (BOOL)activeMode
{
  interactor = self->interactor;
  swift_beginAccess();
  return *(unsigned char *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                  + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor__activeMode);
}

- (void)setActiveMode:(BOOL)a3
{
  BOOL v3 = a3;
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *(void *)&self->interactor[24];
  uint64_t v7 = *(void *)&self->interactor[32];
  sub_1000782E4((uint64_t)interactor, v6);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 40);
  swift_retain();
  v8(v3, v6, v7);
  swift_endAccess();
  swift_release();
}

- (AEAssetAudiobookStatus)assetStatus
{
  return (AEAssetAudiobookStatus *)*(id *)self->assetAudiobookStatus;
}

- (BOOL)audiobookTimeRemainingMode
{
  return byte_100B2BC30;
}

- (void)setAudiobookTimeRemainingMode:(BOOL)a3
{
  BOOL v3 = a3;
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *(void *)&self->interactor[24];
  uint64_t v7 = *(void *)&self->interactor[32];
  sub_1000782E4((uint64_t)interactor, v6);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 80);
  swift_retain();
  v8(v3, v6, v7);
  swift_endAccess();
  swift_release();
}

- (BOOL)isScrubbing
{
  interactor = self->interactor;
  swift_beginAccess();
  v4 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  v5 = *(void **)(*sub_10005DA74(v4, v4[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  swift_retain();
  LOBYTE(v5) = [v5 isScrubbing];
  swift_endAccess();
  swift_endAccess();
  swift_release();
  return (char)v5;
}

- (void)setIsScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *(void *)&self->interactor[24];
  uint64_t v7 = *(void *)&self->interactor[32];
  sub_1000782E4((uint64_t)interactor, v6);
  uint64_t v8 = *(void (**)(BOOL, uint64_t, uint64_t))(v7 + 168);
  swift_retain();
  v8(v3, v6, v7);
  swift_endAccess();
  swift_release();
}

- (int64_t)sleepTimerOption
{
  interactor = self->interactor;
  swift_beginAccess();
  v4 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  sub_10005DA74(v4, v4[3]);
  swift_retain();
  int64_t v5 = sub_1004B1D18();
  swift_endAccess();
  swift_endAccess();
  swift_release();
  return v5;
}

- (void)setSleepTimerOption:(int64_t)a3
{
  interactor = self->interactor;
  swift_beginAccess();
  uint64_t v6 = *(void *)&self->interactor[24];
  uint64_t v7 = *(void *)&self->interactor[32];
  sub_1000782E4((uint64_t)interactor, v6);
  uint64_t v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 200);
  swift_retain();
  v8(a3, v6, v7);
  swift_endAccess();
  swift_release();
}

- (NSArray)playbackRates
{
  swift_retain();
  sub_1005AACCC();
  swift_release();
  v2.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (float)playbackRate
{
  interactor = self->interactor;
  swift_beginAccess();
  v4 = (void *)(*sub_10005DA74(interactor, *(void *)&self->interactor[24])
                + OBJC_IVAR____TtC5Books29AudiobookNowPlayingInteractor_dataManager);
  swift_beginAccess();
  int64_t v5 = *(void **)(*sub_10005DA74(v4, v4[3]) + OBJC_IVAR____TtC5Books30AudiobookNowPlayingDataManager_player);
  swift_retain();
  [v5 playbackRate];
  float v7 = v6;
  sub_10005DA74(v4, v4[3]);
  swift_endAccess();
  uint64_t v8 = sub_1004B1DE4();
  float v9 = sub_100309BDC((uint64_t)v8, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v9;
}

@end