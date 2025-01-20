@interface KeyValueStoreCustomObserver
- (_TtC14bluetoothuserd27KeyValueStoreCustomObserver)init;
- (void)dealloc;
- (void)handleUbiquitousKeyValueStoreChangeLocallyWithNotification:(id)a3;
- (void)handleUbiquitousKeyValueStoreChangeWithNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation KeyValueStoreCustomObserver

- (void)dealloc
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  v3 = self;
  v2();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for KeyValueStoreCustomObserver();
  [(KeyValueStoreCustomObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_dispatchQueue));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd27KeyValueStoreCustomObserver_cloudDefaults));
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v12 = a5;
      v13 = self;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      if (v11) {
        goto LABEL_5;
      }
LABEL_9:

      goto LABEL_10;
    }
  }
  memset(v18, 0, sizeof(v18));
  id v16 = a5;
  v17 = self;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey();
  sub_100007DEC(&qword_10008E8C8, (void (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  sub_10000423C((uint64_t *)&unk_10008F630);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1000747D0;
  *(void *)(v14 + 32) = v9;
  *(void *)(v14 + 40) = v11;
  v15 = *(void (**)(uint64_t, uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0x108);
  swift_bridgeObjectRetain();
  v15(2, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  sub_100007A24((uint64_t)v18);
}

- (void)handleUbiquitousKeyValueStoreChangeWithNotification:(id)a3
{
}

- (void)handleUbiquitousKeyValueStoreChangeLocallyWithNotification:(id)a3
{
}

- (_TtC14bluetoothuserd27KeyValueStoreCustomObserver)init
{
  result = (_TtC14bluetoothuserd27KeyValueStoreCustomObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end