@interface APMediaServiceContextTransformer
- (APMediaServiceContextTransformer)initWithParams:(id)a3;
- (APMediaServiceRequestParameters)params;
- (id)_adRequestDictionary;
- (id)_capArray:(id)a3;
- (id)_contextDictionary;
- (id)_locationDictionary;
- (id)_odmlProperties;
- (id)_propertiesDictionary;
- (id)_requestDebugInfo;
- (id)_typeDictionary;
- (id)transformedContextJSON:(id *)a3;
- (void)_addFrequencyCappingDataToRequestDictionary:(id)a3 fromSupplementalContext:(id)a4;
- (void)_addImpressionCap:(id)a3 clickCap:(id)a4 toDictionary:(id)a5;
- (void)setParams:(id)a3;
@end

@implementation APMediaServiceContextTransformer

- (APMediaServiceContextTransformer)initWithParams:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)APMediaServiceContextTransformer;
    v6 = [(APMediaServiceContextTransformer *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_params, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Required parameter missing.", buf, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (id)transformedContextJSON:(id *)a3
{
  id v5 = +[NSMutableDictionary dictionary];
  v6 = [(APMediaServiceContextTransformer *)self _typeDictionary];
  uint64_t v7 = [(APMediaServiceContextTransformer *)self _adRequestDictionary];
  v8 = (void *)v7;
  if (!v6)
  {
    v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [(APMediaServiceContextTransformer *)self params];
      v19 = [v18 context];
      v20 = [v19 identifier];
      *(_DWORD *)buf = 138543362;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Error requestType nil %{public}@", buf, 0xCu);
    }
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    CFStringRef v40 = @"Error unexpected nil requestType";
    v21 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v22 = 2121;
    goto LABEL_21;
  }
  if (!v7)
  {
    v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [(APMediaServiceContextTransformer *)self params];
      v25 = [v24 context];
      v26 = [v25 identifier];
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Error adRequestDict nil %{public}@", buf, 0xCu);
    }
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    CFStringRef v38 = @"Error unexpected nil adRequestDict";
    v21 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v22 = 2122;
LABEL_21:
    id v15 = +[NSError errorWithDomain:@"APMediaServiceErrorDomain" code:v22 userInfo:v21];

    if (a3)
    {
      id v15 = v15;
      id v16 = 0;
      *a3 = v15;
    }
    else
    {
      id v16 = 0;
    }
    goto LABEL_30;
  }
  if (+[APSystemInternal isAppleInternalInstall])
  {
    if (!+[NSJSONSerialization isValidJSONObject:v6])
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error not valid json object requestType %@", buf, 0xCu);
      }

      v10 = +[NSString stringWithFormat:@"Error transforming context requestType not json"];
      CreateDiagnosticReport();
    }
    if (!+[NSJSONSerialization isValidJSONObject:v8])
    {
      objc_super v11 = APLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error not valid json object adRequestDictionary %@", buf, 0xCu);
      }

      v12 = +[NSString stringWithFormat:@"Error transforming context adRequestDict not json"];
      CreateDiagnosticReport();
    }
  }
  [v5 setObject:v6 forKey:@"type"];
  [v5 setObject:v8 forKey:@"AdRequest"];
  id v32 = 0;
  v13 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v32];
  id v14 = v32;
  id v15 = v14;
  if (!v13 || v14)
  {
    if (a3) {
      *a3 = v14;
    }
    v27 = APLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = [(APMediaServiceContextTransformer *)self params];
      v29 = [v28 context];
      v30 = [v29 identifier];
      *(_DWORD *)buf = 138543618;
      v34 = v30;
      __int16 v35 = 2114;
      id v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error serializing request for context %{public}@: %{public}@", buf, 0x16u);
    }
    id v16 = 0;
  }
  else
  {
    id v16 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
  }

LABEL_30:

  return v16;
}

- (id)_typeDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:&off_10024A478 forKey:@"id"];
  v4 = [(APMediaServiceContextTransformer *)self params];
  id v5 = (char *)[v4 placement];

  if ((unint64_t)(v5 - 7006) > 2) {
    CFStringRef v6 = @"SLPAdRequest";
  }
  else {
    CFStringRef v6 = *(&off_100239158 + (void)(v5 - 7006));
  }
  [v3 setObject:v6 forKey:@"value"];
  [v3 setObject:&off_10024A490 forKey:@"version"];

  return v3;
}

