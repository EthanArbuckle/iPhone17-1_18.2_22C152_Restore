@interface ISONewOfferResponse
- (BOOL)shouldDisplayOfferNow;
- (id)error;
- (id)toContext;
@end

@implementation ISONewOfferResponse

- (id)error
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

- (id)toContext
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

- (BOOL)shouldDisplayOfferNow
{
  id v2 = +[ISONotificationContent notImplementedException];
  objc_exception_throw(v2);
}

@end