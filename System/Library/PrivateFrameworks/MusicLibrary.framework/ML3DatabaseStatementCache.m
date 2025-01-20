@interface ML3DatabaseStatementCache
- (ML3DatabaseStatementCache)initWithCacheSize:(unint64_t)a3;
- (id)allStatements;
- (id)cachedStatementForSQL:(id)a3;
- (unint64_t)cacheSize;
- (void)cacheStatement:(id)a3;
- (void)clearCache;
- (void)dealloc;
@end

@implementation ML3DatabaseStatementCache

- (id)cachedStatementForSQL:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_statementsDictionary objectForKey:v4];
  if (v5) {
    [(ML3StatementCacheList *)self->_nodeList promoteNodeWithDictionaryKey:v4];
  }

  return v5;
}

- (id)allStatements
{
  return (id)[(NSMutableDictionary *)self->_statementsDictionary allValues];
}

- (void)cacheStatement:(id)a3
{
  id v13 = a3;
  id v4 = [v13 sql];
  [(NSMutableDictionary *)self->_statementsDictionary setObject:v13 forKey:v4];
  v5 = [[ML3StatementCacheNode alloc] initWithDictionaryKey:v4];
  [(ML3StatementCacheList *)self->_nodeList appendNode:v5];
  v6 = [(NSMutableDictionary *)self->_statementsDictionary allValues];
  v7 = objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_10801);

  if (v7)
  {
    while ([(ML3StatementCacheList *)self->_nodeList count] > self->_cacheSize)
    {
      v8 = [(ML3StatementCacheList *)self->_nodeList oldestNode];
      v9 = [v8 dictionaryKey];
      v10 = [(NSMutableDictionary *)self->_statementsDictionary objectForKey:v9];
      int v11 = [v10 isExecuting];
      nodeList = self->_nodeList;
      if (v11)
      {
        [(ML3StatementCacheList *)nodeList promoteNodeWithDictionaryKey:v9];
      }
      else
      {
        [(ML3StatementCacheList *)nodeList deleteOldestNode];
        [v10 finalizeStatement];
        [(NSMutableDictionary *)self->_statementsDictionary removeObjectForKey:v9];
      }
    }
  }
}

uint64_t __44__ML3DatabaseStatementCache_cacheStatement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExecuting] ^ 1;
}

- (ML3DatabaseStatementCache)initWithCacheSize:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseStatementCache;
  id v4 = [(ML3DatabaseStatementCache *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_cacheSize = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4->_cacheSize];
    statementsDictionary = v5->_statementsDictionary;
    v5->_statementsDictionary = (NSMutableDictionary *)v6;

    v8 = objc_alloc_init(ML3StatementCacheList);
    nodeList = v5->_nodeList;
    v5->_nodeList = v8;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeList, 0);

  objc_storeStrong((id *)&self->_statementsDictionary, 0);
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)clearCache
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_statementsDictionary allValues];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) finalizeStatement];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_statementsDictionary removeAllObjects];
  [(ML3StatementCacheList *)self->_nodeList deleteAllNodes];
}

- (void)dealloc
{
  [(ML3DatabaseStatementCache *)self clearCache];
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseStatementCache;
  [(ML3DatabaseStatementCache *)&v3 dealloc];
}

@end