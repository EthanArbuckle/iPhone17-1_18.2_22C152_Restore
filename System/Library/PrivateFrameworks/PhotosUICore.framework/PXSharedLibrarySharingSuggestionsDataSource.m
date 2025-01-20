@interface PXSharedLibrarySharingSuggestionsDataSource
- (NSArray)containers;
- (NSDate)aggregateBeforeDate;
- (PHFetchResult)sharingSuggestions;
- (PXSharedLibrarySharingSuggestionsDataSource)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4;
- (PXSharedLibrarySharingSuggestionsDataSourceDelegate)delegate;
- (id)_promiseForContainer:(id)a3;
- (id)itemIndexesForSharingSuggestions:(id)a3;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)setDelegate:(id)a3;
@end

@implementation PXSharedLibrarySharingSuggestionsDataSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharingSuggestions, 0);
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_promiseByContainer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXSharedLibrarySharingSuggestionsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSharedLibrarySharingSuggestionsDataSourceDelegate *)WeakRetained;
}

- (PHFetchResult)sharingSuggestions
{
  return self->_sharingSuggestions;
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (NSArray)containers
{
  return self->_containers;
}

- (id)itemIndexesForSharingSuggestions:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [a3 valueForKeyPath:@"objectID"];
  v6 = [v4 setWithArray:v5];

  containers = self->_containers;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__PXSharedLibrarySharingSuggestionsDataSource_itemIndexesForSharingSuggestions___block_invoke;
  v11[3] = &unk_1E5DBAE70;
  id v12 = v6;
  id v8 = v6;
  v9 = [(NSArray *)containers indexesOfObjectsPassingTest:v11];

  return v9;
}

uint64_t __80__PXSharedLibrarySharingSuggestionsDataSource_itemIndexesForSharingSuggestions___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "px_sl_containedSharingSuggestionObjectIDs");
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != [(PXSharedLibrarySharingSuggestionsDataSource *)self identifier])
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSharedLibrarySharingSuggestionsDataSourceManager.m", 603, @"Invalid parameter not satisfying: %@", @"indexPath.dataSourceIdentifier == self.identifier" object file lineNumber description];
  }
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8)
  {
LABEL_14:
    [MEMORY[0x1E4F28B00] currentHandler];
    objc_claimAutoreleasedReturnValue();
    PXSimpleIndexPathDescription();
  }
  int64_t item = a3->item;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = @"PXSharedLibrarySuggestionDataSourceSection";
    goto LABEL_11;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_14;
  }
  v9 = -[NSArray objectAtIndexedSubscript:](self->_containers, "objectAtIndexedSubscript:");
  id v8 = [(PXSharedLibrarySharingSuggestionsDataSource *)self _promiseForContainer:v9];

LABEL_11:
  return v8;
}

- (id)_promiseForContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_promiseByContainer objectForKeyedSubscript:v4];
  if (!v6)
  {
    v7 = [(PXSharedLibrarySharingSuggestionsDataSource *)v5 delegate];
    v6 = [v7 dataSource:v5 promiseForContainer:v4];

    if (!v6)
    {
      id v8 = [PXSharedLibrarySharingSuggestionPromise alloc];
      v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v6 = [(PXSharedLibrarySharingSuggestionPromise *)v8 initWithContainer:v4 considerNewAfterDate:v9 lightweightPlaceholder:1];
    }
    [(NSMutableDictionary *)v5->_promiseByContainer setObject:v6 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(NSArray *)self->_containers count];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (PXSharedLibrarySharingSuggestionsDataSource)initWithSharingSuggestions:(id)a3 aggregateBeforeDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSource;
  v9 = [(PXSharedLibrarySharingSuggestionsDataSource *)&v22 init];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = [[PXSharedLibraryAggregateSharingSuggestionContainer alloc] initWithSharingSuggestions:v7 aggregateBeforeDate:v8];
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [(PXSharedLibraryAggregateSharingSuggestionContainer *)v11 aggregationRange];
      v14 = [v7 fetchedObjects];
      v15 = objc_msgSend(v14, "subarrayWithRange:", 0, v13);
      [v10 addObjectsFromArray:v15];

      [v10 addObject:v12];
    }
    else
    {
      v16 = [v7 fetchedObjects];
      [v10 addObjectsFromArray:v16];
    }
    uint64_t v17 = [v10 copy];
    containers = v9->_containers;
    v9->_containers = (NSArray *)v17;

    objc_storeStrong((id *)&v9->_sharingSuggestions, a3);
    objc_storeStrong((id *)&v9->_aggregateBeforeDate, a4);
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    promiseByContainer = v9->_promiseByContainer;
    v9->_promiseByContainer = v19;
  }
  return v9;
}

@end