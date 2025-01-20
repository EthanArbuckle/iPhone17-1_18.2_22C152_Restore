@interface VUIBarItemSelectionManager
+ (id)lastSelectedIdentifier;
+ (void)updateLastSelectedIdentifier:(id)a3 tabItemInfo:(id)a4;
- (_TtC8VideosUI26VUIBarItemSelectionManager)init;
@end

@implementation VUIBarItemSelectionManager

+ (void)updateLastSelectedIdentifier:(id)a3 tabItemInfo:(id)a4
{
  uint64_t v4 = sub_1E387C928();
  unint64_t v6 = v5;
  uint64_t v7 = sub_1E387C678();
  static VUIBarItemSelectionManager.updateLastSelectedIdentifier(_:tabItemInfo:)(v4, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)lastSelectedIdentifier
{
  static VUIBarItemSelectionManager.lastSelectedIdentifier()();
  if (v2)
  {
    v3 = (void *)sub_1E387C8E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (_TtC8VideosUI26VUIBarItemSelectionManager)init
{
  return (_TtC8VideosUI26VUIBarItemSelectionManager *)VUIBarItemSelectionManager.init()();
}

@end