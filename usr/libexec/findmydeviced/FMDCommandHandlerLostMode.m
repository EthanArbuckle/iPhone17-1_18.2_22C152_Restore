@interface FMDCommandHandlerLostMode
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
@end

@implementation FMDCommandHandlerLostMode

- (void)handleCommand
{
  uint64_t v86 = qword_10031CB68;
  v3 = [(FMDCommandHandler *)self commandParams];
  v4 = [v3 objectForKeyedSubscript:@"ownerNbr"];

  v5 = [(FMDCommandHandler *)self commandParams];
  v6 = [v5 objectForKeyedSubscript:@"ftCapable"];
  unsigned int v7 = [v6 BOOLValue];

  v8 = [(FMDCommandHandler *)self commandParams];
  v9 = [v8 objectForKeyedSubscript:@"text"];

  v10 = [(FMDCommandHandler *)self commandParams];
  v11 = [v10 objectForKeyedSubscript:@"trackingStatus"];
  unsigned int v12 = [v11 intValue];

  v13 = [(FMDCommandHandler *)self commandParams];
  v14 = [v13 objectForKeyedSubscript:@"emailUpdates"];
  unsigned int v15 = [v14 BOOLValue];

  v16 = [(FMDCommandHandler *)self commandParams];
  v17 = [v16 objectForKeyedSubscript:@"lostModeEnabled"];
  unsigned int v18 = [v17 BOOLValue];

  v19 = [(FMDCommandHandler *)self provider];
  if (v18)
  {
    v20 = [(FMDCommandHandler *)self commandParams];
    v21 = [v20 objectForKeyedSubscript:@"passcode"];

    if (v21)
    {
      v22 = sub_100004238();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10023E21C((uint64_t)v21, v22);
      }
    }
    if ([v19 setPasscodeLock:v21 statusCode:&v86])
    {
      signed int v82 = v12;
      unsigned int v84 = v7;
      v23 = +[NSMutableDictionary dictionary];
      v24 = [(FMDCommandHandler *)self commandParams];
      v25 = [v24 objectForKeyedSubscript:@"loc.timeout"];
      [v23 fm_safelyMapKey:@"timeout" toObject:v25];

      v26 = [(FMDCommandHandler *)self commandParams];
      v27 = [v26 objectForKeyedSubscript:@"loc.startThreshold"];
      [v23 fm_safelyMapKey:@"startThreshold" toObject:v27];

      v28 = [(FMDCommandHandler *)self commandParams];
      v29 = [v28 objectForKeyedSubscript:@"loc.endThreshold"];
      [v23 fm_safelyMapKey:@"endThreshold" toObject:v29];

      v30 = [(FMDCommandHandler *)self commandParams];
      v31 = [v30 objectForKeyedSubscript:@"loc.decayFactor"];
      [v23 fm_safelyMapKey:@"decayFactor" toObject:v31];

      v32 = [(FMDCommandHandler *)self commandParams];
      v33 = [v32 objectForKeyedSubscript:@"loc.desiredAccuracy"];
      [v23 fm_safelyMapKey:@"desiredAccuracy" toObject:v33];

      v34 = [(FMDCommandHandler *)self commandParams];
      v35 = [v34 objectForKeyedSubscript:@"loc.validityDuration"];
      [v23 fm_safelyMapKey:@"validityDuration" toObject:v35];

      v36 = [(FMDCommandHandler *)self commandParams];
      v37 = [v36 objectForKeyedSubscript:@"track.minSLCThresholdInMeters"];

      unsigned int v81 = v15;
      v83 = v37;
      if (v37)
      {
        [v37 doubleValue];
        double v39 = v38;
      }
      else
      {
        double v39 = 400.0;
      }
      v42 = [(FMDCommandHandler *)self commandParams];
      v43 = [v42 objectForKeyedSubscript:@"track.maxTrackedLocationsCount"];
      signed int v80 = [v43 intValue];

      v44 = [(FMDCommandHandler *)self commandParams];
      v45 = [v44 objectForKeyedSubscript:@"track.locCacheDurationInSecs"];
      [v45 doubleValue];
      double v47 = v46;

      v48 = [(FMDCommandHandler *)self commandParams];
      v49 = [v48 objectForKeyedSubscript:@"track.maxCallbackTimeInSecs"];
      [v49 doubleValue];
      double v51 = v50;

      v52 = [(FMDCommandHandler *)self commandParams];
      v53 = [v52 objectForKeyedSubscript:@"track.minDistanceThresholdInMeters"];
      [v53 doubleValue];
      double v55 = v54;

      v56 = [(FMDCommandHandler *)self commandParams];
      v57 = [v56 objectForKeyedSubscript:@"track.minTimeBetweenLocationsInSecs"];
      [v57 doubleValue];
      double v59 = v58;

      v60 = [(FMDCommandHandler *)self commandParams];
      v61 = [v60 objectForKeyedSubscript:@"track.minCallbackTimeInSecs"];
      [v61 doubleValue];
      double v63 = v62;

      v64 = [(FMDCommandHandler *)self commandParams];
      v65 = [v64 objectForKeyedSubscript:@"enableLocationServices"];
      id v66 = [v65 BOOLValue];

      v67 = +[FMDLostModeManager sharedInstance];
      unsigned __int8 v68 = [v67 lostModeEnabled];

      uint64_t v69 = 0;
      if (v68)
      {
        int v41 = 0;
      }
      else
      {
        int v41 = 0;
        if (v66)
        {
          unsigned int v70 = +[CLLocationManager locationServicesEnabled];
          if ((v70 & 1) == 0)
          {
            v71 = sub_100004238();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Location services is off. Reporting to the server that we will turn it on", buf, 2u);
            }
          }
          int v41 = v70 ^ 1;
          unsigned int v72 = +[CLLocationManager isStatusBarIconEnabledForLocationEntityClass:4];
          if ((v72 & 1) == 0)
          {
            v73 = sub_100004238();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Turning on status bar icon since its off & the lost command asks us to turn on location services", buf, 2u);
            }

            +[CLLocationManager setStatusBarIconEnabled:1 forLocationEntityClass:4];
          }
          uint64_t v69 = v72 ^ 1;
        }
      }
      v74 = +[FMDLostModeManager sharedInstance];
      [v74 enableLostModeWithMessage:v9 ownerNumber:v4 facetimeCapable:v84 enableLocationServices:v66 turnOffStatusBarIconAfterLostMode:v69];

      v75 = [v19 locationTracker];

      if (v75)
      {
        v76 = [v19 locationTracker];
        [v76 updateLocationTrackingInfoWithTrackingStatus:v82 minSLCAccuracyThreshold:v23 locateParams:v81 trackNotifyEnabled:v80 maxLocations:v39 keepAlive:v47 periodicCheckInterval:v51 minDistanceBetweenLocations:v55 minTimeBetweenLocations:v59 minTimeBetweenServerCalls:v63];
      }
    }
    else
    {
      v23 = sub_100004238();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Lock failed. Ignoring the lost mode command.", buf, 2u);
      }
      int v41 = 0;
    }
  }
  else
  {
    v40 = sub_100004238();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Lost mode cannot be disabled from the server. There seems to be some bug in the server. Not honouring this lost mode command", buf, 2u);
    }

    int v41 = 0;
    uint64_t v86 = qword_10031CB58;
  }
  [v19 registerDeviceWithCause:@"LostModeCommand" force:0];
  v77 = +[NSMutableDictionary dictionary];
  v78 = v77;
  if (v41) {
    [v77 setObject:&__kCFBooleanTrue forKeyedSubscript:@"locationServicesStateChanged"];
  }
  v79 = +[NSNumber numberWithInteger:v86];
  [v78 setObject:v79 forKeyedSubscript:@"status"];

  [(FMDCommandHandler *)self didHandleCommandWithAckData:v78];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FMDCommandHandler *)self ackDataForCommand];
  v6 = [v5 objectForKeyedSubscript:@"status"];
  signed int v7 = [v6 intValue];

  v8 = [v5 objectForKeyedSubscript:@"locationServicesStateChanged"];
  id v9 = [v8 BOOLValue];

  v10 = [(FMDCommandHandler *)self commandParams];
  v11 = [v10 objectForKeyedSubscript:@"ackURL"];

  unsigned int v12 = [(FMDCommandHandler *)self provider];
  if (v11)
  {
    uint64_t v13 = v7;
    v14 = +[NSURL URLWithString:v11];
    unsigned int v15 = [FMDRequestAckLost alloc];
    v16 = [(FMDCommandHandler *)self commandParams];
    v17 = [(FMDRequestAckLost *)v15 initWithProvider:v12 lostCommand:v16 cmdStatusCode:v13 locationServicesStateChanged:v9 ackURL:v14];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000442B0;
    v19[3] = &unk_1002D9180;
    id v20 = v4;
    [(FMDRequest *)v17 setCompletionHandler:v19];
    [v12 enqueueRequest:v17];
  }
  else
  {
    v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not acking the lost command because there is no ack URL", v18, 2u);
    }
  }
}

@end