@interface SocialGroupReorderGroupActionPerformer
- (_TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation SocialGroupReorderGroupActionPerformer

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA55C778();
}

- (_TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1AB23A76C();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_sourceGroup) = 0;
  v9 = (char *)self + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_destinationIndex;
  *(void *)v9 = 0;
  v9[8] = 1;
  id v10 = a4;
  id v11 = a5;
  v12 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = [(PXAssetCollectionActionPerformer *)&v15 initWithActionType:v12 assetCollectionReference:v10 displayTitleInfo:v11];

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38SocialGroupReorderGroupActionPerformer_sourceGroup));
}

@end