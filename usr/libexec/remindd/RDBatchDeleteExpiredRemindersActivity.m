@interface RDBatchDeleteExpiredRemindersActivity
- (_TtC7remindd37RDBatchDeleteExpiredRemindersActivity)init;
- (id)waiterID;
@end

@implementation RDBatchDeleteExpiredRemindersActivity

- (id)waiterID
{
  v2 = self;
  sub_1001C46D4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC7remindd37RDBatchDeleteExpiredRemindersActivity)init
{
  result = (_TtC7remindd37RDBatchDeleteExpiredRemindersActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_rateReducerConfiguration, (uint64_t *)&unk_10090EEB0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_executionDateStorage);
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_babysitter, (uint64_t *)&unk_10090E4D0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_storeController));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_configurations);
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd37RDBatchDeleteExpiredRemindersActivity_states);

  swift_release();
}

@end