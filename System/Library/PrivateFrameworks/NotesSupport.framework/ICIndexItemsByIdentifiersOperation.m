@interface ICIndexItemsByIdentifiersOperation
- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4;
- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4 objectIDURIsToIndex:(id)a5;
- (NSArray)objectIDURIsToIndex;
- (void)main;
- (void)setObjectIDURIsToIndex:(id)a3;
@end

@implementation ICIndexItemsByIdentifiersOperation

- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4 objectIDURIsToIndex:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICIndexItemsByIdentifiersOperation;
  v9 = [(ICIndexItemsOperation *)&v12 initWithSearchableIndex:a3 dataSources:a4];
  v10 = v9;
  if (v9) {
    [(ICIndexItemsByIdentifiersOperation *)v9 setObjectIDURIsToIndex:v8];
  }

  return v10;
}

- (ICIndexItemsByIdentifiersOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4
{
  return [(ICIndexItemsByIdentifiersOperation *)self initWithSearchableIndex:a3 dataSources:a4 objectIDURIsToIndex:MEMORY[0x263EFFA68]];
}

- (void)main
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(ICIndexItemsOperation *)self dataSources];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        v9 = [(ICIndexItemsByIdentifiersOperation *)self objectIDURIsToIndex];
        v10 = [(ICIndexItemsOperation *)self managedObjectContextForDataSource:v8];
        [v8 stageObjectIDURIsForIndexing:v9 context:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)ICIndexItemsByIdentifiersOperation;
  [(ICIndexItemsOperation *)&v11 main];
}

- (NSArray)objectIDURIsToIndex
{
  return self->_objectIDURIsToIndex;
}

- (void)setObjectIDURIsToIndex:(id)a3
{
}

- (void).cxx_destruct
{
}

@end