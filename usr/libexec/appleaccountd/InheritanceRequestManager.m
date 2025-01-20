@interface InheritanceRequestManager
- (NSArray)preConnectEntitlements;
- (NSString)serviceName;
- (Protocol)exportedProtocol;
- (_TtC13appleaccountd25InheritanceRequestManager)init;
- (void)configureExportedInterface:(id)a3;
- (void)fetchAllHealthInfoWithCompletion:(id)a3;
- (void)fetchBenefactorsWithCompletion:(id)a3;
- (void)fetchBeneficiariesWithCompletion:(id)a3;
- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4;
- (void)fetchInvitationsWithCompletion:(id)a3;
- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4;
- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3;
- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5;
- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4;
- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4;
- (void)removeBenefactor:(id)a3 completion:(id)a4;
- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5;
- (void)removeInvitation:(id)a3 completion:(id)a4;
- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5;
- (void)sendInvitationToContact:(id)a3 completion:(id)a4;
- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8;
- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6;
- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4;
- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5;
@end

@implementation InheritanceRequestManager

- (NSArray)preConnectEntitlements
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)configureExportedInterface:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100009654();
}

- (void)fetchBeneficiariesWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100007C2C;
  *(void *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_100008810((uint64_t)sub_10000785C, v6);

  swift_release();

  swift_release();
}

- (Protocol)exportedProtocol
{
  return (Protocol *)&OBJC_PROTOCOL___AAInheritanceDaemonProtocol;
}

- (_TtC13appleaccountd25InheritanceRequestManager)init
{
  return (_TtC13appleaccountd25InheritanceRequestManager *)sub_1000C5314();
}

- (void).cxx_destruct
{
  v3 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__accountStore];
  uint64_t v4 = sub_100009F04(&qword_100325870);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__cleanupController];
  uint64_t v6 = sub_100009F04(&qword_100325848);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__beneficiaryDeclinedHandler];
  uint64_t v8 = sub_100009F04(&qword_100325A90);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__responseHandler];
  uint64_t v10 = sub_100009F04(&qword_100325A98);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__invitationHandler];
  uint64_t v12 = sub_100009F04(&qword_100325AA0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__accessKeyHandler];
  uint64_t v14 = sub_100009F04(&qword_100325AA8);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__beneficiaryRemovedMessageHandler];
  uint64_t v16 = sub_100009F04((uint64_t *)&unk_100325AB0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__messageProcessor];
  uint64_t v18 = sub_100009F04(&qword_100325A40);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  v19 = &self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager__preferences];
  uint64_t v20 = sub_100009F04(&qword_100321C70);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v20 - 8) + 8))(v19, v20);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_100008EA8((uint64_t)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  sub_100008EA8((uint64_t)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_setupMessenger]);
  sub_100008EA8((uint64_t)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger]);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  sub_100008EA8((uint64_t)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager]);
  swift_release();
  sub_1000D9D10((uint64_t)&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_invitationResponder]);

  swift_unknownObjectRelease();
}

- (NSString)serviceName
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)fetchManifestOptionsForContact:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  _Block_copy(v5);
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1000D66F4((uint64_t)v6, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
  swift_unknownObjectRelease();
}

- (void)isRecipient:(id)a3 capableOf:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = *sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_idsMessenger]);
  _Block_copy(v7);
  id v12 = a4;
  v13 = self;
  sub_100088254(v8, v10, v12, v11, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)setupBeneficiaryManifest:(id)a3 contactInfo:(id)a4 setupAuthToken:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  id v13 = a3;
  swift_unknownObjectRetain();
  uint64_t v14 = self;
  sub_1000D68E4(v13, a4, v10, v12, (char *)v14, (void (**)(void, void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)updateBeneficiaryManifest:(id)a3 contactInfo:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  _Block_copy(v7);
  id v8 = a3;
  swift_unknownObjectRetain();
  uint64_t v9 = self;
  sub_1000D7044((uint64_t)v8, (uint64_t)v9, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_unknownObjectRelease();
}

- (void)updateAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
}

- (void)removeBeneficiary:(id)a3 manifest:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1000D7AD0(v9, (uint64_t)v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)removeBenefactor:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_1000C95AC(v8, (uint64_t)sub_10009F7CC, v7);

  swift_release();
}

