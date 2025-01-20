@interface AudiobookNowPlayingViewModel
- (_TtC5Books28AudiobookNowPlayingViewModel)init;
@end

@implementation AudiobookNowPlayingViewModel

- (_TtC5Books28AudiobookNowPlayingViewModel)init
{
  return (_TtC5Books28AudiobookNowPlayingViewModel *)sub_10022B71C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__absolutePlayedInterval;
  uint64_t v4 = sub_100058D18((uint64_t *)&unk_100B25F50);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__artwork;
  uint64_t v7 = sub_100058D18(&qword_100B25F48);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__assetID;
  uint64_t v9 = sub_100058D18(&qword_100B25F40);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__audiobookTitle;
  uint64_t v11 = sub_100058D18((uint64_t *)&unk_100B29860);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  uint64_t v40 = v11;
  v12((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__authorName, v11);
  v13 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__backgroundColorClosure;
  uint64_t v14 = sub_100058D18((uint64_t *)&unk_100B25F30);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__bufferedProportion, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapterPlayedProportion, v4);
  v12((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapterTitle, v11);
  v15 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__currentChapterIndex;
  uint64_t v16 = sub_100058D18(&qword_100B33660);
  v39 = *(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8);
  v39(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__downloadProgress;
  uint64_t v18 = sub_100058D18((uint64_t *)&unk_100B25F20);
  v19 = *(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8);
  v19(v17, v18);
  v20 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__downloadState;
  uint64_t v21 = sub_100058D18((uint64_t *)&unk_100B298A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8))(v20, v21);
  v22 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isFirstEverLaunch;
  uint64_t v23 = sub_100058D18((uint64_t *)&unk_100B25F10);
  v41 = *(void (**)(char *, uint64_t))(*(void *)(v23 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v41)((void *)(v23 - 8), v22, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isLoadingResources, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isPlaying, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isPreview, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isScrubbing, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isSkipping, v23);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isStalling, v23);
  v39((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__listeningSessionStartChapterIndex, v16);
  v19((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__listeningSessionStartTimeProportion, v18);
  v41((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__multipleRoutes, v23);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skipBackwardInterval, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skipForwardInterval, v4);
  v24 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playButtonState;
  uint64_t v25 = sub_100058D18(&qword_100B25F08);
  (*(void (**)(char *, uint64_t))(*(void *)(v25 - 8) + 8))(v24, v25);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playedInterval, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skippingCumulativeDelta, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerInitialDuration, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerRemainingTime, v4);
  v26 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playbackRate;
  uint64_t v27 = sub_100058D18(&qword_100B25F00);
  (*(void (**)(char *, uint64_t))(*(void *)(v27 - 8) + 8))(v26, v27);
  v12((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__widestRateString, v40);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__toPlayInterval, v4);
  v28 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__volume;
  uint64_t v29 = sub_100058D18(&qword_100B25EF8);
  (*(void (**)(char *, uint64_t))(*(void *)(v29 - 8) + 8))(v28, v29);
  v30 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__buyButtonProvider;
  uint64_t v31 = sub_100058D18(&qword_100B25EF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v31 - 8) + 8))(v30, v31);
  v32 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerSelectedOption;
  uint64_t v33 = sub_100058D18(&qword_100B29880);
  (*(void (**)(char *, uint64_t))(*(void *)(v33 - 8) + 8))(v32, v33);
  v34 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapters;
  uint64_t v35 = sub_100058D18((uint64_t *)&unk_100B25EE0);
  (*(void (**)(char *, uint64_t))(*(void *)(v35 - 8) + 8))(v34, v35);
  v36 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__supplementalContents;
  uint64_t v37 = sub_100058D18((uint64_t *)&unk_100B29830);
  (*(void (**)(char *, uint64_t))(*(void *)(v37 - 8) + 8))(v36, v37);
  v38 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isSG;

  v41(v38, v23);
}

@end