@interface APMetric
- (BOOL)validateMetricAndSetupIdentifiers:(id)a3;
- (id)_clientSourceIDMap;
- (id)_descriptionWithFormat:(id)a3;
- (id)_metric;
- (id)_purpose;
- (id)additives:(id)a3;
- (id)description;
- (id)ecServerDictionaryRepresentation;
- (id)metricRoute;
- (void)updateClientBundleID:(id)a3;
@end

@implementation APMetric

- (id)ecServerDictionaryRepresentation
{
  v3 = +[NSNumber numberWithInteger:[(APMetric *)self metric]];
  uint64_t v4 = kAPMetricEvent;
  v5 = [(APMetric *)self handle];
  uint64_t v6 = kAPMetricHandle;
  v7 = +[NSNumber numberWithInteger:[(APMetric *)self order]];
  uint64_t v8 = kAPMetricOrder;
  v9 = +[NSNumber numberWithUnsignedInt:[(APMetric *)self source]];
  v10 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, v9, kAPMetricSource, 0);

  v11 = [(APMetric *)self properties];
  id v12 = [v11 mutableCopy];

  if (v12)
  {
    v13 = +[NSDictionary dictionaryWithDictionary:v12];
    [v10 setObject:v13 forKey:kAPMetricPropertiesKey];
  }
  v14 = [(APMetric *)self relayData];
  if (v14)
  {
    v15 = +[NSDictionary dictionaryWithDictionary:v14];
    [v10 setObject:v15 forKey:kAPMetricRelaydata];
  }
  v16 = [(APMetric *)self environment];

  if (v16)
  {
    v17 = [(APMetric *)self environment];
    [v10 setObject:v17 forKey:kAPMetricEnvironment];
  }
  v18 = [(APMetric *)self trace];

  if (v18)
  {
    v19 = [(APMetric *)self trace];
    [v10 setObject:v19 forKey:kAPMetricTrace];
  }
  uint64_t v20 = [(APMetric *)self branch];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [(APMetric *)self branch];
    id v23 = [v22 count];

    if (v23)
    {
      v24 = [(APMetric *)self branch];
      [v10 setObject:v24 forKey:kAPMetricBranch];
    }
  }

  return v10;
}

- (id)metricRoute
{
  id v2 = [(APMetric *)self purpose];

  return +[APMetricPurposeRegistry metricRouteForPurpose:v2];
}

- (BOOL)validateMetricAndSetupIdentifiers:(id)a3
{
  unint64_t v4 = (unint64_t)[(APMetric *)self purpose];
  if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = v4;
    id v6 = [(APMetric *)self metric];
    v7 = +[APMetricPurposeRegistry metricRouteForPurpose:v5];
    uint64_t v8 = +[APMetricPurposeRegistry metricRouteForPurpose:v5];
    unsigned __int8 v9 = [v8 metricIsDefined:v6];

    if ((v9 & 1) == 0)
    {
      v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12[0] = 67109376;
        v12[1] = v6;
        __int16 v13 = 1024;
        int v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Metric (%d) for purpose (%d) is not known!", (uint8_t *)v12, 0xEu);
      }
    }
  }
  return 1;
}

- (void)updateClientBundleID:(id)a3
{
  id v8 = [a3 dataUsingEncoding:4];
  unint64_t v4 = [v8 sha256];
  unint64_t v5 = [v4 asHexString];
  id v6 = [(APMetric *)self _clientSourceIDMap];
  v7 = [v6 objectForKeyedSubscript:v5];
  -[APMetric setSource:](self, "setSource:", [v7 unsignedIntValue]);
}

- (id)_purpose
{
  v3 = [(APMetric *)self metricRoute];
  unint64_t v4 = [v3 name];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ (%ld)", v4, [(APMetric *)self purpose]];

  return v5;
}

- (id)_metric
{
  v3 = [(APMetric *)self metricRoute];
  id v4 = [(APMetric *)self metric];
  unint64_t v5 = [v3 stringForMetric:v4];
  id v6 = +[NSString stringWithFormat:@"%@ (%ld)", v5, v4];

  return v6;
}

