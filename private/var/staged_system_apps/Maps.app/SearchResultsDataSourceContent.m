@interface SearchResultsDataSourceContent
- (NSArray)objects;
- (OrderedDataSource)orderedDataSource;
- (SearchResultsDataSourceContent)initWithOrderedDataSource:(id)a3;
- (id)objectAtIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (unint64_t)count;
- (void)setOrderedDataSource:(id)a3;
@end

@implementation SearchResultsDataSourceContent

- (SearchResultsDataSourceContent)initWithOrderedDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultsDataSourceContent;
  v6 = [(SearchResultsDataSourceContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_orderedDataSource, a3);
  }

  return v7;
}

- (NSArray)objects
{
  v2 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  v3 = [v2 orderedObjects];

  return (NSArray *)v3;
}

- (unint64_t)count
{
  v2 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  v3 = [v2 orderedObjects];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (int64_t)numberOfSections
{
  v2 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  id v3 = [v2 numberOfSections];

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v4 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  id v5 = [v4 numberOfRowsInSection:a3];

  return (int64_t)v5;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  v6 = [v5 objectAtIndexPath:v4];

  return v6;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  id v4 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  id v5 = [v4 titleForHeaderInSection:a3];

  return v5;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(SearchResultsDataSourceContent *)self orderedDataSource];
  v7 = [v6 viewForHeaderInSection:a3 isFirstNonEmptySection:v4];

  return v7;
}

- (OrderedDataSource)orderedDataSource
{
  return self->_orderedDataSource;
}

- (void)setOrderedDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end