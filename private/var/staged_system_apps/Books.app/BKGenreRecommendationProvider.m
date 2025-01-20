@interface BKGenreRecommendationProvider
- (BKGenreRecommendationProvider)init;
- (void)recommendedGenreCollectionsFor:(id)a3 :(id)a4;
- (void)recommendedGenresWith:(id)a3;
@end

@implementation BKGenreRecommendationProvider

- (void)recommendedGenreCollectionsFor:(id)a3 :(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = self;
  v12[7] = ObjectType;
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  id v16 = v13;
  id v17 = v14;
  v18 = v15;
  sub_10004BC14((uint64_t)v10, (uint64_t)&unk_100B33F40, (uint64_t)v12);

  swift_release();
}

- (BKGenreRecommendationProvider)init
{
  v3 = (char *)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___recommendationManager;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v4 = (char *)self + OBJC_IVAR___BKGenreRecommendationProvider____lazy_storage___collectionRecommendationService;
  v5 = (objc_class *)type metadata accessor for GenreRecommendationProvider();
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(BKGenreRecommendationProvider *)&v7 init];
}

- (void)recommendedGenresWith:(id)a3
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v6 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = ObjectType;
  id v11 = a3;
  v12 = self;
  id v13 = v11;
  sub_10004BC14((uint64_t)v8, (uint64_t)&unk_100B33F70, (uint64_t)v10);

  swift_release();
}

- (void).cxx_destruct
{
}

@end