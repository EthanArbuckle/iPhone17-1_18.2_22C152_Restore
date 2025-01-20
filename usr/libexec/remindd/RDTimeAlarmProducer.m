@interface RDTimeAlarmProducer
- (NSString)description;
- (_TtC7remindd19RDTimeAlarmProducer)init;
@end

@implementation RDTimeAlarmProducer

- (NSString)description
{
  v2 = self;
  v3._countAndFlagsBits = sub_100587438((uint64_t)v2);
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 62;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (_TtC7remindd19RDTimeAlarmProducer)init
{
  result = (_TtC7remindd19RDTimeAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_dataSource);
  swift_release();
  Swift::String v3 = (char *)self + OBJC_IVAR____TtC7remindd19RDTimeAlarmProducer_delegate;

  sub_100228E14((uint64_t)v3);
}

@end