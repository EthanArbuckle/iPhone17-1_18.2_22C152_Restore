@interface _LNMetadataProviderDirect
- (_TtC10LinkDaemon25_LNMetadataProviderDirect)init;
- (_TtC10LinkDaemon25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5;
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
- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4;
- (id)bundleRegistrationsWithError:(id *)a3;
- (id)bundlesWithError:(id *)a3;
- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)entitiesWithError:(id *)a3;
- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)enumsWithError:(id *)a3;
- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4;
- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4;
- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5;
- (id)queriesWithError:(id *)a3;
- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4;
- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation _LNMetadataProviderDirect

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)initWithConnection:(id)a3 options:(int64_t)a4 error:(id *)a5
{
  return (_TtC10LinkDaemon25_LNMetadataProviderDirect *)_LNMetadataProviderDirect.init(connection:options:)(a3, a4);
}

- (id)actionsWithError:(id *)a3
{
  return sub_1000A1770(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.actions(), (uint64_t *)&unk_10017E9E0);
}

- (id)actionsConformingToSystemProtocols:(id)a3 logicalType:(unint64_t)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  sub_10000D9D4(0, &qword_10017D0A0);
  sub_100048188();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v8 = self;
  _LNMetadataProviderDirect.actionsConforming(to:logicalType:bundleIdentifier:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000BF1C((uint64_t *)&unk_10017E9E0);
  v9.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)actionsAndSystemProtocolDefaultsForBundleIdentifier:(id)a3 error:(id *)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = self;
  _LNMetadataProviderDirect.actionsAndSystemProtocolDefaults(forBundleIdentifier:)();

  swift_bridgeObjectRelease();
  sub_10000D9D4(0, &qword_10017E9F8);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)actionsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A13C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actions(forBundleIdentifier:), &qword_10017E9F0);
}

- (id)actionIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A1894(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.actionIdentifiers(forBundleIdentifier:));
}

- (id)actionForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  v13 = (void *)_LNMetadataProviderDirect.action(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v13;
}

- (id)actionsForBundleIdentifier:(id)a3 andActionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = self;
  _LNMetadataProviderDirect.actions(forBundleIdentifier:andActionIdentifier:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10000D9D4(0, &qword_10017E9F0);
  v13.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
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
  _LNMetadataProviderDirect.actionsConforming(to:withParametersOfTypes:bundleIdentifier:)();
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
  v5 = self;
  _LNMetadataProviderDirect.actions(withFullyQualifiedIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_10000BF1C((uint64_t *)&unk_10017E9E0);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)bundlesWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundles()();

  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)bundleRegistrationsWithError:(id *)a3
{
  v3 = self;
  _LNMetadataProviderDirect.bundleRegistrations()();

  sub_10000D9D4(0, &qword_10017E9D0);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)queriesWithError:(id *)a3
{
  return sub_1000A1770(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.queries(), &qword_10017FC50);
}

- (id)queriesForBundleIdentifier:(id)a3 ofType:(id)a4 error:(id *)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v7 = self;
  _LNMetadataProviderDirect.queries(forBundleIdentifier:ofType:)();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_10000D9D4(0, (unint64_t *)&qword_10017E9C0);
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)enumsWithError:(id *)a3
{
  return sub_1000A1770(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.enums(), &qword_10017E9B8);
}

- (id)enumsForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A13C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.enums(forBundleIdentifier:), (unint64_t *)&qword_10017E9B0);
}

- (id)entitiesWithError:(id *)a3
{
  return sub_1000A1770(self, (uint64_t)a2, (uint64_t)a3, _LNMetadataProviderDirect.entities(), &qword_10017E9A8);
}

- (id)entitiesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A13C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entities(forBundleIdentifier:), (unint64_t *)&qword_10017E9A0);
}

- (id)entityIdentifiersForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A1894(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.entityIdentifiers(forBundleIdentifier:));
}

- (int64_t)metadataVersionForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = self;
  id v10 = _LNMetadataProviderDirect.metadataVersion(forBundleIdentifier:error:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return (int64_t)v10;
}

- (id)appShortcutsProviderMangledTypeNameForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  _LNMetadataProviderDirect.appShortcutsProviderMangledTypeName(forBundleIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      id v13 = v12;
      NSString v14 = 0;
      *a4 = v12;
    }
    else
    {
      swift_errorRelease();
      NSString v14 = 0;
    }
  }
  else
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  return v14;
}

- (id)examplePhrasesForBundleIdentifier:(id)a3 error:(id *)a4
{
  return sub_1000A13C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))_LNMetadataProviderDirect.examplePhrases(forBundleIdentifier:), (unint64_t *)&qword_100180CB0);
}

- (_TtC10LinkDaemon25_LNMetadataProviderDirect)init
{
}

- (void).cxx_destruct
{
}

- (void)autoShortcutsForBundleIdentifier:(id)a3 localeIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v6);
  id v13 = self;
  sub_1000A1F6C(v7, v9, v10, v12, v13, (void (**)(void, void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)autoShortcutsForLocaleIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1000A2518(v6, v8, v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (id)autoShortcutsForLocaleIdentifier:(id)a3 error:(id *)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  _LNMetadataProviderDirect.autoShortcuts(forLocaleIdentifier:)();
  swift_bridgeObjectRelease();

  sub_10000BF1C(&qword_10017D670);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)propertiesForIdentifiers:(id)a3 error:(id *)a4
{
  type metadata accessor for UUID();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  _LNMetadataProviderDirect.properties(forIdentifiers:)();
  swift_bridgeObjectRelease();

  sub_10000D9D4(0, (unint64_t *)&unk_10017FAC0);
  sub_1000A3628((unint64_t *)&qword_10017D340, (void (*)(uint64_t))&type metadata accessor for UUID);
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end