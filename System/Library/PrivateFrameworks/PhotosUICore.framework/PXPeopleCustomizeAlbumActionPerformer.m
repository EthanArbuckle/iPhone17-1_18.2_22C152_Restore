@interface PXPeopleCustomizeAlbumActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (PXPeopleCustomizeAlbumActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPeopleCustomizeAlbumActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  return objc_msgSend(a3, sel_count) == (id)1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3 = a3;
  sub_1A9BFFA08();

  v4 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)systemImageNameForPerson:(id)a3
{
  id v3 = (void *)sub_1AB23A72C();
  return v3;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (!a4) {
    return 0;
  }
  if (objc_msgSend(a4, sel_respondsToSelector_, sel_people))
  {
    id v5 = a3;
    id v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_people);
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
  v14 = (void *)sub_1AA62B850(v6, v8, v9, v11, v12, (uint64_t)a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA62B544();
}

- (PXPeopleCustomizeAlbumActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1AB23A76C();
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  uint64_t v12 = [(PXAssetCollectionActionPerformer *)&v14 initWithActionType:v11 assetCollectionReference:v9 displayTitleInfo:v10];

  return v12;
}

@end