@interface CRLiOSAutoSizingHostingController
- (UINavigationItem)navigationItem;
- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithCoder:(id)a3;
- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CRLiOSAutoSizingHostingController

- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_lastLayoutSize);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_didChangeSize) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_pendingResizeAnimator) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_scrollTargets;
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_100A3BE78((uint64_t)_swiftEmptyArrayStorage);

  result = (_TtC8Freeform33CRLiOSAutoSizingHostingController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  id v5 = [v3 init];
  [(CRLiOSAutoSizingHostingController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  CRLiOSAutoSizingHostingController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  CRLiOSAutoSizingHostingController.viewWillAppear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  CRLiOSAutoSizingHostingController.viewWillLayoutSubviews()();
}

- (UINavigationItem)navigationItem
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_hostingController) navigationItem];

  return (UINavigationItem *)v2;
}

- (_TtC8Freeform33CRLiOSAutoSizingHostingController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform33CRLiOSAutoSizingHostingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_scrollView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform33CRLiOSAutoSizingHostingController_pendingResizeAnimator));

  swift_bridgeObjectRelease();
}

@end