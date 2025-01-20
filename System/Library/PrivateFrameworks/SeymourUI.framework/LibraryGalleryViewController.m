@interface LibraryGalleryViewController
- (_TtC9SeymourUI28LibraryGalleryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI28LibraryGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation LibraryGalleryViewController

- (_TtC9SeymourUI28LibraryGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FB8DE8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239FB78B0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_239FB7A9C(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LibraryGalleryViewController();
  v4 = (char *)v7.receiver;
  [(LibraryGalleryViewController *)&v7 viewIsAppearing:v3];
  objc_msgSend(*(id *)(*(void *)(*(void *)&v4[OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_dataProvider]+ OBJC_IVAR____TtC9SeymourUI26LibraryGalleryDataProvider_page)+ OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView), sel_contentOffset, v7.receiver, v7.super_class);
  sub_23A531EBC(v5, v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryGalleryViewController();
  id v4 = v5.receiver;
  [(LibraryGalleryViewController *)&v5 viewDidAppear:v3];
  sub_239FB8D64(&qword_268A14180);
  sub_23A7FC148();
  sub_239FB8D64(&qword_268A14170);
  sub_239FB8D64(&qword_268A14178);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_239FB7E4C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryGalleryViewController();
  id v4 = v5.receiver;
  [(LibraryGalleryViewController *)&v5 viewDidDisappear:v3];
  sub_239FB8D64(&qword_268A14170);
  sub_239FB8D64(&qword_268A14178);
  sub_23A7FC858();
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for LibraryGalleryViewController();
  v2 = (char *)v10.receiver;
  [(LibraryGalleryViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_dataProvider]
                + OBJC_IVAR____TtC9SeymourUI26LibraryGalleryDataProvider_page);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  objc_super v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (_TtC9SeymourUI28LibraryGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI28LibraryGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_metricPageCategory;
  uint64_t v4 = sub_23A7F8B08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_serviceSubscriptionCache);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_storefrontLocalizer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_upNextQueueButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_standardNavigationBarTintColor));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28LibraryGalleryViewController_currentNavigationBarTintColor);
}

@end