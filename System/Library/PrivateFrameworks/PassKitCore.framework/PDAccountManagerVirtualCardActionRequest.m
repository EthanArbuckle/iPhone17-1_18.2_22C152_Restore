@interface PDAccountManagerVirtualCardActionRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSString)accountIdentifier;
- (NSString)description;
- (NSString)virtualCardIdentifier;
- (PDAccountManagerVirtualCardActionRequest)initWithAccountIdentifier:(id)a3;
- (id)requestIdentifier;
- (int64_t)action;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithVirtualCard:(id)a3 account:(id)a4 error:(id)a5;
- (void)setAction:(int64_t)a3;
- (void)setVirtualCardIdentifier:(id)a3;
@end

@implementation PDAccountManagerVirtualCardActionRequest

- (PDAccountManagerVirtualCardActionRequest)initWithAccountIdentifier:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDAccountManagerVirtualCardActionRequest;
  v6 = [(PDAccountManagerVirtualCardActionRequest *)&v11 init];
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
  return 2;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerVirtualCardActionRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerVirtualCardActionRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerVirtualCardActionRequest *)self requestIdentifier];
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }
  v10 = (NSString *)v9;
  if (!v8 || !v9)
  {

    goto LABEL_18;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    v8 = v4;
    if ([v8 action] != self->_action)
    {
LABEL_19:
      BOOL v12 = 0;
      goto LABEL_20;
    }
    v13 = [v8 virtualCardIdentifier];
    virtualCardIdentifier = self->_virtualCardIdentifier;
    v10 = v13;
    v15 = virtualCardIdentifier;
    if (v10 == v15)
    {

      goto LABEL_16;
    }
    v16 = v15;
    if (v10 && v15)
    {
      unsigned int v17 = [(NSString *)v10 isEqualToString:v15];

      if (!v17) {
        goto LABEL_19;
      }
LABEL_16:
      [(NSMutableSet *)self->_completionHandlers unionSet:v8[1]];
      BOOL v12 = 1;
LABEL_20:

      goto LABEL_21;
    }

LABEL_18:
    goto LABEL_19;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_21:

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

- (void)callCompletionsWithVirtualCard:(id)a3 account:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned __int8 v11 = self->_completionHandlers;
  id v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = sub_10048DC70([(PDAccountManagerVirtualCardActionRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerVirtualCardActionRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"virtualCardIdentifier: '%@'; ", self->_virtualCardIdentifier];
  objc_msgSend(v3, "appendFormat:", @"action: %ld; ", self->_action);
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (NSString)virtualCardIdentifier
{
  return self->_virtualCardIdentifier;
}

- (void)setVirtualCardIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualCardIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end