@interface RDContactInteractionAlarmProducer
- (_TtC7remindd33RDContactInteractionAlarmProducer)init;
- (void)dealloc;
@end

@implementation RDContactInteractionAlarmProducer

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_shouldNotifyOfInteractionWithPeopleNotifyToken;
  int v5 = *(_DWORD *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_shouldNotifyOfInteractionWithPeopleNotifyToken);
  v6 = self;
  if (notify_is_valid_token(v5))
  {
    notify_cancel(*(_DWORD *)((char *)&self->super.isa + v4));
    *(_DWORD *)((char *)&self->super.isa + v4) = -1;
  }
  v7.receiver = v6;
  v7.super_class = ObjectType;
  [(RDContactInteractionAlarmProducer *)&v7 dealloc];
}

- (void).cxx_destruct
{
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_dataSource);
  sub_100228E14((uint64_t)self + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_delegate);

  v3 = (char *)self + OBJC_IVAR____TtC7remindd33RDContactInteractionAlarmProducer_userInteractionSessionManager;

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)v3);
}

- (_TtC7remindd33RDContactInteractionAlarmProducer)init
{
  result = (_TtC7remindd33RDContactInteractionAlarmProducer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end