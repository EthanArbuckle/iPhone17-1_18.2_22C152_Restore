@interface APPCContentDepiction
- (APPCContentDepiction)init;
- (APPCContentDepiction)initWithIdentifier:(id)a3 adjacentPosition:(unint64_t)a4 placement:(int64_t)a5 language:(id)a6 locale:(id)a7 searchTerms:(id)a8 keywords:(id)a9 categories:(id)a10;
- (APPCContentDepiction)initWithIdentifier:(id)a3 placement:(int64_t)a4 language:(id)a5 locale:(id)a6 searchTerms:(id)a7 keywords:(id)a8 categories:(id)a9;
- (NSArray)categories;
- (NSArray)keywords;
- (NSArray)searchTerms;
- (NSString)identifier;
- (NSString)language;
- (NSString)locale;
- (int64_t)placement;
- (unint64_t)adjacentPosition;
@end

@implementation APPCContentDepiction

- (NSString)identifier
{
  return (NSString *)sub_1B5C248F8();
}

- (unint64_t)adjacentPosition
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_adjacentPosition);
}

- (int64_t)placement
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_placement);
}

- (NSString)language
{
  return (NSString *)sub_1B5C248F8();
}

- (NSString)locale
{
  return (NSString *)sub_1B5C248F8();
}

- (NSArray)searchTerms
{
  return (NSArray *)sub_1B5C796F8();
}

- (NSArray)keywords
{
  return (NSArray *)sub_1B5C796F8();
}

- (NSArray)categories
{
  return (NSArray *)sub_1B5C796F8();
}

- (APPCContentDepiction)initWithIdentifier:(id)a3 placement:(int64_t)a4 language:(id)a5 locale:(id)a6 searchTerms:(id)a7 keywords:(id)a8 categories:(id)a9
{
  uint64_t v9 = sub_1B5CB33C0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1B5CB33C0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1B5CB33C0();
  uint64_t v17 = v16;
  uint64_t v18 = sub_1B5CB34C0();
  uint64_t v19 = sub_1B5CB34C0();
  uint64_t v20 = sub_1B5CB34C0();
  return (APPCContentDepiction *)ContentDepiction.init(identifier:placement:language:locale:searchTerms:keywords:categories:)(v9, v11, a4, v12, v14, v15, v17, v18, v19, v20);
}

- (APPCContentDepiction)initWithIdentifier:(id)a3 adjacentPosition:(unint64_t)a4 placement:(int64_t)a5 language:(id)a6 locale:(id)a7 searchTerms:(id)a8 keywords:(id)a9 categories:(id)a10
{
  uint64_t v11 = sub_1B5CB33C0();
  uint64_t v13 = v12;
  uint64_t v26 = sub_1B5CB33C0();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1B5CB33C0();
  uint64_t v18 = v17;
  uint64_t v19 = (objc_class *)sub_1B5CB34C0();
  uint64_t v20 = (objc_class *)sub_1B5CB34C0();
  v21 = (objc_class *)sub_1B5CB34C0();
  v22 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContentDepiction_identifier);
  uint64_t *v22 = v11;
  v22[1] = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_adjacentPosition) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_placement) = (Class)a5;
  v23 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContentDepiction_language);
  uint64_t *v23 = v26;
  v23[1] = v15;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR___APPCContentDepiction_locale);
  uint64_t *v24 = v16;
  v24[1] = v18;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_searchTerms) = v19;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_keywords) = v20;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCContentDepiction_categories) = v21;
  v29.receiver = self;
  v29.super_class = (Class)type metadata accessor for ContentDepiction();
  return [(APPCContentDepiction *)&v29 init];
}

- (APPCContentDepiction)init
{
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

@end