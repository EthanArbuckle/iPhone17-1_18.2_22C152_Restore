@interface CommandHandlerLocate
- (id)_checkForLocateParamOverrides:(id)a3;
- (id)createLocatorWithParams:(id)a3;
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation CommandHandlerLocate

- (void)handleCommand
{
  v3 = [(CommandHandler *)self provider];
  unsigned int v4 = [v3 locServicesCapable];
  unsigned int v5 = [v3 isProviderEnabledForLocations];
  if (v4) {
    CFStringRef v6 = @"Ignored Request - Location Services Not Enabled";
  }
  else {
    CFStringRef v6 = @"Ignored Request - Device Not Capable of Location Services";
  }
  uint64_t v7 = 405;
  if (v4 && v5)
  {
    v8 = [(CommandHandler *)self commandParams];
    v9 = [(CommandHandlerLocate *)self createLocatorWithParams:v8];

    uint64_t v10 = [v3 standardLocator];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [v3 standardLocator];
      unsigned int v13 = [v12 locatorRunning];

      if (v13)
      {
        v14 = [v3 standardLocator];
        [v14 desiredAccuracy];
        double v16 = v15;
        [v9 desiredAccuracy];
        double v18 = v17;

        v19 = sub_10001B6D4();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
        if (v16 <= v18)
        {
          if (v20)
          {
            v33 = [v3 standardLocator];
            [v33 desiredAccuracy];
            uint64_t v35 = v34;
            [v9 desiredAccuracy];
            *(_DWORD *)buf = 134218240;
            uint64_t v45 = v35;
            __int16 v46 = 2048;
            uint64_t v47 = v36;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Current locate command is already looking for the same/better accuracy. Ignoring new locate - current=%fm,new=%fm", buf, 0x16u);
          }
          goto LABEL_15;
        }
        if (v20)
        {
          v21 = [v3 standardLocator];
          [v21 desiredAccuracy];
          uint64_t v23 = v22;
          [v9 desiredAccuracy];
          *(_DWORD *)buf = 134218240;
          uint64_t v45 = v23;
          __int16 v46 = 2048;
          uint64_t v47 = v24;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "New locate command asks for a better accuracy than the current locate. Stopping current locate - current=%fm,new=%fm", buf, 0x16u);
        }
      }
    }
    v25 = [v3 standardLocator];

    if (v25)
    {
      v26 = [v3 standardLocator];
      [v26 stopLocator];

      [v3 setStandardLocator:0];
    }
    CFStringRef v42 = @"id";
    v27 = [(CommandHandler *)self commandID];
    v43 = v27;
    v28 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100013CAC;
    v39[3] = &unk_100059810;
    id v29 = v3;
    id v40 = v29;
    id v41 = v28;
    v19 = v28;
    [v9 setReceivedLocationBlock:v39];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100013CCC;
    v37[3] = &unk_100059350;
    id v30 = v29;
    id v38 = v30;
    [v9 setStoppedLocatorBlock:v37];
    [v30 setStandardLocator:v9];
    [v9 startLocator];

LABEL_15:
    CFStringRef v6 = @"OK";
    uint64_t v7 = 200;
  }
  v31 = +[NSMutableDictionary dictionary];
  v32 = +[NSNumber numberWithInt:v7];
  [v31 setObject:v32 forKeyedSubscript:@"status"];

  [v31 setObject:v6 forKeyedSubscript:@"message"];
  [(CommandHandler *)self didHandleCommandWithAckData:v31];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  id v10 = [(CommandHandler *)self ackDataForCommand];
  unsigned int v5 = [v10 objectForKeyedSubscript:@"status"];
  uint64_t v6 = (int)[v5 intValue];

  uint64_t v7 = [v10 objectForKeyedSubscript:@"message"];
  v8 = [(CommandHandler *)self provider];
  v9 = [(CommandHandler *)self commandParams];
  [v8 ackLocateCommand:v9 withStatusCode:v6 andStatusMessage:v7 withCompletion:v4];
}

- (id)_checkForLocateParamOverrides:(id)a3
{
  id v3 = a3;
  id v4 = [@"/var/mobile/Library/Application Support/FMFLocator/locateOverrides.json" stringByExpandingTildeInPath];
  id v5 = v3;
  if (v4)
  {
    uint64_t v6 = +[NSFileManager defaultManager];
    unsigned int v7 = [v6 fileExistsAtPath:v4];

    id v5 = v3;
    if (v7)
    {
      v8 = sub_10001B6D4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1000375A4(v8);
      }

      v9 = +[NSFileManager defaultManager];
      id v10 = [v9 contentsAtPath:v4];

      id v22 = 0;
      v11 = +[NSJSONSerialization JSONObjectWithData:v10 options:1 error:&v22];
      id v12 = v22;
      id v5 = [v3 mutableCopy];
      unsigned int v13 = [v11 keyEnumerator];
      uint64_t v14 = [v13 nextObject];
      if (v14)
      {
        double v16 = (void *)v14;
        *(void *)&long long v15 = 138412546;
        long long v21 = v15;
        do
        {
          double v17 = [v11 objectForKeyedSubscript:v16, v21];
          double v18 = sub_10001B6D4();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            uint64_t v24 = v16;
            __int16 v25 = 2112;
            v26 = v17;
            _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Locate Param Overridden: %@=%@", buf, 0x16u);
          }

          [v5 setValue:v17 forKey:v16];
          uint64_t v19 = [v13 nextObject];

          double v16 = (void *)v19;
        }
        while (v19);
      }
    }
  }

  return v5;
}

- (id)createLocatorWithParams:(id)a3
{
  id v4 = a3;
  id v5 = [(CommandHandler *)self provider];
  uint64_t v6 = [Locator alloc];
  id v7 = [v5 newLocationManager];
  v8 = [(Locator *)v6 initWithLocationManager:v7];

  v9 = sub_10001B6D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(CommandHandlerLocate *)self fm_logID];
    v11 = [v5 serviceName];
    int v23 = 138412546;
    uint64_t v24 = v10;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Created %@ for service %@", (uint8_t *)&v23, 0x16u);
  }
  unsigned int v13 = [(CommandHandlerLocate *)self _checkForLocateParamOverrides:v4];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"locationTimeout"];
  long long v15 = v14;
  if (v14)
  {
    [v14 doubleValue];
    -[Locator setDuration:](v8, "setDuration:");
  }
  double v16 = [v13 objectForKeyedSubscript:@"startThreshold"];

  if (v16)
  {
    [v16 doubleValue];
    -[Locator setStartThreshold:](v8, "setStartThreshold:");
  }
  double v17 = [v13 objectForKeyedSubscript:@"endThreshold"];

  if (v17)
  {
    [v17 doubleValue];
    -[Locator setEndThreshold:](v8, "setEndThreshold:");
  }
  double v18 = [v13 objectForKeyedSubscript:@"decayFactor"];

  if (v18)
  {
    [v18 doubleValue];
    -[Locator setDecayFactor:](v8, "setDecayFactor:");
  }
  uint64_t v19 = [v13 objectForKeyedSubscript:@"desiredAccuracy"];

  if (v19)
  {
    [v19 doubleValue];
    -[Locator setDesiredAccuracy:](v8, "setDesiredAccuracy:");
  }
  BOOL v20 = [v13 objectForKeyedSubscript:@"locationValidityDuration"];

  if (v20)
  {
    [v20 doubleValue];
    -[Locator setCachedLocValidityDuration:](v8, "setCachedLocValidityDuration:");
  }

  long long v21 = v8;

  return v21;
}

@end