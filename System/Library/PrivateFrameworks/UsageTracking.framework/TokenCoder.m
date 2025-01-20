@interface TokenCoder
+ (_TtC18UsageTrackingAgent10TokenCoder)internal;
- (_TtC18UsageTrackingAgent10TokenCoder)init;
- (id)decodeApplications:(id)a3;
- (id)decodeCategories:(id)a3;
- (id)decodeWebDomains:(id)a3;
- (id)encodeApplication:(id)a3;
- (id)encodeApplications:(id)a3;
- (id)encodeCategories:(id)a3;
- (id)encodeCategory:(id)a3;
- (id)encodeWebDomain:(id)a3;
- (id)encodeWebDomains:(id)a3;
@end

@implementation TokenCoder

+ (_TtC18UsageTrackingAgent10TokenCoder)internal
{
  if (qword_100095110 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000974F8;
  return (_TtC18UsageTrackingAgent10TokenCoder *)v2;
}

- (_TtC18UsageTrackingAgent10TokenCoder)init
{
  return (_TtC18UsageTrackingAgent10TokenCoder *)sub_100062770();
}

- (id)decodeApplications:(id)a3
{
  sub_1000696A4();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000691A8((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_100062E44);

  swift_bridgeObjectRelease();
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)decodeCategories:(id)a3
{
  sub_1000696A4();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000691A8((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_100062F38);

  swift_bridgeObjectRelease();
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)decodeWebDomains:(id)a3
{
  sub_1000696A4();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000691A8((uint64_t)&_swiftEmptySetSingleton, v4, (uint64_t)v5, (uint64_t (*)(char *, uint64_t))sub_10006302C);

  swift_bridgeObjectRelease();
  v6.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

- (id)encodeApplications:(id)a3
{
  return sub_100063588(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(bundleIdentifier:));
}

- (id)encodeCategories:(id)a3
{
  return sub_100063588(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(categoryIdentifier:));
}

- (id)encodeWebDomains:(id)a3
{
  return sub_100063588(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(webDomain:));
}

- (id)encodeApplication:(id)a3
{
  return sub_100063680(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(bundleIdentifier:));
}

- (id)encodeCategory:(id)a3
{
  return sub_100063680(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(categoryIdentifier:));
}

- (id)encodeWebDomain:(id)a3
{
  return sub_100063680(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))&dispatch thunk of TokenEncoder.encode(webDomain:));
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end