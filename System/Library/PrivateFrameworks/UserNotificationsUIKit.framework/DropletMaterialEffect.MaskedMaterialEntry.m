@interface DropletMaterialEffect.MaskedMaterialEntry
- (_TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF19MaskedMaterialEntry)init;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)removeEffectFromView:(id)a3;
@end

@implementation DropletMaterialEffect.MaskedMaterialEntry

- (void)addEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D7D4BC68(v4);
}

- (void)removeEffectFromView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D7D4C410(v4);
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D7D4C514();
}

- (void)applyRequestedEffectToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D7D4C690();
}

- (_TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF19MaskedMaterialEntry)init
{
  result = (_TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF19MaskedMaterialEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF19MaskedMaterialEntry_contentProxy));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC22UserNotificationsUIKit21DropletMaterialEffectP33_14CD243C8142B7E189D98278765B16FF19MaskedMaterialEntry__maskedMaterialView);
}

@end