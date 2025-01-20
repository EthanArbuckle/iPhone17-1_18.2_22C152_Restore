@interface SearchUIContentConfigurator
+ (BOOL)supportsConfigurationFor:(id)a3;
+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6;
+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5;
+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6;
+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5;
- (SearchUIContentConfigurator)init;
@end

@implementation SearchUIContentConfigurator

+ (BOOL)supportsConfigurationFor:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_cardSection);

  if (v4)
  {
    id v5 = objc_msgSend(v3, sel_cardSection);
    if (!v5)
    {
      __break(1u);
      return (char)v5;
    }
    v6 = v5;
    unsigned __int8 v7 = objc_msgSend(v5, sel_supportsConfiguration);

    if (v7)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      type metadata accessor for SearchUIArchivedRowModel();
      LOBYTE(v4) = swift_dynamicCastClass() != 0;
    }
  }

  LOBYTE(v5) = (_BYTE)v4;
  return (char)v5;
}

+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6
{
  sub_1E4685D64(0, (unint64_t *)&qword_1EB99BB90);
  uint64_t v8 = sub_1E46A6110();
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();
  sub_1E469758C(v9, v10, v8);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5
{
  return 0;
}

+ (id)hostedSnippetUIViewFor:(id)a3 rowModel:(id)a4 cardSections:(id)a5 interactionDelegate:(id)a6
{
  return 0;
}

+ (void)applyConfigurationTo:(id)a3 rowModel:(id)a4 interactionDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  sub_1E4697CB0(v7, v8, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (SearchUIContentConfigurator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIContentConfigurator();
  return [(SearchUIContentConfigurator *)&v3 init];
}

@end