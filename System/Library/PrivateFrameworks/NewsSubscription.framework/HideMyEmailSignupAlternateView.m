@interface HideMyEmailSignupAlternateView
- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithCoder:(id)a3;
- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithFrame:(CGRect)a3;
@end

@implementation HideMyEmailSignupAlternateView

- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithFrame:(CGRect)a3
{
  return (_TtC16NewsSubscription30HideMyEmailSignupAlternateView *)sub_1BFB3FC00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16NewsSubscription30HideMyEmailSignupAlternateView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1838]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC16NewsSubscription30HideMyEmailSignupAlternateView *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_email));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16NewsSubscription30HideMyEmailSignupAlternateView_checkmark);
}

@end