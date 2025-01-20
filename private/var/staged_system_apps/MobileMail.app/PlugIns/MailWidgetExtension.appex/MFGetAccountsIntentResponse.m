@interface MFGetAccountsIntentResponse
- (MFGetAccountsIntentResponse)init;
- (MFGetAccountsIntentResponse)initWithBackingStore:(id)a3;
- (MFGetAccountsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (MFGetAccountsIntentResponse)initWithCoder:(id)a3;
- (MFGetAccountsIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation MFGetAccountsIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = MFGetAccountsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  sub_1000861C0(a3);
}

- (MFGetAccountsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (MFGetAccountsIntentResponse)init
{
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init()();
}

- (MFGetAccountsIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(coder:)(a3);
}

- (MFGetAccountsIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(backingStore:)(a3);
}

- (MFGetAccountsIntentResponse)initWithPropertiesByName:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v5 = sub_100089FF0();

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (MFGetAccountsIntentResponse *)MFGetAccountsIntentResponse.init(propertiesByName:)(v6);
}

@end