- (id)_descriptionWithFormat:(id)a3
{
  id v4 = a3;
  unint64_t v5 = +[NSISO8601DateFormatter apLocalSharedFormatter];
  id v6 = [(APMetric *)self timestamp];
  v34 = v5;
  uint64_t v35 = [v5 stringFromDate:v6];

  v40 = [(APMetric *)self _purpose];
  v39 = [(APMetric *)self _metric];
  uint64_t v7 = [(APMetric *)self handle];
  id v8 = (void *)v7;
  unsigned __int8 v9 = @"none";
  if (v7) {
    v10 = (__CFString *)v7;
  }
  else {
    v10 = @"none";
  }
  v38 = v10;

  v37 = [(APMetric *)self _options];
  uint64_t v11 = [(APMetric *)self contentIdentifier];
  id v12 = (void *)v11;
  if (v11) {
    __int16 v13 = (__CFString *)v11;
  }
  else {
    __int16 v13 = @"none";
  }
  v36 = v13;

  uint64_t v14 = [(APMetric *)self contextIdentifier];
  v15 = (void *)v14;
  if (v14) {
    v16 = (__CFString *)v14;
  }
  else {
    v16 = @"none";
  }
  v17 = v16;

  uint64_t v18 = [(APMetric *)self bundleIdentifier];
  v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (__CFString *)v18;
  }
  else {
    uint64_t v20 = @"none";
  }
  v21 = v20;

  v22 = [(APMetric *)self _properties];
  id v23 = [(APMetric *)self _internalProperties];
  v24 = [(APMetric *)self _relayData];
  id v25 = [(APMetric *)self order];
  v26 = [(APMetric *)self environment];
  if (v26)
  {
    v27 = [(APMetric *)self environment];
    unsigned __int8 v9 = [v27 componentsJoinedByString:@","];
  }
  id v41 = 0;
  v28 = (void *)v35;
  v29 = +[NSString stringWithValidatedFormat:v4, @"%@%@%@%@%@%@%@%@%@%@%@%ld%@", &v41, v35, v40, v39, v38, v37, v36, v17, v21, v22, v23, v24, v25, v9 validFormatSpecifiers error];

  id v30 = v41;
  if (v30)
  {
    v31 = APLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = [v30 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v43 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error retrieving description for metric: %{public}@", buf, 0xCu);

      v28 = (void *)v35;
    }
  }

  return v29;
}

