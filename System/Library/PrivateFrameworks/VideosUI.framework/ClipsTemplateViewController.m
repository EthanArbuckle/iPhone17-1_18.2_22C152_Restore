@interface ClipsTemplateViewController
- (AVPlayerViewController)playerViewController;
- (BOOL)mediaSupportsStartOver;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (NSArray)multiviewIdentifiers;
- (TVPMediaItem)currentMediaItem;
- (VUINowPlayingTabControllerDelegate)nowPlayingControllerDelegate;
- (VUIPlayer)activePlayer;
- (_TtC8VideosUI27ClipsTemplateViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI27ClipsTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
@end

@implementation ClipsTemplateViewController

- (NSArray)multiviewIdentifiers
{
  sub_1E387CC88();
  OUTLINED_FUNCTION_9();
  return (NSArray *)v2;
}

- (AVPlayerViewController)playerViewController
{
  return (AVPlayerViewController *)0;
}

- (VUINowPlayingTabControllerDelegate)nowPlayingControllerDelegate
{
  sub_1E307D098();
  return (VUINowPlayingTabControllerDelegate *)self;
}

- (TVPMediaItem)currentMediaItem
{
  v2 = self;
  id v3 = sub_1E307D0E4();

  return (TVPMediaItem *)v3;
}

- (BOOL)mediaSupportsStartOver
{
  return 0;
}

- (VUIPlayer)activePlayer
{
  v2 = self;
  id v3 = (void *)sub_1E307D1C4();

  return (VUIPlayer *)v3;
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E3461EBC();

  return v3 & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (_TtC8VideosUI27ClipsTemplateViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34631A0();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E346430C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E3464508((uint64_t)a4);
  swift_unknownObjectRelease();
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E346465C();
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3464CC4(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E3464D50();
}

- (_TtC8VideosUI27ClipsTemplateViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E3464EA0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23_70((uint64_t)self + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_previousSubtitle);
  OUTLINED_FUNCTION_23_70((uint64_t)self + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_previousAlternateSubtitle);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_playlistViewController));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_hudController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27ClipsTemplateViewController_tabViewController));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end