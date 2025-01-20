@interface PXSocialGroupRejectGroupActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)isActionDestructive;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4;
- (PXSocialGroupRejectGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation PXSocialGroupRejectGroupActionPerformer

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performBackgroundTask
{
  v2 = self;
  sub_1A9DC06EC();
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = a3;
  v5 = (void *)swift_unknownObjectRetain();
  unsigned __int8 v6 = sub_1A9DC0C54(v5);

  swift_unknownObjectRelease();
  return v6 & 1;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5 = a4;
  swift_unknownObjectRetain();
  sub_1A9BFFA08();

  swift_unknownObjectRelease();
  unsigned __int8 v6 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v4 = (void *)sub_1AB23A72C();
  return v4;
}

- (PXSocialGroupRejectGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
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