- (id)_adRequestDictionary
{
  v3 = [(APMediaServiceContextTransformer *)self params];
  v4 = [v3 context];
  id v5 = [v4 supplementalContext];

  CFStringRef v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:@"Regular" forKey:@"RequestType"];
  uint64_t v7 = [(APMediaServiceContextTransformer *)self params];
  v8 = [v7 context];
  v9 = [v8 identifier];
  v10 = [v9 UUIDString];
  [v6 setObject:v10 forKey:@"deviceRequestID"];

  objc_super v11 = [(APMediaServiceContextTransformer *)self _propertiesDictionary];
  [v6 setObject:v11 forKey:@"properties"];

  v12 = [(APMediaServiceContextTransformer *)self _contextDictionary];
  [v6 setObject:v12 forKey:@"context"];

  v13 = [(APMediaServiceContextTransformer *)self params];
  if ([v13 placement] == (id)7007)
  {
  }
  else
  {
    id v14 = [(APMediaServiceContextTransformer *)self params];
    id v15 = [v14 placement];

    if (v15 != (id)7008) {
      goto LABEL_8;
    }
  }
  id v16 = [(APMediaServiceContextTransformer *)self params];
  v17 = [v16 adamId];
  if (v17)
  {
    [v6 setObject:v17 forKey:@"sourceAppId"];
  }
  else
  {
    v18 = +[NSNull null];
    [v6 setObject:v18 forKey:@"sourceAppId"];
  }
LABEL_8:
  [(APMediaServiceContextTransformer *)self _addFrequencyCappingDataToRequestDictionary:v6 fromSupplementalContext:v5];
  v19 = [(APMediaServiceContextTransformer *)self params];
  unsigned int v20 = [v19 hasOdml];

  if (v20)
  {
    v21 = [(APMediaServiceContextTransformer *)self _odmlProperties];
    [v6 setObject:v21 forKey:@"odmlProperties"];
  }

  return v6;
}

- (id)_propertiesDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(APMediaServiceContextTransformer *)self params];
  id v5 = [v4 idAccount];
  CFStringRef v6 = [v5 DPID];
  if (v6)
  {
    [v3 setObject:v6 forKey:@"DPIDString"];
  }
  else
  {
    id v7 = objc_alloc_init((Class)NSNull);
    [v3 setObject:v7 forKey:@"DPIDString"];
  }
  v8 = [(APMediaServiceContextTransformer *)self params];
  v9 = [v8 idAccount];
  v10 = [v9 toroID];
  objc_super v11 = [v10 UUIDString];
  [v3 setObject:v11 forKey:@"clientId"];

  v12 = +[APDeviceInfo current];
  v13 = [v12 deviceModel];
  if (v13)
  {
    [v3 setObject:v13 forKey:@"deviceModel"];
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSNull);
    [v3 setObject:v14 forKey:@"deviceModel"];
  }
  id v15 = +[NSDate date];
  [v15 timeIntervalSince1970];
  id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v16 forKey:@"clientClockTime"];

  v17 = +[NSTimeZone localTimeZone];
  v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)[v17 secondsFromGMT] / 3600.0);
  [v3 setObject:v18 forKey:@"timezone"];

  v19 = +[NSProcessInfo processInfo];
  unsigned int v20 = [v19 operatingSystemVersionString];
  [v3 setObject:v20 forKey:@"osVersionAndBuild"];

  v21 = [(APMediaServiceContextTransformer *)self params];
  uint64_t v22 = [v21 context];
  v23 = [v22 supplementalContext];
  v24 = [v23 objectForKey:@"storeFront"];
  v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = objc_alloc_init((Class)NSNull);
  }
  v27 = v26;

  [v3 setObject:v27 forKey:@"iTunesStore"];
  v28 = [(APMediaServiceContextTransformer *)self params];
  v29 = [v28 context];
  v30 = [v29 supplementalContext];
  v31 = [v30 objectForKey:@"storeFrontLocale"];
  id v32 = v31;
  if (v31) {
    id v33 = v31;
  }
  else {
    id v33 = objc_alloc_init((Class)NSNull);
  }
  v34 = v33;

  [v3 setObject:v34 forKey:@"storeFrontLocaleIdentifier"];
  if ([v12 educationModeEnabled])
  {
    CFStringRef v55 = @"EducationMode";
    __int16 v35 = &v55;
  }
  else
  {
    CFStringRef v54 = @"Default";
    __int16 v35 = &v54;
  }
  id v36 = +[NSArray arrayWithObjects:v35 count:1];
  [v3 setObject:v36 forKey:@"deviceMode"];

  NSErrorUserInfoKey v37 = +[NSMutableArray array];
  CFStringRef v38 = [(APMediaServiceContextTransformer *)self params];
  NSErrorUserInfoKey v39 = [v38 idAccount];

  CFStringRef v40 = [v39 iTunesDSID];
  unsigned __int8 v41 = [v40 isEqualToNumber:&off_10024A4A8];

  if (v41)
  {
    CFStringRef v42 = @"NoAccount";
LABEL_29:
    [v37 addObject:v42];
    goto LABEL_30;
  }
  if ([v39 isManagedAccount]) {
    [v37 addObject:@"ManagedAccount"];
  }
  if ([v39 ageUnknown])
  {
    CFStringRef v42 = @"AgeUnknown";
    goto LABEL_29;
  }
  if ([v39 isChild])
  {
    CFStringRef v42 = @"U18";
    CFStringRef v43 = @"U13";
LABEL_28:
    [v37 addObject:v43];
    goto LABEL_29;
  }
  if ([v39 isAdolescent])
  {
    CFStringRef v42 = @"U18";
    goto LABEL_29;
  }
  if ([v39 sensitiveContentEligible])
  {
    CFStringRef v42 = @"Consumer";
    CFStringRef v43 = @"SensitiveContentEligible";
    goto LABEL_28;
  }
  if ([v39 isAdult])
  {
    CFStringRef v42 = @"Consumer";
    goto LABEL_29;
  }
