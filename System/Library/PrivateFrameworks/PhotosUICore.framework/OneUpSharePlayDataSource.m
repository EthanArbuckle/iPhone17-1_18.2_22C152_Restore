@interface OneUpSharePlayDataSource
- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3;
- (_TtC12PhotosUICore24OneUpSharePlayDataSource)init;
- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3;
- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3;
- (id)indexPathForDisplayAsset:(id)a3 hintIndexPath:(id)a4;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation OneUpSharePlayDataSource

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets), sel_count, a3);
}

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  id v3 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets), sel_objectAtIndexedSubscript_, a3->item);
  return v3;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  int64_t section = a3->section;
  int64_t item = a3->item;
  v6 = self;
  id v7 = OneUpSharePlayDataSource.object(at:)(dataSourceIdentifier, section, item);

  return v7;
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  int64_t section = a3->section;
  int64_t item = a3->item;
  subint64_t item = a3->subitem;
  id v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets);
  v8 = self;
  v11[0] = dataSourceIdentifier;
  v11[1] = section;
  v11[2] = item;
  v11[3] = subitem;
  id v9 = objc_msgSend(objc_allocWithZone((Class)off_1E5DA55E0), sel_initWithSectionObject_itemObject_subitemObject_indexPath_, 0, objc_msgSend(v7, sel_objectAtIndexedSubscript_, item), 0, v11);

  swift_unknownObjectRelease();
  return v9;
}

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  id v3 = (void *)swift_unknownObjectRetain();
  return v3;
}

- (id)indexPathForDisplayAsset:(id)a3 hintIndexPath:(id)a4
{
  sub_1AA7E39E0(0, (unint64_t *)&unk_1E981CA10, MEMORY[0x1E4F27DE8]);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v12);
  v14 = (char *)&v24 - v13;
  if (a4)
  {
    sub_1AB230B1C();
    uint64_t v15 = sub_1AB230B3C();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v10, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_1AB230B3C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
  }
  v17 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets);
  if (objc_msgSend(v17, sel_respondsToSelector_, sel_indexOfObject_))
  {
    swift_unknownObjectRetain();
    v18 = self;
    id v19 = objc_msgSend(v17, sel_indexOfObject_, a3);
    if (v19 == (id)sub_1AB22FC7C())
    {
      uint64_t v20 = sub_1AB230B3C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 1, 1, v20);
    }
    else
    {
      MEMORY[0x1AD0FC6D0](v19, 0);
      uint64_t v20 = sub_1AB230B3C();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 0, 1, v20);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v20 = sub_1AB230B3C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v14, 1, 1, v20);
  }
  sub_1AA7E3984((uint64_t)v10, (unint64_t *)&unk_1E981CA10, MEMORY[0x1E4F27DE8]);
  sub_1AB230B3C();
  uint64_t v21 = *(void *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v14, 1, v20) != 1)
  {
    v22 = (void *)sub_1AB230B0C();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v20);
  }
  return v22;
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = self;
  int64_t v8 = OneUpSharePlayDataSource.indexPath(for:)(v6);
  int64_t v10 = v9;
  int64_t v12 = v11;
  int64_t v14 = v13;

  retstr->int64_t dataSourceIdentifier = v8;
  retstr->int64_t section = v10;
  retstr->int64_t item = v12;
  retstr->subint64_t item = v14;
  return result;
}

- (_TtC12PhotosUICore24OneUpSharePlayDataSource)init
{
  result = (_TtC12PhotosUICore24OneUpSharePlayDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end