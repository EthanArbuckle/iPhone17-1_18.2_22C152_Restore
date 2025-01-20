@interface SearchUIArchivedRowModel
- (BOOL)hasView;
- (NSString)accessibilityIdentifier;
- (NSString)reuseIdentifier;
- (SFColor)backgroundColor;
- (SearchUIArchivedRowModel)init;
- (SearchUIArchivedRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5;
- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6;
- (SearchUIArchivedRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4;
- (SearchUIArchivedRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4;
@end

@implementation SearchUIArchivedRowModel

- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 isInline:(BOOL)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  BOOL v8 = a5;
  if (a7)
  {
    uint64_t v11 = sub_1E46A6050();
    v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    v13 = 0;
  }
  id v14 = a3;
  id v15 = a4;
  return (SearchUIArchivedRowModel *)sub_1E4664518(a3, a4, v8, a6, v11, v13);
}

- (BOOL)hasView
{
  v2 = (char *)self + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
  swift_beginAccess();
  sub_1E4665800((uint64_t)v2, (uint64_t)v4);
  LOBYTE(v2) = v5 != 0;
  sub_1E4666020((uint64_t)v4, &qword_1EAE536B8);
  return (char)v2;
}

- (SFColor)backgroundColor
{
  return (SFColor *)0;
}

- (NSString)accessibilityIdentifier
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

- (NSString)reuseIdentifier
{
  v2 = (void *)sub_1E46A6040();
  return (NSString *)v2;
}

- (SearchUIArchivedRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v4 = a3;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v7 = a3;
  id v8 = a4;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  id v5 = a3;
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SearchUIArchivedRowModel)init
{
  result = (SearchUIArchivedRowModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end