@interface PXCNRecipientSearchDataSource
- (PXCNRecipientSearchDataSource)initWithSearchResults:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXCNRecipientSearchDataSource

- (void).cxx_destruct
{
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXCNRecipientSearchDataSource *)self identifier])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXCNRecipientSearchDataSourceManager.m", 59, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == [self identifier]" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  searchResults = self->_searchResults;
  return -[NSArray objectAtIndexedSubscript:](searchResults, "objectAtIndexedSubscript:");
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(NSArray *)self->_searchResults count];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXCNRecipientSearchDataSource)initWithSearchResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXCNRecipientSearchDataSource;
  v5 = [(PXCNRecipientSearchDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    searchResults = v5->_searchResults;
    v5->_searchResults = (NSArray *)v6;
  }
  return v5;
}

@end