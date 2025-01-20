@interface WorkoutPlanGalleryViewController
- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WorkoutPlanGalleryViewController

- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2DA8B8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A2D9704();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(WorkoutPlanGalleryViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    id v8 = objc_msgSend(self, sel_whiteColor);
    objc_msgSend(v7, sel_setTintColor_, v8);

    id v4 = v8;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanGalleryViewController *)&v5 viewDidAppear:v3];
  sub_23A2DA878((unint64_t *)&unk_268A188A0);
  sub_23A7FC148();
  sub_23A2DA878((unint64_t *)&unk_268A18880);
  sub_23A2DA878((unint64_t *)&unk_268A18890);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A2D9A6C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WorkoutPlanGalleryViewController *)&v5 viewDidDisappear:v3];
  sub_23A2DA878((unint64_t *)&unk_268A18880);
  sub_23A2DA878((unint64_t *)&unk_268A18890);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v2 = (char *)v10.receiver;
  [(WorkoutPlanGalleryViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI30WorkoutPlanGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (_TtC9SeymourUI32WorkoutPlanGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32WorkoutPlanGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_dynamicOfferCoordinator));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_pageNavigator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_purchaseCoordinator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_purchaseHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32WorkoutPlanGalleryViewController_webUserInterfaceCoordinator));

  swift_unknownObjectRelease();
}

@end