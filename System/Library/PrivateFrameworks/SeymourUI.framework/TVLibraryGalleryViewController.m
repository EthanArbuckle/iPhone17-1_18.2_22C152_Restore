@interface TVLibraryGalleryViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVLibraryGalleryViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_dataProvider))[2]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A6CDF10();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A6CD19C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_23A6CD2DC();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibraryGalleryViewController();
  id v4 = v5.receiver;
  [(TVLibraryGalleryViewController *)&v5 viewDidDisappear:v3];
  sub_23A6CDECC((unint64_t *)&unk_268A1E500);
  sub_23A6CDECC(&qword_268A1E518);
  sub_23A7FC858();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVLibraryGalleryViewController();
  id v4 = v5.receiver;
  [(TVLibraryGalleryViewController *)&v5 viewDidAppear:v3];
  sub_23A6CDECC(&qword_268A1E510);
  sub_23A7FC148();
  sub_23A6CDECC((unint64_t *)&unk_268A1E500);
  sub_23A6CDECC(&qword_268A1E518);
  sub_23A7FC848();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A6CD5D0(a3);
}

- (_TtC9SeymourUI30TVLibraryGalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI30TVLibraryGalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_metricPageCategory;
  uint64_t v4 = sub_23A7F8B08();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_storefrontLocalizer);
  swift_unknownObjectRelease();
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  objc_super v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI30TVLibraryGalleryViewController_timerProvider;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

@end