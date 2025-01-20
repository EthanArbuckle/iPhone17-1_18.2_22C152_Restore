@interface BKBookRecommendationProvider
- (BKBookRecommendationProvider)init;
- (void)audiobooksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4;
- (void)booksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4;
- (void)filterWithAssetIDs:(id)a3 features:(id)a4 completion:(id)a5;
- (void)moreFromYourAuthorsWithConfiguration:(id)a3 completion:(id)a4;
- (void)postHydrationFilteredListWithPicks:(id)a3 collectionType:(id)a4 completion:(id)a5;
- (void)postHydrationFilteredListWithPicks:(id)a3 completion:(id)a4;
- (void)siriSuggestedTopPicksWithConfiguration:(id)a3 completion:(id)a4;
- (void)suggestionsTopPicksCollectionsWithConfiguration:(id)a3 completion:(id)a4;
- (void)suggestionsTopPicksWithConfiguration:(id)a3 completion:(id)a4;
@end

@implementation BKBookRecommendationProvider

- (BKBookRecommendationProvider)init
{
  v3 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___recommendationService;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v4 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___collectionRecommendationService;
  *((void *)v4 + 4) = 0;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v5 = (char *)self + OBJC_IVAR___BKBookRecommendationProvider____lazy_storage___postHydrationFilteringService;
  v6 = (objc_class *)type metadata accessor for BookRecommendationProvider();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(BKBookRecommendationProvider *)&v8 init];
}

- (void)suggestionsTopPicksWithConfiguration:(id)a3 completion:(id)a4
{
}

- (void)booksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4
{
}

- (void)filterWithAssetIDs:(id)a3 features:(id)a4 completion:(id)a5
{
  uint64_t v7 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1007FDFF0();
  uint64_t v11 = sub_1007FDFF0();
  uint64_t v12 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v10;
  v13[5] = self;
  v13[6] = v11;
  v13[7] = a5;
  id v14 = a5;
  v15 = self;
  id v16 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10004BC14((uint64_t)v9, (uint64_t)&unk_100B416F0, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)audiobooksYouMightLikeWithConfiguration:(id)a3 completion:(id)a4
{
}

- (void)moreFromYourAuthorsWithConfiguration:(id)a3 completion:(id)a4
{
}

- (void)siriSuggestedTopPicksWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_1007FDA70();
  uint64_t v7 = (objc_class *)a4;
  uint64_t v8 = self;
  sub_10001C800(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)suggestionsTopPicksCollectionsWithConfiguration:(id)a3 completion:(id)a4
{
}

- (void)postHydrationFilteredListWithPicks:(id)a3 completion:(id)a4
{
  unint64_t v6 = sub_1007FDFF0();
  id v7 = a4;
  uint64_t v8 = self;
  sub_1006828BC(v6, 0, 0, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)postHydrationFilteredListWithPicks:(id)a3 collectionType:(id)a4 completion:(id)a5
{
  unint64_t v7 = sub_1007FDFF0();
  uint64_t v8 = sub_1007FDC70();
  uint64_t v10 = v9;
  id v11 = a5;
  uint64_t v12 = self;
  sub_1006828BC(v7, v8, v10, (uint64_t)v11);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end