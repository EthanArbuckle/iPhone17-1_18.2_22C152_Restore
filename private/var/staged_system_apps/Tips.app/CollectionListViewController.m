@interface CollectionListViewController
+ (NSString)defaultNavigationTitle;
- (BOOL)canSearch;
- (CollectionListViewController)initWithAppController:(id)a3;
- (CollectionListViewController)initWithCoder:(id)a3;
- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CollectionListViewController)initWithViewModel:(id)a3;
- (CollectionListViewModel)viewModel;
- (UIViewController)hostingController;
- (void)analyticsIncreaseCountViewForCollectionsView:(id)a3;
- (void)analyticsIncreaseCountViewForCollectionsViewDelay:(id)a3;
- (void)analyticsIncreaseCountViewForNilTipIDWithLaunchType:(id)a3;
- (void)applicationWillEnterBackground;
- (void)applicationWillEnterForeground;
- (void)cancelAnalyticsIncreaseCountViewForCollectionsViewDelay;
- (void)dealloc;
- (void)didPresentSearchController:(id)a3;
- (void)dismissSearch;
- (void)loadView;
- (void)runTest:(id)a3 options:(id)a4;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchWithSearchQuery:(id)a3;
- (void)setViewModel:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CollectionListViewController

- (CollectionListViewController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = (CollectionListViewController *)sub_100006CE8(a3);

  return v5;
}

+ (NSString)defaultNavigationTitle
{
  if (qword_1000C7FC8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionListViewController();
  id v4 = v6.receiver;
  [(TPSAppViewController *)&v6 viewWillAppear:v3];
  id v5 = [self defaultCenter];
  [v5 addObserver:v4 selector:"applicationWillEnterForeground" name:UIApplicationWillEnterForegroundNotification object:0];
  [v5 addObserver:v4 selector:"applicationWillEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];

  v4[OBJC_IVAR___CollectionListViewController_canIncreaseViewCount] = 1;
  [v4 analyticsIncreaseCountViewForCollectionsViewDelay:TPSAnalyticsViewMethodViewAppear];
}

- (void)analyticsIncreaseCountViewForCollectionsViewDelay:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000BB6C();
}

- (CollectionListViewModel)viewModel
{
  return (CollectionListViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                            + OBJC_IVAR___CollectionListViewController_viewModel));
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_100008D20();
}

- (void)loadView
{
  NSString v2 = self;
  sub_10000AF84();
}

- (void)setViewModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_viewModel);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_viewModel) = (Class)a3;
  id v3 = a3;
}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                     + OBJC_IVAR___CollectionListViewController_hostingController));
}

- (void)dealloc
{
  NSString v2 = self;
  [(CollectionListViewController *)v2 cancelAnalyticsIncreaseCountViewForCollectionsViewDelay];
  id v3 = [self defaultCenter];
  [v3 removeObserver:v2 name:UIApplicationWillEnterForegroundNotification object:0];
  [v3 removeObserver:v2 name:UIApplicationDidEnterBackgroundNotification object:0];

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for CollectionListViewController();
  [(TPSViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchResultsViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchResultsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchController));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler);

  sub_100005470(v3);
}

- (CollectionListViewController)initWithCoder:(id)a3
{
  return (CollectionListViewController *)sub_10003831C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionListViewController();
  objc_super v4 = v6.receiver;
  [(TPSAppViewController *)&v6 viewWillDisappear:v3];
  v4[OBJC_IVAR___CollectionListViewController_canIncreaseViewCount] = 0;
  id v5 = [self defaultCenter];
  [v5 removeObserver:v4 name:UIApplicationWillEnterForegroundNotification object:0];
  [v5 removeObserver:v4 name:UIApplicationDidEnterBackgroundNotification object:0];

  [v4 cancelAnalyticsIncreaseCountViewForCollectionsViewDelay];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionListViewController();
  [(CollectionListViewController *)&v6 willTransitionToTraitCollection:a3 withTransitionCoordinator:a4];
}

- (void)applicationWillEnterForeground
{
}

- (void)applicationWillEnterBackground
{
  NSString v2 = self;
  [(CollectionListViewController *)v2 cancelAnalyticsIncreaseCountViewForCollectionsViewDelay];
  *((unsigned char *)&v2->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_canIncreaseViewCount) = 0;
}

- (CollectionListViewController)initWithAppController:(id)a3
{
  id v3 = a3;
  result = (CollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)canSearch
{
  return *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___CollectionListViewController_searchController) != 0;
}

- (void)searchWithSearchQuery:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000388C0(v4);
}

- (void)dismissSearch
{
  NSString v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___CollectionListViewController_searchController);
  if (v2)
  {
    id v3 = self;
    id v4 = [v2 searchBar];
    [v4 resignFirstResponder];
  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100038F88(v4);
}

- (void)didPresentSearchController:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_searchActive) = 1;
  id v4 = a3;
  id v5 = self;
  sub_100003384();
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100039578();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100039624();
}

- (void)cancelAnalyticsIncreaseCountViewForCollectionsViewDelay
{
  id v3 = self;
  id v4 = objc_allocWithZone((Class)TPSViewSourceProxy);
  id v5 = self;
  id v6 = [v4 init];
  [v3 cancelPreviousPerformRequestsWithTarget:v5 selector:"analyticsIncreaseCountViewForCollectionsView:" object:v6];
}

- (void)analyticsIncreaseCountViewForNilTipIDWithLaunchType:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  [(CollectionListViewController *)v4 analyticsIncreaseCountViewForCollectionsViewDelay:v5];

  swift_bridgeObjectRelease();
}

- (void)analyticsIncreaseCountViewForCollectionsView:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_10003936C(v4);
}

- (void)runTest:(id)a3 options:(id)a4
{
}

@end