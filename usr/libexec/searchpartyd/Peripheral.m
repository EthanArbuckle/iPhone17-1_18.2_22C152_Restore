@interface Peripheral
- (NSString)description;
- (_TtC12searchpartyd10Peripheral)init;
- (void)dealloc;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3;
@end

@implementation Peripheral

- (void)dealloc
{
  uint64_t v2 = qword_101637688;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100010324(v4, (uint64_t)qword_10170F8A8);
  sub_100A3C59C(0x74696E696564, 0xE600000000000000);
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for Peripheral();
  [(Peripheral *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_lastSeen;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000A1534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_connectionPromise));
  sub_1000A1534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_disconnectionPromise));
  sub_1000A1534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_servicesPromise));
  sub_1000A1534(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd10Peripheral_sendDataPromise));
  sub_10001DAB4((uint64_t)self + OBJC_IVAR____TtC12searchpartyd10Peripheral_findMyIdentifier, &qword_101638CF0);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  uint64_t v2 = self;
  sub_100A3BDC0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC12searchpartyd10Peripheral)init
{
  result = (_TtC12searchpartyd10Peripheral *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_100A3DDBC(v6);
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_100A41708(v9);
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100A42164(v4);
}

@end