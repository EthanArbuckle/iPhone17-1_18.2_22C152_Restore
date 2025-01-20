@interface PXSharedAlbumsActivityEntryItemList
- (PXSharedAlbumsActivityEntryItemList)init;
- (PXSharedAlbumsActivityEntryItemList)initWithActivities:(id)a3;
- (id)itemAtIndex:(int64_t)a3;
- (int64_t)count;
@end

@implementation PXSharedAlbumsActivityEntryItemList

- (void).cxx_destruct
{
}

- (PXSharedAlbumsActivityEntryItemList)initWithActivities:(id)a3
{
}

- (id)itemAtIndex:(int64_t)a3
{
  uint64_t v4 = *(void *)((char *)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_items);
  if ((v4 & 0xC000000000000001) != 0)
  {
    id v6 = self;
    id v5 = (id)MEMORY[0x1AD107B60](a3, v4);

    goto LABEL_5;
  }
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a3)
  {
LABEL_10:
    __break(1u);
    return self;
  }
  id v5 = *(id *)(v4 + 8 * a3 + 32);
LABEL_5:
  return v5;
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_numberOfItems);
}

- (PXSharedAlbumsActivityEntryItemList)init
{
  result = (PXSharedAlbumsActivityEntryItemList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end