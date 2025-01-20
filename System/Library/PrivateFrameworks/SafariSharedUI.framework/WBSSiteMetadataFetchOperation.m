@interface WBSSiteMetadataFetchOperation
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (WBSSiteMetadataFetchOperation)init;
- (WBSSiteMetadataFetchOperation)initWithRequest:(id)a3;
- (WBSSiteMetadataRequest)request;
- (int64_t)_status;
- (void)_setStatus:(int64_t)a3;
@end

@implementation WBSSiteMetadataFetchOperation

- (WBSSiteMetadataFetchOperation)init
{
  return 0;
}

- (WBSSiteMetadataFetchOperation)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSiteMetadataFetchOperation;
  v6 = [(WBSSiteMetadataFetchOperation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WBSSiteMetadataFetchOperation;
  id v5 = objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v4);
  if (([v4 isEqualToString:@"isExecuting"] & 1) != 0
    || [v4 isEqualToString:@"isFinished"])
  {
    uint64_t v6 = [v5 setByAddingObject:@"status"];

    id v5 = (void *)v6;
  }

  return v5;
}

- (BOOL)isExecuting
{
  return [(WBSSiteMetadataFetchOperation *)self _status] == 1;
}

- (BOOL)isFinished
{
  return [(WBSSiteMetadataFetchOperation *)self _status] == 2;
}

- (WBSSiteMetadataRequest)request
{
  return self->_request;
}

- (int64_t)_status
{
  return self->_status;
}

- (void)_setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
}

@end