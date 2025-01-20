@interface AccessoryDiscoveryTrampoline
- (_TtC12searchpartyd28AccessoryDiscoveryTrampoline)init;
- (void)disableFindMyPairingWithIdentifier:(id)a3;
- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)initiatePairingAndLocateAccessoryWithIdentifier:(id)a3 completion:(id)a4;
- (void)initiatePairingWith:(id)a3 completion:(id)a4;
- (void)invalidatePairingWith:(id)a3 completion:(id)a4;
- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4;
- (void)startAccessoryDiscoveryWithCompletion:(id)a3;
- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3;
- (void)stopAccessoryDiscoveryWithCompletion:(id)a3;
- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3;
@end

@implementation AccessoryDiscoveryTrampoline

- (void)startAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)stopAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)initiatePairingWith:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100DFA7B4(v8, (uint64_t)sub_1001DF814, v7);

  swift_release();
}

- (void)startLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)stopLocalFindableAccessoryDiscoveryWithCompletion:(id)a3
{
}

- (void)disableFindMyPairingWithIdentifier:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100E01B20((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)initiatePairingAndLocateAccessoryWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = __chkstk_darwin(v6);
  v10 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - v11;
  v13 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  type metadata accessor for Transaction();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  unint64_t v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  unint64_t v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v17 + v15, v10, v6);
  v18 = (void (**)(uint64_t, uint64_t))(v17 + v16);
  *v18 = sub_1006D61B0;
  v18[1] = (void (*)(uint64_t, uint64_t))v14;
  v19 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)pairingStatusWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1006D5C70(v8, (uint64_t)sub_1001DFD28, v7);

  swift_release();
}

- (void)finalizePairingWith:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v8);
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_100E01DA0(v10, v11, v9, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (void)invalidatePairingWith:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12searchpartyd28AccessoryDiscoveryTrampoline_implementation);
  _Block_copy(v6);
  id v8 = a3;
  uint64_t v9 = self;
  sub_100E01F84(v8, v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC12searchpartyd28AccessoryDiscoveryTrampoline)init
{
  result = (_TtC12searchpartyd28AccessoryDiscoveryTrampoline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end