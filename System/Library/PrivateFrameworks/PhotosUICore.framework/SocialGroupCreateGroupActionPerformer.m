@interface SocialGroupCreateGroupActionPerformer
- (_TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performBackgroundTask;
@end

@implementation SocialGroupCreateGroupActionPerformer

- (void)performBackgroundTask
{
  v2 = self;
  sub_1AA7D5668();
}

- (_TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7 = sub_1AB23A76C();
  return (_TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer *)sub_1AA7D5A6C(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_photoLibrary));
  sub_1A9BB8934(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_creationCompletionBlock));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore37SocialGroupCreateGroupActionPerformer_mutationActionDelegate;
  sub_1A9D6D380((uint64_t)v3);
}

@end