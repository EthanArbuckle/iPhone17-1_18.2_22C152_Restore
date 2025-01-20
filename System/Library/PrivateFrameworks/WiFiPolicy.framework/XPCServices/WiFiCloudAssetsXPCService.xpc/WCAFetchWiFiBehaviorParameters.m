@interface WCAFetchWiFiBehaviorParameters
+ (void)fetchWiFiBehaviorWithCompletion:(id)a3;
- (NSArray)ambiguousSSIDs;
- (NSArray)internalSSIDs;
- (NSDictionary)apProfile;
- (NSDictionary)beaconParsing;
- (NSDictionary)datapathTelemetry;
- (NSDictionary)disabledMacRandomizationVersions;
- (NSDictionary)jtrnDefaults;
- (NSDictionary)softErrors;
- (void)setAmbiguousSSIDs:(id)a3;
- (void)setApProfile:(id)a3;
- (void)setBeaconParsing:(id)a3;
- (void)setDatapathTelemetry:(id)a3;
- (void)setDisabledMacRandomizationVersions:(id)a3;
- (void)setInternalSSIDs:(id)a3;
- (void)setJtrnDefaults:(id)a3;
- (void)setSoftErrors:(id)a3;
@end

@implementation WCAFetchWiFiBehaviorParameters

+ (void)fetchWiFiBehaviorWithCompletion:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = objc_alloc_init((Class)WCAFetchKeyValuesRequest);
  v9[0] = @"WiFiInternalSSIDs";
  v9[1] = @"MacRandomization";
  v9[2] = @"SoftErrors";
  v9[3] = @"JTRN";
  v9[4] = @"DataPathTelemetry";
  v9[5] = @"WiFiAmbiguousSSIDs";
  v9[6] = @"AccessPointProfile";
  v9[7] = @"BeaconParsing";
  v3 = +[NSArray arrayWithObjects:v9 count:8];
  objc_msgSend(v7, "setKeys:");

  id v4 = +[WCAAsset wifiBehaviorPlistAsset];
  objc_msgSend(v7, "setAsset:");

  id v6 = location[0];
  objc_msgSend(v7, "setCompletionHandler:");
  id v5 = +[WCAClient sharedClient];
  [v5 executeFetchRequest:v7];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (NSArray)internalSSIDs
{
  return self->_internalSSIDs;
}

- (void)setInternalSSIDs:(id)a3
{
}

- (NSDictionary)disabledMacRandomizationVersions
{
  return self->_disabledMacRandomizationVersions;
}

- (void)setDisabledMacRandomizationVersions:(id)a3
{
}

- (NSDictionary)softErrors
{
  return self->_softErrors;
}

- (void)setSoftErrors:(id)a3
{
}

- (NSDictionary)datapathTelemetry
{
  return self->_datapathTelemetry;
}

- (void)setDatapathTelemetry:(id)a3
{
}

- (NSDictionary)jtrnDefaults
{
  return self->_jtrnDefaults;
}

- (void)setJtrnDefaults:(id)a3
{
}

- (NSArray)ambiguousSSIDs
{
  return self->_ambiguousSSIDs;
}

- (void)setAmbiguousSSIDs:(id)a3
{
}

- (NSDictionary)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
}

- (NSDictionary)beaconParsing
{
  return self->_beaconParsing;
}

- (void)setBeaconParsing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end