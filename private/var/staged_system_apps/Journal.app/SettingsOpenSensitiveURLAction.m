@interface SettingsOpenSensitiveURLAction
- (_TtC7Journal30SettingsOpenSensitiveURLAction)init;
- (void)callAsFunction:(id)a3;
@end

@implementation SettingsOpenSensitiveURLAction

- (void)callAsFunction:(id)a3
{
  uint64_t v5 = sub_100010218((uint64_t *)&unk_100800A60);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_10066801C((uint64_t)v7, 0, 0, 0);

  sub_10001457C((uint64_t)v7, (uint64_t *)&unk_100800A60);
}

- (_TtC7Journal30SettingsOpenSensitiveURLAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SettingsOpenSensitiveURLAction();
  return [(SettingsOpenSensitiveURLAction *)&v3 init];
}

@end