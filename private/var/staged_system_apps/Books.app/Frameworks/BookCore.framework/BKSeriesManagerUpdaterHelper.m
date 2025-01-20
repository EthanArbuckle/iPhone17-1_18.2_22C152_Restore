@interface BKSeriesManagerUpdaterHelper
+ (void)gatherAllAssetAdamIDsInSeries:(NSDictionary *)a3 completion:(id)a4;
+ (void)updateSeries:(id)a3 withResource:(id)a4 inMoc:(id)a5;
- (BKSeriesManagerUpdaterHelper)init;
@end

@implementation BKSeriesManagerUpdaterHelper

+ (void)gatherAllAssetAdamIDsInSeries:(NSDictionary *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_344910;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_344750;
  v14[5] = v13;
  v15 = a3;
  sub_1D2630((uint64_t)v9, (uint64_t)&unk_344920, (uint64_t)v14);
  swift_release();
}

+ (void)updateSeries:(id)a3 withResource:(id)a4 inMoc:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  _s8BookCore26SeriesManagerUpdaterHelperC6update_4with2inySo12BKSeriesItemC_So9BFMSeries_pSo0J28DatabaseManagedObjectContextCtFZ_0(v7, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (BKSeriesManagerUpdaterHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SeriesManagerUpdaterHelper();
  return [(BKSeriesManagerUpdaterHelper *)&v3 init];
}

@end