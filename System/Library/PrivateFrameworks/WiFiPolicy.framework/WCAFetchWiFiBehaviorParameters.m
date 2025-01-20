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
  v14[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(WCAFetchKeyValuesRequest);
  v14[0] = @"WiFiInternalSSIDs";
  v14[1] = @"MacRandomization";
  v14[2] = @"SoftErrors";
  v14[3] = @"JTRN";
  v14[4] = @"DataPathTelemetry";
  v14[5] = @"WiFiAmbiguousSSIDs";
  v14[6] = @"AccessPointProfile";
  v14[7] = @"BeaconParsing";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:8];
  [(WCAFetchKeyValuesRequest *)v4 setKeys:v5];

  v6 = +[WCAAsset wifiBehaviorPlistAsset];
  [(WCAFetchRequest *)v4 setAsset:v6];

  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke;
  v12 = &unk_1E69BE318;
  id v13 = v3;
  id v7 = v3;
  [(WCAFetchRequest *)v4 setCompletionHandler:&v9];
  v8 = +[WCAClient sharedClient];
  [v8 executeFetchRequest:v4];
}

void __66__WCAFetchWiFiBehaviorParameters_fetchWiFiBehaviorWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v33 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v33;
    v4 = objc_opt_new();
    v5 = [v3 keyValues];
    v6 = [v5 objectForKeyedSubscript:@"WiFiInternalSSIDs"];
    id v7 = [v6 arrayValue];
    [v4 setInternalSSIDs:v7];

    v8 = [v3 keyValues];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"MacRandomization"];
    uint64_t v10 = [v9 dictionaryValue];
    [v4 setDisabledMacRandomizationVersions:v10];

    v11 = [v3 keyValues];
    v12 = [v11 objectForKeyedSubscript:@"SoftErrors"];
    id v13 = [v12 dictionaryValue];
    [v4 setSoftErrors:v13];

    v14 = [v3 keyValues];
    v15 = [v14 objectForKeyedSubscript:@"DataPathTelemetry"];
    v16 = [v15 dictionaryValue];
    [v4 setDatapathTelemetry:v16];

    v17 = [v3 keyValues];
    v18 = [v17 objectForKeyedSubscript:@"JTRN"];
    v19 = [v18 dictionaryValue];
    [v4 setJtrnDefaults:v19];

    v20 = [v3 keyValues];
    v21 = [v20 objectForKeyedSubscript:@"WiFiAmbiguousSSIDs"];
    v22 = [v21 arrayValue];
    [v4 setAmbiguousSSIDs:v22];

    v23 = [v3 keyValues];
    v24 = [v23 objectForKeyedSubscript:@"AccessPointProfile"];
    v25 = [v24 dictionaryValue];
    [v4 setApProfile:v25];

    v26 = [v3 keyValues];
    v27 = [v26 objectForKeyedSubscript:@"BeaconParsing"];
    v28 = [v27 dictionaryValue];
    [v4 setBeaconParsing:v28];

    uint64_t v29 = *(void *)(a1 + 32);
    if (v29) {
      (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v4);
    }
  }
  else
  {
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    NSLog(&cfstr_ErrorResponseI.isa, v31);

    uint64_t v32 = *(void *)(a1 + 32);
    if (v32) {
      (*(void (**)(uint64_t, void))(v32 + 16))(v32, 0);
    }
  }
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
  objc_storeStrong((id *)&self->_beaconParsing, 0);
  objc_storeStrong((id *)&self->_apProfile, 0);
  objc_storeStrong((id *)&self->_ambiguousSSIDs, 0);
  objc_storeStrong((id *)&self->_jtrnDefaults, 0);
  objc_storeStrong((id *)&self->_datapathTelemetry, 0);
  objc_storeStrong((id *)&self->_softErrors, 0);
  objc_storeStrong((id *)&self->_disabledMacRandomizationVersions, 0);

  objc_storeStrong((id *)&self->_internalSSIDs, 0);
}

@end