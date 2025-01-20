@interface SearchUIRFCardSectionRowModel
+ (BOOL)shouldHideViewForCardSection:(id)a3;
+ (BOOL)supportsConfigurationFor:(id)a3;
- (BOOL)fillsBackgroundWithContent;
- (BOOL)hasLeadingImage;
- (BOOL)prefersNoSeparatorAbove;
- (BOOL)supportsCustomHighlightBehavior;
- (NSDirectionalEdgeInsets)intrinsicContentInset;
- (NSString)reuseIdentifier;
- (SearchUIRFCardSectionRowModel)init;
- (SearchUIRFCardSectionRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5;
- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6;
- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4;
- (SearchUIRFCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4;
- (double)highlightReferenceFrameCornerRadius;
- (int)separatorStyle;
@end

@implementation SearchUIRFCardSectionRowModel

- (NSString)reuseIdentifier
{
  v2 = self;
  sub_1E466FCC4();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1E46A6040();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (SearchUIRFCardSectionRowModel)init
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB99BC30);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1E46B7270;
  id v4 = objc_allocWithZone(MEMORY[0x1E4F99F28]);
  v5 = self;
  *(void *)(v3 + 32) = objc_msgSend(v4, sel_init);
  uint64_t v8 = v3;
  sub_1E46A6120();
  sub_1E46A5DF0();
  swift_allocObject();
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___SearchUIRFCardSectionRowModel__builderContext) = (Class)sub_1E46A5DE0();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
  return [(SearchUIRFCardSectionRowModel *)&v7 init];
}

- (int)separatorStyle
{
  v2 = self;
  int v3 = sub_1E466FED8();

  return v3;
}

- (BOOL)fillsBackgroundWithContent
{
  v2 = self;
  char v3 = sub_1E466FFCC();

  return v3 & 1;
}

- (BOOL)hasLeadingImage
{
  return sub_1E4670104(self, (uint64_t)a2, MEMORY[0x1E4FA55A8]);
}

- (BOOL)prefersNoSeparatorAbove
{
  return sub_1E4670104(self, (uint64_t)a2, MEMORY[0x1E4FA55C0]);
}

+ (BOOL)supportsConfigurationFor:(id)a3
{
  return sub_1E46701B0((uint64_t)a1, (uint64_t)a2, a3, MEMORY[0x1E4FA55B8]);
}

+ (BOOL)shouldHideViewForCardSection:(id)a3
{
  return sub_1E46701B0((uint64_t)a1, (uint64_t)a2, a3, MEMORY[0x1E4FA55B0]);
}

- (BOOL)supportsCustomHighlightBehavior
{
  v2 = self;
  sub_1E467020C(v5);
  uint64_t v3 = LOBYTE(v5[0]);

  return v3 != 2;
}

- (NSDirectionalEdgeInsets)intrinsicContentInset
{
  v2 = self;
  sub_1E467020C(v12);
  sub_1E46709D4((uint64_t)v12, (uint64_t)v13);
  if (v13[0] == 2)
  {
    double v3 = *MEMORY[0x1E4FB12A8];
    double v4 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
    v5 = (double *)(MEMORY[0x1E4FB12A8] + 24);
    double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  }
  else
  {
    double v3 = v14;
    double v4 = v15;
    v5 = (double *)&v17;
    double v6 = v16;
  }
  double v7 = *v5;

  double v8 = v3;
  double v9 = v4;
  double v10 = v6;
  double v11 = v7;
  result.trailing = v11;
  result.bottom = v10;
  result.leading = v9;
  result.top = v8;
  return result;
}

- (double)highlightReferenceFrameCornerRadius
{
  v2 = self;
  sub_1E467020C(v4);

  sub_1E46709D4((uint64_t)v4, (uint64_t)v5);
  double result = v6;
  if (v5[0] == 2) {
    return -1.0;
  }
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v8 = a3;
  id v9 = a4;
  double result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v4 = a3;
  double result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  double result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  double result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIRFCardSectionRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  id v5 = a3;
  double result = (SearchUIRFCardSectionRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end