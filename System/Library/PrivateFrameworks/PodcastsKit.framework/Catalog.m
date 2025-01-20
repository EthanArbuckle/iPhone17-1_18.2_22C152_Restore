@interface Catalog
- (_TtC11PodcastsKit7Catalog)init;
- (void)fetchEpisodesWithStoreIds:(id)a3 resultsHandler:(id)a4;
- (void)fetchShowsWithStoreIds:(id)a3 resultsHandler:(id)a4;
@end

@implementation Catalog

- (void)fetchEpisodesWithStoreIds:(id)a3 resultsHandler:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for StoreId();
  unint64_t v6 = sub_23F0BF780();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_23F0B9834(v6, (uint64_t)sub_23F0B2C70, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)fetchShowsWithStoreIds:(id)a3 resultsHandler:(id)a4
{
  v5 = _Block_copy(a4);
  type metadata accessor for StoreId();
  unint64_t v6 = sub_23F0BF780();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_23F0B9860(v6, (uint64_t)sub_23F0B2C40, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC11PodcastsKit7Catalog)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Catalog();
  return [(Catalog *)&v3 init];
}

@end