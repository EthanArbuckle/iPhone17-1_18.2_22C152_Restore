@interface PXPeopleMergeActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)systemImageNameForPerson:(id)a3;
- (PXPeopleMergeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation PXPeopleMergeActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_fetchedObjects);
  if (v4)
  {
    sub_1A9CD5C68();
    unint64_t v5 = sub_1AB23AADC();

    if (v5 >> 62) {
      _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
    }
    if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) > 1)
    {
      type metadata accessor for PeopleMergeUtilities();
      sub_1A9D5A56C(v5);
    }

    swift_bridgeObjectRelease();
    LOBYTE(v4) = 0;
  }
  else
  {
  }
  return v4 & 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3 = a3;
  id result = objc_msgSend(v3, sel_photoLibrary);
  if (result)
  {
    id v5 = result;
    id v6 = objc_msgSend(result, sel_px_peoplePetsHomeVisibility);

    v7 = (void *)sub_1AB23A72C();
    id v8 = PXLocalizedStringForPersonOrPetAndVisibility(0, (uint64_t)v6, v7);

    sub_1AB23A76C();
    v9 = (void *)sub_1AB23A72C();
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)systemImageNameForPerson:(id)a3
{
  id v3 = (void *)sub_1AB23A72C();
  return v3;
}

- (void)performUserInteractionTask
{
  v2 = self;
  PeopleMergeActionPerformer.performUserInteractionTask()();
}

- (PXPeopleMergeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1AB23A76C();
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(PXAssetCollectionActionPerformer *)&v14 initWithActionType:v11 assetCollectionReference:v9 displayTitleInfo:v10];

  return v12;
}

@end