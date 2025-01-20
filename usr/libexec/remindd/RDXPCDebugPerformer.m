@interface RDXPCDebugPerformer
- (_TtC7remindd19RDXPCDebugPerformer)init;
- (void)addGeofenceWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 uuid:(id)a6 completion:(id)a7;
- (void)addSharedEntitySyncActivityWithActivity:(id)a3 completion:(id)a4;
- (void)cancelCloudKitSync:(id)a3;
- (void)cloudKitStatus:(id)a3;
- (void)containerStats:(id)a3;
- (void)crashDaemonWithMessage:(id)a3;
- (void)createIsolatedStoreContainerWithCompletion:(id)a3;
- (void)daemonPid:(id)a3;
- (void)daemonStatus:(BOOL)a3 completion:(id)a4;
- (void)daemonVersion:(id)a3;
- (void)dataAccessStatusReports:(id)a3;
- (void)destroyIsolatedStoreContainerWithToken:(id)a3 completion:(id)a4;
- (void)downloadContainerWithAccountID:(id)a3 completion:(id)a4;
- (void)dumpUbKVS:(id)a3;
- (void)fetchAccountListOrderedIdentifiersWithAccountID:(id)a3 completion:(id)a4;
- (void)fetchAllDueDateDeltaAlertsIncludingUnsupported:(BOOL)a3 completion:(id)a4;
- (void)fetchAllManualSortHintsWithDetails:(BOOL)a3 completion:(id)a4;
- (void)fetchAllSharedEntitySyncActivities:(id)a3;
- (void)fetchContactsMatching:(id)a3 completion:(id)a4;
- (void)fetchGeofencesWithCompletion:(id)a3;
- (void)fetchManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5;
- (void)fireDebugNotificationWithText:(id)a3 identifier:(id)a4 categoryIdentifier:(id)a5 reference:(id)a6 isRemove:(BOOL)a7 completion:(id)a8;
- (void)handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3;
- (void)handleIncompleteTemplateOperationQueueItemsImmediately;
- (void)immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 completion:(id)a4;
- (void)lowLevelMarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 shouldRemoveFromParent:(BOOL)a5 completion:(id)a6;
- (void)lowLevelUnmarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5;
- (void)markAndDeleteExtraneousAlarmsFromReminderID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5;
- (void)nukeDatabase:(id)a3;
- (void)persistenceStoreIDForAccountID:(id)a3 completion:(id)a4;
- (void)purgeCKRecordWithRecordType:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3;
- (void)refreshHashtagLabelsImmediately;
- (void)registerBabysitterWith:(id)a3 completion:(id)a4;
- (void)removeAllSharedEntitySyncActivityWithCompletion:(id)a3;
- (void)removeFromUbKVSForKey:(id)a3 completion:(id)a4;
- (void)removeGeofenceWithUUID:(id)a3 completion:(id)a4;
- (void)removeManualSortHintWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeSharedEntitySyncActivitiesWithCKIdentifier:(id)a3 completion:(id)a4;
- (void)removeSharedEntitySyncActivityWithUUIDForChangeTracking:(id)a3 completion:(id)a4;
- (void)resetAllManualSortHintsWithCompletion:(id)a3;
- (void)resetBabysitterWithRestrictedAccountID:(id)a3 completion:(id)a4;
- (void)resetManualSortHintBeforeLastAccessed:(id)a3 completion:(id)a4;
- (void)resetManualSortHintWithIdentifier:(id)a3 completion:(id)a4;
- (void)resetManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5;
- (void)retryAccountZoneIDsNeedingToBeSavedWithAccountID:(id)a3 completion:(id)a4;
- (void)setDueDateResolutionTokenNonceForAlarmID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6;
- (void)setDueDateResolutionTokenNonceForReminderID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6;
- (void)setupManualHashtagLabelUpdater;
- (void)simulateCoreLocationEnterRegionWithIdentifier:(id)a3 completion:(id)a4;
- (void)simulateCoreLocationExitRegionWithIdentifier:(id)a3 completion:(id)a4;
- (void)synchronous_revertImageAttachmentsToUnDeduped:(id)a3 completion:(id)a4;
- (void)testFlagAccountForInactivatedCalDAVDataMigrationWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)testInitialSyncWithAccountName:(id)a3 completion:(id)a4;
- (void)testReinitializeCloudKitWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateManualSortHintWithIdentifier:(id)a3 lastAccessed:(id)a4 completion:(id)a5;
- (void)updateMinimumSupportedVersionWithObjectID:(id)a3 minimumSupportedVersion:(int64_t)a4 completion:(id)a5;
- (void)updateRemCurrentRuntimeVersionDebuggingOverride:(int64_t)a3;
- (void)validateHashtagLabelsWithConcealedHashtagsWithRepair:(BOOL)a3 completion:(id)a4;
- (void)validateHashtagLabelsWithoutHashtagWithRepair:(BOOL)a3 completion:(id)a4;
- (void)validateHashtagsWithMismatchedHashtagsWithRepair:(BOOL)a3 completion:(id)a4;
- (void)validateHashtagsWithSharedToMeReminderCKIdentifierAndMismatchedReminderCKIdentifierWithRepair:(BOOL)a3 completion:(id)a4;
- (void)validateHashtagsWithoutHashtagLabelWithRepair:(BOOL)a3 completion:(id)a4;
- (void)validateSharedToMeReminderPlaceholdersWithRepair:(BOOL)a3 completion:(id)a4;
- (void)writeUbKVSWithKey:(id)a3 dateValue:(id)a4 completion:(id)a5;
- (void)writeUbKVSWithKey:(id)a3 stringValue:(id)a4 completion:(id)a5;
@end

