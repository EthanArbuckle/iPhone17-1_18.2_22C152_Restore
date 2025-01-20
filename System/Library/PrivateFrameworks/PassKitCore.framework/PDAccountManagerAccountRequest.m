@interface PDAccountManagerAccountRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fetchExtendedAccount;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerAccountRequest)initWithAccountIdentifier:(id)a3;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithAccount:(id)a3 error:(id)a4;
- (void)setFetchExtendedAccount:(BOOL)a3;
@end

@implementation PDAccountManagerAccountRequest

- (PDAccountManagerAccountRequest)initWithAccountIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountManagerAccountRequest;
  v6 = [(PDAccountManagerAccountRequest *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountIdentifier, a3);
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = v8;
  }
  return v7;
}

- (unint64_t)requestType
{
  return 1;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerAccountRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerAccountRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerAccountRequest *)self requestIdentifier];
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
    goto LABEL_14;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    id v13 = v4;
    id v8 = v13;
    if (!self->_fetchExtendedAccount)
    {
      if ([v13 fetchExtendedAccount])
      {
        self->_int fetchExtendedAccount = 1;
      }
      else
      {
        int fetchExtendedAccount = self->_fetchExtendedAccount;
        if (fetchExtendedAccount != [v8 fetchExtendedAccount])
        {
          BOOL v12 = 0;
          goto LABEL_15;
        }
      }
    }
    completionHandlers = self->_completionHandlers;
    v10 = [v8 completionHandlers];
    [(NSMutableSet *)completionHandlers unionSet:v10];
    BOOL v12 = 1;
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_16:

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

- (void)callCompletionsWithAccount:(id)a3 error:(id)a4
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
  id v4 = sub_10048DC70([(PDAccountManagerAccountRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerAccountRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  if (self->_fetchExtendedAccount) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@"fetchExtendedAccount: '%@'; ", v6];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (BOOL)fetchExtendedAccount
{
  return self->_fetchExtendedAccount;
}

- (void)setFetchExtendedAccount:(BOOL)a3
{
  self->_int fetchExtendedAccount = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
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