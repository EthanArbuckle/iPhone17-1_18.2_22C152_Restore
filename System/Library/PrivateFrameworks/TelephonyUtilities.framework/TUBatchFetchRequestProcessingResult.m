@interface TUBatchFetchRequestProcessingResult
- (NSDictionary)handleToFetchRequest;
- (NSMutableArray)allHandlesFromFetchRequests;
- (NSMutableArray)handlesToBatchFetch;
- (NSMutableDictionary)fetchRequestResults;
- (TUBatchFetchRequestProcessingResult)initWithHandleToFetchRequest:(id)a3 handlesToBatchFetch:(id)a4 allHandlesFromFetchRequests:(id)a5 fetchRequestResults:(id)a6;
@end

@implementation TUBatchFetchRequestProcessingResult

- (TUBatchFetchRequestProcessingResult)initWithHandleToFetchRequest:(id)a3 handlesToBatchFetch:(id)a4 allHandlesFromFetchRequests:(id)a5 fetchRequestResults:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUBatchFetchRequestProcessingResult;
  v15 = [(TUBatchFetchRequestProcessingResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_handleToFetchRequest, a3);
    objc_storeStrong((id *)&v16->_handlesToBatchFetch, a4);
    objc_storeStrong((id *)&v16->_allHandlesFromFetchRequests, a5);
    objc_storeStrong((id *)&v16->_fetchRequestResults, a6);
  }

  return v16;
}

- (NSDictionary)handleToFetchRequest
{
  return self->_handleToFetchRequest;
}

- (NSMutableArray)handlesToBatchFetch
{
  return self->_handlesToBatchFetch;
}

- (NSMutableArray)allHandlesFromFetchRequests
{
  return self->_allHandlesFromFetchRequests;
}

- (NSMutableDictionary)fetchRequestResults
{
  return self->_fetchRequestResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequestResults, 0);
  objc_storeStrong((id *)&self->_allHandlesFromFetchRequests, 0);
  objc_storeStrong((id *)&self->_handlesToBatchFetch, 0);

  objc_storeStrong((id *)&self->_handleToFetchRequest, 0);
}

@end