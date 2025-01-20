@interface FMFUpdateGeoFenceCommand
- (FMFFence)fence;
- (FMFUpdateGeoFenceCommand)initWithClientSession:(id)a3 andFence:(id)a4;
- (NSSet)nonNotifiableRecipients;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)processCommandError;
- (void)processCommandResponse:(id)a3;
- (void)setFence:(id)a3;
- (void)setNonNotifiableRecipients:(id)a3;
@end

@implementation FMFUpdateGeoFenceCommand

- (FMFUpdateGeoFenceCommand)initWithClientSession:(id)a3 andFence:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFUpdateGeoFenceCommand;
  v7 = [(FMFBaseCmd *)&v10 initWithClientSession:a3];
  if (v7)
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand initialized for fence: %@", buf, 0xCu);
    }

    [(FMFUpdateGeoFenceCommand *)v7 setFence:v6];
  }

  return v7;
}

- (id)pathSuffix
{
  return @"updateGeoFence";
}

- (id)jsonBodyDictionary
{
  v64.receiver = self;
  v64.super_class = (Class)FMFUpdateGeoFenceCommand;
  v3 = [(FMFBaseCmd *)&v64 jsonBodyDictionary];
  v4 = [(FMFUpdateGeoFenceCommand *)self fence];
  v5 = [(FMFUpdateGeoFenceCommand *)self fence];
  id v6 = [v5 placemark];

  v7 = [v4 identifier];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [v4 identifier];
    [v3 setObject:v9 forKey:@"id"];
  }
  objc_super v10 = [v4 friendIdentifier];
  id v11 = [v10 length];

  if (v11)
  {
    id v12 = [v4 friendIdentifier];
    [v3 setObject:v12 forKey:@"friendId"];
  }
  if ([v4 isActive]) {
    CFStringRef v13 = @"true";
  }
  else {
    CFStringRef v13 = @"false";
  }
  [v3 setObject:v13 forKey:@"isOn"];
  if ([v4 isRecurring]) {
    CFStringRef v14 = @"false";
  }
  else {
    CFStringRef v14 = @"true";
  }
  [v3 setObject:v14 forKey:@"onetimeonly"];
  v15 = [v4 type];
  [v3 setObject:v15 forKey:@"type"];

  v16 = [v4 trigger];
  [v3 setObject:v16 forKey:@"trigger"];

  if ([v4 shouldUseCloudKitStore])
  {
    [v3 setObject:&off_1000A8F68 forKey:@"locationType"];
    v17 = +[NSNumber numberWithDouble:kCLLocationCoordinate2DInvalid.latitude];
    [v3 setObject:v17 forKey:@"latitude"];

    v18 = +[NSNumber numberWithDouble:kCLLocationCoordinate2DInvalid.longitude];
    [v3 setObject:v18 forKey:@"longitude"];

    v19 = +[NSNull null];
    [v3 setObject:v19 forKey:@"radius"];
  }
  else
  {
    v20 = [v4 label];
    if (v20)
    {
      [v3 setObject:v20 forKey:@"label"];
    }
    else
    {
      v21 = +[NSNull null];
      [v3 setObject:v21 forKey:@"label"];
    }
    v22 = [v6 streetAddress];
    if (v22)
    {
      [v3 setObject:v22 forKey:@"address"];
    }
    else
    {
      v23 = +[NSNull null];
      [v3 setObject:v23 forKey:@"address"];
    }
    v24 = [v6 formattedAddress];
    if (v24)
    {
      [v3 setObject:v24 forKey:@"prettyAddress"];
    }
    else
    {
      v25 = +[NSNull null];
      [v3 setObject:v25 forKey:@"prettyAddress"];
    }
    v26 = [v6 streetName];
    if (v26)
    {
      [v3 setObject:v26 forKey:@"streetName"];
    }
    else
    {
      v27 = +[NSNull null];
      [v3 setObject:v27 forKey:@"streetName"];
    }
    v28 = [v6 dictionaryValue];
    if (v28)
    {
      [v3 setObject:v28 forKey:@"fullAddress"];
    }
    else
    {
      v29 = +[NSNull null];
      [v3 setObject:v29 forKey:@"fullAddress"];
    }
    v30 = [v4 label];
    if (v30)
    {
      [v3 setObject:v30 forKey:@"prettyAddress"];
    }
    else
    {
      v31 = +[NSNull null];
      [v3 setObject:v31 forKey:@"prettyAddress"];
    }
    v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 locationType]);
    [v3 setObject:v32 forKey:@"locationType"];

    v33 = [v4 location];
    [v33 coordinate];
    v34 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v34 forKey:@"latitude"];

    v35 = [v4 location];
    [v35 coordinate];
    v37 = +[NSNumber numberWithDouble:v36];
    [v3 setObject:v37 forKey:@"longitude"];

    v38 = [v4 location];
    [v38 horizontalAccuracy];
    v39 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v3 setObject:v39 forKey:@"radius"];

    v19 = [v4 schedule];
    v40 = [v19 dictionary];
    [v3 setObject:v40 forKeyedSubscript:@"fenceTimeRange"];
  }
  v41 = [v4 recipients];
  id v42 = [v41 count];

  if (v42)
  {
    v59 = v6;
    v43 = objc_opt_new();
    v44 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v45 = [v4 recipients];
    id v46 = [v45 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v61;
      do
      {
        for (i = 0; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v61 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v51 = [v50 identifier];
          [v43 addObject:v51];

          v52 = [v50 serverId];

          if (v52)
          {
            v53 = [v50 serverId];
            [v44 addObject:v53];
          }
        }
        id v47 = [v45 countByEnumeratingWithState:&v60 objects:v67 count:16];
      }
      while (v47);
    }

    if ([v43 count]) {
      [v3 setObject:v43 forKey:@"emails"];
    }
    id v6 = v59;
    if ([v44 count]) {
      [v3 setObject:v44 forKey:@"ids"];
    }
  }
  v54 = [v4 acceptanceStatus];
  [v3 setObject:v54 forKeyedSubscript:@"acceptanceStatus"];

  v55 = [v4 ckRecordName];
  [v3 setObject:v55 forKeyedSubscript:@"ckRecordName"];

  v56 = [v4 ckRecordZoneOwnerName];
  [v3 setObject:v56 forKeyedSubscript:@"ckRecordZoneOwnerName"];

  v57 = sub_100005560();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v66 = v3;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand jsonBodyDictionary: %@", buf, 0xCu);
  }

  return v3;
}

