@interface PhotoKitClearRecentCollectionAssetsActionPerformer
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6;
+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3;
+ (BOOL)canPerformOnSubsetOfSelection;
+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4;
+ (id)systemImageNameForActionManager:(id)a3;
- (_TtC12PhotosUICore50PhotoKitClearRecentCollectionAssetsActionPerformer)initWithActionType:(id)a3;
- (void)performBackgroundTask;
- (void)performUserInteractionTask;
@end

@implementation PhotoKitClearRecentCollectionAssetsActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  swift_getObjCClassMetadata();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  LOBYTE(a4) = _s12PhotosUICore50PhotoKitClearRecentCollectionAssetsActionPerformerC10canPerform4with6person11socialGroupSbSo19PXSelectionSnapshotC_So8PHPersonCSgSo08PHSocialP0CSgtFZ_0(v8);

  return a4 & 1;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v10 = *(uint64_t (**)(id))(swift_getObjCClassMetadata() + 112);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  LOBYTE(a5) = v10(v12);

  return a5 & 1;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  if (a3)
  {
    v3 = *(uint64_t (**)(uint64_t))(swift_getObjCClassMetadata() + 112);
    uint64_t v4 = swift_unknownObjectRetain();
    char v5 = v3(v4);
    swift_unknownObjectRelease();
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  if (a4)
  {
    id v5 = objc_msgSend(a4, sel_effectiveSelectionSnapshot);
    id v6 = objc_msgSend(v5, sel_isAnyItemSelected);
  }
  else
  {
    id v6 = 0;
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  (*(void (**)(id))(ObjCClassMetadata + 128))(v6);

  id v8 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v8;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA6E7D30();
}

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA6E832C();
}

+ (id)systemImageNameForActionManager:(id)a3
{
  v3 = (void *)sub_1AB23A72C();
  return v3;
}

- (_TtC12PhotosUICore50PhotoKitClearRecentCollectionAssetsActionPerformer)initWithActionType:(id)a3
{
  sub_1AB23A76C();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore50PhotoKitClearRecentCollectionAssetsActionPerformer_assetsToProcess) = 0;
  uint64_t v4 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PhotoKitClearRecentCollectionAssetsActionPerformer();
  id v5 = [(PXActionPerformer *)&v7 initWithActionType:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end