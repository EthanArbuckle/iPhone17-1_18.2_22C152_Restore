@interface RDXPCStorePerformer
- (_TtC7remindd19RDXPCStorePerformer)init;
- (void)MCIsManagedAccountWithObjectID:(id)a3 completion:(id)a4;
- (void)acceptCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5;
- (void)acceptShareWithMetadata:(id)a3 completion:(id)a4;
- (void)addCKShareObserverIfNeededForAccountID:(id)a3 completion:(id)a4;
- (void)anchoredBubbleEnabledWithCompletion:(id)a3;
- (void)batchDeleteExpiredRemindersWith:(id)a3 completion:(id)a4;
- (void)clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletion:(id)a3;
- (void)compressedDistributedEvaluationDataWithOptions:(id)a3 completion:(id)a4;
- (void)createOrUpdatePublicLinkForTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)createPublicContentPreviewOfTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)createShareForObjectWithID:(id)a3 appIconData:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)downloadPublicTemplateWithPublicLinkURLUUID:(id)a3 completion:(id)a4;
- (void)executeFetchRequest:(id)a3 completion:(id)a4;
- (void)fetchContentAttributesOfTemplateWithObjectID:(id)a3 completion:(id)a4;
- (void)fetchGroceryLocalCorrectionsOfListWithObjectID:(id)a3 completion:(id)a4;
- (void)fetchMinimumSearchTermLengthByBaseLanguageWithCompletion:(id)a3;
- (void)fetchReplicaManagerForAccountID:(id)a3 completion:(id)a4;
- (void)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)fetchShareForObjectWithID:(id)a3 completion:(id)a4;
- (void)fetchShouldSuggestConvertToGroceryWithObjectID:(id)a3 usingGroceryClassifierWithGroceryLocaleID:(id)a4 completion:(id)a5;
- (void)fetchSuggestedSectionNamesFromGroceryClassifierWithGroceryLocaleID:(id)a3 completion:(id)a4;
- (void)fetchSuggestedSectionsForRemindersWithReminderTitles:(id)a3 fromGroceryClassifierWithGroceryLocaleIDs:(id)a4 maxSuggestionsCountPerReminderTitle:(id)a5 confidenceScoreThreshold:(id)a6 shouldUseGlobalCorrections:(BOOL)a7 completion:(id)a8;
- (void)notifyOfInteractionWithPeople:(id)a3 completion:(id)a4;
- (void)performInvocation:(id)a3 completion:(id)a4;
- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6;
- (void)permanentlyHideRemindersWith:(id)a3 accountID:(id)a4 completion:(id)a5;
- (void)rejectCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5;
- (void)removeOrphanedAccountWithCompletion:(id)a3;
- (void)requestDownloadGroceryModelAssetsFromTrial;
- (void)requestShouldSuggestConvertToGroceryWithObjectID:(id)a3;
- (void)requestToDeleteLocalDataWithCompletion:(id)a3;
- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)requestToUpdateClientConnectionsWithShouldKeepAlive:(BOOL)a3;
- (void)revokePublicLinkForTemplateWithObjectID:(id)a3 completion:(id)a4;
- (void)saveAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 smartListStorages:(id)a6 smartListSectionStorages:(id)a7 templateStorages:(id)a8 templateSectionStorages:(id)a9 reminderStorages:(id)a10 changedKeys:(id)a11 replicaManagers:(id)a12 author:(id)a13 mode:(unint64_t)a14 synchronously:(BOOL)a15 syncToCloudKit:(BOOL)a16 completion:(id)aBlock;
- (void)setOverridingGroceryCategorizationSecondaryGroceryLocales:(id)a3 completion:(id)a4;
- (void)stopShare:(id)a3 accountID:(id)a4 completion:(id)a5;
- (void)uncachedSuggestedAttributesPerformerWithReason:(id)a3 completion:(id)a4;
- (void)updateAccountWithACAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsAndFetchMigrationState:(BOOL)a3 completion:(id)a4;
- (void)updateShare:(id)a3 accountID:(id)a4 completion:(id)a5;
- (void)validatePhantomObjectsWith:(id)a3 shouldRepair:(BOOL)a4 completion:(id)a5;
@end

@implementation RDXPCStorePerformer

- (void)dealloc
{
  v2 = self;
  sub_100552654();
}

