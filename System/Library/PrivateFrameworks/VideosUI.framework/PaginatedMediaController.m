@interface PaginatedMediaController
- (AVPlayerViewController)avPlayerViewController;
- (BOOL)allowsExternalPlayback;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)animateImageChange;
- (BOOL)autoPlayInSharePlay;
- (BOOL)clearPreviousImageBeforeLoading;
- (BOOL)forceAutoPlay;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isAutomaticPlaybackStart;
- (BOOL)isForeground;
- (BOOL)isPlaybackEnabled;
- (BOOL)isPreloadPlaybackEnabled;
- (BOOL)isVideoFrameFallbackEnabled;
- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility;
- (BOOL)pageControlTimerProgress:(id)a3 shouldAdvanceToPage:(int64_t)a4;
- (BOOL)prefersAudioOverPictureInPicture;
- (BOOL)prefetchesVideoFrame;
- (BOOL)recordPausedMediaEventAsStop;
- (BOOL)shouldStopPlayerWhenExitingFullScreen;
- (BOOL)shouldStopPlayerWhenViewDisappears;
- (BOOL)shouldStopWhenAnotherMediaControllerStarts;
- (BOOL)showsPlaybackControlsInForeground;
- (BOOL)stopsPlaybackWhenInactive;
- (BOOL)updatesNowPlayingInfoCenter;
- (NSArray)mediaInfos;
- (NSString)videoGravity;
- (TVPPlayer)player;
- (UIEdgeInsets)legibleContentInsets;
- (VUIMediaInfo)currentMediaInfo;
- (_TtC8VideosUI24PaginatedMediaController)initWithCoder:(id)a3;
- (_TtC8VideosUI24PaginatedMediaController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)playbackStartDelay;
- (double)videoAudioRampDuration;
- (id)notificationObject;
- (id)surrenderCurrentPlayer;
- (unint64_t)imageContentMode;
- (unint64_t)imageSwappingAnimationType;
- (unint64_t)mediaInfoIndex;
- (unint64_t)state;
- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4;
- (void)appendMediaInfos:(id)a3;
- (void)dealloc;
- (void)handlePageControlChanged;
- (void)mediaControllerTapped:(id)a3;
- (void)pause;
- (void)play;
- (void)removeMediaInfoAtIndex:(unint64_t)a3;
- (void)replay;
- (void)setAllowsExternalPlayback:(BOOL)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setAnimateImageChange:(BOOL)a3;
- (void)setAutoPlayInSharePlay:(BOOL)a3;
- (void)setAutomaticPlaybackStart:(BOOL)a3;
- (void)setAvPlayerViewController:(id)a3;
- (void)setClearPreviousImageBeforeLoading:(BOOL)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setForceAutoPlay:(BOOL)a3;
- (void)setImageContentMode:(unint64_t)a3;
- (void)setImageSwappingAnimationType:(unint64_t)a3;
- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3;
- (void)setLegibleContentInsets:(UIEdgeInsets)a3;
- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)setMediaInfoIndex:(unint64_t)a3;
- (void)setMediaInfos:(id)a3;
- (void)setMediaInfos:(id)a3 animated:(BOOL)a4;
- (void)setPlaybackEnabled:(BOOL)a3;
- (void)setPlaybackStartDelay:(double)a3;
- (void)setPlayer:(id)a3;
- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3;
- (void)setPrefetchesVideoFrame:(BOOL)a3;
- (void)setPreloadPlaybackEnabled:(BOOL)a3;
- (void)setRecordPausedMediaEventAsStop:(BOOL)a3;
- (void)setShowsPlaybackControlsInForeground:(BOOL)a3;
- (void)setShowsVideoControls:(BOOL)a3;
- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3;
- (void)setStopPlayerWhenViewDisappears:(BOOL)a3;
- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3;
- (void)setStopsPlaybackWhenInactive:(BOOL)a3;
- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3;
- (void)setVideoAudioRampDuration:(double)a3;
- (void)setVideoFrameFallbackEnabled:(BOOL)a3;
- (void)setVideoGravity:(id)a3;
- (void)stop;
- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4;
- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5;
- (void)transitionToFullScreenAnimated:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation PaginatedMediaController

- (_TtC8VideosUI24PaginatedMediaController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E338C14C();
}

- (void)dealloc
{
  v2 = self;
  _s8VideosUI20VUIJetPackControllerCfD_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_pageControlBottomMarginConstraint));
  swift_bridgeObjectRelease();
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_paginationDelegate);
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_backgroundMediaInfo));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_backgroundMediaController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___previousIndicator));
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_collectionImpressioner, &qword_1EBF8B120);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___nextIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___mediaShowcaseConfig));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___pageControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___pageProgress));
  sub_1E2BEA270((uint64_t)self + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_elapsedTimeObserverToken, &qword_1EBF91570);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_enablePageControlTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_chevronDebounceTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_swipeController));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___metadataView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController____lazy_storage___buttonsView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24PaginatedMediaController_autoAdvancePageTimer));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF84080);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v3();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E338C694();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E338EFAC();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E338F464();
}

