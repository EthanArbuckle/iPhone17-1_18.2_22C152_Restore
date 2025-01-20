@interface FMPlatterButton
- (BOOL)isAccessibilityElement;
- (_TtC6FindMy15FMPlatterButton)init;
- (_TtC6FindMy15FMPlatterButton)initWithCoder:(id)a3;
- (_TtC6FindMy15FMPlatterButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMPlatterButton

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMPlatterButton_topSeparator);
}

- (_TtC6FindMy15FMPlatterButton)init
{
  return (_TtC6FindMy15FMPlatterButton *)sub_10004F4BC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xE0);
  id v5 = a3;
  v6 = self;
  v4();
}

- (_TtC6FindMy15FMPlatterButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy15FMPlatterButton_alignment) = 3;
  uint64_t v5 = OBJC_IVAR____TtC6FindMy15FMPlatterButton_bottomSeparator;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy15FMPlatterButton_topSeparator;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIView) init];

  result = (_TtC6FindMy15FMPlatterButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (_TtC6FindMy15FMPlatterButton)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy15FMPlatterButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end