LABEL_30:
  [v3 setObject:v37 forKey:@"accountType"];
  v44 = [v39 monthlyIDResetCount];
  if (v44)
  {
    [v3 setObject:v44 forKey:@"advertisingIdentifierMonthResetCount"];
  }
  else
  {
    id v45 = objc_alloc_init((Class)NSNull);
    [v3 setObject:v45 forKey:@"advertisingIdentifierMonthResetCount"];
  }
  if ([v12 personalizedAdsAcknowledged]) {
    uint64_t v46 = [v12 personalizedAdsEnabled] ^ 1;
  }
  else {
    uint64_t v46 = 1;
  }
  v47 = +[NSNumber numberWithBool:v46];
  [v3 setObject:v47 forKey:@"limitAdTracking"];

  id v48 = [v12 connectionType];
  if ((unint64_t)v48 > 9) {
    CFStringRef v49 = @"UnknownConnection";
  }
  else {
    CFStringRef v49 = *(&off_100239170 + (void)v48);
  }
  [v3 setObject:v49 forKey:@"connectionType"];
  v50 = [(APMediaServiceContextTransformer *)self _locationDictionary];
  [v3 setObject:v50 forKey:@"currentLocation"];

  v51 = [(APMediaServiceContextTransformer *)self _requestDebugInfo];
  if (v51)
  {
    v52 = [(APMediaServiceContextTransformer *)self _requestDebugInfo];
    [v3 setObject:v52 forKey:@"requestDebugInfo"];
  }

  return v3;
}

- (id)_locationDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[APDeviceInfo current];
  if ([v4 educationModeEnabled])
  {
LABEL_2:

    goto LABEL_4;
  }
  id v5 = +[APIDAccountProvider privateUserAccount];
  unsigned __int8 v6 = [v5 isManagedAccount];

  if ((v6 & 1) == 0)
  {
    v8 = [(APMediaServiceContextTransformer *)self params];
    v9 = [v8 clientInfo];
    v4 = [v9 locationInfo];

    if (v4 && ([v4 isEmpty] & 1) == 0)
    {
      v10 = [v4 isoCountryCode];

      if (v10)
      {
        objc_super v11 = [v4 isoCountryCode];
        [v3 setObject:v11 forKey:@"isoCountryCode"];
      }
      v12 = [v4 postalCode];

      if (v12)
      {
        v13 = [v4 postalCode];
        [v3 setObject:v13 forKey:@"postalCode"];
      }
      id v14 = [v4 administrativeArea];

      if (v14)
      {
        id v15 = [v4 administrativeArea];
        [v3 setObject:v15 forKey:@"administrativeArea"];
      }
      id v16 = [v4 isoCountryCode];

      if (v16)
      {
        v17 = [v4 isoCountryCode];
        [v3 setObject:v17 forKey:@"isoCountryCode"];
      }
      v18 = [v4 locality];

      if (v18)
      {
        v19 = [v4 locality];
        [v3 setObject:v19 forKey:@"locality"];
      }
      unsigned int v20 = [v4 subAdministrativeArea];

      if (v20)
      {
        v21 = [v4 subAdministrativeArea];
        [v3 setObject:v21 forKey:@"subAdministrativeArea"];
      }
    }
    goto LABEL_2;
  }
