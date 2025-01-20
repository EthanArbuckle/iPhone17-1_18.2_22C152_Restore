@interface InheritanceSecurityManager
- (void)checkInheritanceKeyForBeneficiaryID:(id)a3 completion:(id)a4;
- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4;
- (void)preflightInheritanceRecoveryForBeneficiaryID:(id)a3 accessKey:(id)a4 completion:(id)a5;
- (void)recreateInheritanceKeyWithAccessKey:(id)a3 completion:(id)a4;
- (void)removeInheritanceAccessKeyForBeneficiaryID:(id)a3 completion:(id)a4;
@end

@implementation InheritanceSecurityManager

- (void)createInheritanceAccessKeyForContact:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = *(void **)self->controller;
  v10[4] = sub_100263D90;
  v10[5] = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10004DAE8;
  v10[3] = &unk_100303508;
  v9 = _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  [v8 createInheritanceAccessKeyForContact:a3 completion:v9];
  _Block_release(v9);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)removeInheritanceAccessKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  v13 = *(void **)self->controller;
  swift_retain();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_10009F7CC;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10025ED44;
  aBlock[3] = &unk_1003034B8;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 removeInheritanceAccessKeyForBeneficiaryID:isa completion:v15];
  _Block_release(v15);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)preflightInheritanceRecoveryForBeneficiaryID:(id)a3 accessKey:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  v15 = *(void **)self->controller;
  id v16 = a4;
  swift_retain();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_10009F7CC;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10025ED44;
  aBlock[3] = &unk_100303468;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v15 preflightInheritanceRecoveryForBeneficiaryID:isa accessKey:v16 completion:v18];
  _Block_release(v18);

  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)checkInheritanceKeyForBeneficiaryID:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  v13 = *(void **)self->controller;
  swift_retain();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  aBlock[4] = sub_10009F7CC;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10025ED44;
  aBlock[3] = &unk_100303418;
  v15 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v13 checkInheritanceKeyForBeneficiaryID:isa completion:v15];
  _Block_release(v15);
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)recreateInheritanceKeyWithAccessKey:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(void **)self->controller;
  v11[4] = sub_100263D90;
  v11[5] = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10004DAE8;
  v11[3] = &unk_1003033C8;
  uint64_t v9 = _Block_copy(v11);
  id v10 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  [v8 recreateInheritanceKeyWithAccessKey:v10 completion:v9];
  _Block_release(v9);

  swift_release();
  swift_release();
}

@end