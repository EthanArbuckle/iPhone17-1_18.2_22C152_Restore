@interface SearchUIRFCardSectionRowModelProvider
- (SearchUIRFCardSectionRowModelProvider)init;
- (SearchUIRFCardSectionRowModelProvider)initWithCardSections:(id)a3;
- (id)rowModelFor:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
@end

@implementation SearchUIRFCardSectionRowModelProvider

- (SearchUIRFCardSectionRowModelProvider)initWithCardSections:(id)a3
{
  if (a3)
  {
    sub_1E4670934();
    sub_1E46A6110();
  }
  sub_1E46A5DF0();
  swift_allocObject();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModelProvider_builderContext) = (Class)sub_1E46A5DE0();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModelProvider();
  return [(SearchUIRFCardSectionRowModelProvider *)&v6 init];
}

- (id)rowModelFor:(id)a3 result:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  sub_1E46A6050();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModelProvider_builderContext);
  v18[3] = sub_1E46A5DF0();
  v18[0] = v12;
  objc_allocWithZone((Class)type metadata accessor for SearchUIRFCardSectionRowModel());
  id v13 = a3;
  id v14 = a4;
  sub_1E46A4AB0();
  sub_1E467080C((uint64_t)v18, v14, v13, a5, a6);
  v16 = v15;

  return v16;
}

- (SearchUIRFCardSectionRowModelProvider)init
{
  result = (SearchUIRFCardSectionRowModelProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end