LABEL_4:

  return v3;
}

- (id)_requestDebugInfo
{
  if (+[APSystemInternal isAppleInternalInstall])
  {
    v3 = +[NSMutableDictionary dictionary];
    v4 = +[APMediaServiceRequestSettings settings];
    id v5 = [(APMediaServiceContextTransformer *)self params];
    unsigned __int8 v6 = [v4 campaignNamespaceForPlacement:[v5 placement]];

    if (v6) {
      [v3 setObject:v6 forKey:@"campaignNamespace"];
    }
    id v7 = objc_alloc((Class)NSUserDefaults);
    id v8 = [v7 initWithSuiteName:APDefaultsBundleID];
    uint64_t v9 = [v8 objectForKey:@"ToroTestClient"];
    v10 = (void *)v9;
    if (v9) {
      objc_super v11 = (void *)v9;
    }
    else {
      objc_super v11 = &__kCFBooleanTrue;
    }
    [v3 setObject:v11 forKey:@"isTest"];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_capArray:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [v3 allKeys];
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v18[1] = @"value";
        v19[0] = v9;
        v18[0] = @"key";
        v10 = [v3 objectForKeyedSubscript:];
        v19[1] = v10;
        objc_super v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
        [v4 addObject:v11];
      }
      id v6 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_contextDictionary
{
  return +[NSDictionary dictionary];
}

- (id)_odmlProperties
{
  return +[NSDictionary dictionary];
}

- (void)_addImpressionCap:(id)a3 clickCap:(id)a4 toDictionary:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v10 = [(APMediaServiceContextTransformer *)self _capArray:v14];
  }
  else
  {
    uint64_t v10 = +[NSArray array];
  }
  objc_super v11 = (void *)v10;
  [v9 setObject:v10 forKey:@"impressionCapDataByAdamId"];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v12 = [(APMediaServiceContextTransformer *)self _capArray:v8];
  }
  else
  {
    uint64_t v12 = +[NSArray array];
  }
  v13 = (void *)v12;
  [v9 setObject:v12 forKey:@"clickCapDataByAdamId"];
}

- (void)_addFrequencyCappingDataToRequestDictionary:(id)a3 fromSupplementalContext:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [(APMediaServiceContextTransformer *)self params];
  id v8 = [v7 placement];

  if (v8 == (id)7006)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [v20 setObject:v9 forKeyedSubscript:@"TodaySlot1"];
    uint64_t v10 = [v6 objectForKey:@"impressionCap"];
    objc_super v11 = [v6 objectForKey:@"clickCap"];
    [(APMediaServiceContextTransformer *)self _addImpressionCap:v10 clickCap:v11 toDictionary:v9];

    uint64_t v12 = [v6 objectForKey:@"additionalImpressionCaps"];
    v13 = [v6 objectForKey:@"additionalClickCaps"];

    id v14 = +[NSMutableDictionary dictionary];

    [v20 setObject:v14 forKeyedSubscript:@"TodaySlot2"];
    long long v15 = [v12 objectForKey:&off_10024A4C0];
    long long v16 = [v13 objectForKey:&off_10024A4C0];
    [(APMediaServiceContextTransformer *)self _addImpressionCap:v15 clickCap:v16 toDictionary:v14];

    uint64_t v17 = [v12 objectForKey:&off_10024A4D8];
    uint64_t v18 = [v13 objectForKey:&off_10024A4D8];
    if (v17 | v18)
    {
      uint64_t v19 = +[NSMutableDictionary dictionary];

      [v20 setObject:v19 forKeyedSubscript:@"TodaySlot3"];
      [(APMediaServiceContextTransformer *)self _addImpressionCap:v17 clickCap:v18 toDictionary:v19];
      id v14 = (void *)v19;
    }
  }
  else
  {
    id v14 = [v6 objectForKey:@"impressionCap"];
    uint64_t v12 = [v6 objectForKey:@"clickCap"];

    [(APMediaServiceContextTransformer *)self _addImpressionCap:v14 clickCap:v12 toDictionary:v20];
  }
}

- (APMediaServiceRequestParameters)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end