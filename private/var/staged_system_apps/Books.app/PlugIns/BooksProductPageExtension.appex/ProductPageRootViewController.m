@interface ProductPageRootViewController
- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (TUISyncLayoutController)syncLayoutController;
- (UINavigationItem)navigationItem;
- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithCoder:(id)a3;
- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)analyticsTrackerForStoreServices:(id)a3;
- (id)flowControllers;
- (id)objectRegistrationsForBridge:(id)a3;
- (id)windowProviderForBridge:(id)a3;
- (void)_bridgeDidReload:(id)a3;
- (void)_smartInvertDidChange:(id)a3;
- (void)dealloc;
- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5;
- (void)syncLayoutControllerNeedsFlushing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ProductPageRootViewController

- (UINavigationItem)navigationItem
{
  v3 = *(UINavigationItem **)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem];
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for ProductPageRootViewController();
    v6 = self;
    v5 = [(ProductPageRootViewController *)&v9 navigationItem];
  }
  v7 = v3;

  return v5;
}

- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100023490();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC25BooksProductPageExtension29ProductPageRootViewController *)sub_10000A318(v5, v7, a4);
}

- (_TtC25BooksProductPageExtension29ProductPageRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000EF14();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000A648();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v4 = (char *)v7.receiver;
  [(ProductPageRootViewController *)&v7 viewWillAppear:v3];
  uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager];
  if (v5)
  {
    uint64_t v6 = v5;
    sub_1000232E0();

    v4 = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10000AB00(a3);
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v2 = (char *)v3.receiver;
  [(ProductPageRootViewController *)&v3 viewDidLayoutSubviews];
  [*(id *)&v2[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] flush];
}

- (void)dealloc
{
  v2 = self;
  sub_10000B06C();
}

- (void).cxx_destruct
{
  sub_100010560((uint64_t)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification], &qword_100038D00);
  sub_100010560((uint64_t)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification], &qword_100038D00);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (BOOL)lookupItemDidLoad:(id)a3 parameters:(id)a4
{
  uint64_t v6 = sub_100023450();
  id v7 = a3;
  id v8 = self;
  sub_10000B4AC(v7, v6);

  swift_bridgeObjectRelease();
  return 0;
}

- (void)setupWithCustomNavigationItem:(id)a3 promptString:(id)a4 askToBuy:(BOOL)a5
{
  if (a4)
  {
    uint64_t v8 = sub_100023490();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  v12 = self;
  sub_10000B7E0(v11, v8, v10, a5);

  swift_bridgeObjectRelease();
}

- (TUISyncLayoutController)syncLayoutController
{
  result = *(TUISyncLayoutController **)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController];
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (id)windowProviderForBridge:(id)a3
{
  id result = *(id *)&self->SKProductPageExtension_opaque[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider];
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (id)objectRegistrationsForBridge:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10000FB74();

  v6.super.isa = sub_100023440().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (void)_bridgeDidReload:(id)a3
{
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 0;
}

- (void)syncLayoutControllerNeedsFlushing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(ProductPageRootViewController *)v5 view];
  if (v6)
  {
    id v7 = v6;
    [v6 setNeedsLayout];
  }
  else
  {
    __break(1u);
  }
}

- (id)analyticsTrackerForStoreServices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(ProductPageRootViewController *)v5 bc_deepestVisibleChildViewControllerIncludePresented:1];
  id result = [v6 ba_effectiveAnalyticsTracker];
  if (result)
  {
    id v8 = result;

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_smartInvertDidChange:(id)a3
{
}

- (id)flowControllers
{
  sub_1000084A8(&qword_100038BC0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10002B120;
  sub_1000084A8(&qword_100038BC8);
  id v4 = self;
  sub_1000233E0();
  *(void *)(v3 + 56) = swift_getObjectType();
  *(void *)(v3 + 32) = v7;

  v5.super.isa = sub_100023520().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

@end