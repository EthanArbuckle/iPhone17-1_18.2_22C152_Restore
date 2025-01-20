@interface InheritanceSecurityController
- (void)checkInheritanceKeyForBeneficiaryID:(id)a3 completion:(id)a4;
- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4;
- (void)preflightInheritanceRecoveryForBeneficiaryID:(id)a3 accessKey:(id)a4 completion:(id)a5;
- (void)recreateInheritanceKeyWithAccessKey:(id)a3 completion:(id)a4;
- (void)removeInheritanceAccessKeyForBeneficiaryID:(id)a3 completion:(id)a4;
@end

@implementation InheritanceSecurityController

- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_unknownObjectRetain();
  swift_retain();
  InheritanceSecurityController.createAccessKey(for:completion:)(a3, (uint64_t)sub_100263D90, v6);
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
}

- (void)recreateInheritanceKeyWithAccessKey:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain();
  sub_1002628FC((uint64_t)v7, (uint64_t)self, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release();
}

- (void)removeInheritanceAccessKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  swift_retain();
  InheritanceSecurityController.removeAccessKey(for:completion:)((uint64_t)v9, (uint64_t)sub_10009F7CC, v11);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)preflightInheritanceRecoveryForBeneficiaryID:(id)a3 accessKey:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v13);
  id v14 = a4;
  swift_retain();
  sub_100262FCC((uint64_t)v12, (uint64_t)v14, (uint64_t)self, (void (**)(void, void))v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)checkInheritanceKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  swift_retain();
  sub_100263698((uint64_t)v10, (uint64_t)self, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end