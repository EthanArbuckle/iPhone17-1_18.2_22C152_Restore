@interface UpNextQueueViewController
- (_TtC9SeymourUI25UpNextQueueViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI25UpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismissView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation UpNextQueueViewController

- (unint64_t)supportedInterfaceOrientations
{
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_platform) == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  UpNextQueueViewController.viewDidLoad()();
}

- (_TtC9SeymourUI25UpNextQueueViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2B6FB4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(UpNextQueueViewController *)&v5 viewDidAppear:v3];
  sub_23A2B72F8(&qword_268A183C8);
  sub_23A7FC148();
  sub_23A2B72F8(&qword_268A183D0);
  sub_23A2B72F8(&qword_268A183D8);
  sub_23A7FC848();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  UpNextQueueViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_23A7F67C8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = self;
  [(UpNextQueueViewController *)&v12 viewWillDisappear:v3];
  v11[1] = v10;
  sub_23A7F67B8();
  sub_23A2B72F8(&qword_268A183D0);
  sub_23A7FC748();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(UpNextQueueViewController *)&v5 viewDidDisappear:v3];
  sub_23A2B72F8(&qword_268A183D0);
  sub_23A2B72F8(&qword_268A183D8);
  sub_23A7FC858();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UpNextQueueViewController *)&v3 viewWillLayoutSubviews];
  sub_23A2B1D34();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v2 = (char *)v10.receiver;
  [(UpNextQueueViewController *)&v10 viewDidLayoutSubviews];
  objc_super v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30UpNextQueueGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (void)dismissView
{
}

- (_TtC9SeymourUI25UpNextQueueViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI25UpNextQueueViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_bookmarkClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_contentAvailabilityFilter);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_storefrontLocalizer);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_subscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_upNextQueueClient);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_queueActionsView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_mediaTagStringBuilder);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_blurView));
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI25UpNextQueueViewController_layout));

  swift_bridgeObjectRelease();
}

@end