@interface BKMediaTypeRecommendationProvider
- (BKMediaTypeRecommendationProvider)init;
- (void)recommendedMediaTypeWith:(id)a3;
@end

@implementation BKMediaTypeRecommendationProvider

- (BKMediaTypeRecommendationProvider)init
{
  v3 = (char *)self + OBJC_IVAR___BKMediaTypeRecommendationProvider____lazy_storage___recommendationService;
  v4 = (objc_class *)type metadata accessor for MediaTypeRecommendationProvider();
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *((void *)v3 + 4) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(BKMediaTypeRecommendationProvider *)&v6 init];
}

- (void)recommendedMediaTypeWith:(id)a3
{
  uint64_t v5 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = a3;
  id v10 = a3;
  v11 = self;
  id v12 = v10;
  sub_10001C534((uint64_t)v7, (uint64_t)&unk_100B3F8A8, (uint64_t)v9);
  swift_release();
  sub_10005AFE8((uint64_t)v7, &qword_100B27720);
}

- (void).cxx_destruct
{
}

@end