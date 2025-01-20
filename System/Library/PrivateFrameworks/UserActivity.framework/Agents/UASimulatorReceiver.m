@interface UASimulatorReceiver
- (BOOL)active;
- (BOOL)doSetReceivedItems:(id)a3;
- (BOOL)fetchAdvertisedItems:(BOOL)a3;
- (BOOL)receiving;
- (NSArray)receivedItems;
- (UASimulator)simulator;
- (UASimulatorReceiver)initWithSimulator:(id)a3;
- (id)statusString;
@end

@implementation UASimulatorReceiver

- (UASimulatorReceiver)initWithSimulator:(id)a3
{
  id v5 = a3;
  v6 = [v5 controller];
  v7 = [v6 manager];
  v10.receiver = self;
  v10.super_class = (Class)UASimulatorReceiver;
  v8 = [(UAReceiver *)&v10 initWithManager:v7 name:@"SimReceiver"];

  if (v8) {
    objc_storeStrong((id *)&v8->_simulator, a3);
  }

  return v8;
}

- (BOOL)receiving
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSArray *)v2->_receivedItems firstObject];
  BOOL v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)doSetReceivedItems:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 description];
    v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 138477827;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "SIMULATOR: Setting receivedItems to %{private}@", buf, 0xCu);
  }
  if (!v4) {
    id v4 = &__NSArray0__struct;
  }
  v8 = [(UASimulatorReceiver *)self receivedItems];
  v26 = v4;
  unsigned __int8 v27 = [v4 isEqual:v8];

  if ((v27 & 1) == 0)
  {
    v9 = sub_10000BA18(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_super v10 = [(UASimulatorReceiver *)self receivedItems];
      v11 = [v10 description];
      v12 = sub_100063FF0(v11);
      *(_DWORD *)buf = 138477827;
      v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "SIMULATOR: Items changed(from %{private}@), so updating and signalling.", buf, 0xCu);
    }
    v13 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v4;
    id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          v18 = [UASimulatorSuggestedItem alloc];
          v19 = [(UASimulatorReceiver *)self simulator];
          v20 = [v19 peeredDevice];
          v21 = [(UASimulatorReceiver *)self simulator];
          v22 = [(UASimulatorSuggestedItem *)v18 initWithUserActivityInfo:v17 peerDevice:v20 simulator:v21];

          [(UASimulatorSuggestedItem *)v22 setActive:1];
          [(NSArray *)v13 addObject:v22];
        }
        id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    v23 = self;
    objc_sync_enter(v23);
    receivedItems = v23->_receivedItems;
    v23->_receivedItems = v13;

    objc_sync_exit(v23);
  }

  return v27 ^ 1;
}

- (BOOL)fetchAdvertisedItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = "NO";
    if (v3) {
      v6 = "YES";
    }
    *(_DWORD *)buf = 136446210;
    v81 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "includePayload=%{public}s", buf, 0xCu);
  }

  uint64_t v79 = 0;
  int v78 = 0;
  uint64_t v76 = 0;
  double v77 = 0.0;
  uint64_t v75 = 0;
  int v74 = 0;
  v7 = [(UASimulatorReceiver *)self simulator];
  BOOL v8 = sub_10007C798((mach_port_t)[v7 pairedClientPort], 0, &v79, &v78, &v77, &v76, &v75, &v74) == 0;

  if (v8)
  {
    uint64_t v10 = objc_opt_class();
    v11 = sub_100012DE4(v10, v79, v78, 0);
    v12 = [(UASimulatorReceiver *)self receivedItems];
    v13 = [v12 firstObject];

    id v14 = [(UASimulatorReceiver *)self simulator];
    unsigned int v15 = [v14 activitiesShouldCrossover];

    if (v15) {
      double v77 = 0.0;
    }
    if (v13 && !v78)
    {
      v16 = sub_10000BA18(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v13 uuid];
        v18 = [v17 UUIDString];
        *(_DWORD *)buf = 138543619;
        v81 = v18;
        __int16 v82 = 2113;
        v83 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Clearing current item, because it has been removed(was %{public}@/%{private}@).", buf, 0x16u);
      }
      v19 = +[NSArray array];
LABEL_41:
      if (!v19)
      {
        BOOL v9 = 1;
        goto LABEL_45;
      }
      v61 = self;
      objc_sync_enter(v61);
      objc_storeStrong((id *)&v61->_receivedItems, v19);
      objc_sync_exit(v61);

      v62 = [(UASimulatorReceiver *)v61 simulator];
      v63 = [v62 controller];
      v64 = [v63 manager];
      [v64 scheduleBestAppDetermination];

      BOOL v9 = 1;
      long long v32 = v19;
      goto LABEL_43;
    }
    if (v13)
    {
      v20 = [v13 uuid];
      v21 = [v11 uuid];
      unsigned int v22 = [v20 isEqual:v21];

      if (v22)
      {
        v23 = sub_10000BA18(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = [v13 uuid];
          v25 = [v24 UUIDString];
          v26 = [v11 payloadForIdentifier:UAUserActivityUserInfoPayload];
          unsigned __int8 v27 = sub_100003070(v26);
          v28 = [v11 webpageURL];
          *(_DWORD *)buf = 138543875;
          v81 = v25;
          __int16 v82 = 2113;
          v83 = v27;
          __int16 v84 = 2113;
          v85 = v28;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Updating existing item, %{public}@ %{private}@/%{private}@", buf, 0x20u);
        }
        long long v29 = [v11 webpageURL];
        [v13 setWebpageURL:v29];

        uint64_t v30 = UAUserActivityUserInfoPayload;
        long long v31 = [v11 payloadForIdentifier:UAUserActivityUserInfoPayload];
        [v13 setPayload:v31 identifier:v30];

        long long v32 = +[NSDate dateWithTimeIntervalSinceNow:-v77];
        [v13 setWhen:v32];
        BOOL v9 = 0;
LABEL_43:

        goto LABEL_45;
      }
      v33 = [v13 uuid];
      v34 = [v11 uuid];
      if ([v33 isEqual:v34])
      {
        v35 = [v13 webpageURL];
        v36 = [v11 webpageURL];
        if ([v35 isEqual:v36])
        {
          v37 = [v11 webpageURL];
          v38 = [v13 webpageURL];
          unsigned __int8 v39 = [v37 isEqual:v38];

          if (v39)
          {
            BOOL v9 = 0;
LABEL_45:

            return v9;
          }
          goto LABEL_25;
        }
      }
    }
