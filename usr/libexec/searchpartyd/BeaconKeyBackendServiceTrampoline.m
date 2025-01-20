@interface BeaconKeyBackendServiceTrampoline
- (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline)init;
- (void)beaconInfoWithBeaconIdentifierData:(id)a3 completion:(id)a4;
- (void)beaconInfoWithCompletion:(id)a3;
- (void)setWithUserIdentifier:(id)a3 beaconsData:(id)a4 completion:(id)a5;
@end

@implementation BeaconKeyBackendServiceTrampoline

- (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline)init
{
  result = (_TtC12searchpartyd33BeaconKeyBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)setWithUserIdentifier:(id)a3 beaconsData:(id)a4 completion:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  v12 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v27 - v13;
  v15 = _Block_copy(a5);
  v28 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v16 = a4;
  v17 = self;
  uint64_t v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v20 = v19;

  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v15;
  uint64_t v27 = type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v22 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v23 = (v10 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = v18;
  *((void *)v24 + 3) = v20;
  *((void *)v24 + 4) = v17;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v24[v22], v12, v8);
  v25 = (void (**)(uint64_t))&v24[v23];
  *v25 = sub_1001DF814;
  v25[1] = (void (*)(uint64_t))v21;
  v26 = v17;
  sub_1000361E0(v18, v20);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v18, v20);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v28, v8);
}

- (void)beaconInfoWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  type metadata accessor for Transaction();
  v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_100FCFD5C;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();

  swift_release();
}

- (void)beaconInfoWithBeaconIdentifierData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v6;
  type metadata accessor for Transaction();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100FCF478;
  v13[6] = v12;
  v14 = v8;
  sub_1000361E0(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)();
  swift_release();
  swift_release();
  sub_10001CFB8(v9, v11);
}

@end