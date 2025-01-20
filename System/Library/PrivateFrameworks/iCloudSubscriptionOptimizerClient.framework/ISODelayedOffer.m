@interface ISODelayedOffer
- (id)newOfferResponse;
- (id)serverDict;
@end

@implementation ISODelayedOffer

- (id)serverDict
{
  id v2 = [(ISODelayedOffer *)self newOfferResponse];
  v3 = [v2 toContext];

  return v3;
}

- (id)newOfferResponse
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

@end