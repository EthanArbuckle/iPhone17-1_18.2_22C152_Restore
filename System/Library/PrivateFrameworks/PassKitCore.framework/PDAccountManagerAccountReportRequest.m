@interface PDAccountManagerAccountReportRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerAccountReportRequest)initWithAccountIdentifier:(id)a3 report:(id)a4 trigger:(unint64_t)a5;
- (PKAccountReport)report;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (unint64_t)trigger;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithError:(id)a3;
- (void)setReport:(id)a3;
@end

@implementation PDAccountManagerAccountReportRequest

- (PDAccountManagerAccountReportRequest)initWithAccountIdentifier:(id)a3 report:(id)a4 trigger:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDAccountManagerAccountReportRequest;
  v11 = [(PDAccountManagerAccountReportRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accountIdentifier, a3);
    objc_storeStrong((id *)&v12->_report, a4);
    v12->_trigger = a5;
    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v12->_completionHandlers;
    v12->_completionHandlers = v13;
  }
  return v12;
}

- (unint64_t)requestType
{
  return 11;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerAccountReportRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)[(PDAccountManagerAccountReportRequest *)self requestType])
  {
    v6 = [v4 requestIdentifier];
    v7 = [(PDAccountManagerAccountReportRequest *)self requestIdentifier];
    id v8 = v6;
    id v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
      unsigned __int8 v11 = 1;
    }
    else
    {
      unsigned __int8 v11 = 0;
      if (v8 && v9) {
        unsigned __int8 v11 = [v8 isEqualToString:v9];
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
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

- (void)callCompletionsWithError:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_completionHandlers;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = sub_10048DC70([(PDAccountManagerAccountReportRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerAccountReportRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  id v6 = PKAccountWebServiceTransactionDataTriggerToString();
  [v3 appendFormat:@"trigger: '%@'; ", v6];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (PKAccountReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (unint64_t)trigger
{
  return self->_trigger;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end