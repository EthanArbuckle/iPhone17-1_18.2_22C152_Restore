@interface CatalogPage
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (UICollectionView)accessibilityCollectionView;
- (_TtC9SeymourUI11CatalogPage)init;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)rebuildLocations;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation CatalogPage

- (UICollectionView)accessibilityCollectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView));
}

- (_TtC9SeymourUI11CatalogPage)init
{
  result = (_TtC9SeymourUI11CatalogPage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_locationStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9SeymourUI11CatalogPage_mostRecentlyPresentedOverlayDisplayingCell);
}

- (void)rebuildLocations
{
  v2 = self;
  sub_23A7797F8();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  CatalogPage.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v26 = self;
  uint64_t v7 = sub_23A7F6B08();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v13 = (char *)&v25 - v12;
  MEMORY[0x270FA5388](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x270FA5388](v17);
  v19 = (char *)&v25 - v18;
  sub_23A7F6AA8();
  sub_23A7F6AA8();
  sub_23A7F6AA8();
  id v20 = a3;
  v21 = v26;
  CatalogPage.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)(v20, (uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_23A7F6A78();
  v22(v19, v7);

  return v23;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_23A7F6B08();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_23A47E584(a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CatalogPage.scrollViewDidChangeAdjustedContentInset(_:)(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CatalogPage.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    uint64_t v11 = *(void (**)(double, double))(v10 + 144);
    id v12 = a3;
    id v13 = self;
    v11(x, y);

    swift_unknownObjectRelease();
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    swift_getObjectType();
    uint64_t v10 = *(double (**)(double, double))(v9 + 152);
    id v11 = a3;
    id v12 = self;
    double x = v10(x, y);
    double y = v13;

    swift_unknownObjectRelease();
  }
  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v14 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  sub_23A47CF08(v14, v9);
  id v11 = (char *)v10 + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x23ECB8640]((char *)v10 + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate))
  {
    uint64_t v12 = *((void *)v11 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC9SeymourUI11CatalogPage *, id, id, uint64_t, uint64_t))(v12 + 208))(v10, v14, v9, ObjectType, v12);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  sub_23A7F6B08();
  uint64_t v7 = sub_23A7FFC78();
  id v8 = a3;
  id v9 = self;
  uint64_t v10 = (void *)_s9SeymourUI11CatalogPageC14collectionView_34contextMenuConfigurationForItemsAt5pointSo09UIContexthI0CSgSo012UICollectionF0C_Say10Foundation9IndexPathVGSo7CGPointVtF_0(v8, v7);

  swift_bridgeObjectRelease();

  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    swift_getObjectType();
    uint64_t v10 = *(void (**)(void))(v9 + 328);
    id v11 = a3;
    id v12 = a4;
    swift_unknownObjectRetain();
    double v13 = self;
    v10();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0F400);
  __n128 v6 = MEMORY[0x270FA5388](v5 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, v6))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    id v11 = *(void (**)(void))(v10 + 200);
    id v12 = a3;
    double v13 = self;
    v11();

    swift_unknownObjectRelease();
    uint64_t v14 = sub_23A7F6B08();
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
    {
      uint64_t v16 = (void *)sub_23A7F6A78();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
    }
  }
  else
  {
    uint64_t v17 = sub_23A7F6B08();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v8, 1, 1, v17);
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_23A7F6B08();
  uint64_t v6 = sub_23A7FFC78();
  uint64_t v7 = self;
  id v8 = a3;
  sub_23A78415C(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

@end