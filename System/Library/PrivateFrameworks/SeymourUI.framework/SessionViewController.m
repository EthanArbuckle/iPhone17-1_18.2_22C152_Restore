@interface SessionViewController
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (NSArray)keyCommands;
- (NSArray)preferredFocusEnvironments;
- (UIViewController)childViewControllerForHomeIndicatorAutoHidden;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC9SeymourUI21SessionViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI21SessionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)handleEscapeKeyCommand;
- (void)handleSpacebarCommand;
- (void)menuButtonTapped;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SessionViewController

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(unsigned char *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = v9;
  v14[4] = sub_239F05050;
  v14[5] = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_239E3E38C;
  v14[3] = &block_descriptor_11;
  v11 = _Block_copy(v14);
  id v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  swift_release();
  objc_msgSend(a5, sel_addCoordinatedAnimations_completion_, v11, 0);
  _Block_release(v11);

  swift_unknownObjectRelease();
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay));
}

- (unint64_t)supportedInterfaceOrientations
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_platform) == 1) {
    return 30;
  }
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_platform)) {
    return 24;
  }
  v2 = self;
  uint64_t v3 = sub_23A7F7D08();
  char v5 = v3;
  if ((v6 & 1) == 0)
  {
    sub_239C1E4D0(v3, v4, 0);

    return 24;
  }

  if ((v5 & 0xFE) != 0) {
    return 24;
  }
  else {
    return 2;
  }
}

- (NSArray)keyCommands
{
  if (_s9SeymourUI21SessionViewControllerC11keyCommandsSaySo12UIKeyCommandCGSgvg_0())
  {
    sub_239C24FF0(0, &qword_268A1E220);
    v2 = (void *)sub_23A7FFC58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)handleEscapeKeyCommand
{
  uint64_t v3 = sub_23A7FEE28();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  char v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_23A7FE928();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_23A2602D4();
}

- (void)handleSpacebarCommand
{
  v2 = self;
  sub_23A27ED0C();
}

- (void)dealloc
{
  v2 = self;
  SessionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_miniPlayerHost);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_pictureInPictureSurrogate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_sessionContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_castingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_instructionsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_watchDiscoveryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_continueOnWatchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_ongoingWorkoutDetectedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_introSequenceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_bufferView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_displayPreferencesViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_summaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SessionViewController_menuGestureRecognizer));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21SessionViewController_activityTypeBehavior;
  uint64_t v4 = sub_23A7FA8A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (_TtC9SeymourUI21SessionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A6A786C();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  SessionViewController.preferredFocusEnvironments.getter();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  id v3 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)viewDidLoad
{
  v2 = self;
  SessionViewController.viewDidLoad()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  SessionViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  SessionViewController.viewWillLayoutSubviews()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  SessionViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)menuButtonTapped
{
  v2 = self;
  sub_23A2602D4();
}

- (_TtC9SeymourUI21SessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI21SessionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (UIViewController)childViewControllerForHomeIndicatorAutoHidden
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SessionViewController_introSequenceCompleted) == 1) {
    id v2 = objc_retain(*(id *)((char *)&self->super.super.super.isa
  }
                           + OBJC_IVAR____TtC9SeymourUI21SessionViewController_mediaPlayerDisplay));
  else {
    id v2 = 0;
  }

  return (UIViewController *)v2;
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde18WillStartPictureInI0yySo08AVPlayerdE0CF_0();
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_23A6A7B70(v8);
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde17WillStopPictureInI0yySo08AVPlayerdE0CF_0();
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s9SeymourUI21SessionViewControllerC06playerde16DidStopPictureInI0yySo08AVPlayerdE0CF_0();
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v9 = self;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = self;
  id v14 = objc_msgSend(v9, sel_sheetPresentationControllerForPresentedController_presentingController_, v10, v11);
  objc_msgSend(v14, sel_setPrefersPageSizing_, 1);
  id v15 = objc_msgSend(self, sel_smu_effectWithBlurRadius_, 5.0);
  objc_msgSend(v14, sel_setBackgroundBlurEffect_, v15);

  return v14;
}

@end