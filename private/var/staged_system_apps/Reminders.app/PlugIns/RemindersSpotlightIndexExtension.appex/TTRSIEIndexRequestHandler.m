@interface TTRSIEIndexRequestHandler
- (_TtC32RemindersSpotlightIndexExtension25TTRSIEIndexRequestHandler)init;
- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4;
- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5;
@end

@implementation TTRSIEIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_100003FE8(v7, (void (**)(void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = sub_100006A28();
  _Block_copy(v7);
  id v9 = a3;
  v10 = self;
  sub_1000042A0(v9, v8, (void (**)(void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (id)dataForSearchableIndex:(id)a3 itemIdentifier:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v8 = sub_1000069A8();
  v10 = v9;
  uint64_t v11 = sub_1000069A8();
  unint64_t v13 = v12;
  id v14 = a3;
  v15 = self;
  uint64_t v16 = sub_1000055BC(v14, v8, v10, v11, v13);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v19.super.isa = sub_100006888().super.isa;
  sub_100006400(v16, v18);

  return v19.super.isa;
}

- (_TtC32RemindersSpotlightIndexExtension25TTRSIEIndexRequestHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRSIEIndexRequestHandler();
  return [(TTRSIEIndexRequestHandler *)&v3 init];
}

@end