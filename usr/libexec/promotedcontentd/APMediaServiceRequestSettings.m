@interface APMediaServiceRequestSettings
+ (id)storageWithDefaultValues:(id)a3;
- (BOOL)disablePlacementParamValue;
- (BOOL)ignoreBagKeyCheckValue;
- (BOOL)prettyPrintJsonValue;
- (BOOL)useAMSBagValue;
- (id)_readResponseJsonForPlacement:(unint64_t)a3;
- (id)campaignNamespaceForPlacement:(unint64_t)a3;
- (id)mockResponseResultForPlacement:(unint64_t)a3;
@end

@implementation APMediaServiceRequestSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:v3];

  return v4;
}

- (BOOL)prettyPrintJsonValue
{
  v2 = [(APMediaServiceRequestSettings *)self prettyPrintJson];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)useAMSBagValue
{
  v2 = [(APMediaServiceRequestSettings *)self useAMSBag];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)ignoreBagKeyCheckValue
{
  v2 = [(APMediaServiceRequestSettings *)self ignoreBagKeyCheck];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)mockResponseResultForPlacement:(unint64_t)a3
{
  id v3 = [(APMediaServiceRequestSettings *)self _readResponseJsonForPlacement:a3];
  if (v3)
  {
    unsigned __int8 v4 = objc_alloc_init(APMockedAMSURLResult);
    v5 = [v3 dataUsingEncoding:4];
    [(APMockedAMSURLResult *)v4 setMockData:v5];

    [(APMockedAMSURLResult *)v4 setMockResponseHeaders:&__NSDictionary0__struct];
    [(APMockedAMSURLResult *)v4 setMockResponseStatusCode:200];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (id)_readResponseJsonForPlacement:(unint64_t)a3
{
  id v3 = +[NSString stringWithFormat:@"APMediaServiceRequestSettings.mockResponseJson_%lu", a3];
  id v4 = objc_alloc((Class)NSUserDefaults);
  id v5 = [v4 initWithSuiteName:APDefaultsBundleID];
  v6 = [v5 objectForKey:v3];

  return v6;
}

- (id)campaignNamespaceForPlacement:(unint64_t)a3
{
  id v3 = +[NSString stringWithFormat:@"APMediaServiceRequestSettings.campaignNamespace_%lu", a3];
  id v4 = objc_alloc((Class)NSUserDefaults);
  id v5 = [v4 initWithSuiteName:APDefaultsBundleID];
  v6 = [v5 objectForKey:v3];

  return v6;
}

- (BOOL)disablePlacementParamValue
{
  v2 = [(APMediaServiceRequestSettings *)self disablePlacementParam];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end