- (void)mediaControllerTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_81();
  sub_1E338F650();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E338F72C();
}

- (void)transitionToFullScreenAnimated:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E338F808(v4);
}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
  char v4 = self;
  OUTLINED_FUNCTION_138_9();
  sub_1E338F868();
}

- (void)transitionToForeground:(BOOL)a3 withPlaybackControls:(BOOL)a4 animated:(BOOL)a5
{
  id v5 = self;
  j__OUTLINED_FUNCTION_64_19();
}

- (void)setControlsVisible:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E338FFB8(v4);
}

- (_TtC8VideosUI24PaginatedMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3393BEC();
}

- (TVPPlayer)player
{
  v2 = self;
  id v3 = sub_1E3393C88();

  return (TVPPlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E3393D18(v6);
}

- (AVPlayerViewController)avPlayerViewController
{
  v2 = self;
  id v3 = sub_1E3393E54();

  return (AVPlayerViewController *)v3;
}

- (void)setAvPlayerViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E3393EE4(v6);
}

- (unint64_t)state
{
  v2 = self;
  id v3 = sub_1E3393F80();

  return (unint64_t)v3;
}

- (NSArray)mediaInfos
{
  v2 = self;
  uint64_t v3 = sub_1E3394018();

  if (v3)
  {
    sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
    id v4 = (void *)sub_1E387CC88();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setMediaInfos:(id)a3
{
  if (a3)
  {
    sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
    sub_1E387CC98();
  }
  id v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_129_0();
  sub_1E33940C4(v5);
}

- (VUIMediaInfo)currentMediaInfo
{
  v2 = self;
  id v3 = sub_1E338DC70();

  return (VUIMediaInfo *)v3;
}

- (unint64_t)mediaInfoIndex
{
  v2 = self;
  id v3 = sub_1E33891B0();

  return (unint64_t)v3;
}

- (void)setMediaInfoIndex:(unint64_t)a3
{
  id v3 = self;
  unint64_t v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394234(v4);
}

- (BOOL)isPlaybackEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394274();

  return v3 & 1;
}

- (void)setPlaybackEnabled:(BOOL)a3
{
  unsigned __int8 v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E33942E8();
}

- (BOOL)forceAutoPlay
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394AA4();

  return v3 & 1;
}

- (void)setForceAutoPlay:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394B18(v4);
}

- (BOOL)autoPlayInSharePlay
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394B64();

  return v3 & 1;
}

- (void)setAutoPlayInSharePlay:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394BD8(v4);
}

- (BOOL)prefetchesVideoFrame
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394C24();

  return v3 & 1;
}

- (void)setPrefetchesVideoFrame:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394C98(v4);
}

- (double)videoAudioRampDuration
{
  v2 = self;
  sub_1E3394CEC();
  double v4 = v3;

  return v4;
}

- (void)setVideoAudioRampDuration:(double)a3
{
  double v3 = self;
  OUTLINED_FUNCTION_104_10();
  sub_1E3394D54();
}

- (BOOL)recordPausedMediaEventAsStop
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394DA0();

  return v3 & 1;
}

- (void)setRecordPausedMediaEventAsStop:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394E14(v4);
}

- (BOOL)isVideoFrameFallbackEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394E60();

  return v3 & 1;
}

- (void)setVideoFrameFallbackEnabled:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394ED4(v4);
}

- (BOOL)allowsExternalPlayback
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394F20();

  return v3 & 1;
}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3394F94(v4);
}

- (BOOL)stopsPlaybackWhenInactive
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3394FE0();

  return v3 & 1;
}

- (void)setStopsPlaybackWhenInactive:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395054(v4);
}

- (BOOL)updatesNowPlayingInfoCenter
{
  v2 = self;
  unsigned __int8 v3 = sub_1E33950A0();

  return v3 & 1;
}

- (void)setUpdatesNowPlayingInfoCenter:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395114(v4);
}

- (BOOL)isForeground
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395358();

  return v3 & 1;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  v2 = self;
  unsigned __int8 v3 = sub_1E33953B8();

  return v3 & 1;
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E339542C(v4);
}

- (BOOL)shouldStopPlayerWhenExitingFullScreen
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395478();

  return v3 & 1;
}

- (void)setStopPlayerWhenExitingFullScreen:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33954EC(v4);
}

- (BOOL)clearPreviousImageBeforeLoading
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395580();

  return v3 & 1;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33955F4(v4);
}

