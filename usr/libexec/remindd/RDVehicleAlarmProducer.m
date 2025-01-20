@interface RDVehicleAlarmProducer
- (NSString)description;
- (_TtC7remindd22RDVehicleAlarmProducer)init;
- (void)dealloc;
@end

@implementation RDVehicleAlarmProducer

- (void)dealloc
{
  v2 = self;
  sub_1004B7B0C();
}

- (void).cxx_destruct
{
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd22RDVehicleAlarmProducer_dataSource);
  v3 = (char *)self + OBJC_IVAR____TtC7remindd22RDVehicleAlarmProducer_delegate;

  sub_100228E14((uint64_t)v3);
}

- (NSString)description
{
  v2 = self;
  v3._countAndFlagsBits = sub_100587438((uint64_t)v2);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 10558;
  v4._object = (void *)0xE200000000000000;
  String.append(_:)(v4);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (_TtC7remindd22RDVehicleAlarmProducer)init
{
  result = (_TtC7remindd22RDVehicleAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end