- (void)removeAccessCodeForContactInfo:(id)a3 completion:(id)a4
{
}

- (void)fetchBenefactorsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = sub_1000D927C;
  v7[3] = v5;
  v7[4] = v6;
  id v8 = self;
  swift_retain();
  swift_retain();
  sub_1000EAAFC((uint64_t)sub_1000D92AC, (uint64_t)v7);

  swift_release();
  swift_release();

  swift_release();
}

- (void)fetchSuggestedBeneficiariesWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager];
  uint64_t v7 = *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager + 8];
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_familyManager], v6);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1000D9244;
  *(void *)(v8 + 24) = v5;
  id v9 = *(void (**)(uint64_t (*)(uint64_t, char), uint64_t, uint64_t, uint64_t))(v7 + 24);
  id v10 = self;
  swift_retain();
  v9(sub_1000D9270, v8, v6, v7);

  swift_release();

  swift_release();
}

- (void)sendInvitationToContact:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_1000CB160(a3, (uint64_t)sub_10009F7CC, v7);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)fetchInvitationsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000D8ED8;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1000E5174((uint64_t)sub_1000D8F3C, v6);

  swift_release();

  swift_release();
}

- (void)fetchInvitationWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v10 = __chkstk_darwin(v6, v9);
  uint64_t v11 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (char *)&v20 - v13;
  v15 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v14, v6);
  unint64_t v17 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = sub_10009F7C4;
  *(void *)(v18 + 24) = v16;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v17, v11, v6);
  v19 = self;
  swift_retain();
  sub_1000E53EC((uint64_t)v14, (uint64_t)sub_1000D8E64, v18);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
}

- (void)removeInvitation:(id)a3 completion:(id)a4
{
  uint64_t v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_10009F7CC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = v6;
  v8[4] = v7;
  v8[5] = self;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  uint64_t v12 = v10;
  sub_100011D2C((uint64_t)v6);
  sub_1000E5174((uint64_t)sub_1000D8CD4, (uint64_t)v8);
  swift_release();
  sub_100011358((uint64_t)v6);
}

- (void)respondToInvitation:(id)a3 accepted:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (uint64_t (*)())_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    uint64_t v13 = sub_10009F7CC;
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = self;
  sub_1000CD670((uint64_t)v12, v6, (uint64_t)v13, v14);
  sub_100011358((uint64_t)v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)fetchAllHealthInfoWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  sub_100008EF8(&self->controller[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController], *(void *)&self->storageController[OBJC_IVAR____TtC13appleaccountd25InheritanceRequestManager_storageController]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1000D8A10;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_1000EC7DC((uint64_t)sub_1000D8A3C, v6);

  swift_release();

  swift_release();
}

- (void)presentInheritanceInvitationUIWithBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v13 = self;
  sub_1000CE36C((uint64_t)v10, (uint64_t)sub_10009EA5C, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)setupBeneficiaryAliasWithAccessKey:(id)a3 password:(id)a4 firstName:(id)a5 lastName:(id)a6 authToken:(id)a7 completion:(id)a8
{
  uint64_t v10 = _Block_copy(a8);
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (a5)
  {
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a5 = v16;
    if (a6)
    {
LABEL_3:
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a6 = v18;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
LABEL_6:
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = v10;
  v23 = self;
  sub_1000CEE1C(v26, v12, v24, v14, v15, (uint64_t)a5, v17, (uint64_t)a6, v19, v21, (uint64_t)sub_1000D89B0, v22);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end