- (double)playbackStartDelay
{
  v2 = self;
  sub_1E3395648();
  double v4 = v3;

  return v4;
}

- (void)setPlaybackStartDelay:(double)a3
{
  double v3 = self;
  OUTLINED_FUNCTION_104_10();
  sub_1E33956B0();
}

- (BOOL)animateImageChange
{
  v2 = self;
  unsigned __int8 v3 = sub_1E33956FC();

  return v3 & 1;
}

- (void)setAnimateImageChange:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395770(v4);
}

- (unint64_t)imageContentMode
{
  v2 = self;
  id v3 = sub_1E33957BC();

  return (unint64_t)v3;
}

- (void)setImageContentMode:(unint64_t)a3
{
  id v3 = self;
  uint64_t v4 = OUTLINED_FUNCTION_8_8();
  sub_1E339581C(v4);
}

- (unint64_t)imageSwappingAnimationType
{
  v2 = self;
  id v3 = sub_1E339586C();

  return (unint64_t)v3;
}

- (void)setImageSwappingAnimationType:(unint64_t)a3
{
  id v3 = self;
  uint64_t v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33958CC(v4);
}

- (BOOL)isPreloadPlaybackEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1E339591C();

  return v3 & 1;
}

- (void)setPreloadPlaybackEnabled:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395990(v4);
}

- (BOOL)prefersAudioOverPictureInPicture
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395A64();

  return v3 & 1;
}

- (void)setPrefersAudioOverPictureInPicture:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395AD8(v4);
}

- (BOOL)showsPlaybackControlsInForeground
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395BD0();

  return v3 & 1;
}

- (void)setShowsPlaybackControlsInForeground:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395C44(v4);
}

- (BOOL)allowsPictureInPicturePlayback
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395C90();

  return v3 & 1;
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395D04(v4);
}

- (UIEdgeInsets)legibleContentInsets
{
  v2 = self;
  sub_1E3395D5C();
  OUTLINED_FUNCTION_25_2();
  double v3 = OUTLINED_FUNCTION_44();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setLegibleContentInsets:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1E3395DEC();
}

- (BOOL)keepVideoGravityUnchangedByVideoControlsVisibility
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3395E38();

  return v3 & 1;
}

- (void)setKeepVideoGravityUnchangedByVideoControlsVisibility:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3395EAC(v4);
}

- (NSString)videoGravity
{
  v2 = self;
  id v3 = sub_1E3395F20();

  return (NSString *)v3;
}

- (void)setVideoGravity:(id)a3
{
  id v4 = a3;
  id v5 = self;
  double v6 = (void *)OUTLINED_FUNCTION_129_0();
  sub_1E3395FB0(v6);
}

- (BOOL)isAutomaticPlaybackStart
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3396048();

  return v3 & 1;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E33960BC(v4);
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3396108();

  return v3 & 1;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  unsigned __int8 v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E339617C(v4);
}

- (void)appendMediaInfos:(id)a3
{
  sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
  sub_1E387CC98();
  char v4 = self;
  OUTLINED_FUNCTION_11_4();
  sub_1E339265C();

  swift_bridgeObjectRelease();
}

- (void)removeMediaInfoAtIndex:(unint64_t)a3
{
  unsigned __int8 v3 = self;
  uint64_t v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3396204(v4);
}

- (void)setMediaInfos:(id)a3 animated:(BOOL)a4
{
  sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
  sub_1E387CC98();
  id v5 = self;
  sub_1E3396268();

  swift_bridgeObjectRelease();
}

- (void)setMediaInfo:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  sub_1E339332C((uint64_t)v8, a4, a5);
}

- (id)notificationObject
{
  id v2 = sub_1E3396404();
  return v2;
}

- (void)play
{
  id v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3396448();
}

- (void)replay
{
  id v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E33964C8();
}

- (void)pause
{
  id v2 = self;
  sub_1E3396590((const char **)&selRef_pause);
}

- (void)stop
{
  id v2 = self;
  sub_1E3396590((const char **)&selRef_stop);
}

- (void)setShowsVideoControls:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3396628(v4);
}

- (id)surrenderCurrentPlayer
{
  id v2 = self;
  id v3 = sub_1E3396E68();

  return v3;
}

- (void)adoptAVPlayerViewController:(id)a3 player:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  OUTLINED_FUNCTION_138_9();
  uint64_t v9 = OUTLINED_FUNCTION_166();
  sub_1E3396EEC(v9, v10);
}

- (void)handlePageControlChanged
{
  id v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3399264();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1E339A874((int)v8, v7);

  return v9 & 1;
}

- (BOOL)pageControlTimerProgress:(id)a3 shouldAdvanceToPage:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1E339ABA8();

  return 0;
}

@end