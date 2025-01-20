@interface ShelvesDelegate
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC23ShelfKitCollectionViews15ShelvesDelegate)init;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ShelvesDelegate

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = ShelvesDelegate.collectionView(_:shouldSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
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
  LOBYTE(self) = ShelvesDelegate.collectionView(_:shouldSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
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
  ShelvesDelegate.collectionView(_:didSelectItemAt:)(v10, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_37B160();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_11DCE0(v14, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_37B160();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  uint64_t v12 = (void (**)(char *, uint64_t))a3;
  id v13 = a4;
  id v14 = self;
  ShelvesDelegate.collectionView(_:willDisplay:forItemAt:)(v12, v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_37B160();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  sub_11EB9C(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  uint64_t v11 = self;
  sub_11F38C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = sub_37B160();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v13 = a3;
  id v14 = self;
  uint64_t v15 = (void *)ShelvesDelegate.collectionView(_:contextMenuConfigurationForItemAt:point:)(v13, (uint64_t)v12, x, y);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  return v15;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  return sub_11931C(self, (uint64_t)a2, a3, a4);
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  return sub_11931C(self, (uint64_t)a2, a3, a4);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_episodeController), *(void *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_episodeController + 8]);
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_382B60();

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_37B160();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v24 - v12;
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v24 - v15;
  sub_37B0E0();
  sub_37B0E0();
  id v17 = a3;
  v18 = self;
  uint64_t v19 = sub_37B130();
  if (v19 == sub_37B130()) {
    v20 = v10;
  }
  else {
    v20 = v13;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v16, v20, v7);

  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v10, v7);
  v21(v13, v7);
  v22.super.isa = sub_37B0D0().super.isa;
  v21(v16, v7);

  return v22.super.isa;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewDidScroll(_:)((UIScrollView)v4);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewWillBeginDecelerating(_:)((UIScrollView)v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  ShelvesDelegate.scrollViewDidEndDecelerating(_:)((UIScrollView)v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  ShelvesDelegate.scrollViewDidEndDragging(_:willDecelerate:)((UIScrollView)v6, a4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  uint64_t v10 = self;
  ShelvesDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)((uint64_t)v9, (uint64_t)a5, x, y);
}

- (_TtC23ShelfKitCollectionViews15ShelvesDelegate)init
{
  result = (_TtC23ShelfKitCollectionViews15ShelvesDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_presenter, (uint64_t *)&unk_4763C0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_episodeController);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_overflowTransitioningDelegate));
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter];
  uint64_t v4 = *(void *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 16];
  uint64_t v5 = *(void *)&self->presenter[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 32];
  uint64_t v6 = *(void *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter + 8];
  sub_27760(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_converter));
  sub_27760(v3);
  sub_27760(v4);
  sub_27760(v5);
  sub_27760(v6);
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15ShelvesDelegate_currentContextMenuIndexPath, (uint64_t *)&unk_4726A0);
}

@end