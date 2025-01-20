@interface SpotlightIndexer.IndexDelegate
- (_TtCC17IMAPSearchIndexer16SpotlightIndexer13IndexDelegate)init;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation SpotlightIndexer.IndexDelegate

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t Strong = swift_weakLoadStrong();
  id v10 = a3;
  if (Strong)
  {
    v9 = self;
    sub_1005B8220((uint64_t)sub_1005B9BD0, v7);

    swift_release();
  }
  swift_release();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  v8 = (void *)sub_1005E20C0();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t Strong = swift_weakLoadStrong();
  id v11 = a3;
  v12 = self;
  if (Strong)
  {
    sub_1005B8438(v8, (uint64_t)sub_1005B9BC0, v9);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_release();
}

- (_TtCC17IMAPSearchIndexer16SpotlightIndexer13IndexDelegate)init
{
  result = (_TtCC17IMAPSearchIndexer16SpotlightIndexer13IndexDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end