@interface RDStaledFileAttachmentCleanupActivity
- (_TtC7remindd37RDStaledFileAttachmentCleanupActivity)init;
- (id)waiterID;
@end

@implementation RDStaledFileAttachmentCleanupActivity

- (id)waiterID
{
  v2 = self;
  sub_1001B0880();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC7remindd37RDStaledFileAttachmentCleanupActivity)init
{
  result = (_TtC7remindd37RDStaledFileAttachmentCleanupActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_rateReducerConfiguration, (uint64_t *)&unk_10090EEB0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_executionDateStorage);
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_babysitter, (uint64_t *)&unk_10090E4D0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_storeController));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_configurations);
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDStaledFileAttachmentCleanupActivity_states);

  swift_release();
}

@end