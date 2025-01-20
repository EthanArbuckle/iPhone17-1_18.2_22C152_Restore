@interface SFInlinePopUpButton
- (SFInlinePopUpButton)initWithCoder:(id)a3;
- (SFInlinePopUpButton)initWithFrame:(CGRect)a3;
- (void)updateValueText;
@end

@implementation SFInlinePopUpButton

- (SFInlinePopUpButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SFInlinePopUpButton_valueText);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SFInlinePopUpButton_referenceFont) = 0;
  id v5 = a3;

  result = (SFInlinePopUpButton *)sub_18C6FA758();
  __break(1u);
  return result;
}

- (void)updateValueText
{
  v2 = self;
  sub_18C58D0E8();
}

- (SFInlinePopUpButton)initWithFrame:(CGRect)a3
{
  result = (SFInlinePopUpButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___SFInlinePopUpButton_referenceFont);
}

@end