- (void).cxx_destruct
{
  sub_10012227C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity), *(void *)&self->storeController[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 8], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 16], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 24] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_clientIdentity + 28] << 32));
  swift_release();
  swift_release();
  swift_release();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_coreSuggestionsHandler);
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd19RDXPCStorePerformer_publicCloudDatabaseController, &qword_100916818);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC7remindd19RDXPCStorePerformer)init
{
  result = (_TtC7remindd19RDXPCStorePerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)executeFetchRequest:(id)a3 completion:(id)a4
{
}

- (void)performInvocation:(id)a3 completion:(id)a4
{
}

- (void)performSwiftInvocation:(id)a3 withParametersData:(id)a4 storages:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  id v11 = a3;
  id v12 = a4;
  v18 = self;
  id v13 = a5;
  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  if (v13)
  {
    sub_1000963CC(0, (unint64_t *)&qword_10090A3B0);
    sub_1000E4F40((unint64_t *)&qword_10090A3C0, (unint64_t *)&qword_10090A3B0);
    uint64_t v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v17 = 0;
  }
  _Block_copy(v10);
  sub_100563B6C(v11, v14, v16, v17, (uint64_t)v18, (uint64_t)v18, (uint64_t)v10, (uint64_t)sub_10056DBC4);
  _Block_release(v10);
  _Block_release(v10);
  swift_bridgeObjectRelease();
  sub_100097F34(v14, v16);
}

- (void)fetchReplicaManagerForAccountID:(id)a3 completion:(id)a4
{
}

