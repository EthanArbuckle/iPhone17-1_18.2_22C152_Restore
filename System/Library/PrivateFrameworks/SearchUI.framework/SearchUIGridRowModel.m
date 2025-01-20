@interface SearchUIGridRowModel
- (BOOL)hasLeadingImage;
- (BOOL)prefersNoSeparatorAbove;
- (BOOL)shouldHide;
- (SearchUIGridLayoutManager)gridLayoutManager;
- (SearchUIGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 gridLayoutManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGridLayoutManager:(id)a3;
- (void)setShouldHide:(BOOL)a3;
@end

@implementation SearchUIGridRowModel

- (SearchUIGridRowModel)initWithResult:(id)a3 cardSection:(id)a4 gridLayoutManager:(id)a5 queryId:(unint64_t)a6 itemIdentifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SearchUIGridRowModel;
  v14 = [(SearchUICardSectionRowModel *)&v20 initWithResult:a3 cardSection:v12 isInline:0 queryId:a6 itemIdentifier:a7];
  v15 = v14;
  if (v14)
  {
    [(SearchUIGridRowModel *)v14 setGridLayoutManager:v13];
    v16 = [(SearchUIGridRowModel *)v15 gridLayoutManager];
    v17 = [v16 tableRowForTableRowCardSection:v12];
    v18 = [v17 data];
    [(SearchUIGridRowModel *)v15 setShouldHide:+[SearchUIGridLayoutManager shouldHideViewForRichData:v18]];
  }
  return v15;
}

- (BOOL)prefersNoSeparatorAbove
{
  v3 = [(SearchUIRowModel *)self cardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(SearchUIGridRowModel *)self gridLayoutManager];
    v5 = [v4 gridManager];
    char v6 = [v5 tableContainsRowHeaders];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)hasLeadingImage
{
  v3 = [(SearchUIGridRowModel *)self gridLayoutManager];
  v4 = [(SearchUIRowModel *)self cardSection];
  v5 = [v3 tableRowForTableRowCardSection:v4];
  char v6 = [v5 data];
  v7 = [v6 firstObject];
  char v8 = [v7 hasOnlyImage];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIGridRowModel;
  id v4 = [(SearchUICardSectionRowModel *)&v7 copyWithZone:a3];
  v5 = [(SearchUIGridRowModel *)self gridLayoutManager];
  [v4 setGridLayoutManager:v5];

  objc_msgSend(v4, "setShouldHide:", -[SearchUIGridRowModel shouldHide](self, "shouldHide"));
  return v4;
}

- (SearchUIGridLayoutManager)gridLayoutManager
{
  return self->_gridLayoutManager;
}

- (void)setGridLayoutManager:(id)a3
{
}

- (BOOL)shouldHide
{
  return self->_shouldHide;
}

- (void)setShouldHide:(BOOL)a3
{
  self->_shouldHide = a3;
}

- (void).cxx_destruct
{
}

@end