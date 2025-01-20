@interface TPSSearchResult
+ (BOOL)supportsSecureCoding;
+ (id)makeResultWith:(id)a3 items:(id)a4 suggestions:(id)a5;
- (NSArray)items;
- (NSArray)suggestions;
- (NSString)description;
- (TPSSearchQuery)query;
- (TPSSearchResult)init;
- (TPSSearchResult)initWithCoder:(id)a3;
- (TPSSearchResult)initWithQuery:(id)a3 items:(id)a4 suggestions:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setItems:(id)a3;
- (void)setQuery:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation TPSSearchResult

- (NSArray)items
{
  swift_beginAccess();
  type metadata accessor for SearchResult.Item();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setItems:(id)a3
{
  type metadata accessor for SearchResult.Item();
  uint64_t v4 = sub_19C9769E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResult_items);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSArray)suggestions
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_19C9769D0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSuggestions:(id)a3
{
  uint64_t v4 = sub_19C9769E0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResult_suggestions);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (TPSSearchQuery)query
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  return (TPSSearchQuery *)*v2;
}

- (void)setQuery:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResult_query);
  swift_beginAccess();
  v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (TPSSearchResult)initWithQuery:(id)a3 items:(id)a4 suggestions:(id)a5
{
  type metadata accessor for SearchResult.Item();
  uint64_t v6 = sub_19C9769E0();
  uint64_t v7 = sub_19C9769E0();
  id v8 = a3;
  v9 = (TPSSearchResult *)sub_19C940DC4(v8, v6, v7);

  return v9;
}

- (TPSSearchResult)init
{
  result = (TPSSearchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResult_query);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SearchResult.encode(with:)((NSCoder)v4);
}

- (TPSSearchResult)initWithCoder:(id)a3
{
  return (TPSSearchResult *)SearchResult.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19C940AA4(self, (uint64_t)a2, (void (*)(void))SearchResult.description.getter);
}

+ (id)makeResultWith:(id)a3 items:(id)a4 suggestions:(id)a5
{
  sub_19C968270();
  uint64_t v6 = sub_19C9769E0();
  uint64_t v7 = sub_19C9769E0();
  id v8 = (char *)a3;
  id v9 = sub_19C96AE38(v8, v6, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

@end