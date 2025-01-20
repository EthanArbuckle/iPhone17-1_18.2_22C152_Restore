@interface SocialGroupAddPeopleActionPerformer
- (_TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5;
- (void)performUserInteractionTask;
@end

@implementation SocialGroupAddPeopleActionPerformer

- (void)performUserInteractionTask
{
  v2 = self;
  sub_1AA20CC0C();
}

- (_TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7 = sub_1AB23A76C();
  return (_TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer *)sub_1AA20D778(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_photoLibrary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_peopleToAdd));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_error));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore35SocialGroupAddPeopleActionPerformer_mutationActionDelegate;
  sub_1A9D6D380((uint64_t)v3);
}

@end