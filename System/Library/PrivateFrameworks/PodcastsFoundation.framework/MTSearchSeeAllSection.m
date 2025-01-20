@interface MTSearchSeeAllSection
- (MTSearchSeeAllSection)init;
- (MTSearchSeeAllSection)initWithContentType:(int64_t)a3 nextPage:(id)a4;
- (NSString)nextPage;
- (int64_t)contentType;
@end

@implementation MTSearchSeeAllSection

- (int64_t)contentType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___MTSearchSeeAllSection_contentType);
}

- (NSString)nextPage
{
  if (*(void *)&self->contentType[OBJC_IVAR___MTSearchSeeAllSection_nextPage])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1ACE76178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (MTSearchSeeAllSection)initWithContentType:(int64_t)a3 nextPage:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1ACE761B8();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MTSearchSeeAllSection_contentType) = (Class)a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___MTSearchSeeAllSection_nextPage);
  uint64_t *v8 = v6;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SearchSeeAllSection();
  return [(MTSearchSeeAllSection *)&v10 init];
}

- (MTSearchSeeAllSection)init
{
  result = (MTSearchSeeAllSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end