@interface BookmarkNavButton
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC23ShelfKitCollectionViews17BookmarkNavButton)initWithCoder:(id)a3;
- (void)primaryActionTriggered;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation BookmarkNavButton

- (_TtC23ShelfKitCollectionViews17BookmarkNavButton)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_37BC80();
  sub_37BBF0();

  result = (_TtC23ShelfKitCollectionViews17BookmarkNavButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)primaryActionTriggered
{
  v2 = self;
  sub_382600();
}

- (NSString)accessibilityLabel
{
  v3 = self;
  id v4 = self;
  v5 = (objc_class *)[v3 mainBundle];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11._object = (void *)0x80000000003B6B20;
  v11._countAndFlagsBits = 0xD00000000000001CLL;
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
  v2 = self;
  sub_2C4950();
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
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17BookmarkNavButton_bookmarkGlyph;
  uint64_t v4 = sub_37BDE0();
  NSString v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17BookmarkNavButton_bookmarkedGlyph, v4);

  swift_release();
}

@end