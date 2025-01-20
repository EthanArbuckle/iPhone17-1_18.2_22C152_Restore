@interface PDAccountManagerEnhancedMerchantsRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)ignoreErrorBackoff;
- (NSSet)completionHandlers;
- (NSString)accountIdentifier;
- (NSString)description;
- (PDAccountManagerEnhancedMerchantsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5;
- (id)requestIdentifier;
- (unint64_t)cooldownLevel;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithEnhancedMerchants:(id)a3 error:(id)a4 lastUpdate:(id)a5;
@end

@implementation PDAccountManagerEnhancedMerchantsRequest

- (PDAccountManagerEnhancedMerchantsRequest)initWithAccountIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PDAccountManagerEnhancedMerchantsRequest;
  v10 = [(PDAccountManagerEnhancedMerchantsRequest *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountIdentifier, a3);
    v11->_ignoreErrorBackoff = a4;
    v11->_cooldownLevel = a5;
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v12;
  }
  return v11;
}

- (unint64_t)requestType
{
  return 9;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerEnhancedMerchantsRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_accountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerEnhancedMerchantsRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerEnhancedMerchantsRequest *)self requestIdentifier];
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
    id v13 = v4;
    if ([v13 ignoreErrorBackoff]) {
      self->_ignoreErrorBackoff = 1;
    }
    [v13 cooldownLevel];
    self->_cooldownLevel = PKStricterAccountEnhancedMerchantCooldownLevel();
    completionHandlers = self->_completionHandlers;
    id v8 = [v13 completionHandlers];

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

- (void)callCompletionsWithEnhancedMerchants:(id)a3 error:(id)a4 lastUpdate:(id)a5
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
      objc_super v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * (void)v15));
        objc_super v15 = (char *)v15 + 1;
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
  id v4 = sub_10048DC70([(PDAccountManagerEnhancedMerchantsRequest *)self requestType]);
  [v3 appendFormat:@"requestType: '%@'; ", v4];

  id v5 = [(PDAccountManagerEnhancedMerchantsRequest *)self requestIdentifier];
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

- (unint64_t)cooldownLevel
{
  return self->_cooldownLevel;
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