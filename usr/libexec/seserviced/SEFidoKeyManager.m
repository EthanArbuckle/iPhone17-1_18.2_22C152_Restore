@interface SEFidoKeyManager
+ (_TtC10seserviced16SEFidoKeyManager)singleton;
- (BOOL)deleteKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 error:(id *)a6;
- (BOOL)storeKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 keyData:(id)a6 error:(id *)a7;
- (_TtC10seserviced16SEFidoKeyManager)init;
- (id)createFidoAttestationWithSecureElement:(id)a3 instanceAID:(id)a4 fidoKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 error:(id *)a9;
- (id)findKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 secureElement:(id)a6 error:(id *)a7;
- (id)performFidoSignatureWithSecureElement:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 ptaEndPointIdentifierForExtension:(id)a9 externalizedAuth:(id)a10 error:(id *)a11;
- (id)performFidoVerificationWithPublicKey:(id)a3 signedChallenge:(id)a4 error:(id *)a5;
- (void)reportCAEvent:(id)a3;
- (void)reportCAEvent:(id)a3 count:(int64_t)a4;
@end

@implementation SEFidoKeyManager

- (void)reportCAEvent:(id)a3 count:(int64_t)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  sub_10006C51C(&qword_100455670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100378290;
  v8 = self;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = a4;
  sub_1001DB24C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_100050700(v6, isa);

  swift_bridgeObjectRelease();
}

- (void)reportCAEvent:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  sub_10006C51C(&qword_100455670);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100378290;
  uint64_t v6 = self;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 96) = &type metadata for Int;
  *(void *)(inited + 72) = 1;
  sub_1001DB24C(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_100050700(v4, isa);

  swift_bridgeObjectRelease();
}

+ (_TtC10seserviced16SEFidoKeyManager)singleton
{
  if (qword_100453900 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100468A20;

  return (_TtC10seserviced16SEFidoKeyManager *)v2;
}

- (id)createFidoAttestationWithSecureElement:(id)a3 instanceAID:(id)a4 fidoKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 error:(id *)a9
{
  id v35 = a3;
  id v15 = a4;
  id v34 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = self;
  uint64_t v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v22 = v21;

  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v24 = v23;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v27 = v26;

  uint64_t v28 = sub_10029C2CC(v35, v20, v22, v34, v33, v24);
  unint64_t v30 = v29;

  sub_10006D144(v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10006D144(v20, v22);
  v31.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10006D144(v28, v30);

  return v31.super.isa;
}

- (id)performFidoSignatureWithSecureElement:(id)a3 instanceAID:(id)a4 loadedKey:(id)a5 relyingParty:(id)a6 relyingPartyAccountHash:(id)a7 challenge:(id)a8 ptaEndPointIdentifierForExtension:(id)a9 externalizedAuth:(id)a10 error:(id *)a11
{
  id v47 = a3;
  id v43 = a4;
  id v46 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  unint64_t v21 = self;
  id v22 = a9;
  uint64_t v45 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v24 = v23;

  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  uint64_t v28 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v30 = v29;

  if (v22)
  {
    uint64_t v42 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v44 = v31;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v44 = 0xF000000000000000;
  }
  uint64_t v32 = v25;
  uint64_t v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v35 = v34;

  v36 = sub_1002A1DE8(v47, v45, v24, v46, v32, v27);
  unint64_t v40 = v37;
  uint64_t v41 = (uint64_t)v36;

  sub_10006D144(v33, v35);
  sub_100075868(v42, v44);
  sub_10006D144(v28, v30);
  swift_bridgeObjectRelease();
  sub_10006D144(v45, v24);
  v38.super.Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10006D144(v41, v40);

  return v38.super.isa;
}

- (id)performFidoVerificationWithPublicKey:(id)a3 signedChallenge:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;

  id v16 = (void *)sub_10029D0A0(v10, v12, v13, v15);
  sub_10006D144(v13, v15);
  sub_10006D144(v10, v12);

  return v16;
}

- (id)findKeyForRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 secureElement:(id)a6 error:(id *)a7
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;
  id v16 = a6;
  id v17 = self;
  if (a5)
  {
    id v18 = a5;
    uint64_t v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    unint64_t v21 = 0xF000000000000000;
  }
  uint64_t v22 = sub_10029D9B8(v10, v12, v13, v15, v19, v21, a6);
  unint64_t v24 = v23;
  if (v23 >> 60 == 15)
  {
    sub_10007582C(0, (unint64_t *)&qword_100454598);
    sub_100299FAC(0, 1, 0x20746F6E2079654BLL, 0xEE003F646E756F66, 0);
    swift_willThrow();

    sub_100075868(v19, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (a7)
    {
      uint64_t v25 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      id v26 = v25;
      Class isa = 0;
      *a7 = v25;
    }
    else
    {
      swift_errorRelease();
      Class isa = 0;
    }
  }
  else
  {
    uint64_t v28 = v22;

    sub_100075868(v19, v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100075868(v28, v24);
  }

  return isa;
}

- (BOOL)storeKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 keyData:(id)a6 error:(id *)a7
{
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  id v15 = a5;
  id v16 = a6;
  id v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v23 = v22;

  sub_10029E780(v25, v11, v12, v14, v18, v20, v21, v23);
  sub_10006D144(v21, v23);
  sub_10006D144(v18, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deleteKeyWithRelyingParty:(id)a3 relyingPartyAccountHash:(id)a4 fidoKeyHash:(id)a5 error:(id *)a6
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  id v14 = a5;
  id v15 = self;
  uint64_t v16 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v18 = v17;

  sub_10029EF30(v8, v10, v11, v13, v16, v18);
  sub_10006D144(v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC10seserviced16SEFidoKeyManager)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainGroup);
  void *v3 = 0xD000000000000026;
  v3[1] = 0x80000001003BC680;
  uint64_t v4 = OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_keychainWrapper;
  v5 = self;
  uint64_t v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)[v5 sharedInstance];
  String.init(cString:)();
  Logger.init(subsystem:category:)();

  v8.receiver = v6;
  v8.super_class = (Class)type metadata accessor for SEFidoKeyManager();
  return [(SEFidoKeyManager *)&v8 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced16SEFidoKeyManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end