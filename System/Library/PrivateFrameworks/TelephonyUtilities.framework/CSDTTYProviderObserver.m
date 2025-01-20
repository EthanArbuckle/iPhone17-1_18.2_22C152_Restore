@interface CSDTTYProviderObserver
- (RTTTelephonyUtilities)utilityProvider;
- (unint64_t)transportMethod;
@end

@implementation CSDTTYProviderObserver

- (RTTTelephonyUtilities)utilityProvider
{
  v2 = (void *)CUTWeakLinkClass();

  return (RTTTelephonyUtilities *)_[v2 sharedUtilityProvider];
}

- (unint64_t)transportMethod
{
  v2 = [(CSDTTYProviderObserver *)self utilityProvider];
  id v3 = [v2 currentPreferredTransportMethod];

  if (v3 == (id)2) {
    return 2;
  }
  else {
    return v3 == (id)1;
  }
}

@end