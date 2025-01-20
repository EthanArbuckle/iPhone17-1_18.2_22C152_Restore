@interface ICSearchIndexImplementation
- (CSSearchableIndex)searchableIndex;
- (void)beginIndexBatch;
- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3;
- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)deleteSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)endIndexBatchWithClientState:(id)a3 completionHandler:(id)a4;
- (void)fetchLastClientStateWithCompletionHandler:(id)a3;
- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4;
- (void)setSearchableIndex:(id)a3;
- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7;
@end

@implementation ICSearchIndexImplementation

- (CSSearchableIndex)searchableIndex
{
  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    id v4 = objc_alloc(MEMORY[0x263F02AD8]);
    v5 = ICSearchableIndexName();
    v6 = ICNotesAppBundleIdentifier();
    v7 = (CSSearchableIndex *)[v4 initWithName:v5 bundleIdentifier:v6];
    v8 = self->_searchableIndex;
    self->_searchableIndex = v7;

    searchableIndex = self->_searchableIndex;
  }
  return searchableIndex;
}

- (void)beginIndexBatch
{
  id v2 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v2 beginIndexBatch];
}

- (void)endIndexBatchWithClientState:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v8 endIndexBatchWithClientState:v7 completionHandler:v6];
}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v8 indexSearchableItems:v7 completionHandler:v6];
}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v5 deleteAllSearchableItemsWithCompletionHandler:v4];
}

- (void)deleteSearchableItemsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v8 deleteSearchableItemsWithIdentifiers:v7 completionHandler:v6];
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v8 deleteSearchableItemsWithDomainIdentifiers:v7 completionHandler:v6];
}

- (void)slowFetchAttributes:(id)a3 protectionClass:(id)a4 bundleID:(id)a5 identifiers:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v17 slowFetchAttributes:v16 protectionClass:v15 bundleID:v14 identifiers:v13 completionHandler:v12];
}

- (void)fetchLastClientStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSearchIndexImplementation *)self searchableIndex];
  [v5 fetchLastClientStateWithCompletionHandler:v4];
}

- (void)setSearchableIndex:(id)a3
{
}

- (void).cxx_destruct
{
}

@end