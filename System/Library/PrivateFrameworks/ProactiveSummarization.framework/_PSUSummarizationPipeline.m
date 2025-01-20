@interface _PSUSummarizationPipeline
- (_PSUSummarizationPipeline)init;
- (_PSUSummarizationPipeline)initWithContactStore:(id)a3;
- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)processItem:(id)a3;
@end

@implementation _PSUSummarizationPipeline

- (_PSUSummarizationPipeline)initWithContactStore:(id)a3
{
  id v3 = a3;
  SummarizationPipeline.init(contactStore:)();
  return result;
}

- (void)processItem:(id)a3
{
  id v5 = a3;
  v4 = self;
  SummarizationPipeline.processItem(_:)((CSSearchableItem)v5);
}

- (void)handleDeletionOfItemsWithIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = sub_25A9DD178();
  uint64_t v6 = sub_25A9DCF68();
  v8 = v7;
  v10 = self;
  v9._countAndFlagsBits = v6;
  v9._object = v8;
  SummarizationPipeline.handleDeletionOfItems(withIdentifiers:bundleIdentifier:)((Swift::OpaquePointer)v5, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_PSUSummarizationPipeline)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____PSUSummarizationPipeline_smartRepliesPrecomputationDatabase));

  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____PSUSummarizationPipeline_mailUrgencyContextProducer);
}

@end