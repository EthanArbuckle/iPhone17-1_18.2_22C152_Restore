@interface PXPeopleChangeTypeActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)systemImageNameForPerson:(id)a3;
+ (int64_t)changeTypeFor:(id)a3;
- (PXPeopleChangeTypeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXPeopleChangeTypeActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  return sub_1AA890340((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s12PhotosUICore31PeopleChangeTypeActionPerformerC14localizedTitle3forSSSgSo8PHPersonC_tFZ_0);
}

+ (id)systemImageNameForPerson:(id)a3
{
  return sub_1AA890340((uint64_t)a1, (uint64_t)a2, a3, (void (*)(void))_s12PhotosUICore31PeopleChangeTypeActionPerformerC15systemImageName3forSSSgSo8PHPersonC_tFZ_0);
}

- (void)performBackgroundTask
{
  v2 = self;
  PeopleChangeTypeActionPerformer.performBackgroundTask()();
}

+ (int64_t)changeTypeFor:(id)a3
{
  id v3 = a3;
  int64_t v4 = _s12PhotosUICore31PeopleChangeTypeActionPerformerC06changeE03forSo08PHPersonE0VSo13PHFetchResultCySo0J0CG_tFZ_0(v3);

  return v4;
}

- (PXPeopleChangeTypeActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
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