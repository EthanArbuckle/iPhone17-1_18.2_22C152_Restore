@interface PlaylistDetailViewController
- (_TtC9SeymourUI28PlaylistDetailViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI28PlaylistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)backButtonPressed;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PlaylistDetailViewController

- (_TtC9SeymourUI28PlaylistDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5E5218();
}

- (unint64_t)supportedInterfaceOrientations
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_platform) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  PlaylistDetailViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  PlaylistDetailViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(PlaylistDetailViewController *)&v5 viewDidAppear:v3];
  sub_23A5E50EC(&qword_268A1CD98);
  sub_23A7FC148();
  sub_23A5E50EC(&qword_268A1CDA0);
  sub_23A5E50EC(&qword_268A1CDA8);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  PlaylistDetailViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(PlaylistDetailViewController *)&v5 viewDidDisappear:v3];
  sub_23A5E50EC(&qword_268A1CDA0);
  sub_23A5E50EC(&qword_268A1CDA8);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(PlaylistDetailViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI26PlaylistDetailDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)backButtonPressed
{
  double v6 = self;
  v2 = (_TtC9SeymourUI28PlaylistDetailViewController *)[(PlaylistDetailViewController *)v6 navigationController];
  if (v2)
  {
    BOOL v3 = v2;
    id v4 = [(PlaylistDetailViewController *)v2 popViewControllerAnimated:1];

    objc_super v5 = v3;
  }
  else
  {
    objc_super v5 = v6;
  }
}

- (_TtC9SeymourUI28PlaylistDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI28PlaylistDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_bookmarkClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_queueActionsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_standardNavigationBarTintColor));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28PlaylistDetailViewController_currentNavigationBarTintColor);
}

@end