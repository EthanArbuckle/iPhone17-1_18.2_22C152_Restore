@interface CHNavigator
+ (CHNavigator)sharedNavigator;
+ (NSString)scheme;
- (BOOL)navigateToURL:(id)a3;
- (BOOL)registerURLHandlerWithSlug:(id)a3 completion:(id)a4;
- (CHNavigator)init;
- (id)regexFormattedURL:(id)a3;
- (void)unregister:(id)a3;
@end

@implementation CHNavigator

- (BOOL)registerURLHandlerWithSlug:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  LOBYTE(v6) = sub_100083200(v6, v8, (uint64_t)sub_10053A72C, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v6 & 1;
}

- (CHNavigator)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlKeys) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHNavigator_urlHandlers) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Navigator();
  return [(CHNavigator *)&v3 init];
}

+ (CHNavigator)sharedNavigator
{
  if (qword_10094AE38 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100998320;

  return (CHNavigator *)v2;
}

+ (NSString)scheme
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (void)unregister:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100539288(v4, v6);

  swift_bridgeObjectRelease();
}

- (BOOL)navigateToURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  char v9 = sub_100539564((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9 & 1;
}

- (id)regexFormattedURL:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  sub_10008391C();

  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end