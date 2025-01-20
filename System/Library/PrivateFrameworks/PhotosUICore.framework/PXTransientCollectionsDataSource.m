@interface PXTransientCollectionsDataSource
- (PHFetchResult)fetchResult;
- (PXTransientCollectionsDataSource)init;
- (PXTransientCollectionsDataSource)initWithFetchResult:(id)a3;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionListForSection:(int64_t)a3;
- (id)indexPathForCollection:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4;
@end

@implementation PXTransientCollectionsDataSource

- (void).cxx_destruct
{
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t section = a3->section;
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8
    || section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL
    || section != 0)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  return [(PXTransientCollectionsDataSource *)self fetchResult];
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(PXTransientCollectionsDataSource *)self fetchResult];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)collectionListForSection:(int64_t)a3
{
  if (a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXTransientCollectionsDataSource.m", 48, @"Invalid parameter not satisfying: %@", @"section == 0" object file lineNumber description];
  }
  int64_t v4 = (void *)MEMORY[0x1E4F39008];
  v5 = [(PXTransientCollectionsDataSource *)self fetchResult];
  v6 = [v5 fetchedObjects];
  v7 = [v4 transientCollectionListWithCollections:v6 title:0];

  return v7;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 section])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXTransientCollectionsDataSource.m", 43, @"Invalid parameter not satisfying: %@", @"indexPath.section == 0" object file lineNumber description];
  }
  v6 = [(PXTransientCollectionsDataSource *)self fetchResult];
  uint64_t v7 = [v5 item];

  v8 = [v6 objectAtIndex:v7];

  return v8;
}

- (id)indexPathForCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PXTransientCollectionsDataSource *)self fetchResult];
  uint64_t v6 = [v5 indexOfObject:v4];

  uint64_t v7 = (void *)MEMORY[0x1E4F28D58];
  return (id)[v7 indexPathForItem:v6 inSection:0];
}

- (PXTransientCollectionsDataSource)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXTransientCollectionsDataSource.m", 32, @"%s is not available as initializer", "-[PXTransientCollectionsDataSource init]");

  abort();
}

- (PXTransientCollectionsDataSource)initWithFetchResult:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTransientCollectionsDataSource;
  uint64_t v6 = [(PXTransientCollectionsDataSource *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fetchResult, a3);
  }

  return v7;
}

@end