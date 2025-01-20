@interface CustodianDaemonService
- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4;
- (void)availableRecoveryFactorsWithCompletion:(id)a3;
- (void)displayCustodianInviteWithUUID:(id)a3 completion:(id)a4;
- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4;
- (void)fetchCachedTrustedContactsWithCompletion:(id)a3;
- (void)fetchCustodianHealthStatusWithCompletion:(id)a3;
- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4;
- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3;
- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4;
- (void)fetchCustodianshipInfoWithCompletion:(id)a3;
- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4;
- (void)fetchSuggestedCustodiansForUpsellWithCompletion:(id)a3;
- (void)fetchSuggestedCustodiansWithCompletion:(id)a3;
- (void)fetchTrustedContactsWithCompletion:(id)a3;
- (void)generateCustodianRecoveryCodeWithContext:(AACustodianRecoveryRequestContext *)a3 completion:(id)a4;
- (void)performTrustedContactsDataSyncWithCompletion:(id)a3;
- (void)preflightCustodianRecoveryWithCompletion:(id)a3;
- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3;
- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4;
- (void)removeCustodian:(id)a3 completion:(id)a4;
- (void)repairCustodians:(id)a3 completion:(id)a4;
- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5;
- (void)respondToInviteWithContext:(id)a3 completion:(id)a4;
- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4;
- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4;
- (void)startHealthCheckWithCompletion:(id)a3;
- (void)startManateeMigrationWithCompletion:(id)a3;
- (void)stopBeingCustodian:(id)a3 completion:(id)a4;
- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4;
@end

@implementation CustodianDaemonService

- (void)fetchTrustedContactsWithCompletion:(id)a3
{
  sub_100009F04(&qword_100321C90);
  __chkstk_darwin();
  v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009F04((uint64_t *)&unk_1003245B0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v17[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a3);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v8 + 16))(v10, &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC13appleaccountd22CustodianDaemonService__custodianFetcher], v7);
  swift_retain();
  Dependency.wrappedValue.getter();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v13 = *sub_100008EF8(v17, v17[3]);
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v6, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v13;
  v15[5] = sub_100005838;
  v15[6] = v12;
  swift_retain();
  swift_retain();
  sub_100225A54((uint64_t)v6, (uint64_t)&unk_100324638, (uint64_t)v15);
  swift_release();
  sub_100008EA8((uint64_t)v17);
  swift_release();
  swift_release();
}

- (void)setupCustodianshipWithContext:(id)a3 completion:(id)a4
{
}

- (void)reSendCustodianInvitationWithCustodianID:(id)a3 completion:(id)a4
{
}

- (void)removeCustodian:(id)a3 completion:(id)a4
{
}

- (void)stopBeingCustodian:(id)a3 completion:(id)a4
{
}

- (void)fetchCachedTrustedContactsWithCompletion:(id)a3
{
  uint64_t v5 = sub_100009F04(&qword_100321C90);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100324650;
  v12[5] = v10;
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_100324658;
  v13[5] = v12;
  swift_retain();
  sub_1001A5AAC((uint64_t)v8, (uint64_t)&unk_100324660, (uint64_t)v13);
  swift_release();
}

- (void)fetchCustodianshipInfoWithCompletion:(id)a3
{
}

- (void)fetchCustodianshipInfoWithUUID:(id)a3 completion:(id)a4
{
}

- (void)fetchSuggestedCustodiansWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)&self->familyManager[24];
  uint64_t v7 = *(void *)&self->familyManager[32];
  sub_100008EF8(self->familyManager, v6);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10009F7C8;
  *(void *)(v8 + 24) = v5;
  uint64_t v9 = *(void (**)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v7 + 24);
  swift_retain();
  swift_retain();
  v9(sub_10009EEB8, v8, v6, v7);
  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchSuggestedCustodiansForUpsellWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = sub_10009EEB0;
  *(void *)(v5 + 24) = v4;
  swift_retain();
  swift_retain();
  sub_1002146B0((uint64_t)sub_10009F87C, v5);
  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchCustodianHealthStatusWithCompletion:(id)a3
{
}

- (void)startCustodianRecoveryWithContext:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_10008E924(v7, (uint64_t)sub_10009EEA0, v6);

  swift_release();

  swift_release();
}

- (BOOL)cancelCustodianRecoveryWithSessionID:(id)a3 error:(id *)a4
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  swift_retain();
  sub_10008FCFC(v4, v6);
  swift_bridgeObjectRelease();
  swift_release();
  return 1;
}

- (void)fetchCustodianRecoveryConfigurationWithCompletion:(id)a3
{
}

- (void)generateCustodianRecoveryCodeWithContext:(AACustodianRecoveryRequestContext *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100009F04(&qword_100321C90);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_100324618;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100324620;
  v15[5] = v14;
  v16 = a3;
  swift_retain();
  sub_1001A5AAC((uint64_t)v10, (uint64_t)&unk_100324628, (uint64_t)v15);
  swift_release();
}

- (void)validateCustodianRecoveryCodeWithContext:(id)a3 completion:(id)a4
{
}

- (void)fetchCustodianPasswordResetInformationWithSessionID:(id)a3 completion:(id)a4
{
}

- (void)fetchCustodianRecoveryKeysWithSessionID:(id)a3 completion:(id)a4
{
}

- (void)respondToInviteWithContext:(id)a3 completion:(id)a4
{
}

- (void)startHealthCheckWithCompletion:(id)a3
{
}

- (void)performTrustedContactsDataSyncWithCompletion:(id)a3
{
}

- (void)startManateeMigrationWithCompletion:(id)a3
{
}

- (void)pullTrustedContactsFromCloudKitWithCompletion:(id)a3
{
}

- (void)displayTrustedContactFlowWithModel:(id)a3 completion:(id)a4
{
  unint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1000956D4((uint64_t)a3, (uint64_t)sub_10009F7CC, v6);
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
}

- (void)displayCustodianInviteWithUUID:(id)a3 completion:(id)a4
{
}

- (void)availableRecoveryFactorsWithCompletion:(id)a3
{
  uint64_t v5 = sub_100009F04((uint64_t *)&unk_1003245F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a3);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  (*(void (**)(char *, unsigned __int8 *, uint64_t))(v6 + 16))(v9, &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC13appleaccountd22CustodianDaemonService__recoveryFactorsController], v5);
  swift_retain();
  Dependency.wrappedValue.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  sub_100008EF8(v14, v14[3]);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10009EB78;
  *(void *)(v12 + 24) = v11;
  swift_retain();
  sub_1000DE034((uint64_t)sub_10009EB80, v12);
  swift_release();
  sub_100008EA8((uint64_t)v14);
  swift_release();
  swift_release();
}

- (void)repairCustodians:(id)a3 remove:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a3)
  {
    type metadata accessor for UUID();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (a4)
  {
    type metadata accessor for UUID();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v8);
  swift_retain();
  sub_10009DAAC((uint64_t)a3, (uint64_t)self, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)repairCustodians:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (a3)
  {
    type metadata accessor for UUID();
    a3 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v6);
  swift_retain();
  sub_10009DAAC((uint64_t)a3, (uint64_t)self, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)preflightCustodianRecoveryWithCompletion:(id)a3
{
}

@end