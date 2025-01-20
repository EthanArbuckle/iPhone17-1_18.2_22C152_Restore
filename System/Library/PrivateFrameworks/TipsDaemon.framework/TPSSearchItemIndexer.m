@interface TPSSearchItemIndexer
+ (TPSSearchItemIndexer)default;
- (TPSSearchItemIndexer)init;
- (TPSSearchItemIndexer)initWithName:(id)a3;
- (void)deleteAllItemsWithQualityOfService:(int64_t)a3 completionHandler:(id)a4;
- (void)indexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)indexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)reindexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
- (void)reindexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation TPSSearchItemIndexer

+ (TPSSearchItemIndexer)default
{
  if (qword_1EBFF52E0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBFF52D8;

  return (TPSSearchItemIndexer *)v2;
}

- (void)indexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1E451B798();
  unint64_t v8 = sub_1E451B948();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_1E4509624;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.indexUserGuides(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1E44A9530((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)indexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1E44A9E8C();
  unint64_t v8 = sub_1E451B948();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_1E4509624;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.indexTips(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1E44A9530((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (TPSSearchItemIndexer)initWithName:(id)a3
{
  uint64_t v3 = sub_1E451B868();
  return (TPSSearchItemIndexer *)SearchItemIndexer.init(name:)(v3, v4);
}

- (TPSSearchItemIndexer)init
{
  result = (TPSSearchItemIndexer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  swift_release();
}

- (void)reindexTips:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1E44A9E8C();
  uint64_t v8 = sub_1E451B948();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_1E4509624;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.reindexTips(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1E44A9530((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)reindexUserGuides:(id)a3 qualityOfService:(int64_t)a4 completionHandler:(id)a5
{
  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_1E451B798();
  uint64_t v8 = sub_1E451B948();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    v7 = sub_1E4509624;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  SearchItemIndexer.reindexUserGuides(_:qualityOfService:completionHandler:)(v8, a4, (uint64_t)v7, v9);
  sub_1E44A9530((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)deleteAllItemsWithQualityOfService:(int64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1E44A9E20;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  SearchItemIndexer.deleteAllItems(qualityOfService:completionHandler:)(a3, (uint64_t)v6, v7);
  sub_1E44A9530((uint64_t)v6);
}

@end