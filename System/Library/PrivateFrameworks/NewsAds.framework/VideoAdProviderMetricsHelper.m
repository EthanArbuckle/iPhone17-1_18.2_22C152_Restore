@interface VideoAdProviderMetricsHelper
- (_TtC7NewsAds28VideoAdProviderMetricsHelper)init;
- (void)enteredFullscreen;
- (void)exitedFullscreen;
- (void)muteStateChanged:(BOOL)a3;
- (void)playbackFailedWithError:(id)a3;
- (void)playbackFinished;
- (void)playbackPassedQuartile:(unint64_t)a3;
- (void)playbackPaused;
- (void)playbackReadyToStart;
- (void)playbackResumed;
- (void)playbackStarted;
- (void)skipped;
- (void)tappedToToggleControlVisibility:(BOOL)a3;
- (void)willUnload;
@end

@implementation VideoAdProviderMetricsHelper

- (_TtC7NewsAds28VideoAdProviderMetricsHelper)init
{
  result = (_TtC7NewsAds28VideoAdProviderMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)playbackReadyToStart
{
  v2 = self;
  VideoAdProviderMetricsHelper.playbackReadyToStart()();
}

- (void)playbackStarted
{
}

- (void)playbackPaused
{
}

- (void)playbackResumed
{
}

- (void)playbackFinished
{
}

- (void)playbackFailedWithError:(id)a3
{
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_diagnosticMetricsHelper);
  if (a3)
  {
    swift_getErrorValue();
    v6 = self;
    id v7 = a3;
    sub_1BFA182A8();
  }
  else
  {
    v8 = self;
  }
  v9 = (void *)sub_1BFA17B08();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_mediaPlaybackFailedWithReason_, v9);
}

- (void)enteredFullscreen
{
}

- (void)exitedFullscreen
{
}

- (void)muteStateChanged:(BOOL)a3
{
  v4 = self;
  VideoAdProviderMetricsHelper.muteStateChanged(_:)(a3);
}

- (void)playbackPassedQuartile:(unint64_t)a3
{
  v4 = self;
  VideoAdProviderMetricsHelper.playbackPassed(quartile:)((id)a3);
}

- (void)tappedToToggleControlVisibility:(BOOL)a3
{
  if (!a3)
  {
    v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_mediaMetricsHelper);
    if (v3)
    {
      v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsAds28VideoAdProviderMetricsHelper_metadata);
      v5 = self;
      objc_msgSend(v4, sel_time);
      objc_msgSend(v3, sel_mediaShowControlsAtPosition_);
    }
  }
}

- (void)skipped
{
}

- (void)willUnload
{
}

@end