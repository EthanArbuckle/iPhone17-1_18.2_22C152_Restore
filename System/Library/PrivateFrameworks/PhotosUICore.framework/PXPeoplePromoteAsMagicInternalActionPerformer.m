@interface PXPeoplePromoteAsMagicInternalActionPerformer
+ (BOOL)canPerformOn:(id)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForPerson:(id)a3;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)systemImageNameForPerson:(id)a3;
- (PXPeoplePromoteAsMagicInternalActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXPeoplePromoteAsMagicInternalActionPerformer

+ (BOOL)canPerformOn:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = sub_1AA1A15C4(v3);

  return v4 & 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  id v3 = (void *)sub_1AB23A72C();
  return v3;
}

+ (id)systemImageNameForPerson:(id)a3
{
  id v3 = (void *)sub_1AB23A72C();
  return v3;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  v5 = (void *)swift_unknownObjectRetain();
  unsigned __int8 v6 = sub_1AA1A17C8(v5);

  swift_unknownObjectRelease();
  return v6 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = (void *)sub_1AB23A72C();
  return v5;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = (void *)sub_1AB23A72C();
  return v4;
}

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA1A0EF4();
}

- (PXPeoplePromoteAsMagicInternalActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
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