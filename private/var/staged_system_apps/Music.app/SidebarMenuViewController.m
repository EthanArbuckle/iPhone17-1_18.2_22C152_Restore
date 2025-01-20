@interface SidebarMenuViewController
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (_TtC5Music25SidebarMenuViewController)initWithCoder:(id)a3;
- (_TtC5Music25SidebarMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)presentRazzmatazz:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SidebarMenuViewController

- (_TtC5Music25SidebarMenuViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100790C34();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100775150();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  id v4 = v6.receiver;
  [(SidebarMenuViewController *)&v6 viewDidAppear:v3];
  v5 = *(void (**)(id, _UNKNOWN **))(*(void *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor()
                                              + 224);
  swift_retain();
  v5(v4, &off_100FE8718);

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SidebarMenuViewController(0);
  id v4 = v6.receiver;
  [(SidebarMenuViewController *)&v6 viewDidDisappear:v3];
  v5 = *(void (**)(id, _UNKNOWN **))(*(void *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor()
                                              + 232);
  swift_retain();
  v5(v4, &off_100FE8718);

  swift_release();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v6 = self;
  sub_100780FBC(a3, a4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100781B74();
}

- (void)presentRazzmatazz:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007880CC(v4);
}

- (_TtC5Music25SidebarMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music25SidebarMenuViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10051BEFC(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu), *(void **)&self->editedLibraryMenu[OBJC_IVAR____TtC5Music25SidebarMenuViewController_editedLibraryMenu]);
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music25SidebarMenuViewController_onUserSelection));
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music25SidebarMenuViewController_onSelectedItemChanged));
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_selectedItem, (uint64_t *)&unk_1010B9F80);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_pendingSelectedItem, (uint64_t *)&unk_1010B9F80);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController_dataSource));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_sharedLibrarySelectionObserver, &qword_1010B46B0);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music25SidebarMenuViewController_availableSharedLibrariesObserver, &qword_1010B46B0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___contextBarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___contextBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___enableCloudLibraryButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music25SidebarMenuViewController____lazy_storage___cloudLibraryLoadingSpinner));
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  sub_10079128C((uint64_t)v11);
  LOBYTE(self) = v13;

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_100791A58();
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10078B29C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))sub_100788CEC);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_10078900C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_10078B29C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(id, char *))sub_10078AD54);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_100791C50();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  char v13 = (char *)&v22 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v22 - v15;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v17 = a3;
  v18 = self;
  sub_10078B4A8((uint64_t)v13, (uint64_t)v10, (uint64_t)v16);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v10, v7);
  v19(v13, v7);
  v20.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v19(v16, v7);

  return v20.super.isa;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_100791ED0(v9, a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  type metadata accessor for IndexPath();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a3;
  id v9 = self;
  id v10 = sub_1007922E4(v8, v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  if (a5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = self;
    v14[4] = sub_100792B3C;
    v14[5] = v9;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 1107296256;
    v14[2] = sub_100020238;
    v14[3] = &unk_100FE8750;
    id v10 = _Block_copy(v14);
    uint64_t v11 = self;
    id v12 = a3;
    id v13 = a4;
    swift_unknownObjectRetain();
    swift_release();
    [a5 addCompletion:v10];
    _Block_release(v10);

    swift_unknownObjectRelease();
  }
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = sub_1007929F8(v12, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15;
}

@end