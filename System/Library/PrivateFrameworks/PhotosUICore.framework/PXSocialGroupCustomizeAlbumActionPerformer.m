@interface PXSocialGroupCustomizeAlbumActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (PXSocialGroupCustomizeAlbumActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXSocialGroupCustomizeAlbumActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (!a4) {
    return 0;
  }
  if (objc_msgSend(a4, sel_respondsToSelector_, sel_socialGroups))
  {
    id v5 = a3;
    id v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_socialGroups);
    if (v6)
    {
      v7 = v6;
      id v8 = objc_msgSend(v6, sel_count);

      swift_unknownObjectRelease();
      return v8 == (id)1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = a4;
  swift_unknownObjectRetain();
  sub_1A9BFFA08();

  swift_unknownObjectRelease();
  id v6 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v4 = (void *)sub_1AB23A72C();
  return v4;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  uint64_t v6 = sub_1AB23A76C();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1AB23A76C();
  uint64_t v11 = v10;
  if (a5)
  {
    uint64_t v12 = sub_1AB23A76C();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v14 = (void *)sub_1A9E51134(v6, v8, v9, v11, v12, (uint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (void)performUserInteractionTask
{
}

- (PXSocialGroupCustomizeAlbumActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7 = sub_1AB23A76C();
  return (PXSocialGroupCustomizeAlbumActionPerformer *)sub_1A9E50F30(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_photoLibrary));
  swift_bridgeObjectRelease();
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_creationCompletionBlock));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_addPeoplePerformer);
}

@end