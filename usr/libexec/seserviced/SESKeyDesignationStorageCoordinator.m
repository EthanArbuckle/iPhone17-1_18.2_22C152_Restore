@interface SESKeyDesignationStorageCoordinator
+ (id)getAndReturnError:(id *)a3;
- (_TtC10seserviced35SESKeyDesignationStorageCoordinator)init;
- (id)findKeyWithKeyIdentifier:(id)a3;
- (void)commit;
- (void)designateKeyWithAid:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9;
- (void)removeDesignationWithKeyIdentifier:(id)a3;
- (void)removeWithDesignation:(int64_t)a3;
@end

@implementation SESKeyDesignationStorageCoordinator

+ (id)getAndReturnError:(id *)a3
{
  id v3 = sub_1001111E4();

  return v3;
}

- (id)findKeyWithKeyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  swift_beginAccess();
  sub_10006D0EC(v6, v8);
  unint64_t v9 = swift_bridgeObjectRetain();
  v10 = sub_100110C0C(v9, v6, v8);
  sub_10006D144(v6, v8);
  swift_bridgeObjectRelease();
  sub_10006D144(v6, v8);

  return v10;
}

- (void)designateKeyWithAid:(id)a3 slotNumber:(int64_t)a4 keyIdentifier:(id)a5 assetACL:(id)a6 assetACLAttestation:(id)a7 operationApprovalVersion:(int64_t)a8 designation:(int64_t)a9
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31 = self;
  uint64_t v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v19 = v18;

  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v25 = v24;

  uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v28 = v27;

  sub_10010EAC8(v17, v19, a4, v20, v22, v23, v25, v26, v28, a8, (id)a9);
  sub_10006D144(v26, v28);
  sub_10006D144(v23, v25);
  sub_10006D144(v20, v22);
  sub_10006D144(v17, v19);
}

- (void)removeDesignationWithKeyIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  unint64_t v9 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_keys);
  swift_beginAccess();
  sub_10006D0EC(v6, v8);
  uint64_t v10 = sub_1001118A4(v9, v6, v8);
  sub_10006D144(v6, v8);
  if ((unint64_t)*v9 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v11 >= v10) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v11 >= v10)
    {
LABEL_3:
      sub_1002D274C(v10, v11);
      swift_endAccess();
      *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated) = 1;
      sub_10006D144(v6, v8);

      return;
    }
  }
  __break(1u);
}

- (void)removeWithDesignation:(int64_t)a3
{
  id v4 = self;
  sub_100110578((id)a3);
}

- (void)commit
{
  uint64_t v2 = OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated;
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10seserviced35SESKeyDesignationStorageCoordinator_mutated) == 1)
  {
    swift_beginAccess();
    sub_1001112F0();
    id v4 = self;
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    SESDesignatedKeyCommit();

    *((unsigned char *)&self->super.isa + v2) = 0;
  }
}

- (_TtC10seserviced35SESKeyDesignationStorageCoordinator)init
{
  result = (_TtC10seserviced35SESKeyDesignationStorageCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end