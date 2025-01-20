@interface FMCardContainerViewController
- (BOOL)collapseCard;
- (BOOL)expandCard;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UITraitCollection)traitCollection;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC6FindMy29FMCardContainerViewController)initWithCoder:(id)a3;
- (_TtC6FindMy29FMCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (void)handleCloseAction;
- (void)handlePanGestureWithSender:(id)a3;
- (void)loadView;
- (void)traitCollectionDidChange:(id)a3;
- (void)unwindToBaseAction;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FMCardContainerViewController

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000AD88((uint64_t)a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardContainerViewController();
  id v2 = v3.receiver;
  [(FMCardContainerViewController *)&v3 viewDidLoad];
  [v2 setDefinesPresentationContext:1];
  sub_10002C3E8();
  sub_10002F6CC();
  sub_10001AD98();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_10000AEA8();
}

- (UITraitCollection)traitCollection
{
  id v2 = self;
  id v3 = sub_1000554F0();

  return (UITraitCollection *)v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_contentViewController));
}

- (_TtC6FindMy29FMCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC6FindMy29FMCardContainerViewController *)sub_10000E374(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000096A8(a3, (SEL *)&selRef_viewWillAppear_);
}

- (void)loadView
{
  id v2 = self;
  sub_100007964();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000096A8(a3, (SEL *)&selRef_viewWillDisappear_);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = [(FMCardContainerViewController *)v11 traitCollection];
  id v13 = [(UITraitCollection *)v12 horizontalSizeClass];

  if (v13 == (id)1) {
    v14 = (objc_class *)type metadata accessor for FMCardPresentedCompactTransition();
  }
  else {
    v14 = (objc_class *)type metadata accessor for FMCardPresentedRegularTransition();
  }
  id v15 = [objc_allocWithZone(v14) init];

  return v15;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(FMCardContainerViewController *)v5 traitCollection];
  id v7 = [(UITraitCollection *)v6 horizontalSizeClass];

  if (v7 == (id)1) {
    id v8 = (objc_class *)type metadata accessor for FMCardDismissedCompactTransition();
  }
  else {
    id v8 = (objc_class *)type metadata accessor for FMCardDismissedRegularTransition();
  }
  id v9 = [objc_allocWithZone(v8) init];

  return v9;
}

- (void)handleCloseAction
{
  id v2 = self;
  sub_100255968();
}

- (void)unwindToBaseAction
{
  id v2 = self;
  sub_100255B28();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_100257330(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)expandCard
{
  id v2 = self;
  sub_100256288();

  return 1;
}

- (BOOL)collapseCard
{
  id v2 = self;
  sub_100256300();

  return 1;
}

- (_TtC6FindMy29FMCardContainerViewController)initWithCoder:(id)a3
{
  return (_TtC6FindMy29FMCardContainerViewController *)sub_1002575C0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_tabBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_tabBarTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_darkenerBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_cardShadow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_cardContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_passthroughView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_otherGesture));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_compactCardTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_regularCardTopConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_contentViewController);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1005433EC(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_100543590(v7);

  return v9 & 1;
}

- (void)handlePanGestureWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1005425D0(v4);
}

@end