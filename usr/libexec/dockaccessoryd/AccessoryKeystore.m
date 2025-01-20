@interface AccessoryKeystore
- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3;
- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4;
- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4;
- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8;
- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4;
- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4;
- (BOOL)removeAllAccessoryKeys:(id *)a3;
- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5;
- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4;
- (BOOL)removeControllerKeyPairWithError:(id *)a3;
- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5;
- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 error:(id *)a5;
- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5;
- (BOOL)updateActiveControllerPairingIdentifier:(id)a3;
- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8;
- (NSString)activeControllerPairingIdentifier;
- (_TtC14dockaccessoryd17AccessoryKeystore)init;
- (id)getAssociatedControllerKeyForAccessory:(id)a3;
- (id)getLocalPairingIdentity:(id *)a3;
- (id)getOrCreateLocalPairingIdentity:(id *)a3;
- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4;
- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6;
- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5;
@end

@implementation AccessoryKeystore

- (_TtC14dockaccessoryd17AccessoryKeystore)init
{
  return (_TtC14dockaccessoryd17AccessoryKeystore *)sub_10017995C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)getLocalPairingIdentity:(id *)a3
{
  return sub_10017A068(self, (uint64_t)a2, (uint64_t)a3, sub_100179C94);
}

- (id)getOrCreateLocalPairingIdentity:(id *)a3
{
  return sub_10017A068(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_100179E6C);
}

- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = self;
  sub_10017E25C(a3);

  return 1;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8
{
  if (a7)
  {
    v13 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = self;
  sub_10017A1B4(a3, a4, a5, a6, v13, v15);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)updateActiveControllerPairingIdentifier:(id)a3
{
  if (a3
    && (v3 = self,
        self = (_TtC14dockaccessoryd17AccessoryKeystore *)static String._unconditionallyBridgeFromObjectiveC(_:)(),
        v4))
  {
    v5 = self;
    uint64_t v6 = v4;
    id v7 = (char *)v3 + OBJC_IVAR____TtC14dockaccessoryd17AccessoryKeystore__activeController;
    BOOL v8 = *(_TtC14dockaccessoryd17AccessoryKeystore **)v7 == self && v4 == *((void *)v7 + 1);
    if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      LOBYTE(self) = 0;
    }
    else
    {
      *(void *)id v7 = v5;
      *((void *)v7 + 1) = v6;
      swift_bridgeObjectRelease();
      LOBYTE(self) = 1;
    }
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (NSString)activeControllerPairingIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)removeControllerKeyPairWithError:(id *)a3
{
  v3 = self;
  sub_100179658(0, 0);

  return 1;
}

- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4
{
  uint64_t v4 = self;
  sub_100179658(0, 0);

  return 1;
}

- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    BOOL v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    BOOL v8 = 0;
  }
  v9 = self;
  sub_100179658(v6, v8);

  swift_bridgeObjectRelease();
  return 1;
}

- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    BOOL v8 = v7;
    v9 = self;
    sub_100178D18(v6, v8, 0);
    id v14 = *(id *)(v13 + 32);
    swift_bridgeObjectRelease();

    swift_release();
  }
  else
  {
    sub_1000B8650();
    swift_allocError();
    unsigned char *v12 = 2;
    swift_willThrow();
    if (a4)
    {
      v10 = (void *)_convertErrorToNSError(_:)();
      swift_errorRelease();
      id v11 = v10;
      id v14 = 0;
      *a4 = v10;
    }
    else
    {
      swift_errorRelease();
      id v14 = 0;
    }
  }

  return v14;
}

- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    BOOL v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    BOOL v8 = 0;
  }
  v9 = self;
  uint64_t v10 = sub_10017E818(v6, v8);
  unint64_t v12 = v11;

  swift_bridgeObjectRelease();
  v13.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1000A6240(v10, v12);

  return v13.super.isa;
}

- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  if (!a3)
  {
    id v16 = a4;
    v17 = self;
    unint64_t v12 = 0xF000000000000000;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v13 = 0;
    uint64_t v15 = 0;
    goto LABEL_6;
  }
  id v8 = a4;
  v9 = self;
  id v10 = v6;
  uint64_t v6 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

LABEL_6:
  sub_10017A850((uint64_t)v6, v12, v13, v15);

  swift_bridgeObjectRelease();
  sub_1000A9990((uint64_t)v6, v12);
  return 1;
}

- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  sub_10017AADC(a3);

  return 1;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4
{
  if (a3)
  {
    id v6 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = v7;
  }
  else
  {
    id v6 = 0;
    id v8 = 0;
  }
  v9 = self;
  char v10 = sub_10017ADF8(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v5 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v7 = v6;
  }
  else
  {
    v5 = 0;
    id v7 = 0;
  }
  id v8 = self;
  sub_100179324(v5, v7);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)removeAllAccessoryKeys:(id *)a3
{
  v3 = self;
  sub_100179324(0, 0);

  return 1;
}

- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v8 = sub_1000992E8(&qword_1002AAA20);
  __chkstk_darwin(v8 - 8);
  char v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  }
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v15 = self;
  sub_10017B0CC((uint64_t)v10, (uint64_t)a4, v14);
  sub_1000A61E4((uint64_t)v10, &qword_1002AAA20);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_10017BAA0(v5, v7);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3
{
  v3 = self;
  sub_10017BDB8();

  return 1;
}

- (id)getAssociatedControllerKeyForAccessory:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (const void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
    unint64_t v7 = self;
    sub_100178D18(v4, v6, 0);
    id v9 = *(id *)(v8 + 32);

    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    a3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v13 = v12;
  }
  else
  {
    unint64_t v13 = 0;
  }
  unint64_t v14 = self;
  sub_10017C130((uint64_t)a3, v13, (uint64_t)v11);

  swift_bridgeObjectRelease();
  v15.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v15.super.isa;
}

- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8
{
  uint64_t v13 = sub_1000992E8(&qword_1002AAA20);
  __chkstk_darwin(v13 - 8);
  NSUUID v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v16 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
  }
  else
  {
    uint64_t v17 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  if (a4)
  {
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  v20 = self;
  sub_10017E984((uint64_t)v15, v18, (unint64_t)a4, a5, a7);
  sub_1000A61E4((uint64_t)v15, &qword_1002AAA20);

  swift_bridgeObjectRelease();
  return 1;
}

@end