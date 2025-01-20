@interface HideMyEmailSignupBlueprintFooterView
- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView)initWithFrame:(CGRect)a3;
@end

@implementation HideMyEmailSignupBlueprintFooterView

- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView *)sub_1BFBB5980(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button;
  id v6 = objc_allocWithZone((Class)sub_1BFBD2FE8());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel;
  type metadata accessor for UnselectableLinkEnabledTextView();
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_button));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintFooterView_privacyLabel);
}

@end