- (void)processCommandResponse:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMFUpdateGeoFenceCommand;
  [(FMFBaseCmd *)&v15 processCommandResponse:v4];
  v5 = [v4 objectForKey:@"commandResponse"];
  id v6 = [v5 fm_nullToNil];

  if (v6)
  {
    v7 = [v6 objectForKey:@"statusMap"];
    id v8 = [v7 fm_nullToNil];

    if (v8)
    {
      v9 = sub_100005560();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v17 = (int64_t)v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand contacts_status_map : %@", buf, 0xCu);
      }

      objc_super v10 = [v8 keysOfEntriesPassingTest:&stru_1000A2870];
      [(FMFUpdateGeoFenceCommand *)self setNonNotifiableRecipients:v10];
    }
  }
  id v11 = sub_100005560();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = [(FMFBaseCmd *)self commandStatus];
    *(_DWORD *)buf = 134217984;
    int64_t v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand processCommandResponse status code %lu", buf, 0xCu);
  }

  CFStringRef v13 = sub_100005560();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = [v4 allKeys];
    *(_DWORD *)buf = 138412290;
    int64_t v17 = (int64_t)v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand processCommandResponse : %@", buf, 0xCu);
  }
  [(FMFUpdateGeoFenceCommand *)self processCommandError];
}

- (void)processCommandError
{
  int64_t v3 = [(FMFBaseCmd *)self commandStatus];
  switch(v3)
  {
    case 541:
      uint64_t v4 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
      CFStringRef v41 = @"iOS version needs to be upgraded";
      v5 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      uint64_t v6 = v4;
      uint64_t v7 = 1;
      goto LABEL_14;
    case 542:
      uint64_t v9 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      CFStringRef v39 = @"App version needs to be upgraded";
      v5 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      uint64_t v6 = v9;
      uint64_t v7 = 0;
      goto LABEL_14;
    case 543:
      uint64_t v10 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      CFStringRef v37 = @"Geofencing is disabled";
      v5 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v6 = v10;
      uint64_t v7 = 2;
      goto LABEL_14;
    case 544:
      uint64_t v11 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
      CFStringRef v31 = @"Me device upgrade is needed";
      v5 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v6 = v11;
      uint64_t v7 = 3;
      goto LABEL_14;
    case 545:
      uint64_t v12 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      CFStringRef v35 = @"No me device set";
      v5 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      uint64_t v6 = v12;
      uint64_t v7 = 4;
      goto LABEL_14;
    case 546:
      uint64_t v13 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"Me device upgrade is needed";
      v5 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      uint64_t v6 = v13;
      uint64_t v7 = 5;
      goto LABEL_14;
    case 547:
      uint64_t v14 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      CFStringRef v33 = @"Cannot set a fence for that region";
      v5 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v6 = v14;
      uint64_t v7 = 6;
      goto LABEL_14;
    case 548:
      uint64_t v15 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"The user has reached the maximum number of notify others fences";
      v16 = &v27;
      int64_t v17 = &v26;
      goto LABEL_13;
    case 549:
      uint64_t v15 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
      CFStringRef v25 = @"The user has reached the maximum number of fences";
      v16 = &v25;
      int64_t v17 = &v24;
LABEL_13:
      v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v17 count:1];
      uint64_t v6 = v15;
      uint64_t v7 = 7;
      goto LABEL_14;
    default:
      if (v3 != 411) {
        return;
      }
      uint64_t v8 = FMFFenceErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      CFStringRef v23 = @"The fence cannot be set";
      v5 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v6 = v8;
      uint64_t v7 = 9;
LABEL_14:
      v18 = +[NSError errorWithDomain:v6 code:v7 userInfo:v5];

      if (v18)
      {
        v19 = sub_100005560();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMFUpdateGeoFenceCommand: Error processed: %@", (uint8_t *)&v20, 0xCu);
        }

        [(FMFUpdateGeoFenceCommand *)self setError:v18];
      }
      return;
  }
}

- (FMFFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
}

- (NSSet)nonNotifiableRecipients
{
  return self->_nonNotifiableRecipients;
}

- (void)setNonNotifiableRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonNotifiableRecipients, 0);

  objc_storeStrong((id *)&self->_fence, 0);
}

@end