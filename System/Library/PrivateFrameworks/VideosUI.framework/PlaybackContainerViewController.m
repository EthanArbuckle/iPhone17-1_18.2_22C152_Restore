@interface PlaybackContainerViewController
- (BOOL)isShowingEmbeddedContent;
- (BOOL)overridesOrientationLock;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAutorotate;
- (VUIPlaybackContainerViewControllerDelegate)delegate;
- (_TtC8VideosUI31PlaybackContainerViewController)init;
- (_TtC8VideosUI31PlaybackContainerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI31PlaybackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)unembedMultiPlayerViewController;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)backgroundPlaybackWillBegin;
- (void)embedCatchUpToLiveViewController:(id)a3;
- (void)embedCatchUpToLiveViewController:(id)a3 reusingFullscreenPlaybackWithPlayer:(id)a4;
- (void)embedMultiPlayerViewController:(id)a3;
- (void)enterPictureInPicture;
- (void)exitPictureInPictureWithCompletion:(id)a3;
- (void)hidePictureInPictureWithCompletion:(id)a3;
- (void)loadPostPlayForMediaItem:(id)a3;
- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5;
- (void)playbackUpNextControllerReadyToBeDisplayed;
- (void)presentPlayerViewController:(AVPlayerViewController *)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removePostPlayViewController;
- (void)setDelegate:(id)a3;
- (void)unembedCatchUpToLiveViewController;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PlaybackContainerViewController

- (VUIPlaybackContainerViewControllerDelegate)delegate
{
  v2 = (void *)sub_1E31753D4();
  return (VUIPlaybackContainerViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E3175468();
}

- (BOOL)isShowingEmbeddedContent
{
  return sub_1E31756E4();
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 26;
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3175798((SEL *)&selRef_prefersStatusBarHidden);

  return v3 & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3175798((SEL *)&selRef_prefersHomeIndicatorAutoHidden);

  return v3 & 1;
}

- (_TtC8VideosUI31PlaybackContainerViewController)init
{
  return (_TtC8VideosUI31PlaybackContainerViewController *)sub_1E3175B94();
}

- (_TtC8VideosUI31PlaybackContainerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3176408();
}

- (void)viewDidLoad
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3176540();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1E3176828(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v8 = self;
  double v6 = OUTLINED_FUNCTION_11_2();
  sub_1E3176910((uint64_t)a4, v6, v7);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E3176C38();
}

- (void)embedCatchUpToLiveViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_0_25();
  sub_1E3176DF0(v6);
}

- (void)embedCatchUpToLiveViewController:(id)a3 reusingFullscreenPlaybackWithPlayer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E3176E8C(v6, a4);
}

- (void)unembedCatchUpToLiveViewController
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E31773C0();
}

- (void)presentPlayerViewController:(AVPlayerViewController *)a3 animated:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;
  sub_1E317843C((uint64_t)&unk_1EADEBC48, v9);
}

- (_TtC8VideosUI31PlaybackContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3178540();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_pipTargetView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_backgroundContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController_playerViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31PlaybackContainerViewController____lazy_storage___fullscreenButton));
  swift_bridgeObjectRelease();
}

- (void)embedMultiPlayerViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E3178BC4(v6);
}

- (id)unembedMultiPlayerViewController
{
  v2 = self;
  id v3 = sub_1E3178D8C();

  return v3;
}

- (void)loadPostPlayForMediaItem:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  id v5 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E3178E78(v5);
  swift_unknownObjectRelease();
}

- (void)removePostPlayViewController
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E317A998();
}

- (void)enterPictureInPicture
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E317AA90();
}

- (void)exitPictureInPictureWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_1E317843C((uint64_t)&unk_1EADEBC00, v5);
}

- (void)hidePictureInPictureWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = OUTLINED_FUNCTION_21_0();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_1E3070BA0;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1E317BA88((uint64_t)v7, v6);
  sub_1E2C5FB90((uint64_t)v7);
}

- (void)playbackUpNextControllerReadyToBeDisplayed
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E317BCE4();
}

- (void)backgroundPlaybackWillBegin
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E317BE6C();
}

- (void)mediaInfoDidChangeTo:(id)a3 canPlay:(BOOL)a4 wasAutoPlayed:(BOOL)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_1E317BF34((uint64_t)v9, a4, a5);
}

- (BOOL)overridesOrientationLock
{
  v2 = self;
  BOOL v3 = sub_1E317C064();

  return v3;
}

@end