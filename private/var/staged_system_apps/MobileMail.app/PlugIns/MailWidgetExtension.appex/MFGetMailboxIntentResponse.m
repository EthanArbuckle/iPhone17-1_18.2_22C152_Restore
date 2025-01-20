@interface MFGetMailboxIntentResponse
- (MFGetMailboxIntentResponse)init;
- (MFGetMailboxIntentResponse)initWithBackingStore:(id)a3;
- (MFGetMailboxIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (MFGetMailboxIntentResponse)initWithCoder:(id)a3;
- (MFGetMailboxIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation MFGetMailboxIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = MFGetMailboxIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  sub_100084D28(a3);
}

- (MFGetMailboxIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (MFGetMailboxIntentResponse *)MFGetMailboxIntentResponse.init(code:userActivity:)(a3, a4);
}

- (MFGetMailboxIntentResponse)init
{
  return (MFGetMailboxIntentResponse *)MFGetMailboxIntentResponse.init()();
}

- (MFGetMailboxIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MFGetMailboxIntentResponse *)MFGetMailboxIntentResponse.init(coder:)(a3);
}

- (MFGetMailboxIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (MFGetMailboxIntentResponse *)MFGetMailboxIntentResponse.init(backingStore:)(a3);
}

- (MFGetMailboxIntentResponse)initWithPropertiesByName:(id)a3
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
  return (MFGetMailboxIntentResponse *)MFGetMailboxIntentResponse.init(propertiesByName:)(v6);
}

@end