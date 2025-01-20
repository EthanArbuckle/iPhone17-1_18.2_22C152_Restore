@interface SyncedLyricsViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)bottomTapHandler;
- (void)displayLinkFired:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)shareGestureHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
@end

@implementation SyncedLyricsViewController

- (void)viewDidLoad
{
  v2 = self;
  SyncedLyricsViewController.viewDidLoad()();
}

- (void)bottomTapHandler
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 40);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  SyncedLyricsViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  uint64_t v4 = (char *)v7.receiver;
  [(SyncedLyricsViewController *)&v7 viewDidDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink;
  [*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink] invalidate];
  v6 = *(void **)&v4[v5];
  *(void *)&v4[v5] = 0;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SyncedLyricsViewController.viewDidLayoutSubviews()();
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsViewController();
  id v2 = v3.receiver;
  [(SyncedLyricsViewController *)&v3 viewLayoutMarginsDidChange];
  sub_87131C();
}

- (void)displayLinkFired:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_87B6B4();
}

- (void)shareGestureHandler:(id)a3
{
  uint64_t v4 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)a3;
  id v5 = self;
  if ([(SyncedLyricsViewController *)v4 state] == (char *)&def_3B9D84 + 1
    && (v6 = (_TtC11MusicCoreUI26SyncedLyricsViewController *)[(SyncedLyricsViewController *)v4 view]) != 0)
  {
    v8 = v6;
    type metadata accessor for SyncedLyricsLineView();
    objc_super v7 = (char *)swift_dynamicCastClass();
    if (v7) {
      sub_8709C0(v7);
    }

    uint64_t v4 = v5;
  }
  else
  {
    v8 = v5;
  }
}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_AB6510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11MusicCoreUI26SyncedLyricsViewController)initWithCoder:(id)a3
{
  return (_TtC11MusicCoreUI26SyncedLyricsViewController *)SyncedLyricsViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_specs, 0x219uLL);
  sub_8546D8((uint64_t)v3);
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_delegate);
  swift_release();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_timingProvider, &qword_DF5030);
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_shareHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_scrollView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_displayLink));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_instrumentalBreakVisibleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_tapFeedbackGenerator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  unsigned __int8 v9 = sub_87BAB0(v7);

  return v9 & 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_87544C();
  sub_8788D0();
  *((unsigned char *)&v5->super.super.super.isa
  + OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScroll) = 0;
  uint64_t v6 = OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer;
  [*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC11MusicCoreUI26SyncedLyricsViewController_allowAnimateToNextLineAfterScrollTimer) invalidate];
  id v7 = *(Class *)((char *)&v5->super.super.super.isa + v6);
  *(Class *)((char *)&v5->super.super.super.isa + v6) = 0;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  _s11MusicCoreUI26SyncedLyricsViewControllerC06scrollF14DidEndDragging_14willDecelerateySo08UIScrollF0C_SbtF_0();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  unsigned __int8 v9 = self;
  _s11MusicCoreUI26SyncedLyricsViewControllerC06scrollF15WillEndDragging_12withVelocity19targetContentOffsetySo08UIScrollF0C_So7CGPointVSpyAJGtF_0(x, y);
}

@end