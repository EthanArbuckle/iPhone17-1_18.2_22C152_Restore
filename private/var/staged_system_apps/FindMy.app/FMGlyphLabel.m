@interface FMGlyphLabel
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC6FindMy12FMGlyphLabel)initWithCoder:(id)a3;
- (_TtC6FindMy12FMGlyphLabel)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation FMGlyphLabel

- (_TtC6FindMy12FMGlyphLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy12FMGlyphLabel_iconView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UIImageView) init];

  result = (_TtC6FindMy12FMGlyphLabel *)_assertionFailure(_:_:file:line:flags:)();
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

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel);
  v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    uint64_t v5 = v4;
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

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMGlyphLabel();
  v2 = (char *)v5.receiver;
  [(FMGlyphLabel *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy12FMGlyphLabel_titleLabel];
  [v2 frame];
  [v3 setPreferredMaxLayoutWidth:v4 * 0.8];
}

- (_TtC6FindMy12FMGlyphLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy12FMGlyphLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMGlyphLabel_iconView);
}

@end