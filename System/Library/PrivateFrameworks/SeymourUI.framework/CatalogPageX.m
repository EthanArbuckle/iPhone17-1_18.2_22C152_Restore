@interface CatalogPageX
- (_TtC9SeymourUI12CatalogPageX)init;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
@end

@implementation CatalogPageX

- (_TtC9SeymourUI12CatalogPageX)init
{
  result = (_TtC9SeymourUI12CatalogPageX *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_dataSource);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_23A7F6B08();
  uint64_t v6 = sub_23A7FFC78();
  id v7 = a3;
  v8 = self;
  sub_23A2F4290(v6);

  swift_bridgeObjectRelease();
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  if (!MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_delegate, a2)) {
    return;
  }
  if (a5 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if ((*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_shelves))[2] <= (unint64_t)a5)
  {
LABEL_9:
    __break(1u);
    return;
  }
  id v9 = a3;
  swift_unknownObjectRetain();
  v10 = self;
  swift_unknownObjectRetain();
  sub_23A2E33F8(a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

@end