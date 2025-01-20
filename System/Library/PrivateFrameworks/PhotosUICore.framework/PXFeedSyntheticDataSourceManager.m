@interface PXFeedSyntheticDataSourceManager
- (PXFeedSyntheticDataSourceManager)init;
- (PXFeedSyntheticDataSourceManager)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4;
- (id)createInitialDataSource;
@end

@implementation PXFeedSyntheticDataSourceManager

- (id)createInitialDataSource
{
  v2 = [[_PXFeedSyntheticDataSource alloc] initWithNumberOfSections:self->_initialNumberOfSections numberOfItemsPerSection:self->_initialNumberOfItemsPerSection];
  return v2;
}

- (PXFeedSyntheticDataSourceManager)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXFeedSyntheticDataSourceManager;
  result = [(PXSectionedDataSourceManager *)&v7 init];
  if (result)
  {
    result->_initialNumberOfSections = a3;
    result->_initialNumberOfItemsPerSection = a4;
  }
  return result;
}

- (PXFeedSyntheticDataSourceManager)init
{
  return [(PXFeedSyntheticDataSourceManager *)self initWithNumberOfSections:0 numberOfItemsPerSection:0];
}

@end