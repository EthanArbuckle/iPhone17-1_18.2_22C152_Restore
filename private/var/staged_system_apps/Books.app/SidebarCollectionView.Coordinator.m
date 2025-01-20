@interface SidebarCollectionView.Coordinator
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (_TtCV5Books21SidebarCollectionView11Coordinator)init;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)hoveringChevron:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateChevronVisibilityForAccessibilityOnCell:(id)a3;
@end

@implementation SidebarCollectionView.Coordinator

- (_TtCV5Books21SidebarCollectionView11Coordinator)init
{
  result = (_TtCV5Books21SidebarCollectionView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  sub_1005727C8(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  if ([v10 isEditing]) {
    sub_100572CAC();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_100573268(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1007F2E40();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v11 = a3;
  uint64_t v12 = self;
  id v13 = sub_100576270();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_1007F2E40();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v27 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v27 - v18;
  sub_1007F2DE0();
  sub_1007F2DE0();
  sub_10007B314(&qword_100B3B218, (void (*)(uint64_t))&type metadata accessor for IndexPath);
  id v27 = a3;
  v28 = self;
  LOBYTE(self) = sub_1007FE2B0();
  uint64_t v20 = v8;
  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v21(v10, v13, v7);
  if (self)
  {
    unsigned __int8 v22 = sub_100573CB8();
    v23 = *(void (**)(char *, uint64_t))(v20 + 8);
    v23(v10, v7);
    if (v22) {
      v24 = v13;
    }
    else {
      v24 = v16;
    }
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t))(v20 + 8);
    v23(v10, v7);
    v24 = v16;
  }
  v21(v19, v24, v7);

  v23(v13, v7);
  v23(v16, v7);
  v25.super.isa = sub_1007F2DC0().super.isa;
  v23(v19, v7);

  return v25.super.isa;
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1007F2E40();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2DE0();
  id v10 = a3;
  uint64_t v11 = self;
  LOBYTE(self) = sub_1005765E8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v9 = sub_100058D18((uint64_t *)&unk_100B33680);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1007F2DE0();
    uint64_t v12 = sub_1007F2E40();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1007F2E40();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  swift_unknownObjectRetain();
  uint64_t v15 = self;
  id v16 = sub_100574434(v14, a4, (uint64_t)v11);

  swift_unknownObjectRelease();
  sub_10005AFE8((uint64_t)v11, (uint64_t *)&unk_100B33680);

  return v16;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_100576790(a4);

  swift_unknownObjectRelease();
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100574C18(v4);
}

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  sub_1007FDC70();
  id v8 = a3;
  uint64_t v9 = self;
  id v10 = [v8 text];
  if (v10)
  {
    uint64_t v11 = v10;
    sub_1007FDC70();

    uint64_t v12 = sub_1007FDDB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12 < 500;
  }
  uint64_t v13 = sub_1007FDDB0();

  BOOL result = swift_bridgeObjectRelease();
  BOOL v15 = __OFSUB__(v13, length);
  uint64_t v12 = v13 - length;
  if (!v15) {
    return v12 < 500;
  }
  __break(1u);
  return result;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  sub_1007FDC70();
  id v6 = a3;
  uint64_t v7 = self;
  swift_retain();
  sub_1007F7790();

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100574F94(v4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100574F94(v4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100574F94(v4);
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return [a3 isUserInteractionEnabled];
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1005750DC(v4);
}

- (void)hoveringChevron:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100576F4C(v4);
}

- (void)updateChevronVisibilityForAccessibilityOnCell:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100577910(a3);
}

@end