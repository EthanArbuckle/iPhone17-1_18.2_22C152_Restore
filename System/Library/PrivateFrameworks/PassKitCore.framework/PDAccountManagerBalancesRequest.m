@interface PDAccountManagerBalancesRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerBalancesRequest)initWithAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)type;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithBalances:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerBalancesRequest

- (PDAccountManagerBalancesRequest)initWithAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PDAccountManagerBalancesRequest;
  v14 = [(PDAccountManagerBalancesRequest *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_accountIdentifier, a3);
    objc_storeStrong((id *)&v15->_startDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    v15->_type = a6;
    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v15->_completionHandlers;
    v15->_completionHandlers = v16;
  }
  return v15;
}

- (unint64_t)requestType
{
  return 10;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerBalancesRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerBalancesRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerBalancesRequest *)self requestIdentifier];
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_13;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    v8 = v4;
    id v13 = [v8 startDate];
    if (PKEqualObjects())
    {
      v14 = [v8 endDate];
      if (PKEqualObjects())
      {
        unint64_t type = self->_type;
        id v16 = [v8 type];

        if ((id)type != v16) {
          goto LABEL_16;
        }
LABEL_13:
        BOOL v12 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
LABEL_16:
    [(NSMutableSet *)self->_completionHandlers unionSet:v8[1]];
    BOOL v12 = 1;
    goto LABEL_17;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_18:

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

- (void)callCompletionsWithBalances:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = self->_completionHandlers;
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
  id v4 = sub_10048DC70([(PDAccountManagerBalancesRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerBalancesRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"startDate: '%@'; ", self->_startDate];
  objc_msgSend(v3, "appendFormat:", @"type: %lu; ", self->_type);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end