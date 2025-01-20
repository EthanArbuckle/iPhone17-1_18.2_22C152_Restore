@interface ChannelCoinView
- (BOOL)accessibilityActivate;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7NewsUI215ChannelCoinView)initWithCoder:(id)a3;
- (_TtC7NewsUI215ChannelCoinView)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)setAccessibilityTraits:(unint64_t)a3;
@end

@implementation ChannelCoinView

- (_TtC7NewsUI215ChannelCoinView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI215ChannelCoinView *)sub_1DFBD5744(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI215ChannelCoinView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DFBD63CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI215ChannelCoinView_secondaryNameLabel));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI215ChannelCoinView_token);
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1DFBD5F7C(self, (uint64_t)a2, (void (*)(void))sub_1DFBD55EC);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1DFBD5F7C(self, (uint64_t)a2, (void (*)(void))sub_1DFBD5D38);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1DFBD5F7C(self, (uint64_t)a2, (void (*)(void))sub_1DFBD5FFC);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v2 = v7.receiver;
  unint64_t v3 = [(ChannelCoinView *)&v7 accessibilityTraits];
  uint64_t v4 = *MEMORY[0x1E4FB2540];

  if ((v4 & ~v3) != 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ChannelCoinView *)&v4 setAccessibilityTraits:a3];
}

@end