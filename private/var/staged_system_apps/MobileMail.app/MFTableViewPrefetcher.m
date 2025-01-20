@interface MFTableViewPrefetcher
- (MFTableViewPrefetchProvider)prefetchProvider;
- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3;
- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3 maxConcurrentOperationCount:(unint64_t)a4;
- (NSOperationQueue)operationQueue;
- (void)setOperationQueue:(id)a3;
- (void)setPrefetchProvider:(id)a3;
- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
@end

@implementation MFTableViewPrefetcher

- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3 maxConcurrentOperationCount:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MFTableViewPrefetcher.m", 22, @"Invalid parameter not satisfying: %@", @"prefetchProvider" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)MFTableViewPrefetcher;
  v9 = [(MFTableViewPrefetcher *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_prefetchProvider, a3);
    v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v11;

    [(NSOperationQueue *)v10->_operationQueue setQualityOfService:25];
    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:a4];
  }

  return v10;
}

- (MFTableViewPrefetcher)initWithPrefetchProvider:(id)a3
{
  return [(MFTableViewPrefetcher *)self initWithPrefetchProvider:a3 maxConcurrentOperationCount:4];
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        v10 = [(MFTableViewPrefetcher *)self prefetchProvider];
        v11 = [v10 tableViewPrefetcher:self prefetchOperationAtIndexPath:v9];

        if (v11)
        {
          v12 = [(MFTableViewPrefetcher *)self operationQueue];
          [v12 addOperation:v11];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)tableView:(id)a3 cancelPrefetchingForRowsAtIndexPaths:(id)a4
{
  id v5 = [a4 mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(MFTableViewPrefetcher *)self operationQueue];
  uint64_t v7 = [v6 operations];

  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v12 = [v11 indexPath];
        if ([v5 containsObject:v12])
        {
          [v11 cancel];
          [v5 removeObject:v12];
          if (![v5 count])
          {

            goto LABEL_12;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (MFTableViewPrefetchProvider)prefetchProvider
{
  return self->_prefetchProvider;
}

- (void)setPrefetchProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchProvider, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end