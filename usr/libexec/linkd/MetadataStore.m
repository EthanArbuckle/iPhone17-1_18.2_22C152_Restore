@interface MetadataStore
- (_TtC10LinkDaemon13MetadataStore)init;
- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6;
- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5;
- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)actionsWithError:(id *)a3;
- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4;
- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
@end

@implementation MetadataStore

- (_TtC10LinkDaemon13MetadataStore)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_1000347E8((uint64_t)self + OBJC_IVAR____TtC10LinkDaemon13MetadataStore_URL, (uint64_t *)&unk_10017D0C0);
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10LinkDaemon13MetadataStore_provider);
}

- (id)actionsWithError:(id *)a3
{
  return sub_10006E2D8(self, (uint64_t)a2, (uint64_t)a3, sub_10006D3A8, (uint64_t *)&unk_10017E9E0);
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  sub_10006E410(v6, v8, v9, v11, (uint64_t (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_100098D90);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10000D9D4(0, &qword_10017E9F0);
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  sub_10000D9D4(0, &qword_10017D0A0);
  sub_100048188();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v8 = self;
  sub_100066820();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000BF1C((uint64_t *)&unk_10017E9E0);
  v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_10006E49C(v5, v7, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_100099908);

  swift_bridgeObjectRelease();
  sub_10000D9D4(0, &qword_10017E9F8);
  v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_100099268, &qword_10017E9F0);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E514(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_100099D34);
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  NSArray v13 = (void *)sub_10006E410(v6, v8, v9, v11, (uint64_t (*)(id, id, uint64_t, uint64_t, uint64_t, uint64_t))sub_100097978);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)actionsConformingToSystemProtocol:(id)a3 withParametersOfTypes:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  sub_10000D9D4(0, &qword_10017FE20);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a3;
  uint64_t v10 = self;
  sub_10006D970();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000BF1C((uint64_t *)&unk_10017E9E0);
  v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

- (id)actionsWithFullyQualifiedIdentifiers:(id)a3 error:(id *)a4
{
  sub_10000D9D4(0, &qword_10017E9D8);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_10006DB4C();
  swift_bridgeObjectRelease();

  sub_10000BF1C((uint64_t *)&unk_10017E9E0);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)bundlesWithError:(id *)a3
{
  v3 = self;
  sub_10006DCB8();

  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  v3 = self;
  sub_10006DDAC();

  sub_10000D9D4(0, &qword_10017E9D0);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_10006E2D8(self, (uint64_t)a2, (uint64_t)a3, sub_10006DEB4, &qword_10017FC50);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v7 = self;
  sub_10006DF0C();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000D9D4(0, (unint64_t *)&qword_10017E9C0);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)enumsWithError:(id *)a3
{
  return sub_10006E2D8(self, (uint64_t)a2, (uint64_t)a3, sub_10006E0CC, &qword_10017E9B8);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_100097D9C, (unint64_t *)&qword_10017E9B0);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_10006E2D8(self, (uint64_t)a2, (uint64_t)a3, sub_10006E280, &qword_10017E9A8);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_100097DFC, (unint64_t *)&qword_10017E9A0);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E514(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_10009A2C8);
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = self;
  id v10 = sub_10006E614(v6, v8, a4);

  swift_bridgeObjectRelease();
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  sub_10006E6A8(v5, v7);
  swift_bridgeObjectRelease();

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_10006E14C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(id, id, uint64_t, uint64_t))sub_10009CC9C, (unint64_t *)&qword_100180CB0);
}

@end