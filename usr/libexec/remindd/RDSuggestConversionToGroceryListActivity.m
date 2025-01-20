@interface RDSuggestConversionToGroceryListActivity
- (_TtC7remindd40RDSuggestConversionToGroceryListActivity)init;
- (id)waiterID;
@end

@implementation RDSuggestConversionToGroceryListActivity

- (id)waiterID
{
  v2 = self;
  sub_10067AE40();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC7remindd40RDSuggestConversionToGroceryListActivity)init
{
  result = (_TtC7remindd40RDSuggestConversionToGroceryListActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_rateReducerConfiguration, (uint64_t *)&unk_10090EEB0);
  swift_bridgeObjectRelease();
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_executionDateStorage);
  sub_1000966BC((uint64_t)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_babysitter, (uint64_t *)&unk_10090E4D0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_storeController));
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_configurations);
  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_states);
  swift_release();
  NSString v3 = (char *)self + OBJC_IVAR____TtC7remindd40RDSuggestConversionToGroceryListActivity_userDefaults;

  _s7remindd37RDStaledFileAttachmentCleanupActivityC40RDStaledFileAttachmentCleanupRateReducerVwxx_0((uint64_t)v3);
}

@end