@interface CatalogTipGalleryViewController
- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CatalogTipGalleryViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_resignActiveObserver) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_hasPostedEnterEvent) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_hasPostedExitEvent) = 0;
  id v4 = a3;

  result = (_TtC9SeymourUI31CatalogTipGalleryViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_239DF0F10();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  [(CatalogTipGalleryViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_pageNavigator);

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239DF0310();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  id v4 = v9.receiver;
  [(CatalogTipGalleryViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    id v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
    objc_msgSend(v7, sel_setTintColor_, v8);

    id v4 = v8;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_239DF0554(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_239DF0B2C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  id v4 = v7.receiver;
  [(CatalogTipGalleryViewController *)&v7 viewDidDisappear:v3];
  sub_239DF2550(&qword_268A111E8, v5, (void (*)(uint64_t))type metadata accessor for CatalogTipGalleryViewController);
  sub_239DF2550(&qword_268A111F0, v6, (void (*)(uint64_t))type metadata accessor for CatalogTipGalleryViewController);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CatalogTipGalleryViewController();
  v2 = (char *)v10.receiver;
  [(CatalogTipGalleryViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI31CatalogTipGalleryViewController_dataProvider] + 56);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (_TtC9SeymourUI31CatalogTipGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI31CatalogTipGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end