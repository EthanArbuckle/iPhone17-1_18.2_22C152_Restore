@interface PDFamilyCircleMemberTypeRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (PDFamilyCircleMemberTypeRequest)initWithCachePolicy:(unint64_t)a3;
- (unint64_t)cachePolicy;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)executeRequestWithManager:(id)a3 completion:(id)a4;
@end

@implementation PDFamilyCircleMemberTypeRequest

- (PDFamilyCircleMemberTypeRequest)initWithCachePolicy:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PDFamilyCircleMemberTypeRequest;
  v4 = [(PDFamilyCircleMemberTypeRequest *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_cachePolicy = a3;
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = v6;
  }
  return v5;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (unint64_t)requestType
{
  return 2;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDFamilyCircleMemberTypeRequest *)self _canCoalesceRequest:v4];
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = [v4 completionHandlers];
    [(NSMutableArray *)completionHandlers addObjectsFromArray:v7];
  }
  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFamilyCircleMemberTypeRequest *)self requestType];
  if (v5 == [v4 requestType])
  {
    id cachePolicy = self->_cachePolicy;
    BOOL v7 = cachePolicy == [v4 cachePolicy] || self->_cachePolicy == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)executeRequestWithManager:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003650E0;
  v15[3] = &unk_100731BA0;
  v15[4] = self;
  id v16 = a4;
  id v5 = v16;
  v6 = objc_retainBlock(v15);
  id v7 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
  v8 = v7;
  unint64_t cachePolicy = self->_cachePolicy;
  uint64_t v10 = 1;
  if (cachePolicy == 1) {
    uint64_t v10 = 2;
  }
  if (cachePolicy == 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  [v7 setCachePolicy:v11];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100365200;
  v13[3] = &unk_10074B178;
  id v14 = v6;
  v12 = v6;
  [v8 startRequestWithCompletionHandler:v13];
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end