@interface PXCreateSocialGroupAction
- (NSString)actionIdentifier;
- (NSString)localizedActionName;
- (PXCreateSocialGroupAction)initWithPeople:(id)a3 customTitle:(id)a4 creationCompletionBlock:(id)a5;
- (PXCreateSocialGroupAction)initWithPhotoLibrary:(id)a3;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXCreateSocialGroupAction

- (NSString)actionIdentifier
{
  v2 = self;
  sub_1AA63090C();
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

- (PXCreateSocialGroupAction)initWithPeople:(id)a3 customTitle:(id)a4 creationCompletionBlock:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  v8 = v7;
  if (!a4)
  {
    uint64_t v10 = 0;
    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    return (PXCreateSocialGroupAction *)sub_1AA24DED4(a3, (uint64_t)a4, v10, (uint64_t)v8, v11);
  }
  a4 = (id)sub_1AB23A76C();
  uint64_t v10 = v9;
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v8;
  v8 = sub_1AA24EFF8;
  return (PXCreateSocialGroupAction *)sub_1AA24DED4(a3, (uint64_t)a4, v10, (uint64_t)v8, v11);
}

- (void)performAction:(id)a3
{
}

- (void)performUndo:(id)a3
{
}

- (PXCreateSocialGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  result = (PXCreateSocialGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXCreateSocialGroupAction_creationCompletionBlock);
  sub_1A9BB8934(v3);
}

@end