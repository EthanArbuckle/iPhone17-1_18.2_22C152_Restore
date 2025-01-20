@interface PDAccountManagerAllAccountsRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)description;
- (PDAccountManagerAllAccountsRequest)init;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithAccounts:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerAllAccountsRequest

- (PDAccountManagerAllAccountsRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDAccountManagerAllAccountsRequest;
  v2 = [(PDAccountManagerAllAccountsRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }
  return v2;
}

- (unint64_t)requestType
{
  return 0;
}

- (id)requestIdentifier
{
  uint64_t v2 = [(PDAccountManagerAllAccountsRequest *)self requestType];
  return (id)sub_10048DC70(v2);
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerAllAccountsRequest *)self requestType]) {
    goto LABEL_6;
  }
  objc_super v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerAllAccountsRequest *)self requestIdentifier];
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
    goto LABEL_10;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    completionHandlers = self->_completionHandlers;
    id v8 = [v4 completionHandlers];
    [(NSMutableSet *)completionHandlers unionSet:v8];
    BOOL v12 = 1;
LABEL_10:

    goto LABEL_11;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_11:

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

- (void)callCompletionsWithAccounts:(id)a3 error:(id)a4
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
  id v4 = sub_10048DC70([(PDAccountManagerAllAccountsRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerAllAccountsRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
}

@end