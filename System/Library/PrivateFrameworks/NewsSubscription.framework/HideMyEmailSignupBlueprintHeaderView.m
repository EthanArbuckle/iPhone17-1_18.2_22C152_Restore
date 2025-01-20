@interface HideMyEmailSignupBlueprintHeaderView
- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation HideMyEmailSignupBlueprintHeaderView

- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView *)sub_1BFA702EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFA7060C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_publisherLogo));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_headline));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription36HideMyEmailSignupBlueprintHeaderView_subheadline);
}

@end