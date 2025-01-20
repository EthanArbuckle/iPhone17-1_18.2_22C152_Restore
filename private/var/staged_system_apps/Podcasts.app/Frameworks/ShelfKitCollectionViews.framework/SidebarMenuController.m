@interface SidebarMenuController
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SidebarMenuController

- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1F2B74();
}

- (void)viewDidLoad
{
  v2 = self;
  SidebarMenuController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SidebarMenuController.viewDidLayoutSubviews()();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  SidebarMenuController.setEditing(_:animated:)(a3, a4);
}

- (_TtC23ShelfKitCollectionViews21SidebarMenuController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews21SidebarMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_datasource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_collectionView));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_libraryActionController);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_storeDataProvider);
  swift_bridgeObjectRelease();
  sub_BF18C(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_previousNavigationTab));
  sub_BF18C(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_pendingTabSelection));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_episodeController);
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController_searchSuggestionsController, &qword_479D30);
  id v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController__isEditingSidebar;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_47AE70);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21SidebarMenuController____lazy_storage___collectionViewLayout);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  SidebarMenuController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = SidebarMenuController.collectionView(_:shouldSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1F2D48();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  sub_1F2F48();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_37B160();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v22 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v22 - v15;
  sub_37B0E0();
  sub_37B0E0();
  id v17 = a3;
  v18 = self;
  SidebarMenuController.collectionView(_:targetIndexPathForMoveFromItemAt:toProposedIndexPath:)((uint64_t)v13, (uint64_t)v10, (uint64_t)v16);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v10, v7);
  v19(v13, v7);
  v20.super.isa = sub_37B0D0().super.isa;
  v19(v16, v7);

  return v20.super.isa;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_37B160();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = sub_1F32D4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = (void *)_s23ShelfKitCollectionViews21SidebarMenuControllerC07contextF11Interaction_016configurationForF10AtLocationSo09UIContextF13ConfigurationCSgSo0nfI0C_So7CGPointVtF_0(x, y);

  return v9;
}

@end