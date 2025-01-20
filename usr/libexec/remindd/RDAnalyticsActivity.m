@interface RDAnalyticsActivity
- (_TtC7remindd19RDAnalyticsActivity)init;
- (id)waiterID;
@end

@implementation RDAnalyticsActivity

- (id)waiterID
{
  v2 = self;
  sub_1003EE18C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC7remindd19RDAnalyticsActivity)init
{
  result = (_TtC7remindd19RDAnalyticsActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_rateReducerConfiguration, (uint64_t *)&unk_10090EEB0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_executionDateStorage);
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_babysitter, (uint64_t *)&unk_10090E4D0);

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_configurations);
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_states);
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDAnalyticsActivity_executable);
}

@end