@interface NowPlayingViewController
- (_TtC5Music24NowPlayingViewController)initWithCoder:(id)a3;
- (_TtC5Music24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)environmentMonitorDidChangeThermalLevel:(id)a3;
- (void)handleTimeGesture;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation NowPlayingViewController

- (_TtC5Music24NowPlayingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100546A5C();
}

- (void)dealloc
{
  v2 = self;
  sub_10052E5E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_initialArtworkImage));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_controlsViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_motionBackgroundViewContainer));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24NowPlayingViewController_motionBackground, &qword_1010ADE50);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music24NowPlayingViewController_previousMotionVideoArtwork, (uint64_t *)&unk_1010ABF30);
  swift_bridgeObjectRelease();
  sub_1000E014C(*(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music24NowPlayingViewController_mode), *(void **)&self->initialArtworkImage[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->nowPlaying[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->queue[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->controlsViewController[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode], *(void **)&self->animationData[OBJC_IVAR____TtC5Music24NowPlayingViewController_mode]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_playingItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_animatedBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_containerView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_lyricsFullScreenTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music24NowPlayingViewController_presentLyricsTimer));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music24NowPlayingViewController_timeLabel);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10052E934();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1005354E8(a3);
}

- (id)contentScrollView
{
  unint64_t v2 = *(unint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Music24NowPlayingViewController_mode);
  if (!(v2 >> 62)) {
    goto LABEL_4;
  }
  if (v2 >> 62 == 1)
  {
    v2 &= 0x3FFFFFFFFFFFFFFFuLL;
LABEL_4:
    id v3 = [(id)v2 contentScrollView];
    goto LABEL_6;
  }
  id v3 = 0;
LABEL_6:

  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_100535B9C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100535CB8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10053646C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100536BB0(a3);
}

- (void)viewDidLayoutSubviews
{
  unint64_t v2 = self;
  sub_100536D60();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1005379A8(a4, width, height);
  swift_unknownObjectRelease();
}

- (int64_t)preferredStatusBarStyle
{
  unint64_t v2 = self;
  id v3 = [(NowPlayingViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100537E94(a3);
}

- (void)handleTimeGesture
{
  unint64_t v2 = self;
  sub_10053A75C();
}

- (_TtC5Music24NowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music24NowPlayingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100547518();
}

@end