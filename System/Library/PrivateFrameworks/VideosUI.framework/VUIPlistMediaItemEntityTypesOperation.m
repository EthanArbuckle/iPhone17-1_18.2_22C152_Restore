@interface VUIPlistMediaItemEntityTypesOperation
- (NSError)error;
- (VUIMediaItemEntityTypesFetchResponse)response;
- (VUIPlistMediaDatabase)database;
- (VUIPlistMediaItemEntityTypesOperation)init;
- (VUIPlistMediaItemEntityTypesOperation)initWithDatabase:(id)a3;
- (void)executionDidBegin;
- (void)setDatabase:(id)a3;
- (void)setError:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation VUIPlistMediaItemEntityTypesOperation

- (VUIPlistMediaItemEntityTypesOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIPlistMediaItemEntityTypesOperation)initWithDatabase:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"database" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaItemEntityTypesOperation;
  v6 = [(VUIPlistMediaItemEntityTypesOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (void)executionDidBegin
{
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v4 = [(VUIPlistMediaItemEntityTypesOperation *)self database];
  id v5 = [v4 episodes];
  if ([v5 count])
  {
    v6 = +[VUIMediaEntityType episode];
    [v3 addObject:v6];

    [v19 addObjectsFromArray:v5];
  }
  v7 = objc_msgSend(v4, "homeVideos", v5);
  if ([v7 count])
  {
    v8 = +[VUIMediaEntityType homeVideo];
    [v3 addObject:v8];

    [v19 addObjectsFromArray:v7];
  }
  objc_super v9 = [v4 movies];
  if ([v9 count])
  {
    v10 = +[VUIMediaEntityType movie];
    [v3 addObject:v10];

    [v19 addObjectsFromArray:v9];
  }
  v11 = [v4 movieRentals];
  if ([v11 count])
  {
    v12 = +[VUIMediaEntityType movieRental];
    [v3 addObject:v12];

    [v19 addObjectsFromArray:v11];
  }
  v13 = +[VUIMediaLibraryUtilities mediaItemEntityTypesSortComparator];
  [v3 sortUsingComparator:v13];

  v14 = objc_msgSend(MEMORY[0x1E4F28F60], "vui_equalPredicateWithKeyPath:value:", @"isLocal", MEMORY[0x1E4F1CC38]);
  v15 = [v19 filteredArrayUsingPredicate:v14];
  BOOL v16 = [v15 count] != 0;
  v17 = objc_alloc_init(VUIMediaItemEntityTypesFetchResponse);
  [(VUIMediaItemEntityTypesFetchResponse *)v17 setMediaItemEntityTypes:v3];
  [(VUIMediaItemEntityTypesFetchResponse *)v17 setLocalMediaItemsAvailable:v16];
  [(VUIPlistMediaItemEntityTypesOperation *)self setResponse:v17];
  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (VUIMediaItemEntityTypesFetchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIPlistMediaDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end