@interface BottomPlayerViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (MPCPlayerResponse)accessibilityNowPlayingResponse;
- (MPRouteLabel)nowPlayingItemRouteLabel;
- (UILabel)nowPlayingItemSecondaryLabel;
- (UILabel)nowPlayingItemTitleLabel;
- (UILabel)sharedListeningParticipantsLabel;
- (UIStackView)nowPlayingItemStackView;
- (_TtC5Music21NowPlayingContentView)artworkView;
- (_TtC5Music25NowPlayingTransportButton)playPauseButton;
- (_TtC5Music25NowPlayingTransportButton)reverseButton;
- (_TtC5Music25NowPlayingTransportButton)skipButton;
- (_TtC5Music26BottomPlayerViewController)init;
- (_TtC5Music26BottomPlayerViewController)initWithCoder:(id)a3;
- (_TtC5Music26BottomPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setArtworkView:(id)a3;
- (void)setNowPlayingItemRouteLabel:(id)a3;
- (void)setNowPlayingItemSecondaryLabel:(id)a3;
- (void)setNowPlayingItemStackView:(id)a3;
- (void)setNowPlayingItemTitleLabel:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setReverseButton:(id)a3;
- (void)setSharedListeningParticipantsLabel:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BottomPlayerViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10005EAC8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000B8B8(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(BottomPlayerViewController *)&v5 viewWillAppear:v3];
  sub_100016210((void (*)(void *, char *))sub_100274CC0, (void (*)(void *, uint64_t, uint64_t, uint64_t))sub_100271AC8, (uint64_t (*)(void *, uint64_t))sub_100016368);
}

- (_TtC5Music26BottomPlayerViewController)init
{
  return (_TtC5Music26BottomPlayerViewController *)sub_1000301EC();
}

- (_TtC5Music21NowPlayingContentView)artworkView
{
  return (_TtC5Music21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                      + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView));
}

- (void)setArtworkView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView) = (Class)a3;
  id v6 = a3;
  objc_super v5 = self;
  sub_10007907C(v4);
}

- (_TtC5Music26BottomPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100272EBC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(BottomPlayerViewController *)&v5 viewWillDisappear:v3];
  if (qword_101097980 != -1) {
    swift_once();
  }
  sub_1005D3D00((uint64_t)v4, qword_101128F08);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_1002739EC(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (UIStackView)nowPlayingItemStackView
{
  return (UIStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView));
}

- (void)setNowPlayingItemStackView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView) = (Class)a3;
  id v3 = a3;
}

- (MPRouteLabel)nowPlayingItemRouteLabel
{
  return (MPRouteLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel));
}

- (void)setNowPlayingItemRouteLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)nowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel));
}

- (void)setNowPlayingItemTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)nowPlayingItemSecondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
}

- (void)setNowPlayingItemSecondaryLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)skipButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton));
}

- (void)setSkipButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)playPauseButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton));
}

- (void)setPlayPauseButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC5Music25NowPlayingTransportButton)reverseButton
{
  return (_TtC5Music25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                          + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton));
}

- (void)setReverseButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton) = (Class)a3;
  id v3 = a3;
}

- (UILabel)sharedListeningParticipantsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel));
}

- (void)setSharedListeningParticipantsLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel) = (Class)a3;
  id v3 = a3;
}

- (MPCPlayerResponse)accessibilityNowPlayingResponse
{
  return (MPCPlayerResponse *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlaying));
}

- (_TtC5Music26BottomPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music26BottomPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkView));

  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffToAction));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffFromAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlaying));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingPath));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharePlayTogetherSession));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemRouteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemSecondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playPauseButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_reverseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_sharedListeningParticipantsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_routeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_mediaControls));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_skipFeedbackGenerator));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_artworkLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_shuffleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_repeatButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemLargeTextTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_nowPlayingItemLargeTextMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_playbackCancellationGesture));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_transportControlsStack));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_highlightGestureRecognizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController_handoffButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music26BottomPlayerViewController____lazy_storage___nowPlayingHeadlineStackView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Music26BottomPlayerViewController_springLoadedInteraction);
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100273B40(a4);

  swift_unknownObjectRelease();
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return 0;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_100273F64(a5);

  swift_unknownObjectRelease();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  CGFloat x = a4.x;
  id v6 = a3;
  id v7 = self;
  id v8 = sub_100274074(x);

  return v8;
}

@end