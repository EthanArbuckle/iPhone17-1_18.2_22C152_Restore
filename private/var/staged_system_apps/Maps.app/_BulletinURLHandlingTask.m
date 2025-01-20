@interface _BulletinURLHandlingTask
- (BOOL)_validParameters:(id)a3 data:(id *)a4;
- (void)performTask;
@end

@implementation _BulletinURLHandlingTask

- (BOOL)_validParameters:(id)a3 data:(id *)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"MapsPushNotificationType"];
  if (v6)
  {
    v15[0] = @"ParkedCar";
    v15[1] = @"CommuteDetails";
    v15[2] = @"LowFuel";
    v15[3] = @"MapsPushNotificationTypeUGCPhotoCreditCleared";
    v15[4] = @"MapsPushNotificationTypeOfflineMapsManagement";
    v7 = +[NSArray arrayWithObjects:v15 count:5];
    v8 = +[NSSet setWithArray:v7];

    if ([v8 containsObject:v6])
    {
      id v9 = 0;
    }
    else
    {
      uint64_t v11 = [v5 objectForKeyedSubscript:@"MapsPushNotificationPushData"];
      if (!v11
        || (v12 = (void *)v11,
            id v9 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v11 options:1],
            v12,
            !v9))
      {
        BOOL v10 = 0;
        goto LABEL_9;
      }
    }
    id v13 = v9;
    *a4 = v13;

    BOOL v10 = 1;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_10:

  return v10;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v66 = self;
  v3 = [(URLHandlingTask *)self url];
  v4 = [v3 query];
  v67 = v3;
  if (![v4 length])
  {
    uint64_t v5 = [v3 resourceSpecifier];

    v4 = (void *)v5;
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v65 = v4;
  v7 = [v4 componentsSeparatedByString:@"&"];
  id v8 = [v7 countByEnumeratingWithState:&v73 objects:v80 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v74;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v74 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v73 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ((unint64_t)[v12 count] >= 2)
        {
          id v13 = [v12 subarrayWithRange:1, (char *)[v12 count] - 1];
          v14 = [v13 componentsJoinedByString:@"="];
          v15 = [v12 objectAtIndexedSubscript:0];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v73 objects:v80 count:16];
    }
    while (v9);
  }

  id v72 = 0;
  v16 = v66;
  unsigned __int8 v17 = [(_BulletinURLHandlingTask *)v66 _validParameters:v6 data:&v72];
  id v18 = v72;
  if (v17)
  {
    v19 = [v6 objectForKeyedSubscript:@"MapsPushNotificationType"];
    if ([v19 isEqualToString:@"MapsPushNotifcationTypePushToPhone"])
    {
      v20 = [[SyncedBookmarkRepr alloc] initWithData:v18];
      v21 = v20;
      if (v20)
      {
        v22 = [(SyncedBookmarkRepr *)v20 richMapsActivity];
        if (v22)
        {
          [(URLHandlingTask *)v66 taskFinished:v22];
LABEL_81:

          goto LABEL_82;
        }
        goto LABEL_80;
      }
      v27 = sub_1000A930C();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      *(_WORD *)buf = 0;
      v28 = "_BulletinURLHandlingTask SyncedBookmarkRepr nil from data";
      goto LABEL_47;
    }
    if ([v19 isEqualToString:@"MapsPushNotifcationTypeProblemResolved"])
    {
      v21 = (SyncedBookmarkRepr *)[objc_alloc((Class)GEORPProblemStatusResponse) initWithData:v18];
      if (v21)
      {
        v24 = [[PresentRAPAction alloc] initWithResponse:v21];
LABEL_26:
        v25 = (SharedTripAction *)v24;
        v26 = [[RichMapsActivity alloc] initWithMapsAction:v24];
        [(URLHandlingTask *)v66 taskFinished:v26];

LABEL_27:
LABEL_82:

        goto LABEL_83;
      }
      v27 = sub_1000A930C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v28 = "_BulletinURLHandlingTask GEORPProblemStatusResponse nil from data";
LABEL_47:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    if ([v19 isEqualToString:@"MapsPushNotifcationTypeProblemStatusChange"])
    {
      v21 = (SyncedBookmarkRepr *)[objc_alloc((Class)GEORPRapInfo) initWithData:v18];
      if (v21)
      {
        v24 = [[PresentRAPAction alloc] initWithRapInfo:v21];
        goto LABEL_26;
      }
      v27 = sub_1000A930C();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v28 = "_BulletinURLHandlingTask GEORPRapInfo nil from data";
        goto LABEL_47;
      }
LABEL_48:

      [(URLHandlingTask *)v66 taskFailed];
      goto LABEL_82;
    }
    if ([v19 isEqualToString:@"ParkedCar"])
    {
      v29 = [v6 objectForKeyedSubscript:@"action"];
      unsigned __int8 v30 = [v29 isEqualToString:@"photo"];

      if (v30)
      {
        uint64_t v31 = 2;
      }
      else
      {
        v41 = [v6 objectForKeyedSubscript:@"action"];
        unsigned int v42 = [v41 isEqualToString:@"editlocation"];

        if (v42) {
          uint64_t v31 = 3;
        }
        else {
          uint64_t v31 = 0;
        }
      }
      v43 = [[PresentParkedCarAction alloc] initWithParkedCarAction:v31];
      v44 = [[RichMapsActivity alloc] initWithMapsAction:v43];
      [(URLHandlingTask *)v66 taskFinished:v44];

      goto LABEL_53;
    }
    if ([v19 isEqualToString:@"CommuteDetails"])
    {
      v64 = v19;
      v32 = +[MKMapService sharedService];
      [v32 captureUserAction:9003 onTarget:711 eventValue:0];

      +[NSURLComponents componentsWithURL:v67 resolvingAgainstBaseURL:1];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v63 = long long v71 = 0u;
      v33 = [v63 queryItems];
      id v34 = [v33 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v34)
      {
        id v35 = v34;
        uint64_t v36 = *(void *)v69;
LABEL_38:
        uint64_t v37 = 0;
        while (1)
        {
          if (*(void *)v69 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v68 + 1) + 8 * v37);
          v39 = [v38 name];
          unsigned __int8 v40 = [v39 isEqualToString:@"uniqueID"];

          if (v40) {
            break;
          }
          if (v35 == (id)++v37)
          {
            id v35 = [v33 countByEnumeratingWithState:&v68 objects:v77 count:16];
            if (v35) {
              goto LABEL_38;
            }
            goto LABEL_44;
          }
        }
        v49 = [v38 value];

        if (!v49) {
          goto LABEL_59;
        }
        v50 = [[OpenCommuteEntryAction alloc] initWithEntry:v49];
        v51 = [[RichMapsActivity alloc] initWithMapsAction:v50];
        [(URLHandlingTask *)v66 taskFinished:v51];

        v19 = v64;
        goto LABEL_83;
      }
LABEL_44:

LABEL_59:
      v16 = v66;
      v45 = v63;
      v19 = v64;
LABEL_60:

      goto LABEL_61;
    }
    if ([v19 isEqualToString:@"LowFuel"])
    {
      v45 = [v6 objectForKeyedSubscript:@"engineType"];
      id v46 = [v45 integerValue];
      if (v46)
      {
        v47 = [[LowFuelAction alloc] initWithEngineType:v46];
        [(MapsAction *)v47 setUserLocationAccuracy:kCLLocationAccuracyKilometer];
        v48 = [[RichMapsActivity alloc] initWithMapsAction:v47];
        [(URLHandlingTask *)v66 taskFinished:v48];

        goto LABEL_83;
      }
      goto LABEL_60;
    }
    if ([v19 isEqualToString:@"MapsPushNotificationTypeSharedTrip"])
    {
      v53 = (SyncedBookmarkRepr *)[objc_alloc((Class)GEOSharedNavState) initWithData:v18];
      if (v53)
      {
        v21 = v53;
        v25 = [[SharedTripAction alloc] initWithSharedTrip:v53];
        v54 = [[RichMapsActivity alloc] initWithMapsAction:v25];
        [(URLHandlingTask *)v66 taskFinished:v54];

        goto LABEL_27;
      }
LABEL_61:
      v52 = sub_1000A930C();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v79 = v19;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask type not handled %@", buf, 0xCu);
      }

      [(URLHandlingTask *)v16 taskFailed];
      goto LABEL_83;
    }
    if ([v19 isEqualToString:@"MapsPushNotificationTypeUGCPhotoCreditCleared"])
    {
      v43 = objc_alloc_init(OpenPhotoAttributionSettingsAction);
      v55 = [[RichMapsActivity alloc] initWithMapsAction:v43];
      [(URLHandlingTask *)v66 taskFinished:v55];
    }
    else
    {
      if (![v19 isEqualToString:@"MapsPushNotificationTypeOfflineMapsManagement"])
      {
        if ([v19 isEqualToString:@"MapsPushNotificationTypeOfflineMapsSuggestion"])
        {
          v21 = (SyncedBookmarkRepr *)[objc_alloc((Class)GEOMapRegion) initWithData:v18];
          uint64_t v57 = [v6 objectForKeyedSubscript:@"MapsPushNotificationTypeOfflineMapsSuggestionRegionName"];
          v22 = (void *)v57;
          if (v21)
          {
            if (v57)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v58 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v22 options:1];
                id v59 = [objc_alloc((Class)NSString) initWithData:v58 encoding:4];
                v60 = objc_alloc_init(OpenOfflineMapsManagementAction);
                [(OpenOfflineMapsManagementAction *)v60 setDownloadRegion:v21];
                [(OpenOfflineMapsManagementAction *)v60 setDownloadRegionName:v59];
                v61 = [[RichMapsActivity alloc] initWithMapsAction:v60];
                [(URLHandlingTask *)v66 taskFinished:v61];

                goto LABEL_81;
              }
            }
          }
          v62 = sub_1000A930C();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask mapRegion nil from data", buf, 2u);
          }

LABEL_80:
          [(URLHandlingTask *)v66 taskFailed];
          goto LABEL_81;
        }
        goto LABEL_61;
      }
      v43 = objc_alloc_init(OpenOfflineMapsManagementAction);
      v55 = [v6 objectForKeyedSubscript:@"path"];
      [(PresentParkedCarAction *)v43 setPath:[(RichMapsActivity *)v55 isEqualToString:@"EXPIRED_MAPS"]];
      v56 = [[RichMapsActivity alloc] initWithMapsAction:v43];
      [(URLHandlingTask *)v66 taskFinished:v56];
    }
LABEL_53:

LABEL_83:
    goto LABEL_84;
  }
  v23 = sub_1000A930C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v79 = v6;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "_BulletinURLHandlingTask invalid parameters %@", buf, 0xCu);
  }

  [(URLHandlingTask *)v66 taskFailed];
LABEL_84:
}

@end