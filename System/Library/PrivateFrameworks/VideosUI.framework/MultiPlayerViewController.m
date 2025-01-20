@interface MultiPlayerViewController
- (BOOL)isShowingProspectivePlayer;
- (BOOL)isSupportedScreenSize:(CGSize)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (CGRect)presentationRectForPlayerViewController:(id)a3;
- (NSArray)playerViewControllers;
- (VUIImageProxy)backgroundImageProxy;
- (VUIMultiPlayerViewControllerDelegate)delegate;
- (_TtC8VideosUI25MultiPlayerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI25MultiPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4;
- (int64_t)prospectivePlayerIndex;
- (unint64_t)distribution;
- (void)addPlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)captureAndShowPlayerScreenshots;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)enterFullscreenWithPlayerViewController:(id)a3 completion:(id)a4;
- (void)exitFullscreenWithCompletion:(id)a3;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)recordMetricsEventWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5 didAddPlayer:(BOOL)a6;
- (void)removePlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)replacePlayerViewController:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setBackgroundImageProxy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailsViewControllerVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setFullscreenGesturesEnabled:(BOOL)a3;
- (void)setProspectivePlayerVisible:(BOOL)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MultiPlayerViewController

- (NSArray)playerViewControllers
{
  v2 = self;
  sub_1E3061810();

  sub_1E2BE915C(0, (unint64_t *)&qword_1EADF1670);
  v3 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (VUIImageProxy)backgroundImageProxy
{
  v2 = self;
  id v3 = sub_1E3061B74();

  return (VUIImageProxy *)v3;
}

- (void)setBackgroundImageProxy:(id)a3
{
  id v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E3061BF8();
}

- (VUIMultiPlayerViewControllerDelegate)delegate
{
  v2 = (void *)sub_1E3061E3C();
  return (VUIMultiPlayerViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E3061ED4();
}

- (unint64_t)distribution
{
  v2 = self;
  unint64_t v3 = sub_1E3061FD0();

  return v3;
}

- (BOOL)isShowingProspectivePlayer
{
  v2 = self;
  BOOL v3 = sub_1E3062150();

  return v3;
}

- (int64_t)prospectivePlayerIndex
{
  v2 = self;
  int64_t v3 = sub_1E30621B8();

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  return sub_1E306246C() & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return sub_1E30624A4() & 1;
}

- (_TtC8VideosUI25MultiPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3064C84();
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E306DDFC((SEL *)&selRef_viewDidLoad);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1E3064F7C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3065064(v4);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E30651F4(v4);
}

- (void)addPlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  v12 = OUTLINED_FUNCTION_164_1(v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_186_1(v13);
    v12 = sub_1E3076014;
  }
  id v14 = v6;
  v5;
  OUTLINED_FUNCTION_54_9();
  sub_1E3067DB0();
  sub_1E2C5FB90((uint64_t)v12);

  OUTLINED_FUNCTION_143();
}

- (void)removePlayerViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  v12 = OUTLINED_FUNCTION_164_1(v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_186_1(v13);
    v12 = sub_1E3076014;
  }
  id v14 = v6;
  v5;
  OUTLINED_FUNCTION_54_9();
  sub_1E3067EFC();
  sub_1E2C5FB90((uint64_t)v12);

  OUTLINED_FUNCTION_143();
}

- (void)replacePlayerViewController:(id)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  OUTLINED_FUNCTION_135_1();
  int v7 = v6;
  int v9 = v8;
  v11 = _Block_copy(v10);
  if (v11) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v11;
  }
  id v12 = v7;
  v9;
  OUTLINED_FUNCTION_141_3();
  sub_1E3068350();
  OUTLINED_FUNCTION_91_7();

  OUTLINED_FUNCTION_143();
}

- (void)enterFullscreenWithPlayerViewController:(id)a3 completion:(id)a4
{
  OUTLINED_FUNCTION_135_1();
  id v5 = v4;
  int v7 = v6;
  int v9 = _Block_copy(v8);
  if (v9)
  {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v9;
    int v9 = sub_1E3076014;
  }
  id v10 = v5;
  v7;
  OUTLINED_FUNCTION_83_7();
  sub_1E30687D8();
  sub_1E2C5FB90((uint64_t)v9);

  OUTLINED_FUNCTION_143();
}

