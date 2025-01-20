@interface PDAccountManagerSharedAccountCloudStoreRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fromPush;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerSharedAccountCloudStoreRequest)initWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithSharedAccountCloudStore:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerSharedAccountCloudStoreRequest

- (PDAccountManagerSharedAccountCloudStoreRequest)initWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDAccountManagerSharedAccountCloudStoreRequest;
  v8 = [(PDAccountManagerSharedAccountCloudStoreRequest *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v9->_fromPush = a4;
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v9->_completionHandlers;
    v9->_completionHandlers = v10;
  }
  return v9;
}

- (unint64_t)requestType
{
  return 4;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerSharedAccountCloudStoreRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerSharedAccountCloudStoreRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  id v7 = [(PDAccountManagerSharedAccountCloudStoreRequest *)self requestIdentifier];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    BOOL v12 = 0;
LABEL_12:

    goto LABEL_13;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    if ([v4 fromPush]) {
      self->_fromPush = 1;
    }
    completionHandlers = self->_completionHandlers;
    id v8 = [v4 completionHandlers];
    [(NSMutableSet *)completionHandlers unionSet:v8];
    BOOL v12 = 1;
    goto LABEL_12;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableSet *)completionHandlers addObject:v4];
  }
}

- (void)callCompletionsWithSharedAccountCloudStore:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_completionHandlers;
  id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      BOOL v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12));
        BOOL v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = sub_10048DC70([(PDAccountManagerSharedAccountCloudStoreRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerSharedAccountCloudStoreRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)fromPush
{
  return self->_fromPush;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end