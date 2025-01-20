@interface WelcomeView.TitleGroup
- (NSString)accessibilityLabel;
- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithCoder:(id)a3;
- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithFrame:(CGRect)a3;
@end

@implementation WelcomeView.TitleGroup

- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithFrame:(CGRect)a3
{
  sub_1DEC08FA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC7NewsUI211WelcomeView10TitleGroup)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEC09EE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7NewsUI211WelcomeView10TitleGroup_welcomeTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7NewsUI211WelcomeView10TitleGroup_welcomeSubTitleLabel);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1DEC09C5C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

@end