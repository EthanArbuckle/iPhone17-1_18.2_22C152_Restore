@interface AddCallParticipantIntentHandlerDataSource
- (NSArray)isoCountryCodes;
@end

@implementation AddCallParticipantIntentHandlerDataSource

- (NSArray)isoCountryCodes
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = TUNetworkCountryCode();
  id v4 = [v3 length];

  if (v4)
  {
    v5 = TUNetworkCountryCode();
    [v2 addObject:v5];
  }
  v6 = TUHomeCountryCode();
  id v7 = [v6 length];

  if (v7)
  {
    v8 = TUHomeCountryCode();
    [v2 addObject:v8];
  }

  return (NSArray *)v2;
}

@end