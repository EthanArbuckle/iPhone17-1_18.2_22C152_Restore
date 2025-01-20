@interface Registry
- (_TtC10LinkDaemon8Registry)init;
- (void)actionForBundleIdentifier:(NSString *)a3 appShortcutIdentifier:(NSString *)a4 parameterIdentifier:(NSString *)a5 completionHandler:(id)a6;
- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 actionIdentifier:(NSString *)a5 parameterIdentifier:(NSUUID *)a6 completionHandler:(id)a7;
- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 completionHandler:(id)a5;
- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 parameterIdentifier:(NSUUID *)a5 completionHandler:(id)a6;
- (void)actionIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)actionsAndSystemProtocolDefaultsForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)actionsConformingToSystemProtocol:(LNSystemProtocol *)a3 withParametersOfTypes:(NSDictionary *)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6;
- (void)actionsConformingToSystemProtocols:(NSSet *)a3 logicalType:(unint64_t)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6;
- (void)actionsForBundleIdentifier:(NSString *)a3 andActionIdentifier:(NSString *)a4 reply:(id)a5;
- (void)actionsForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)actionsWithFullyQualifiedIdentifiers:(NSArray *)a3 reply:(id)a4;
- (void)actionsWithReply:(id)a3;
- (void)autoShortcutsForBundleIdentifier:(NSString *)a3 localeIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)autoShortcutsForLocaleIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)bundleRegistrationsWithReply:(id)a3;
- (void)bundlesWithReply:(id)a3;
- (void)entitiesForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)entitiesWithReply:(id)a3;
- (void)entityIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)enumsForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)enumsWithReply:(id)a3;
- (void)examplePhrasesForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)fetchDatabaseURL:(id)a3;
- (void)metadataVersionForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)propertiesForIdentifiers:(NSArray *)a3 completionHandler:(id)a4;
- (void)queriesForBundleIdentifier:(NSString *)a3 ofType:(NSString *)a4 reply:(id)a5;
- (void)queriesWithReply:(id)a3;
- (void)registerBundleWithIdentifier:(NSString *)a3 force:(BOOL)a4 reply:(id)a5;
- (void)relevantIntentsForBundleIdentifier:(NSString *)a3 reply:(id)a4;
- (void)relevantIntentsWithReply:(id)a3;
- (void)resetWithReply:(id)a3;
- (void)scanBundlesWithReply:(id)a3;
- (void)unregisterBundleWithIdentifier:(NSString *)a3 reply:(id)a4;
@end

@implementation Registry

- (_TtC10LinkDaemon8Registry)init
{
}

- (void).cxx_destruct
{
  sub_10000E788((uint64_t)self + OBJC_IVAR____TtC10LinkDaemon8Registry_applicationSource);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1000347E8((uint64_t)self + OBJC_IVAR____TtC10LinkDaemon8Registry_lastMetadataAudit, &qword_10017F5B0);

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)fetchDatabaseURL:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000C4C94((char *)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (void)actionsWithReply:(id)a3
{
}

- (void)actionsForBundleIdentifier:(NSString *)a3 andActionIdentifier:(NSString *)a4 reply:(id)a5
{
}

- (void)actionsConformingToSystemProtocols:(NSSet *)a3 logicalType:(unint64_t)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a5;
  v14 = self;

  sub_1000F7D3C((uint64_t)&unk_10017FE40, (uint64_t)v11);
}

- (void)actionsConformingToSystemProtocol:(LNSystemProtocol *)a3 withParametersOfTypes:(NSDictionary *)a4 bundleIdentifier:(NSString *)a5 reply:(id)a6
{
}

- (void)actionsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)actionsWithFullyQualifiedIdentifiers:(NSArray *)a3 reply:(id)a4
{
}

- (void)actionsAndSystemProtocolDefaultsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)actionIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)bundlesWithReply:(id)a3
{
}

- (void)bundleRegistrationsWithReply:(id)a3
{
}

- (void)entitiesWithReply:(id)a3
{
}

- (void)entitiesForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)entityIdentifiersForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)enumsWithReply:(id)a3
{
}

- (void)enumsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)examplePhrasesForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)queriesWithReply:(id)a3
{
}

- (void)queriesForBundleIdentifier:(NSString *)a3 ofType:(NSString *)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;

  sub_1000F7D3C((uint64_t)&unk_10017FC18, (uint64_t)v9);
}

- (void)metadataVersionForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)actionForBundleIdentifier:(NSString *)a3 appShortcutIdentifier:(NSString *)a4 parameterIdentifier:(NSString *)a5 completionHandler:(id)a6
{
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 parameterIdentifier:(NSUUID *)a5 completionHandler:(id)a6
{
  v10 = _Block_copy(a6);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = self;

  sub_1000F7D3C((uint64_t)&unk_10017FB88, (uint64_t)v11);
}

- (void)actionForBundleIdentifier:(NSString *)a3 basePhraseTemplate:(NSString *)a4 actionIdentifier:(NSString *)a5 parameterIdentifier:(NSUUID *)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = self;

  sub_1000F7D3C((uint64_t)&unk_10017FB50, (uint64_t)v13);
}

- (void)autoShortcutsForBundleIdentifier:(NSString *)a3 localeIdentifier:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)autoShortcutsForLocaleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)propertiesForIdentifiers:(NSArray *)a3 completionHandler:(id)a4
{
}

- (void)relevantIntentsForBundleIdentifier:(NSString *)a3 reply:(id)a4
{
}

- (void)relevantIntentsWithReply:(id)a3
{
}

- (void)registerBundleWithIdentifier:(NSString *)a3 force:(BOOL)a4 reply:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  v11 = self;

  sub_1000F7D3C((uint64_t)&unk_10017FA20, v9);
}

- (void)resetWithReply:(id)a3
{
}

- (void)scanBundlesWithReply:(id)a3
{
}

- (void)unregisterBundleWithIdentifier:(NSString *)a3 reply:(id)a4
{
}

@end