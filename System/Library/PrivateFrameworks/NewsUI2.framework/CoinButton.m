@interface CoinButton
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7NewsUI210CoinButton)initWithCoder:(id)a3;
- (_TtC7NewsUI210CoinButton)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CoinButton

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC7NewsUI210CoinButton)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI210CoinButton *)sub_1DEC18170(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI210CoinButton)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC7NewsUI210CoinButton_linkedToggle) = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI210CoinButton_toggleState;
  uint64_t v6 = *MEMORY[0x1E4FABC70];
  uint64_t v7 = sub_1DFDF07E0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI210CoinButton_isBouncingEnabled) = 1;
  uint64_t v8 = OBJC_IVAR____TtC7NewsUI210CoinButton_onTap;
  sub_1DEC193E8();
  id v10 = objc_allocWithZone(v9);
  id v11 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v10, sel_init);

  result = (_TtC7NewsUI210CoinButton *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1DEC189A4(self, (uint64_t)a2, (void (*)(void))sub_1DEC184C4);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1DEC189A4(self, (uint64_t)a2, (void (*)(void))sub_1DEC1873C);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1DEC189A4(self, (uint64_t)a2, (void (*)(void))sub_1DEC18A24);
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI210CoinButton_linkedToggle);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI210CoinButton_toggleState;
  uint64_t v4 = sub_1DFDF07E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NewsUI210CoinButton_onTap);
}

@end