@implementation RDXPCDebugPerformer

- (_TtC7remindd19RDXPCDebugPerformer)init
{
  result = (_TtC7remindd19RDXPCDebugPerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1000F3DB4((uint64_t)self + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_xpcDaemon);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_q_storeControllerByContainerURL));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_q_storeControllerNotificationCenterByContainerURL));

  swift_release();
}

- (void)daemonVersion:(id)a3
{
  v4 = (void (**)(void *, NSString))_Block_copy(a3);
  v6 = self;
  Double.description.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  v4[2](v4, v5);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)daemonPid:(id)a3
{
  v4 = (void (**)(void *, NSString))_Block_copy(a3);
  NSString v5 = self;
  v6 = self;
  id v7 = [v5 processInfo];
  [v7 processIdentifier];

  dispatch thunk of CustomStringConvertible.description.getter();
  NSString v8 = String._bridgeToObjectiveC()();
  v4[2](v4, v8);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (void)daemonStatus:(BOOL)a3 completion:(id)a4
{
}

- (void)containerStats:(id)a3
{
}

- (void)dumpUbKVS:(id)a3
{
}

- (void)writeUbKVSWithKey:(id)a3 stringValue:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  if (a4 && (uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(), v12))
  {
    *((void *)&v15 + 1) = &type metadata for String;
    *(void *)&long long v14 = v11;
    *((void *)&v14 + 1) = v12;
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
  }
  _Block_copy(v7);
  v13 = self;
  swift_bridgeObjectRetain();
  sub_100112308(v8, v10, (uint64_t)&v14, (uint64_t)v7);
  _Block_release(v7);
  sub_1000966BC((uint64_t)&v14, &qword_100908190);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)writeUbKVSWithKey:(id)a3 dateValue:(id)a4 completion:(id)a5
{
  uint64_t v8 = sub_100094134((uint64_t *)&unk_100909A40);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v23 - v12;
  long long v14 = _Block_copy(a5);
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 0, 1, v18);
  }
  else
  {
    uint64_t v18 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v13, 1, 1, v18);
  }
  sub_1000BF710((uint64_t)v13, (uint64_t)v11, (uint64_t *)&unk_100909A40);
  type metadata accessor for Date();
  uint64_t v19 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v11, 1, v18) == 1)
  {
    _Block_copy(v14);
    v20 = self;
    sub_1000966BC((uint64_t)v11, (uint64_t *)&unk_100909A40);
    long long v23 = 0u;
    long long v24 = 0u;
  }
  else
  {
    *((void *)&v24 + 1) = v18;
    v21 = sub_1000C1FE8((uint64_t *)&v23);
    (*(void (**)(uint64_t *, char *, uint64_t))(v19 + 32))(v21, v11, v18);
    _Block_copy(v14);
    v22 = self;
  }
  _Block_copy(v14);
  sub_100112308(v15, v17, (uint64_t)&v23, (uint64_t)v14);
  _Block_release(v14);
  sub_1000966BC((uint64_t)&v23, &qword_100908190);
  _Block_release(v14);
  _Block_release(v14);

  swift_bridgeObjectRelease();
  sub_1000966BC((uint64_t)v13, (uint64_t *)&unk_100909A40);
}

- (void)removeFromUbKVSForKey:(id)a3 completion:(id)a4
{
  NSString v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_10011259C(v6, v8, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)nukeDatabase:(id)a3
{
}

- (void)testInitialSyncWithAccountName:(id)a3 completion:(id)a4
{
}

- (void)testReinitializeCloudKitWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)testFlagAccountForInactivatedCalDAVDataMigrationWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)retryAccountZoneIDsNeedingToBeSavedWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)cancelCloudKitSync:(id)a3
{
}