- (void)fetchReplicaManagersForAccountID:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v8);
  id v9 = a3;
  v10 = self;
  sub_100564BDC((uint64_t)a3, (uint64_t)v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)fetchMinimumSearchTermLengthByBaseLanguageWithCompletion:(id)a3
{
  uint64_t v5 = sub_100094134(&qword_100909BE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10091CE30;
  v11[5] = v9;
  id v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10091CE40;
  v12[5] = v11;
  id v13 = self;
  sub_100562C00((uint64_t)v7, (uint64_t)&unk_10091CE50, (uint64_t)v12);
  swift_release();
}

- (void)compressedDistributedEvaluationDataWithOptions:(id)a3 completion:(id)a4
{
}

- (void)saveAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 smartListStorages:(id)a6 smartListSectionStorages:(id)a7 templateStorages:(id)a8 templateSectionStorages:(id)a9 reminderStorages:(id)a10 changedKeys:(id)a11 replicaManagers:(id)a12 author:(id)a13 mode:(unint64_t)a14 synchronously:(BOOL)a15 syncToCloudKit:(BOOL)a16 completion:(id)aBlock
{
  uint64_t v17 = _Block_copy(aBlock);
  sub_1000963CC(0, &qword_100910180);
  unint64_t v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, (unint64_t *)&unk_100914440);
  unint64_t v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, (unint64_t *)&qword_10090AD98);
  unint64_t v29 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, &qword_10090B328);
  unint64_t v28 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, (unint64_t *)&qword_100911180);
  unint64_t v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, &qword_10090D2A0);
  uint64_t v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, &qword_100913418);
  uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, &qword_1009100F8);
  unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, (unint64_t *)&qword_10090A3B0);
  sub_100094134(&qword_100911CB0);
  sub_1000E4F40((unint64_t *)&qword_10090A3C0, (unint64_t *)&qword_10090A3B0);
  uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000963CC(0, (unint64_t *)&unk_10090A3D8);
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (a13)
  {
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;
  }
  else
  {
    uint64_t v20 = 0;
    unint64_t v22 = 0;
  }
  _Block_copy(v17);
  v23 = self;
  sub_100565DE4(v32, v30, v29, v28, v27, v26, v25, v24, v18, v19, v20, v22, a14, a15, a16, v23, v17);
  _Block_release(v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchShareForObjectWithID:(id)a3 completion:(id)a4
{
}

- (void)createShareForObjectWithID:(id)a3 appIconData:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  id v8 = a3;
  uint64_t v9 = self;
  if (a4)
  {
    id v10 = a4;
    a4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v12 = v11;
  }
  else
  {
    unint64_t v12 = 0xF000000000000000;
  }
  _Block_copy(v7);
  sub_100567250((uint64_t)a3, (uint64_t)a4, v12, (uint64_t)self, (void (**)(void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_100097F20((uint64_t)a4, v12);
}

- (void)updateShare:(id)a3 accountID:(id)a4 completion:(id)a5
{
}

- (void)stopShare:(id)a3 accountID:(id)a4 completion:(id)a5
{
}

- (void)addCKShareObserverIfNeededForAccountID:(id)a3 completion:(id)a4
{
}

- (void)acceptShareWithMetadata:(id)a3 completion:(id)a4
{
}

- (void)acceptCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5
{
}

- (void)rejectCalDAVShareWithCalendarURL:(id)a3 acAccountID:(id)a4 completion:(id)a5
{
}

- (void)fetchContentAttributesOfTemplateWithObjectID:(id)a3 completion:(id)a4
{
}

- (void)createOrUpdatePublicLinkForTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

- (void)createPublicContentPreviewOfTemplateWithObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
}

- (void)revokePublicLinkForTemplateWithObjectID:(id)a3 completion:(id)a4
{
}

- (void)downloadPublicTemplateWithPublicLinkURLUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  unint64_t v11 = self;
  sub_100569450((uint64_t)v9, (uint64_t)v11, (void (**)(void, void, void))v10);
  _Block_release(v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)clearGroceryLocalCorrectionsOfListsOwnedByCurrentUserWithCompletion:(id)a3
{
}

- (void)fetchSuggestedSectionNamesFromGroceryClassifierWithGroceryLocaleID:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_100094134(&qword_100909BE0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  unint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v10;
  v15[5] = v12;
  v15[6] = sub_10056D0B8;
  v15[7] = v13;
  unint64_t v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000C6B60((uint64_t)v8, (uint64_t)&unk_10091CE18, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)fetchSuggestedSectionsForRemindersWithReminderTitles:(id)a3 fromGroceryClassifierWithGroceryLocaleIDs:(id)a4 maxSuggestionsCountPerReminderTitle:(id)a5 confidenceScoreThreshold:(id)a6 shouldUseGlobalCorrections:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  uint64_t v12 = _Block_copy(a8);
  uint64_t v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v12);
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = self;
  sub_10056997C(v13, v14, a5, a6, v8, (void (**)(void, void, void))v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchGroceryLocalCorrectionsOfListWithObjectID:(id)a3 completion:(id)a4
{
}

- (void)fetchShouldSuggestConvertToGroceryWithObjectID:(id)a3 usingGroceryClassifierWithGroceryLocaleID:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  uint64_t v9 = self;
  sub_100569F34((uint64_t)v8, (uint64_t)v9, v7);
  _Block_release(v7);
  _Block_release(v7);
}

- (void)requestShouldSuggestConvertToGroceryWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10055BE98((uint64_t)v4);
}

- (void)setOverridingGroceryCategorizationSecondaryGroceryLocales:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    type metadata accessor for Locale();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_10056A1B4((uint64_t)a3, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)notifyOfInteractionWithPeople:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  sub_1000963CC(0, &qword_10091CDA0);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_10056A4D4(v6, (uint64_t)v7, (uint64_t (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)updateAccountsAndFetchMigrationState:(BOOL)a3 completion:(id)a4
{
  unint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  uint64_t v7 = self;
  sub_10056AD50(a3, (uint64_t)v7, (void (**)(void, void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)updateAccountWithACAccountID:(id)a3 restartDA:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  uint64_t v11 = self;
  sub_10056AF00(v8, v10, a4, (uint64_t)v11, (void (**)(void, void, void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)removeOrphanedAccountWithCompletion:(id)a3
{
}

- (void)requestToMergeLocalDataIntoSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)requestToDeleteSyncDataWithAccountIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = (void (**)(void *, void))_Block_copy(a4);
  uint64_t v7 = self;
  sub_10056AAC8();
  id v6 = [self daemonUserDefaults];
  [v6 setAcAccountIdentifierToMergeLocalDataIntoSyncData:0];

  v5[2](v5, 0);
  _Block_release(v5);
}

- (void)requestToDeleteLocalDataWithCompletion:(id)a3
{
}

- (void)uncachedSuggestedAttributesPerformerWithReason:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = self;
  sub_10056B77C(v6, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (void)anchoredBubbleEnabledWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10056B9B0((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)requestDownloadGroceryModelAssetsFromTrial
{
  v2 = self;
  sub_10055DE44();
}

- (void)MCIsManagedAccountWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_10056BBCC(v7, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)requestToUpdateClientConnectionsWithShouldKeepAlive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = self;
  id v6 = self;
  id v7 = [v5 defaultCenter];
  if (v3)
  {
    if (qword_100907660 != -1) {
      swift_once();
    }
    uint64_t v8 = &qword_100942270;
  }
  else
  {
    if (qword_100907668 != -1) {
      swift_once();
    }
    uint64_t v8 = &qword_100942278;
  }
  id v9 = (id)*v8;
  [v7 postNotificationName:v9 object:0];
}

- (void)validatePhantomObjectsWith:(id)a3 shouldRepair:(BOOL)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  sub_1000963CC(0, (unint64_t *)&qword_10090A3B0);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = self;
  sub_10055E4BC(v8, a4, (uint64_t)sub_10056CAF4, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)batchDeleteExpiredRemindersWith:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  uint64_t v8 = self;
  sub_10056C4D4((uint64_t)a3, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)permanentlyHideRemindersWith:(id)a3 accountID:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  type metadata accessor for Date();
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  id v9 = a4;
  uint64_t v10 = self;
  sub_10056C744(v8, (uint64_t)v9, (uint64_t)v10, v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

@end