- (id)description
{
  if (!+[APSystemInternal isAppleInternalInstall])
  {
    id v6 = [(APMetric *)self _descriptionWithFormat:@"%@ R: %@ M: %@ H: %@ O: %@, CI: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"];
    goto LABEL_50;
  }
  id v3 = objc_alloc((Class)NSUserDefaults);
  id v4 = [v3 initWithSuiteName:APDefaultsBundleID];
  if ([v4 BOOLForKey:kAPAutomationLoggingEnabled])
  {
    id v49 = v4;
    if (objc_opt_respondsToSelector())
    {
      unint64_t v5 = [(APMetric *)self ecServerDictionaryRepresentation];
    }
    else
    {
      unint64_t v5 = 0;
    }
    uint64_t v7 = +[NSISO8601DateFormatter apDefaultSharedFormatter];
    id v8 = [(APMetric *)self timestamp];
    uint64_t v9 = [v7 stringFromDate:v8];

    id v10 = [(APMetric *)self purpose];
    id v52 = [(APMetric *)self metric];
    uint64_t v11 = [v5 objectForKey:kAPMetricHandle];
    uint64_t v12 = [(APMetric *)self _optionsArray];
    uint64_t v13 = [(APMetric *)self contentIdentifier];
    uint64_t v14 = [(APMetric *)self contextIdentifier];
    uint64_t v15 = [(APMetric *)self bundleIdentifier];
    v16 = (void *)v15;
    v17 = &stru_1002392C0;
    if (v15) {
      v17 = (__CFString *)v15;
    }
    v54 = v17;

    uint64_t v18 = [v5 objectForKey:kAPMetricPropertiesKey];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = +[NSDictionary dictionary];
    }
    v55 = v20;

    v21 = [(APMetric *)self internalProperties];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = +[NSDictionary dictionary];
    }
    id v24 = v23;

    id v25 = [(APMetric *)self relayData];
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = +[NSDictionary dictionary];
    }
    v51 = v27;

    id v44 = [(APMetric *)self order];
    v28 = [(APMetric *)self environment];
    if (v28)
    {
      v29 = [(APMetric *)self environment];
      v50 = [v29 componentsJoinedByString:@","];
    }
    else
    {
      v50 = &stru_1002392C0;
    }

    v56[0] = @"TS";
    uint64_t v30 = v9;
    if (!v9)
    {
      uint64_t v30 = +[NSNull null];
    }
    v48 = (void *)v9;
    v42 = (void *)v30;
    v57[0] = v30;
    v56[1] = @"R";
    v45 = +[NSNumber numberWithInteger:v10];
    v57[1] = v45;
    v56[2] = @"M";
    v43 = +[NSNumber numberWithInteger:v52];
    v57[2] = v43;
    v56[3] = @"H";
    uint64_t v31 = v11;
    if (!v11)
    {
      uint64_t v31 = +[NSNull null];
    }
    v47 = (void *)v11;
    id v41 = (void *)v31;
    v57[3] = v31;
    v56[4] = @"O";
    v32 = (void *)v12;
    if (!v12)
    {
      v32 = +[NSNull null];
    }
    v53 = v24;
    v46 = (void *)v12;
    v57[4] = v32;
    v56[5] = @"CI";
    v33 = (void *)v13;
    if (!v13)
    {
      v33 = +[NSNull null];
    }
    v34 = (void *)v13;
    v57[5] = v33;
    v56[6] = @"CX";
    uint64_t v35 = v14;
    if (!v14)
    {
      uint64_t v35 = +[NSNull null];
    }
    v57[6] = v35;
    v57[7] = v54;
    v56[7] = @"BID";
    v56[8] = @"P";
    v36 = v55;
    if (!v55)
    {
      v36 = +[NSNull null];
    }
    v57[8] = v36;
    v56[9] = @"IP";
    v37 = v53;
    if (!v53)
    {
      v37 = +[NSNull null];
    }
    v57[9] = v37;
    v56[10] = @"ORD";
    v38 = +[NSNumber numberWithInteger:v44];
    v57[10] = v38;
    v57[11] = v51;
    v56[11] = @"REL";
    v56[12] = @"ENV";
    v57[12] = v50;
    v39 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:13];

    if (!v53) {
    if (!v55)
    }

    if (v14)
    {
      if (v34)
      {
LABEL_42:
        if (!v46) {

        }
        if (!v47) {
        if (!v48)
        }

        id v6 = [v39 jsonStringWithOptions:1];

        id v4 = v49;
        goto LABEL_49;
      }
    }
    else
    {

      if (v34) {
        goto LABEL_42;
      }
    }

    goto LABEL_42;
  }
  id v6 = [(APMetric *)self _descriptionWithFormat:@"%@ Purpose: %@ Metric: %@ H: %@ Options: %@, CID: %@ CX: %@ BID: %@ P: %@ IP: %@ REL: %@, ORD: %ld ENV: %@"];
LABEL_49:

LABEL_50:

  return v6;
}

- (id)_clientSourceIDMap
{
  return &off_10024B4D0;
}

- (id)additives:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [(APMetric *)self timestamp];
  v22 = +[NSISO8601DateFormatter apUTCSharedFormatter];
  id v23 = (void *)v4;
  v21 = [v22 stringFromDate:v4];
  unint64_t v5 = +[APSystemInfo osIdentifier];
  uint64_t v6 = kAPMetricOS;
  uint64_t v7 = +[APSystemInfo osVersion];
  uint64_t v8 = kAPMetricOSVersion;
  uint64_t v9 = +[APSystemInfo longBuildVersion];
  uint64_t v10 = kAPMetricOSBuild;
  uint64_t v11 = +[APDeviceInfo current];
  uint64_t v12 = [v11 deviceModel];
  uint64_t v13 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, v10, v12, kAPMetricDeviceModel, 0);

  uint64_t v14 = [(APMetric *)self bundleIdentifier];

  if (v14)
  {
    uint64_t v15 = [(APMetric *)self bundleIdentifier];
    [v13 setObject:v15 forKey:kAPMetricClientIdentifierKey];
  }
  v16 = [(APMetric *)self handle];

  if (v16)
  {
    v17 = [(APMetric *)self handle];
    [v13 setObject:v17 forKey:kAPMetricIdentifierKey];
  }
  if (v21) {
    [v13 setObject:v21 forKey:kAPMetricTimestampKey];
  }
  uint64_t v18 = [(APMetric *)self internalProperties];
  v19 = +[NSDictionary dictionaryWithDictionary:v18];
  [v24 setObject:v19 forKey:kAPMetricInternalPropertiesKey];

  [v24 setObject:v13 forKey:@"additives"];

  return v24;
}

@end