@interface CRLURLLauncher
+ (BOOL)canOpenURL:(id)a3;
+ (void)openURL:(id)a3;
- (_TtC8Freeform14CRLURLLauncher)init;
@end

@implementation CRLURLLauncher

+ (BOOL)canOpenURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned __int8 v8 = sub_10077FDCC((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v8 & 1;
}

+ (void)openURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10077FF34((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (_TtC8Freeform14CRLURLLauncher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLURLLauncher();
  return [(CRLURLLauncher *)&v3 init];
}

@end