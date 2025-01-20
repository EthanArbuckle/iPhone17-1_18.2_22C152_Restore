@interface SearchHomeUserGuidesDataFetcher
- (BOOL)isFetchingDataComplete;
- (NSArray)dataProviders;
- (SearchHomeDataFetcherDelegate)delegate;
- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)init;
- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4;
- (void)fetchContent;
- (void)setDataProviders:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFetchingDataComplete:(BOOL)a3;
@end

@implementation SearchHomeUserGuidesDataFetcher

- (SearchHomeDataFetcherDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (SearchHomeDataFetcherDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_delegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (NSArray)dataProviders
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders))
  {
    swift_bridgeObjectRetain();
    sub_1000FF33C((uint64_t *)&unk_1015CEF50);
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)setDataProviders:(id)a3
{
  if (a3)
  {
    sub_1000FF33C((uint64_t *)&unk_1015CEF50);
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_dataProviders) = v4;

  swift_bridgeObjectRelease();
}

- (BOOL)isFetchingDataComplete
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_isFetchingDataComplete);
}

- (void)setIsFetchingDataComplete:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_isFetchingDataComplete) = a3;
}

- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)initWithDelegate:(id)a3 isSearchAlongRoute:(BOOL)a4
{
  swift_unknownObjectRetain();
  v5 = (_TtC4Maps31SearchHomeUserGuidesDataFetcher *)sub_100131E50((uint64_t)a3);
  swift_unknownObjectRelease();
  return v5;
}

- (void)fetchContent
{
  NSArray v2 = self;
  sub_10013112C();
}

- (_TtC4Maps31SearchHomeUserGuidesDataFetcher)init
{
  result = (_TtC4Maps31SearchHomeUserGuidesDataFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31SearchHomeUserGuidesDataFetcher_collectionDataProvider));

  swift_bridgeObjectRelease();
}

@end