@interface TVPlaylistListViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI28TVPlaylistListViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI28TVPlaylistListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVPlaylistListViewController

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(void **)((*(void **)((char *)&self->super.super.super.isa
                              + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_dataProvider))[4]
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI28TVPlaylistListViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_visibility) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_resignActiveObserver) = 0;
  id v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_lastFocusedIndexPath;
  uint64_t v6 = sub_23A7F6B08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_settlingTimer) = 0;
  id v7 = a3;

  result = (_TtC9SeymourUI28TVPlaylistListViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A52E58C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  id v4 = v5.receiver;
  [(TVPlaylistListViewController *)&v5 viewDidAppear:v3];
  sub_23A52F124(&qword_268A1BFC0);
  sub_23A7FC148();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = sub_23A7F67C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (objc_class *)type metadata accessor for TVPlaylistListViewController();
  v12.receiver = self;
  v12.super_class = v9;
  v10 = self;
  [(TVPlaylistListViewController *)&v12 viewWillDisappear:v3];
  v11[1] = v10;
  sub_23A7F67B8();
  sub_23A52F124(&qword_268A1BFB8);
  sub_23A7FC748();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  id v2 = v3.receiver;
  [(TVPlaylistListViewController *)&v3 viewWillLayoutSubviews];
  sub_239E22264(0);
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TVPlaylistListViewController();
  id v2 = (char *)v10.receiver;
  [(TVPlaylistListViewController *)&v10 viewDidLayoutSubviews];
  objc_super v3 = *(char **)(*(void *)&v2[OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_dataProvider] + 32);
  __swift_project_boxed_opaque_existential_1(&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker], *(void *)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker + 24]);
  id v4 = *(void **)&v3[OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView];
  uint64_t v5 = v3;
  objc_msgSend(v4, sel_bounds, v10.receiver, v10.super_class);
  sub_23A05CD58(v6, v7, v8, v9);
}

- (_TtC9SeymourUI28TVPlaylistListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI28TVPlaylistListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_pageNavigator);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_lastFocusedIndexPath);
  swift_unknownObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI28TVPlaylistListViewController_timerProvider;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end