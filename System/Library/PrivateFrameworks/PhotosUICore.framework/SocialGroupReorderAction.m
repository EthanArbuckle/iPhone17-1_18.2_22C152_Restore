@interface SocialGroupReorderAction
- (NSString)actionIdentifier;
- (NSString)localizedActionName;
- (_TtC12PhotosUICore24SocialGroupReorderAction)initWithPhotoLibrary:(id)a3;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation SocialGroupReorderAction

- (NSString)actionIdentifier
{
  v2 = self;
  sub_1AA630930();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
}

- (NSString)localizedActionName
{
  return (NSString *)0;
}

- (void)performAction:(id)a3
{
}

- (void)performUndo:(id)a3
{
}

- (_TtC12PhotosUICore24SocialGroupReorderAction)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  result = (_TtC12PhotosUICore24SocialGroupReorderAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore24SocialGroupReorderAction_sourceGroup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore24SocialGroupReorderAction_destinationGroups));
  swift_bridgeObjectRelease();
}

@end