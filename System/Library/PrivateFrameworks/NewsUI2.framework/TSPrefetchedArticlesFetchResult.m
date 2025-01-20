@interface TSPrefetchedArticlesFetchResult
- (NSArray)articleIDs;
- (NSDictionary)prefetchedHeadlines;
- (NSString)selectedArticleID;
- (TSPrefetchedArticlesFetchResult)init;
- (TSPrefetchedArticlesFetchResult)initWithSelectedArticleID:(id)a3 articleIDs:(id)a4 prefetchedHeadlines:(id)a5;
@end

@implementation TSPrefetchedArticlesFetchResult

- (NSString)selectedArticleID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDCE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSArray)articleIDs
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFE200();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSDictionary)prefetchedHeadlines
{
  sub_1DEABCC20();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DFDFDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (TSPrefetchedArticlesFetchResult)initWithSelectedArticleID:(id)a3 articleIDs:(id)a4 prefetchedHeadlines:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_1DFDFDD20();
  uint64_t v9 = v8;
  v10 = (objc_class *)sub_1DFDFE220();
  sub_1DEABCC20();
  v11 = (objc_class *)sub_1DFDFDAF0();
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___TSPrefetchedArticlesFetchResult_selectedArticleID);
  uint64_t *v12 = v7;
  v12[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSPrefetchedArticlesFetchResult_articleIDs) = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSPrefetchedArticlesFetchResult_prefetchedHeadlines) = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(TSPrefetchedArticlesFetchResult *)&v14 init];
}

- (TSPrefetchedArticlesFetchResult)init
{
  result = (TSPrefetchedArticlesFetchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end