@interface SocialGroupRejectGroupAction
- (NSString)actionIdentifier;
- (NSString)localizedActionName;
- (_TtC12PhotosUICore28SocialGroupRejectGroupAction)initWithPhotoLibrary:(id)a3;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation SocialGroupRejectGroupAction

- (NSString)actionIdentifier
{
  v2 = self;
  sub_1AA630924();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (NSString)localizedActionName
{
  v2 = self;
  sub_1A9BFFA08();

  v3 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)performAction:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1A9F4A928((uint64_t)sub_1A9F4ADE0, v5, (uint64_t)sub_1A9F4A864, (uint64_t)&block_descriptor_69, (uint64_t)&block_descriptor_3_1);

  swift_release();
}

- (void)performUndo:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1A9F4A928((uint64_t)sub_1A9D5E1DC, v5, (uint64_t)sub_1A9F4AA70, (uint64_t)&block_descriptor_7, (uint64_t)&block_descriptor_10_0);

  swift_release();
}

- (_TtC12PhotosUICore28SocialGroupRejectGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  result = (_TtC12PhotosUICore28SocialGroupRejectGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore28SocialGroupRejectGroupAction_socialGroup));
}

@end