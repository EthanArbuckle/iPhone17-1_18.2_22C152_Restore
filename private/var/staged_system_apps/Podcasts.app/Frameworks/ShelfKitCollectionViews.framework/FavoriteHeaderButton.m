@interface FavoriteHeaderButton
- (NSString)accessibilityIdentifier;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC23ShelfKitCollectionViews20FavoriteHeaderButton)initWithCoder:(id)a3;
- (void)primaryActionTriggered;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation FavoriteHeaderButton

- (_TtC23ShelfKitCollectionViews20FavoriteHeaderButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_7335C();
}

- (void)primaryActionTriggered
{
  v2 = self;
  sub_71C94();
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_729CC((uint64_t)a3);
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
  id v5 = (objc_class *)[v3 mainBundle];
  v9._countAndFlagsBits = 0xE000000000000000;
  v11._object = (void *)0x80000000003AA020;
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
  NSString v2 = self;
  sub_72CBC();
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
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20FavoriteHeaderButton_userDefaults));
  swift_release();

  swift_release();
}

@end