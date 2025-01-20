@interface TPSSearchQuery
+ (BOOL)supportsSecureCoding;
+ (id)escapeSearchTerm:(id)a3;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)searchTerm;
- (TPSSearchQuery)init;
- (TPSSearchQuery)initWithCoder:(id)a3;
- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4;
- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4 options:(unint64_t)a5 matchingStyle:(int64_t)a6 contentTypeFilter:(int64_t)a7;
- (id)makeCSQueryWith:(id)a3;
- (id)rankingModifier;
- (int64_t)contentTypeFilter;
- (int64_t)hash;
- (int64_t)matchingStyle;
- (int64_t)maxCount;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setContentTypeFilter:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setMatchingStyle:(int64_t)a3;
- (void)setMaxCount:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRankingModifier:(id)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation TPSSearchQuery

- (id)makeCSQueryWith:(id)a3
{
  sub_19C9769E0();
  v4 = self;
  id v5 = sub_19C9410B4();

  swift_bridgeObjectRelease();
  return v5;
}

+ (id)escapeSearchTerm:(id)a3
{
  uint64_t v3 = sub_19C9768B0();
  sub_19C94254C(v3, v4);
  swift_bridgeObjectRelease();
  id v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return v5;
}

- (NSString)identifier
{
  return (NSString *)sub_19C93CE90();
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)searchTerm
{
  return (NSString *)sub_19C93CE90();
}

- (void)setSearchTerm:(id)a3
{
}

- (unint64_t)options
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  return *v2;
}

- (void)setOptions:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_options);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (int64_t)matchingStyle
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  return *v2;
}

- (void)setMatchingStyle:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_matchingStyle);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)contentTypeFilter
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  return *v2;
}

- (void)setContentTypeFilter:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_contentTypeFilter);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)maxCount
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  return *v2;
}

- (void)setMaxCount:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSSearchQuery_maxCount);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)isCancelled
{
  v2 = (BOOL *)self + OBJC_IVAR___TPSSearchQuery_isCancelled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCancelled:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___TPSSearchQuery_isCancelled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (id)rankingModifier
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier))
  {
    uint64_t v2 = *(void *)&self->identifier[OBJC_IVAR___TPSSearchQuery_rankingModifier];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_19C96C630;
    v5[3] = &block_descriptor_6;
    uint64_t v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)setRankingModifier:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_19C96DF54;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_19C94253C(v8);
}

- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4 options:(unint64_t)a5 matchingStyle:(int64_t)a6 contentTypeFilter:(int64_t)a7
{
  uint64_t v10 = sub_19C9768B0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_19C9768B0();
  return (TPSSearchQuery *)SearchQuery.init(identifier:searchTerm:options:matchingStyle:contentTypeFilter:)(v10, v12, v13, v14, a5, a6, a7);
}

- (TPSSearchQuery)initWithIdentifier:(id)a3 searchTerm:(id)a4
{
  sub_19C9768B0();
  sub_19C9768B0();
  uint64_t v5 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  v7 = [(TPSSearchQuery *)self initWithIdentifier:v5 searchTerm:v6 options:0 matchingStyle:0 contentTypeFilter:0];

  return v7;
}

- (NSString)description
{
  uint64_t v2 = self;
  SearchQuery.description.getter();

  uint64_t v3 = (void *)sub_19C976880();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TPSSearchQuery)init
{
  result = (TPSSearchQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchQuery_rankingModifier);
  sub_19C94253C(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  SearchQuery.encode(with:)((NSCoder)v4);
}

- (TPSSearchQuery)initWithCoder:(id)a3
{
  return (TPSSearchQuery *)SearchQuery.init(coder:)(a3);
}

- (int64_t)hash
{
  swift_beginAccess();
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  int64_t v4 = sub_19C976990();

  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    int64_t v4 = self;
    swift_unknownObjectRetain();
    sub_19C976D10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = SearchQuery.isEqual(_:)((uint64_t)v8);

  sub_19C8F58A0((uint64_t)v8);
  return v6 & 1;
}

@end