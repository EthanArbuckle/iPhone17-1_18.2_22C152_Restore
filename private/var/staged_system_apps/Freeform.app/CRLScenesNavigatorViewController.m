@interface CRLScenesNavigatorViewController
- (BOOL)accessibilityPerformEscape;
- (NSArray)decoratorOverlayRenderables;
- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithCoder:(id)a3;
- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)grabberButtonPressedWithSender:(id)a3;
- (void)loadView;
- (void)nextSceneButtonPressedWithSender:(id)a3;
- (void)popoverButtonPressedWithSender:(id)a3;
- (void)previousSceneButtonPressed;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBeginZoomingOperation;
@end

@implementation CRLScenesNavigatorViewController

- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100D6F1A4();
}

- (void)loadView
{
  id v3 = (objc_class *)type metadata accessor for CRLScenesNavigatorViewController.PlatformView();
  id v4 = objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = self;
  v6 = -[CRLScenesNavigatorViewController initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[CRLScenesNavigatorViewController setView:](v5, "setView:", v6, v7.receiver, v7.super_class);

  sub_100D5F110();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100D5D968();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100D5DCF0(a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100D5DB84(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100D5DCF0(a3, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController();
  id v2 = v3.receiver;
  [(CRLScenesNavigatorViewController *)&v3 viewDidLayoutSubviews];
  sub_100D62074();
  sub_100D6308C(0);
}

- (void)dealloc
{
  id v2 = self;
  sub_100D5E790();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController();
  [(CRLScenesNavigatorViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_scenesNavigatorState));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_scenesPopoverState));
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_delegate);
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___topCaptureSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___bottomCaptureSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_bezelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_drawerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_backdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_leadingSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController_trailingSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___grabberButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___previousSceneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___nextSceneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___popoverButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLScenesNavigatorViewController____lazy_storage___drawerWidthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)grabberButtonPressedWithSender:(id)a3
{
}

- (void)previousSceneButtonPressed
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    objc_super v3 = self;
    sub_100E5EDC0();

    swift_unknownObjectRelease();
  }
}

- (void)nextSceneButtonPressedWithSender:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_100E5E974();

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_100522F00((uint64_t)v6, &qword_101672BF0);
}

- (void)popoverButtonPressedWithSender:(id)a3
{
}

- (void)updateViewConstraints
{
  id v2 = self;
  sub_100D61CE8();
}

- (BOOL)accessibilityPerformEscape
{
  id v2 = self;
  unsigned int v3 = [(CRLScenesNavigatorViewController *)v2 crl_canBeDismissed];
  if (v3) {
    [(CRLScenesNavigatorViewController *)v2 dismissViewControllerAnimated:1 completion:0];
  }

  return v3;
}

- (NSArray)decoratorOverlayRenderables
{
  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)willBeginZoomingOperation
{
  NSArray v2 = self;
  sub_100D6E7E4();
}

- (_TtC8Freeform32CRLScenesNavigatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform32CRLScenesNavigatorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end