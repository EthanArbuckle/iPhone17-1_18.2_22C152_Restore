@interface IndexRequestHandler
- (_TtC18TipsSpotlightIndex19IndexRequestHandler)init;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation IndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100003278((uint64_t)sub_100003874, v7);

  swift_release();
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1000038F8();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v10 = a3;
  v11 = self;
  sub_100003430(v8, (uint64_t)sub_100003268, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC18TipsSpotlightIndex19IndexRequestHandler)init
{
  uint64_t v3 = OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient;
  id v4 = objc_allocWithZone((Class)TPSSearchQueryClient);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)[v4 init];

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for IndexRequestHandler();
  return [(IndexRequestHandler *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18TipsSpotlightIndex19IndexRequestHandler_searchQueryClient));
}

@end