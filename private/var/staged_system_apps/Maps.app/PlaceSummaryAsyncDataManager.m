@interface PlaceSummaryAsyncDataManager
- (_TtC4Maps28PlaceSummaryAsyncDataManager)init;
- (void)loadWith:(id)a3 containerWidth:(double)a4 desiredScale:(double)a5;
@end

@implementation PlaceSummaryAsyncDataManager

- (_TtC4Maps28PlaceSummaryAsyncDataManager)init
{
  return (_TtC4Maps28PlaceSummaryAsyncDataManager *)sub_10023C08C();
}

- (void)loadWith:(id)a3 containerWidth:(double)a4 desiredScale:(double)a5
{
  id v8 = a3;
  v9 = self;
  sub_10023C168(a4, a5);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps28PlaceSummaryAsyncDataManager_mapItemDownloader);
}

@end