- (void)exitFullscreenWithCompletion:(id)a3
{
  char v4 = _Block_copy(a3);
  if (v4) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v4;
  }
  else {
    OUTLINED_FUNCTION_149_3();
  }
  id v5 = self;
  sub_1E3068BBC();
  OUTLINED_FUNCTION_148_1();
}

- (void)setProspectivePlayerVisible:(BOOL)a3 atIndex:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  OUTLINED_FUNCTION_135_1();
  int v7 = v6;
  int v9 = _Block_copy(v8);
  if (v9) {
    *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v9;
  }
  v7;
  OUTLINED_FUNCTION_141_3();
  sub_1E3069000(v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_91_7();
  OUTLINED_FUNCTION_143();
}

- (void)setDetailsViewControllerVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  OUTLINED_FUNCTION_135_1();
  uint64_t v11 = OUTLINED_FUNCTION_165_1(v6, v7, v8, v9, v10);
  if (v11)
  {
    uint64_t v12 = OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_186_1(v12);
    uint64_t v11 = sub_1E3070BA0;
  }
  v5;
  OUTLINED_FUNCTION_54_9();
  sub_1E3069400(v13, v14, v15, v16);
  sub_1E2C5FB90((uint64_t)v11);
  OUTLINED_FUNCTION_143();
}

- (CGRect)presentationRectForPlayerViewController:(id)a3
{
  id v5 = a3;
  int v6 = self;
  OUTLINED_FUNCTION_12_15();
  sub_1E306A594();
  OUTLINED_FUNCTION_22_0();

  double v7 = OUTLINED_FUNCTION_44();
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (BOOL)isSupportedScreenSize:(CGSize)a3
{
  OUTLINED_FUNCTION_5_1();
  id v4 = v3;
  double v5 = OUTLINED_FUNCTION_11_2();
  char v7 = sub_1E306A8C8(v5, v6);

  return v7 & 1;
}

- (void)captureAndShowPlayerScreenshots
{
  v2 = self;
  sub_1E306AAA4();
}

- (void)recordMetricsEventWithIdentifier:(id)a3 impressionsData:(id)a4 locationData:(id)a5 didAddPlayer:(BOOL)a6
{
  OUTLINED_FUNCTION_44_7();
  char v7 = v6;
  double v9 = v8;
  uint64_t v10 = sub_1E387C928();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1E387CC98();
  uint64_t v14 = sub_1E387CC98();
  id v15 = v9;
  sub_1E306AB74(v10, v12, v13, v14, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  swift_bridgeObjectRelease();
}

- (void)setFullscreenGesturesEnabled:(BOOL)a3
{
  id v3 = self;
  uint64_t v4 = OUTLINED_FUNCTION_8_8();
  sub_1E306AD8C(v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  OUTLINED_FUNCTION_5_1();
  char v6 = v5;
  swift_unknownObjectRetain();
  id v7 = v6;
  OUTLINED_FUNCTION_11_2();
  sub_1E306C94C(a4);
  swift_unknownObjectRelease();
}

- (_TtC8VideosUI25MultiPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E306DD98();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_fullscreenPlayerViewController));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_exitFullscreenCompletion));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___gestureManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___backgroundView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_ghostPlayerViewController));
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_playerView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController____lazy_storage___grabberView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_detailsViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_leadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_trailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_grabberBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25MultiPlayerViewController_stateMachine);
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  char v6 = self;
  sub_1E306E5A8();

  swift_unknownObjectRelease();
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  uint64_t v9 = OUTLINED_FUNCTION_12_15();
  sub_1E306E7A4(v9, a4);

  return v7;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_1E33AACB0((int)v7, a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  id v13 = sub_1E33AC51C((uint64_t)v11, v12, v10);

  return v13;
}

@end