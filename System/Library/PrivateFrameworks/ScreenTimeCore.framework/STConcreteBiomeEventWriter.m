@interface STConcreteBiomeEventWriter
+ (int)_eventKindForResourceType:(int64_t)a3 fillingWebsitePath:(id *)a4 fillingBundleID:(id *)a5 withResourceIdentifier:(id)a6;
- (id)writeAskForTimeRequestEvent:(id)a3;
- (id)writeAskForTimeResponseEvent:(id)a3;
- (id)writeDowntimeStateEvent:(id)a3;
@end

@implementation STConcreteBiomeEventWriter

- (id)writeAskForTimeRequestEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resourceType];
  id v27 = 0;
  id v28 = 0;
  v5 = [v3 requestedResourceIdentifier];
  uint64_t v6 = +[STConcreteBiomeEventWriter _eventKindForResourceType:v4 fillingWebsitePath:&v28 fillingBundleID:&v27 withResourceIdentifier:v5];
  id v7 = v28;
  id v8 = v27;

  id v9 = objc_alloc((Class)BMScreenTimeRequestEvent);
  v10 = [v3 identifier];
  v11 = [v3 timestamp];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;
  v14 = [v3 requesterUserID];
  v15 = [v14 dsid];
  v16 = [v15 stringValue];
  id v17 = [v9 initWithRequestID:v10 kind:v6 status:1 eventTime:0 approvalTime:v16 requesterDSID:0 responderDSID:v13 websitePath:v7 bundleID:v8];

  if (v17)
  {
    v18 = +[BMStreams screenTimeRequestStream];
    id v19 = [v18 source];

    [v19 sendEvent:v17];
    v20 = +[STLog ask];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v3 identifier];
      *(_DWORD *)buf = 138543362;
      v30 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Wrote ask for time request: %{public}@ into biome stream", buf, 0xCu);
    }
    uint64_t v22 = +[STResult success];
  }
  else
  {
    v23 = +[STLog ask];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100268FF0(v3);
    }

    id v24 = objc_alloc((Class)NSError);
    id v19 = [v24 initWithDomain:STErrorDomain code:53 userInfo:0];
    uint64_t v22 = +[STResult failure:v19];
  }
  v25 = (void *)v22;

  return v25;
}

- (id)writeAskForTimeResponseEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resourceType];
  id v35 = 0;
  id v36 = 0;
  v5 = [v3 requestedResourceIdentifier];
  unsigned int v31 = +[STConcreteBiomeEventWriter _eventKindForResourceType:v4 fillingWebsitePath:&v36 fillingBundleID:&v35 withResourceIdentifier:v5];
  id v34 = v36;
  id v33 = v35;

  unint64_t v6 = (unint64_t)[v3 approvedTime];
  if (v6 > 3)
  {
    id v7 = 0;
    unsigned int v30 = 0;
  }
  else
  {
    id v7 = (id)v6;
    unsigned int v30 = dword_100284BF0[v6];
  }
  id v8 = objc_alloc((Class)BMScreenTimeRequestEvent);
  id v9 = [v3 identifier];
  v10 = [v3 timestamp];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;
  double v13 = [v3 requesterUserID];
  v14 = [v13 dsid];
  v15 = [v14 stringValue];
  v32 = v3;
  v16 = [v3 responderUserID];
  id v17 = [v16 dsid];
  v18 = [v17 stringValue];
  id v19 = [v8 initWithRequestID:v9 kind:v31 status:v30 eventTime:v7 approvalTime:v15 requesterDSID:v18 responderDSID:v12 websitePath:v34 bundleID:v33];

  if (v19)
  {
    v20 = +[BMStreams screenTimeRequestStream];
    id v21 = [v20 source];

    [v21 sendEvent:v19];
    uint64_t v22 = +[STLog ask];
    v23 = v32;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v32 identifier];
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Wrote ask for time response: %{public}@ into biome stream", buf, 0xCu);
    }
    uint64_t v25 = +[STResult success];
  }
  else
  {
    v26 = +[STLog ask];
    v23 = v32;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100269078(v32);
    }

    id v27 = objc_alloc((Class)NSError);
    id v21 = [v27 initWithDomain:STErrorDomain code:53 userInfo:0];
    uint64_t v25 = +[STResult failure:v21];
  }
  id v28 = (void *)v25;

  return v28;
}

+ (int)_eventKindForResourceType:(int64_t)a3 fillingWebsitePath:(id *)a4 fillingBundleID:(id *)a5 withResourceIdentifier:(id)a6
{
  id v9 = a6;
  v10 = v9;
  if (a3 != 1)
  {
    if (a3)
    {
      LODWORD(a3) = 0;
      goto LABEL_8;
    }
    LODWORD(a3) = 2;
    if (!a5) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  a5 = a4;
  if (a4) {
LABEL_6:
  }
    *a5 = v9;
LABEL_8:

  return a3;
}

- (id)writeDowntimeStateEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 enabled]);
  v5 = [v3 userID];
  unint64_t v6 = [v5 dsid];
  id v7 = [v6 stringValue];

  id v8 = objc_alloc((Class)BMScreenTimeChildState);
  id v9 = [v3 identifier];
  v10 = [v3 downtimeDate];
  id v11 = [v8 initWithStarting:v4 eventID:v9 signalDate:v10 userDSID:v7 state:1];

  if (v11)
  {
    double v12 = BiomeLibrary();
    double v13 = [v12 Family];
    v14 = [v13 ScreenTime];
    id v15 = [v14 ChildState];

    v16 = [v15 source];
    [v16 sendEvent:v11];
    id v17 = +[STLog reactor];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [v3 identifier];
      unsigned int v19 = [v3 enabled];
      v20 = [v3 userID];
      int v25 = 138543875;
      v26 = v18;
      __int16 v27 = 1024;
      unsigned int v28 = v19;
      __int16 v29 = 2113;
      unsigned int v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Wrote downtime state event: %{public}@ into biome stream with state %d for child dsid: %{private}@", (uint8_t *)&v25, 0x1Cu);
    }
    id v21 = +[STResult success];
  }
  else
  {
    uint64_t v22 = +[STLog ask];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100269100(v3);
    }

    id v23 = objc_alloc((Class)NSError);
    id v15 = [v23 initWithDomain:STErrorDomain code:55 userInfo:0];
    id v21 = +[STResult failure:v15];
  }

  return v21;
}

@end