- (void)cloudKitStatus:(id)a3
{
}

- (void)fireDebugNotificationWithText:(id)a3 identifier:(id)a4 categoryIdentifier:(id)a5 reference:(id)a6 isRemove:(BOOL)a7 completion:(id)a8
{
  uint64_t v12 = _Block_copy(a8);
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  if (a4)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v16;
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v17 = 0;
    uint64_t v19 = 0;
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v15 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;
  if (a6)
  {
LABEL_4:
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a6 = v21;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v20 = 0;
LABEL_8:
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v12;
  long long v23 = self;
  sub_1000FBCE8(v24, v14, v15, (uint64_t)a4, v17, v19, v20, (uint64_t)a6, a7, (uint64_t)sub_10011FBC8, v22);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)fetchGeofencesWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1000FC3FC((uint64_t)sub_10011E170, v5);

  swift_release();
}

- (void)removeGeofenceWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = self;
  sub_1000FCB2C((uint64_t)v9, (uint64_t)sub_10011FCF0, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)addGeofenceWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 uuid:(id)a6 completion:(id)a7
{
  uint64_t v13 = sub_100094134((uint64_t *)&unk_100909E50);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v16 = _Block_copy(a7);
  if (a6)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = self;
  sub_1000FD0EC((uint64_t)v15, (uint64_t)sub_10011FCF0, v19, a3, a4, a5);

  swift_release();
  sub_1000966BC((uint64_t)v15, (uint64_t *)&unk_100909E50);
}

- (void)simulateCoreLocationEnterRegionWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1000FDCA4(v6, v8, (uint64_t)sub_10011FCF0, v9, (uint64_t)&unk_1008BA410, (uint64_t)sub_10011DF10, (uint64_t)&unk_1008BA428);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)simulateCoreLocationExitRegionWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1000FDCA4(v6, v8, (uint64_t)sub_10011DEA0, v9, (uint64_t)&unk_1008BA398, (uint64_t)sub_10011DEAC, (uint64_t)&unk_1008BA3B0);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)persistenceStoreIDForAccountID:(id)a3 completion:(id)a4
{
}

- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_storeController);
  v9[4] = sub_10011FBC8;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000E13D0;
  v9[3] = &unk_1008BA338;
  uint64_t v7 = _Block_copy(v9);
  uint64_t v8 = self;
  swift_retain();
  swift_release();
  [v6 purgeDeletedObjectsWithCompletionHandler:v7];
  _Block_release(v7);

  swift_release();
}

- (void)lowLevelMarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 shouldRemoveFromParent:(BOOL)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  uint64_t v12 = self;
  sub_10011530C(v11, a4, a5, (uint64_t)v12, v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)lowLevelUnmarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5
{
}

- (void)markAndDeleteExtraneousAlarmsFromReminderID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5
{
}

- (void)setDueDateResolutionTokenNonceForAlarmID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6
{
}

- (void)setDueDateResolutionTokenNonceForReminderID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6
{
}

- (void)crashDaemonWithMessage:(id)a3
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = qword_100906EB8;
  uint64_t v12 = self;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = sub_10008E2DC(v4, (uint64_t)qword_10090ADC0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v13, v4);
  sub_100094134(&qword_100908170);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100776E40;
  *(void *)(inited + 32) = 48;
  *(void *)(inited + 40) = 0xE100000000000000;
  *(void *)(inited + 72) = &type metadata for String;
  *(void *)(inited + 48) = v8;
  *(void *)(inited + 56) = v10;
  swift_bridgeObjectRetain();
  sub_1001805C0(inited);
  sub_1001805C0((uint64_t)_swiftEmptyArrayStorage);
  sub_10052ECB8((uint64_t)"RDXPCDebugPerformer called crash {message: %@}", 46, 2);
  __break(1u);
}

- (void)fetchContactsMatching:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_100115E50(v7, (uint64_t)a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)createIsolatedStoreContainerWithCompletion:(id)a3
{
}

- (void)destroyIsolatedStoreContainerWithToken:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1000FFE04(v8, (uint64_t)sub_10011FBC8, v7);

  swift_release();
}

- (void)dataAccessStatusReports:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10011650C((uint64_t)sub_10011D924, v5);

  swift_release();
}

