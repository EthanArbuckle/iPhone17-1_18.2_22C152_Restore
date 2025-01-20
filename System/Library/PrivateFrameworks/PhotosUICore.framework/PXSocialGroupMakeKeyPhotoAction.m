@interface PXSocialGroupMakeKeyPhotoAction
- (NSString)actionIdentifier;
- (NSString)localizedActionName;
- (PXSocialGroupMakeKeyPhotoAction)initWithPhotoLibrary:(id)a3;
- (PXSocialGroupMakeKeyPhotoAction)initWithSocialGroup:(id)a3 newKeyAsset:(id)a4;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXSocialGroupMakeKeyPhotoAction

- (NSString)actionIdentifier
{
  sub_1AB23A76C();
  v2 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)localizedActionName
{
  v2 = self;
  sub_1A9BFFA08();

  v3 = (void *)sub_1AB23A72C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PXSocialGroupMakeKeyPhotoAction)initWithSocialGroup:(id)a3 newKeyAsset:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_originalKeyAsset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_socialGroup) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_newKeyAsset) = (Class)a4;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  id v11 = v9;
  result = (PXSocialGroupMakeKeyPhotoAction *)objc_msgSend(v10, sel_photoLibrary);
  if (result)
  {
    v13 = result;
    v15.receiver = self;
    v15.super_class = ObjectType;
    v14 = [(PXPhotosAction *)&v15 initWithPhotoLibrary:result];

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)performAction:(id)a3
{
}

- (void)performUndo:(id)a3
{
}

- (PXSocialGroupMakeKeyPhotoAction)initWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  result = (PXSocialGroupMakeKeyPhotoAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_originalKeyAsset);
}

@end