@interface TipKitManager
+ (uint64_t)setupTips;
- (_TtC10VoiceMemos13TipKitManager)init;
@end

@implementation TipKitManager

+ (uint64_t)setupTips
{
  uint64_t v0 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028654(&qword_10026A440);
  type metadata accessor for Tips.ConfigurationOption();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1001F1BD0;
  static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
  static Tips.ConfigurationOption.datastoreLocation(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  static Tips.configure(_:)();
  return swift_bridgeObjectRelease();
}

- (_TtC10VoiceMemos13TipKitManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TipKitManager();
  return [(TipKitManager *)&v3 init];
}

@end