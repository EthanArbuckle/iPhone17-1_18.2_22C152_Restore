@interface WelcomeView.TitleGroup
- (CGRect)accessibilityFrame;
- (NSString)accessibilityLabel;
- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithCoder:(id)a3;
- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithFrame:(CGRect)a3;
@end

@implementation WelcomeView.TitleGroup

- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithFrame:(CGRect)a3
{
  return (_TtCC8StocksUI11WelcomeView10TitleGroup *)sub_20A66FD0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC8StocksUI11WelcomeView10TitleGroup)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_appIcon;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtCC8StocksUI11WelcomeView10TitleGroup *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (CGRect)accessibilityFrame
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel), sel_accessibilityFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)accessibilityLabel
{
  double v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel);
  double v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    double v5 = v4;
    sub_20A8CE280();

    id v6 = (void *)sub_20A8CE240();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCC8StocksUI11WelcomeView10TitleGroup_welcomeLabel);
}

@end