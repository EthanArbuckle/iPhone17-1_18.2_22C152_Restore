@interface MiniPlayerViewController
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UILabel)accessibilityNowPlayingItemTitleLabel;
- (_TtC12NowPlayingUI21NowPlayingContentView)accessibilityArtworkView;
- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)playPauseButton;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipBackwardButton;
- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipButton;
- (id)accessibilityPlayerRequestController;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)loadView;
- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setNowPlayingItemTitleLabel:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setSkipBackwardButton:(id)a3;
- (void)setSkipButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation MiniPlayerViewController

- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_BF2B8();
}

- (void)setArtworkView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView) = (Class)a3;
  id v3 = a3;
}

- (void)setNowPlayingItemTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)playPauseButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton));
}

- (void)setPlayPauseButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton));
}

- (void)setSkipButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC12NowPlayingUI25NowPlayingTransportButton)skipBackwardButton
{
  return (_TtC12NowPlayingUI25NowPlayingTransportButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton));
}

- (void)setSkipBackwardButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton) = (Class)a3;
  id v3 = a3;
}

- (void)loadView
{
  type metadata accessor for MiniPlayerView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v4 = self;
  id v5 = [v3 init];
  swift_unknownObjectWeakAssign();
  [(MiniPlayerViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_B6488();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_BAC0C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_BAEAC(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v7.receiver;
  id v5 = a3;
  [(MiniPlayerViewController *)&v7 willMoveToParentViewController:v5];
  v6 = *(void **)&v4[OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController];
  if (v5)
  {
    [v6 beginAutomaticResponseLoading];
  }
  else
  {
    [v6 endAutomaticResponseLoading];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_BF994(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_BFA30();
}

- (UILabel)accessibilityNowPlayingItemTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel));
}

- (_TtC12NowPlayingUI21NowPlayingContentView)accessibilityArtworkView
{
  return (_TtC12NowPlayingUI21NowPlayingContentView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                              + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView));
}

- (id)accessibilityPlayerRequestController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController));
}

- (_TtC12NowPlayingUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NowPlayingUI24MiniPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_artworkLayoutGuide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_leadingArtworkConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_trailingTransportControlsConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemRouteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingUpsellLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemLargeTextTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_nowPlayingItemLargeTextMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playbackCancellationGesture));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_transportControlsStack));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playPauseButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_skipBackwardButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_contextActionRegistration));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_highlightGestureRecognizer));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_playerRequestController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_upsellAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController____lazy_storage___upsellString));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI24MiniPlayerViewController_openMiniPlayerHook);

  sub_FB70(v3);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_2744C;
  v8[4] = v7;
  v8[5] = self;
  id v9 = a3;
  v10 = self;
  id v11 = v9;
  v12 = v10;
  swift_retain();
  sub_126FA0();

  swift_release();

  swift_release();
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = [v6 request];
  self;
  uint64_t v10 = swift_dynamicCastObjCClass();
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    *(void *)(v12 + 24) = v7;
    id v13 = v7;
    swift_unknownObjectRetain();
    sub_126FA0();

    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {

    swift_unknownObjectRelease();
  }

  return 1;
}

@end