- (void)registerBabysitterWith:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1001167F4(v6, v8, (uint64_t)sub_10011FBC8, v9, (uint64_t)&unk_1008BA078, (uint64_t)sub_10011D918, (uint64_t)&unk_1008BA090);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)resetBabysitterWithRestrictedAccountID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  sub_1001167F4(v6, v8, (uint64_t)sub_10011FBC8, v9, (uint64_t)&unk_1008BA000, (uint64_t)sub_10011D8C0, (uint64_t)&unk_1008BA018);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)downloadContainerWithAccountID:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    uint64_t v7 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  _Block_copy(v6);
  uint64_t v9 = self;
  sub_100116AEC(v7, a3, (uint64_t)v9, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)purgeCKRecordWithRecordType:(id)a3 identifier:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  uint64_t v15 = self;
  sub_10011752C(v12, v14, (uint64_t)v10, (uint64_t)v15, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)fetchAllManualSortHintsWithDetails:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  uint64_t Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  swift_storeEnumTagMultiPayload();
  _Block_copy(v10);
  uint64_t v11 = self;
  sub_100117C60(0xD000000000000021, 0x80000001007CA3D0, v5, (uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  sub_10011C774((uint64_t)v9, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v10);
}

- (void)fetchManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5
{
}

- (void)removeManualSortHintWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)resetAllManualSortHintsWithCompletion:(id)a3
{
  uint64_t Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  swift_storeEnumTagMultiPayload();
  _Block_copy(v8);
  uint64_t v9 = self;
  sub_100118640(0xD000000000000017, 0x80000001007CA390, (uint64_t)v7, (uint64_t)v9, v8);
  _Block_release(v8);
  sub_10011C774((uint64_t)v7, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v8);
}

- (void)resetManualSortHintWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  swift_storeEnumTagMultiPayload();
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_100118640(0xD000000000000021, 0x80000001007CA360, (uint64_t)v8, (uint64_t)v14, v13);
  _Block_release(v13);
  sub_10011C774((uint64_t)v8, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)resetManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5
{
}

- (void)resetManualSortHintBeforeLastAccessed:(id)a3 completion:(id)a4
{
  uint64_t Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = _Block_copy(a4);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v8, v12, v9);
  swift_storeEnumTagMultiPayload();
  _Block_copy(v13);
  uint64_t v14 = self;
  sub_100118640(0xD000000000000029, 0x80000001007CA2D0, (uint64_t)v8, (uint64_t)v14, v13);
  _Block_release(v13);
  sub_10011C774((uint64_t)v8, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)updateManualSortHintWithIdentifier:(id)a3 lastAccessed:(id)a4 completion:(id)a5
{
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v15);
  uint64_t v16 = self;
  sub_100118B50((uint64_t)v14, (uint64_t)v10, (uint64_t)v16, v15);
  _Block_release(v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)setupManualHashtagLabelUpdater
{
  v2 = self;
  sub_100103900();
}

- (void)refreshHashtagLabelsImmediately
{
  v2 = self;
  sub_100103C80();
}

- (void)handleIncompleteTemplateOperationQueueItemsImmediately
{
  v2 = self;
  sub_100103E34();
}

- (void)handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3
{
  uint64_t v4 = self;
  sub_100104218(a3);
}

- (void)immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1001190E4((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 completion:(id)a4
{
}

- (void)synchronous_revertImageAttachmentsToUnDeduped:(id)a3 completion:(id)a4
{
  BOOL v5 = _Block_copy(a4);
  sub_1000963CC(0, (unint64_t *)&qword_10090A3B0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  uint64_t v7 = self;
  sub_100119320(v6, (uint64_t)v7, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)validateHashtagLabelsWithoutHashtagWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)validateHashtagLabelsWithConcealedHashtagsWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)validateHashtagsWithoutHashtagLabelWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)validateHashtagsWithMismatchedHashtagsWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)validateHashtagsWithSharedToMeReminderCKIdentifierAndMismatchedReminderCKIdentifierWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)validateSharedToMeReminderPlaceholdersWithRepair:(BOOL)a3 completion:(id)a4
{
}

- (void)fetchAccountListOrderedIdentifiersWithAccountID:(id)a3 completion:(id)a4
{
}

- (void)fetchAllSharedEntitySyncActivities:(id)a3
{
}

- (void)addSharedEntitySyncActivityWithActivity:(id)a3 completion:(id)a4
{
}

- (void)removeAllSharedEntitySyncActivityWithCompletion:(id)a3
{
}

- (void)removeSharedEntitySyncActivityWithUUIDForChangeTracking:(id)a3 completion:(id)a4
{
}

- (void)removeSharedEntitySyncActivitiesWithCKIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateMinimumSupportedVersionWithObjectID:(id)a3 minimumSupportedVersion:(int64_t)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = self;
  sub_10011BC90((uint64_t)v9, a4, (uint64_t)v10, v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)updateRemCurrentRuntimeVersionDebuggingOverride:(int64_t)a3
{
}

- (void)fetchAllDueDateDeltaAlertsIncludingUnsupported:(BOOL)a3 completion:(id)a4
{
}

@end