@interface FMAddButton
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC6FindMy11FMAddButton)initWithCoder:(id)a3;
- (_TtC6FindMy11FMAddButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMAddButton

- (_TtC6FindMy11FMAddButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10022F168();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy11FMAddButton_titleLabel);
  id v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10022EA28();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10022EC9C();
}

- (_TtC6FindMy11FMAddButton)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy11FMAddButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy11FMAddButton_iconViewLeadingConstraint);
}

@end