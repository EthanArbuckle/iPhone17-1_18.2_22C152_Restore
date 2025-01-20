@interface CDStorePurchaseGetAuthInfoResponse
- (AMSDelegatePurchaseRequest)purchaseRequest;
- (CDStorePurchaseGetAuthInfoResponse)initWithRapportDictionary:(id)a3;
- (NSString)description;
- (id)makeRapportDictionary;
- (void)setPurchaseRequest:(id)a3;
@end

@implementation CDStorePurchaseGetAuthInfoResponse

- (CDStorePurchaseGetAuthInfoResponse)initWithRapportDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CDStorePurchaseGetAuthInfoResponse;
  v5 = [(CDStorePurchaseGetAuthInfoResponse *)&v10 init];
  if (v5)
  {
    v6 = self;
    uint64_t v7 = sub_10001CD14(v4, @"purchaseRequest", (uint64_t)v6);
    purchaseRequest = v5->_purchaseRequest;
    v5->_purchaseRequest = (AMSDelegatePurchaseRequest *)v7;
  }
  return v5;
}

- (id)makeRapportDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = sub_10001D014((uint64_t)self->_purchaseRequest);
  [v3 setObject:v4 forKeyedSubscript:@"purchaseRequest"];

  id v5 = [v3 copy];

  return v5;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendObject:self->_purchaseRequest withName:@"purchaseRequest" skipIfNil:1];
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (AMSDelegatePurchaseRequest)purchaseRequest
{
  return self->_purchaseRequest;
}

- (void)setPurchaseRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end