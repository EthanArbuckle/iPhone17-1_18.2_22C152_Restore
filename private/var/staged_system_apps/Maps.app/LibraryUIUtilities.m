@interface LibraryUIUtilities
+ (BOOL)isMyPlacesEnabled;
+ (double)NavBarChromeHeaderTopYOffset;
+ (id)addBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (id)capsuleBarButtonItemWithTitle:(id)a3 systemImageName:(id)a4 target:(id)a5 action:(SEL)a6;
+ (id)closeButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (id)createPlacedCardSavedButtonConfig;
+ (id)editBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (id)iOSNavbarTitleButtonItemWithTitle:(id)a3;
+ (id)threeDotsBarButtonItemWithMenuProvider:(id)a3;
+ (void)setIsMyPlacesEnabled:(BOOL)a3;
- (_TtC4Maps18LibraryUIUtilities)init;
@end

@implementation LibraryUIUtilities

+ (BOOL)isMyPlacesEnabled
{
  if (qword_1015CBDD8 != -1) {
    swift_once();
  }
  return byte_1016118B0;
}

+ (void)setIsMyPlacesEnabled:(BOOL)a3
{
  if (qword_1015CBDD8 != -1) {
    swift_once();
  }
  byte_1016118B0 = a3;
}

+ (double)NavBarChromeHeaderTopYOffset
{
  return 4.0;
}

+ (id)addBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_100255050((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_10025541C);
}

+ (id)capsuleBarButtonItemWithTitle:(id)a3 systemImageName:(id)a4 target:(id)a5 action:(SEL)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  swift_unknownObjectRetain();
  id v14 = sub_100255724(v8, v10, v11, v13, (uint64_t)a5, (uint64_t)a6);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)editBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_100255050((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_100255970);
}

+ (id)threeDotsBarButtonItemWithMenuProvider:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  id v5 = sub_100255C3C((uint64_t)sub_100256430, v4);
  swift_release();

  return v5;
}

+ (id)closeButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return sub_100255050((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_100255FE4);
}

+ (id)iOSNavbarTitleButtonItemWithTitle:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v3 = sub_1002562EC();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)createPlacedCardSavedButtonConfig
{
  v2 = (objc_class *)type metadata accessor for InfoCardButtonConfiguration();
  id v3 = objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_type] = 6;
  v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_shouldBlur] = 0;
  *(void *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_tintColor] = 0;
  *(void *)&v3[OBJC_IVAR____TtC4Maps27InfoCardButtonConfiguration_visibility] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super init];

  return v4;
}

- (_TtC4Maps18LibraryUIUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LibraryUIUtilities();
  return [(LibraryUIUtilities *)&v3 init];
}

@end