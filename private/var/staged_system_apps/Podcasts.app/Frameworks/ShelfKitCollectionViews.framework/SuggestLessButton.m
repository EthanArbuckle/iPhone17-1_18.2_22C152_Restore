@interface SuggestLessButton
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC23ShelfKitCollectionViews17SuggestLessButton)initWithCoder:(id)a3;
- (void)primaryActionTriggered;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation SuggestLessButton

- (_TtC23ShelfKitCollectionViews17SuggestLessButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_385780(27);
  swift_bridgeObjectRelease();
  result = (_TtC23ShelfKitCollectionViews17SuggestLessButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  v2 = self;
  sub_1DC020();
}

- (NSString)accessibilityIdentifier
{
  NSString v2 = sub_384380();

  return (NSString *)v2;
}

- (void)setAccessibilityIdentifier:(id)a3
{
}

- (NSString)accessibilityLabel
{
  id v3 = self;
  v4 = self;
  v5 = (objc_class *)[v3 mainBundle];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11._object = (void *)0x80000000003B1B50;
  v11._countAndFlagsBits = 0xD000000000000020;
  v12.value._countAndFlagsBits = 0;
  v12.value._object = 0;
  v6.super.isa = v5;
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  sub_37AE80(v11, v12, v6, v13, v9);

  NSString v7 = sub_384380();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  NSString v2 = self;
  sub_1DCE48();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end