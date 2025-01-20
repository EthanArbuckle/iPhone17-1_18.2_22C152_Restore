@interface BTDevice
- (_TtC14dockaccessoryd8BTDevice)init;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3;
@end

@implementation BTDevice

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_1000F73D4(v6, (uint64_t)a4);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1000F7650(v8, v9, (uint64_t)a5);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  if (!a5)
  {
    id v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_rssi);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_rssi) = (Class)a4;
    id v6 = a4;
  }
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
}

- (_TtC14dockaccessoryd8BTDevice)init
{
  result = (_TtC14dockaccessoryd8BTDevice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000F8FDC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext), *(void *)&self->discoveryContext[OBJC_IVAR____TtC14dockaccessoryd8BTDevice_discoveryContext]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v5 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd8BTDevice_id;
  uint64_t v6 = type metadata accessor for UUID();
  id v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end