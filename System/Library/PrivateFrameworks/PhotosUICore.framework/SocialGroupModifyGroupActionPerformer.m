@interface SocialGroupModifyGroupActionPerformer
- (_TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation SocialGroupModifyGroupActionPerformer

- (void)performBackgroundTask
{
  v2 = self;
  sub_1A9D6CC2C();
}

- (_TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7 = sub_1AB23A76C();
  return (_TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer *)sub_1A9D6D198(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  sub_1A9D6D380((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer_mutationActionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37SocialGroupModifyGroupActionPerformer_newKeyAsset));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end