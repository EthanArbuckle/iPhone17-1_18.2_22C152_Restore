@interface PXFetchResultDataSource
- (PHFetchResult)fetchResult;
- (PXFetchResultDataSource)init;
- (PXFetchResultDataSource)initWithFetchResult:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXFetchResultDataSource

- (void).cxx_destruct
{
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 55, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsSection(indexPath)" object file lineNumber description];

    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != [(PXFetchResultDataSource *)self identifier])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 56, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->section)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 57, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  return [(PXFetchResultDataSource *)self fetchResult];
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 47, @"Invalid parameter not satisfying: %@", @"PXSimpleIndexPathIsItem(indexPath)" object file lineNumber description];

    int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  }
  if (dataSourceIdentifier != [(PXFetchResultDataSource *)self identifier])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 48, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->section)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 49, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  int64_t item = a3->item;
  v10 = [(PXFetchResultDataSource *)self fetchResult];
  v11 = [v10 objectAtIndexedSubscript:item];

  return v11;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if (a3)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXFetchResultDataSource.m", 37, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  v4 = [(PXFetchResultDataSource *)self fetchResult];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXFetchResultDataSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFetchResultDataSource.m", 27, @"%s is not available as initializer", "-[PXFetchResultDataSource init]");

  abort();
}

- (PXFetchResultDataSource)initWithFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFetchResultDataSource;
  v6 = [(PXFetchResultDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchResult, a3);
  }

  return v7;
}

@end