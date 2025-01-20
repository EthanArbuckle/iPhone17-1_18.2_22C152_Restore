@interface TPSSearchResultItem
+ (BOOL)supportsSecureCoding;
- (NSString)body;
- (NSString)collectionIdentifier;
- (NSString)contentType;
- (NSString)correlationIdentifier;
- (NSString)description;
- (NSString)documentIdentifier;
- (NSString)title;
- (TPSSearchResultItem)init;
- (TPSSearchResultItem)initWithCoder:(id)a3;
- (TPSSearchResultItem)initWithIdentifier:(id)a3 collectionIdentifier:(id)a4;
- (double)relevance;
- (void)encodeWithCoder:(id)a3;
- (void)setBody:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setContentType:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setRelevance:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation TPSSearchResultItem

- (NSString)documentIdentifier
{
  return (NSString *)sub_19C93CE90();
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (NSString)collectionIdentifier
{
  return (NSString *)sub_19C93CE90();
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (NSString)correlationIdentifier
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (NSString)contentType
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_contentType);
}

- (void)setContentType:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return (NSString *)sub_19C937024((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_body);
}

- (void)setBody:(id)a3
{
}

- (double)relevance
{
  v2 = (double *)((char *)self + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  return *v2;
}

- (void)setRelevance:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  double *v4 = a3;
}

- (TPSSearchResultItem)initWithIdentifier:(id)a3 collectionIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_19C9768B0();
  uint64_t v8 = v7;
  uint64_t v9 = sub_19C9768B0();
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
  void *v10 = 0;
  v10[1] = 0;
  v11 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_contentType);
  void *v11 = 0;
  v11[1] = 0;
  v12 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_title);
  void *v12 = 0;
  v12[1] = 0;
  v13 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_body);
  void *v13 = 0;
  v13[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_relevance) = (Class)0x3FF0000000000000;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  uint64_t *v14 = v6;
  v14[1] = v8;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResultItem_collectionIdentifier);
  uint64_t *v15 = v9;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = ObjectType;
  return [(TPSSearchResultItem *)&v18 init];
}

- (TPSSearchResultItem)init
{
  result = (TPSSearchResultItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SearchResult.Item.encode(with:)((NSCoder)v4);
}

- (TPSSearchResultItem)initWithCoder:(id)a3
{
  return (TPSSearchResultItem *)SearchResult.Item.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19C940AA4(self, (uint64_t)a2, (void (*)(void))SearchResult.Item.description.getter);
}

@end