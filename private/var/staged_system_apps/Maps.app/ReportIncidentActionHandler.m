@interface ReportIncidentActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ReportIncidentActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = +[MKLocationManager sharedLocationManager];
    if ([v8 isLocationServicesEnabled])
    {
      v9 = +[MKLocationManager sharedLocationManager];
      unsigned __int8 v10 = [v9 isAuthorizedForPreciseLocation];

      if (v10)
      {
        v11 = +[MKLocationManager sharedLocationManager];
        unsigned __int8 v12 = [v11 isLocationServicesPossiblyAvailable];

        if ((v12 & 1) == 0)
        {
          v13 = +[UIApplication sharedMapsDelegate];
          [v13 promptLocationServicesOff];
LABEL_11:

          goto LABEL_12;
        }
        v13 = [v6 incidentIntent];
        v14 = [v13 incidentType];
        uint64_t v15 = +[TrafficIncidentIntentSupport incidentTypeForINTrafficIncidentType:](TrafficIncidentIntentSupport, "incidentTypeForINTrafficIncidentType:", [v14 type]);

        v16 = [v13 isClear];
        if ([v16 BOOLValue])
        {
        }
        else
        {
          v18 = [v13 additionalDetails];
          unsigned int v19 = [v18 isEqual:@"update"];

          if (!v19)
          {
            v23 = +[MKMapService sharedService];
            if (v15 >= 0x12)
            {
              v24 = +[NSString stringWithFormat:@"(unknown: %i)", v15];
            }
            else
            {
              v24 = off_101316F28[(int)v15];
            }
            [v23 captureUserAction:2152 onTarget:0 eventValue:v24];

            v25 = +[TrafficIncidentLayoutManager sharedInstance];
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_100ADE5C0;
            v26[3] = &unk_1012FF408;
            int v28 = v15;
            id v27 = v7;
            [v25 fetchTrafficIncidentsLayout:v26];

            v21 = v27;
            goto LABEL_20;
          }
        }
        CFStringRef v30 = @"SiriTrafficIncidentIsClearKey";
        v20 = [v13 isClear];
        v31 = v20;
        v21 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];

        v22 = +[NSNotificationCenter defaultCenter];
        [v22 postNotificationName:@"SiriTrafficIncidentUpdateNotification" object:a1 userInfo:v21];

LABEL_20:
        goto LABEL_11;
      }
    }
    else
    {
    }
    v17 = sub_100576E2C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "ReportIncidentActionHandler: precise location is disabled", buf, 2u);
    }

    v13 = +[UIApplication sharedMapsDelegate];
    [v13 promptPreciseLocationOff];
    goto LABEL_11;
  }
LABEL_12:
}

@end