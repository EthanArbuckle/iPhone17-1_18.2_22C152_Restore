@interface PDPaymentOffersManagerCatalogFetchRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)fromPush;
- (NSSet)completionHandlers;
- (NSString)description;
- (PDPaymentOffersManagerCatalogFetchRequest)initWithFromPush:(BOOL)a3 completion:(id)a4;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithCatalog:(id)a3 error:(id)a4;
@end

@implementation PDPaymentOffersManagerCatalogFetchRequest

- (PDPaymentOffersManagerCatalogFetchRequest)initWithFromPush:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDPaymentOffersManagerCatalogFetchRequest;
  v7 = [(PDPaymentOffersManagerCatalogFetchRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_fromPush = a3;
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v8->_completionHandlers;
    v8->_completionHandlers = v9;

    [(PDPaymentOffersManagerCatalogFetchRequest *)v8 addCompletion:v6];
  }

  return v8;
}

- (unint64_t)requestType
{
  return 0;
}

- (id)requestIdentifier
{
  return @"catalog";
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDPaymentOffersManagerCatalogFetchRequest *)self requestType]) {
    goto LABEL_6;
  }
  id v6 = [v4 requestIdentifier];
  v7 = [(PDPaymentOffersManagerCatalogFetchRequest *)self requestIdentifier];
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
    id v8 = v4;
    if ([v8 fromPush]) {
      self->_fromPush = 1;
    }
    completionHandlers = self->_completionHandlers;
    v10 = [v8 completionHandlers];
    [(NSMutableSet *)completionHandlers unionSet:v10];
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
  completionHandlers = self->_completionHandlers;
  id v4 = objc_retainBlock(a3);
  [(NSMutableSet *)completionHandlers pk_safelyAddObject:v4];
}

- (void)callCompletionsWithCatalog:(id)a3 error:(id)a4
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
  [(PDPaymentOffersManagerCatalogFetchRequest *)self requestType];
  [v3 appendFormat:@"requestType: '%@'; ", @"catalog"];
  id v4 = [(PDPaymentOffersManagerCatalogFetchRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v4];

  if (self->_fromPush) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"fromPush: '%@'; ", v5];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
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
}

@end