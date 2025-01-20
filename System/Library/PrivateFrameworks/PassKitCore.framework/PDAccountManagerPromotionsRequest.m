@interface PDAccountManagerPromotionsRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)ignoreErrorBackoff;
- (BOOL)observeCooldownPeriod;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerPromotionsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithPromotions:(id)a3 error:(id)a4;
@end

@implementation PDAccountManagerPromotionsRequest

- (PDAccountManagerPromotionsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDAccountManagerPromotionsRequest;
  v10 = [(PDAccountManagerPromotionsRequest *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountIdentifier, a3);
    v11->_ignoreErrorBackoff = a4;
    v11->_observeCooldownPeriod = a5;
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v12;
  }
  return v11;
}

- (unint64_t)requestType
{
  return 8;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerPromotionsRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerPromotionsRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerPromotionsRequest *)self requestIdentifier];
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
LABEL_14:

    goto LABEL_15;
  }
  unsigned __int8 v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    id v13 = v4;
    if ([v13 ignoreErrorBackoff]) {
      self->_ignoreErrorBackoff = 1;
    }
    if (([v13 observeCooldownPeriod] & 1) == 0) {
      self->_observeCooldownPeriod = 0;
    }
    completionHandlers = self->_completionHandlers;
    id v8 = [v13 completionHandlers];

    [(NSMutableSet *)completionHandlers unionSet:v8];
    BOOL v12 = 1;
    goto LABEL_14;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_15:

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

- (void)callCompletionsWithPromotions:(id)a3 error:(id)a4
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
  id v4 = sub_10048DC70([(PDAccountManagerPromotionsRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerPromotionsRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  if (self->_ignoreErrorBackoff) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  [v3 appendFormat:@"ignoreErrorBackoff: '%@'; ", v6];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)ignoreErrorBackoff
{
  return self->_ignoreErrorBackoff;
}

- (BOOL)observeCooldownPeriod
{
  return self->_observeCooldownPeriod;
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