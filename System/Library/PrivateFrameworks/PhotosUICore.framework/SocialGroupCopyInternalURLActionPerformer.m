@interface SocialGroupCopyInternalURLActionPerformer
- (_TtC12PhotosUICore41SocialGroupCopyInternalURLActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation SocialGroupCopyInternalURLActionPerformer

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA25A6B8();
}

- (_TtC12PhotosUICore41SocialGroupCopyInternalURLActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
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