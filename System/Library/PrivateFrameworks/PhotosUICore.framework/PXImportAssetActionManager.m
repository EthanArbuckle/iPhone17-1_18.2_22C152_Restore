@interface PXImportAssetActionManager
- (BOOL)canPerformActionType:(id)a3;
- (PXImportAssetActionManager)initWithImportItem:(id)a3 importController:(id)a4;
- (PXImportAssetActionManager)initWithSelectionManager:(id)a3;
- (id)actionPerformerForActionType:(id)a3;
@end

@implementation PXImportAssetActionManager

- (PXImportAssetActionManager)initWithImportItem:(id)a3 importController:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importItem) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importController) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ImportAssetActionManager();
  id v6 = a3;
  id v7 = a4;
  return [(PXAssetActionManager *)&v9 initWithSelectionManager:0];
}

- (BOOL)canPerformActionType:(id)a3
{
  uint64_t v4 = sub_1AB23A76C();
  uint64_t v6 = v5;
  if (v4 == sub_1AB23A76C() && v6 == v7)
  {
    v11 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_1AB23C5AC();
    v10 = self;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
  }
  id v12 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importItem), sel_importAsset);

  swift_bridgeObjectRelease();
  if (v12)
  {

    return 1;
  }
  return 0;
}

- (id)actionPerformerForActionType:(id)a3
{
  uint64_t v4 = sub_1AB23A76C();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_1A9FEAA98(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (PXImportAssetActionManager)initWithSelectionManager:(id)a3
{
  id v3 = a3;
  result = (PXImportAssetActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXImportAssetActionManager_importController);
}

@end