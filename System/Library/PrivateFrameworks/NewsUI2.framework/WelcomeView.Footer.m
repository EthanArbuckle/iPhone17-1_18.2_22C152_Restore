@interface WelcomeView.Footer
- (_TtCC7NewsUI211WelcomeView6Footer)initWithCoder:(id)a3;
- (_TtCC7NewsUI211WelcomeView6Footer)initWithEffect:(id)a3;
@end

@implementation WelcomeView.Footer

- (_TtCC7NewsUI211WelcomeView6Footer)initWithEffect:(id)a3
{
  id v4 = a3;
  return (_TtCC7NewsUI211WelcomeView6Footer *)sub_1DEC09318(a3);
}

- (_TtCC7NewsUI211WelcomeView6Footer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEC09FDC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_offlineMessage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_privacyIcon));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtCC7NewsUI211WelcomeView6Footer_privacyLink);
}

@end