LABEL_25:
    uint64_t v40 = objc_opt_class();
    v72 = sub_100012DE4(v40, v75, v74, 0);
    v41 = [UASimulatorSuggestedItem alloc];
    v42 = [(UASimulatorReceiver *)self simulator];
    v43 = [(UASimulatorSuggestedItem *)v41 initWithUserActivityInfo:v11 peerDevice:v72 simulator:v42];

    v44 = +[NSDate dateWithTimeIntervalSinceNow:-v77];
    [(UASimulatorSuggestedItem *)v43 setWhen:v44];

    v45 = sub_10000BA18(0);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = [(UASimulatorSuggestedItem *)v43 uuid];
      v47 = [v46 UUIDString];
      v48 = [v13 uuid];
      v49 = [v48 UUIDString];
      *(_DWORD *)buf = 138543618;
      v81 = v47;
      __int16 v82 = 2114;
      v83 = v49;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Item %{public}@ seems to be different from %{public}@, so changing received item & updating lists.", buf, 0x16u);
    }
    v50 = +[LSApplicationWorkspace defaultWorkspace];
    if (v50)
    {
      v51 = [v11 teamIdentifier];
      if (v51)
      {
        v52 = [v11 teamIdentifier];
      }
      else
      {
        v52 = &stru_1000C6800;
      }
      v53 = [v11 activityType];
      v73 = +[NSString stringWithFormat:@"%@:%@", v52, v53, v72];

      if (v51) {
      v54 = sub_10000BA18(0);
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138477827;
        v81 = v73;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "SIMULATOR: Looking for %{private}@", buf, 0xCu);
      }

      v55 = [v50 applicationForUserActivityType:v73];
      if (v55
        || ([v11 activityType],
            v66 = objc_claimAutoreleasedReturnValue(),
            unsigned int v67 = [v66 isEqual:NSUserActivityTypeBrowsingWeb],
            v66,
            v67)
        && (sub_1000646A0(), (v55 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v56 = sub_10000BA18(0);
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          v57 = [v11 uuid];
          v58 = [v57 UUIDString];
          v59 = [v55 bundleIdentifier];
          *(_DWORD *)buf = 138543875;
          v81 = v58;
          __int16 v82 = 2113;
          v83 = v11;
          __int16 v84 = 2113;
          v85 = v59;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "SIMULATOR: Found bundle ID for item %{public}@/%{private}@, %{private}@", buf, 0x20u);
        }
        v60 = [v55 bundleIdentifier];
        [(UASimulatorSuggestedItem *)v43 setBundleIdentifier:v60];
      }
      else
      {
        v55 = sub_10000BA18(0);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v68 = [v11 teamIdentifier];
          v69 = [v11 activityType];
          v70 = [(UASimulatorSuggestedItem *)v43 uuid];
          v71 = [v70 UUIDString];
          *(_DWORD *)buf = 138478339;
          v81 = v68;
          __int16 v82 = 2113;
          v83 = v69;
          __int16 v84 = 2114;
          v85 = v71;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Unable to find application to handle typeIdentifier %{private}@:%{private}@ for item %{public}@", buf, 0x20u);
        }
      }
    }
    v19 = +[NSArray arrayWithObject:v43];

    goto LABEL_41;
  }
  return 0;
}

- (BOOL)active
{
  v2 = [(UASimulatorReceiver *)self simulator];
  unsigned __int8 v3 = [v2 active];

  return v3;
}

- (id)statusString
{
  unsigned __int8 v3 = self;
  id v4 = [(UASimulatorReceiver *)self receivedItems];
  id v5 = [v4 count];

  if (v5)
  {
    v6 = +[NSMutableString string];
    if ([v3 receiving]) {
      CFStringRef v7 = @"ACTIVE";
    }
    else {
      CFStringRef v7 = &stru_1000C6800;
    }
    BOOL v8 = [v3 receivedItems];
    id v9 = [v8 count];
    uint64_t v10 = [v3 receivedItems];
    v11 = [v10 firstObject];
    if (v11)
    {
      unsigned __int8 v3 = [v3 receivedItems];
      v2 = [v3 firstObject];
      v12 = [v2 logString];
    }
    else
    {
      v12 = &stru_1000C6800;
    }
    [v6 appendFormat:@"UASimulatorReceiver: %@, %ld items %@", v7, v9, v12];
    if (v11)
    {
    }
    v13 = v6;
  }
  else
  {
    v13 = 0;
  }
  id v14 = [v13 copy];

  return v14;
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)receivedItems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedItems, 0);

  objc_storeStrong((id *)&self->_simulator, 0);
}

@end