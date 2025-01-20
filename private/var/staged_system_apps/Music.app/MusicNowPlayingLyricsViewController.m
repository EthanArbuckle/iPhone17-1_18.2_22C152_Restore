@interface MusicNowPlayingLyricsViewController
- (MPCPlayerResponse)nowPlaying;
- (MusicNowPlayingLyricsViewController)initWithCoder:(id)a3;
- (MusicNowPlayingLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MusicVocalsAttenuationSlider)accessibilityVocalAttenuationToggleSlider;
- (double)cardHeight;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)contentScrollView;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)setCardHeight:(double)a3;
- (void)setNowPlaying:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MusicNowPlayingLyricsViewController

- (MPCPlayerResponse)nowPlaying
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying));
}

- (void)setNowPlaying:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_nowPlaying) = (Class)a3;
  id v5 = a3;
  v6 = self;

  sub_100254230();
}

- (double)cardHeight
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_cardHeight);
}

- (void)setCardHeight:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_cardHeight) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___MusicNowPlayingLyricsViewController_syncedLyricsViewController);
  if (v3)
  {
    id v5 = *(void (**)(double))((swift_isaMask & *v3) + 0x168);
    v6 = self;
    v7 = v3;
    v5(a3);
  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedMonitor];
  [v5 unregisterObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController();
  [(MusicNowPlayingLyricsViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_delegate);
  sub_1000637B8((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsCompositingFilter, (uint64_t *)&unk_10109BF40);
  sub_100260F34(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicNowPlayingLyricsViewController_state), self->nowPlaying[OBJC_IVAR___MusicNowPlayingLyricsViewController_state]);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_syncedLyricsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_staticLyricsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_gradientMaskLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_modelPlayEvent));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsLoader));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_sharingTransitionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationToggleSlider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_tapToRadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicNowPlayingLyricsViewController_reportingController));
  sub_1000637B8((uint64_t)self + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsVisibilityStart, &qword_1010A9820);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002554D8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_100063814(&qword_1010A9820);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for NowPlayingLyricsViewController();
  v13.receiver = self;
  v13.super_class = v8;
  v9 = self;
  [(MusicNowPlayingLyricsViewController *)&v13 viewDidAppear:v3];
  Date.init()();
  uint64_t v10 = type metadata accessor for Date();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 0, 1, v10);
  uint64_t v11 = (uint64_t)v9 + OBJC_IVAR___MusicNowPlayingLyricsViewController_lyricsVisibilityStart;
  swift_beginAccess();
  sub_10002D09C((uint64_t)v7, v11, &qword_1010A9820);
  swift_endAccess();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController();
  v4 = (char *)v7.receiver;
  [(MusicNowPlayingLyricsViewController *)&v7 viewDidDisappear:v3];
  sub_10025F958();
  uint64_t v5 = *(void **)&v4[OBJC_IVAR___MusicNowPlayingLyricsViewController_song];
  id v6 = v5;
  sub_10025FB8C(v5);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NowPlayingLyricsViewController();
  id v2 = v3.receiver;
  [(MusicNowPlayingLyricsViewController *)&v3 viewDidLayoutSubviews];
  sub_100257C30();
}

- (MusicVocalsAttenuationSlider)accessibilityVocalAttenuationToggleSlider
{
  return (MusicVocalsAttenuationSlider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                 + OBJC_IVAR___MusicNowPlayingLyricsViewController_vocalAttenuationToggleSlider));
}

- (id)contentScrollView
{
  id v2 = self;
  id v3 = sub_100260198();

  return v3;
}

- (MusicNowPlayingLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MusicNowPlayingLyricsViewController *)sub_10026025C(v5, v7, a4);
}

- (MusicNowPlayingLyricsViewController)initWithCoder:(id)a3
{
  return (MusicNowPlayingLyricsViewController *)sub_1002605DC(a3);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100260A14(v4);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v12 = sub_10026172C();

  return v12;
}

@end