@interface ChannelTagView
- (BOOL)accessibilityActivate;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7NewsUI214ChannelTagView)initWithCoder:(id)a3;
- (_TtC7NewsUI214ChannelTagView)initWithFrame:(CGRect)a3;
@end

@implementation ChannelTagView

- (_TtC7NewsUI214ChannelTagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI214ChannelTagView *)sub_1DF47B6D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI214ChannelTagView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF47C454();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI214ChannelTagView_token);
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_1DF47BB38();

  return 1;
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI214ChannelTagView_nameLabel);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_1DFDFDD20();

    v6 = (void *)sub_1DFDFDCE0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1DF47C0C8(self, (uint64_t)a2, (void (*)(void))sub_1DF47BE84);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1DF47C0C8(self, (uint64_t)a2, (void (*)(void))sub_1DF47C148);
}

@end