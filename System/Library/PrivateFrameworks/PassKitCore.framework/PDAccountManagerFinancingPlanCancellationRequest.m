@interface PDAccountManagerFinancingPlanCancellationRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)cancellationReasonDescription;
- (NSString)cancellationReasonIdentifier;
- (NSString)description;
- (NSString)planIdentifier;
- (PDAccountManagerFinancingPlanCancellationRequest)initWithAccountIdentifier:(id)a3 planIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithError:(id)a3;
@end

@implementation PDAccountManagerFinancingPlanCancellationRequest

- (PDAccountManagerFinancingPlanCancellationRequest)initWithAccountIdentifier:(id)a3 planIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PDAccountManagerFinancingPlanCancellationRequest;
  v15 = [(PDAccountManagerFinancingPlanCancellationRequest *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountIdentifier, a3);
    objc_storeStrong((id *)&v16->_planIdentifier, a4);
    objc_storeStrong((id *)&v16->_cancellationReasonIdentifier, a5);
    objc_storeStrong((id *)&v16->_cancellationReasonDescription, a6);
    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v16->_completionHandlers;
    v16->_completionHandlers = v17;
  }
  return v16;
}

- (unint64_t)requestType
{
  return 13;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerFinancingPlanCancellationRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@-%@", v3, self->_accountIdentifier, self->_planIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 == (id)[(PDAccountManagerFinancingPlanCancellationRequest *)self requestType])
  {
    v6 = [v4 requestIdentifier];
    v7 = [(PDAccountManagerFinancingPlanCancellationRequest *)self requestIdentifier];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
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
  id v4 = sub_10048DC70([(PDAccountManagerFinancingPlanCancellationRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerFinancingPlanCancellationRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"planIdentifier: '%@'; ", self->_planIdentifier];
  [v3 appendFormat:@"cancellationReasonIdentifier: '%@'", self->_cancellationReasonIdentifier];
  objc_msgSend(v3, "appendFormat:", @"cancellationReasonDescription: '%@'; ",
    self->_cancellationReasonDescription);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (NSString)cancellationReasonIdentifier
{
  return self->_cancellationReasonIdentifier;
}

- (NSString)cancellationReasonDescription
{
  return self->_cancellationReasonDescription;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationReasonDescription, 0);
  objc_storeStrong((id *)&self->_cancellationReasonIdentifier, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end