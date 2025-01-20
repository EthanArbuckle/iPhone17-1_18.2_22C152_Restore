@interface HideMyEmailSignupChoiceView
- (_TtC16NewsSubscription27HideMyEmailSignupChoiceView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription27HideMyEmailSignupChoiceView)initWithFrame:(CGRect)a3;
@end

@implementation HideMyEmailSignupChoiceView

- (_TtC16NewsSubscription27HideMyEmailSignupChoiceView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription27HideMyEmailSignupChoiceView *)sub_1BFB96C00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription27HideMyEmailSignupChoiceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BFB96F88();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_choiceLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_addressPreviewLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription27HideMyEmailSignupChoiceView_checkbox);
}

@end