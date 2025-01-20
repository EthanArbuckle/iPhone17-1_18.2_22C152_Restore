@interface IntentHandler
- (id)_supportedIncidentTypesForIncidentLayout:(id)a3;
- (void)_fetchTrafficIncidentsLayoutForLocation:(id)a3 completion:(id)a4;
- (void)handleReportIncident:(id)a3 completion:(id)a4;
- (void)resolveIncidentTypeForReportIncident:(id)a3 withCompletion:(id)a4;
@end

@implementation IntentHandler

- (void)handleReportIncident:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)INReportIncidentIntentResponse) initWithCode:2 userActivity:0];
  (*((void (**)(id, id))a4 + 2))(v5, v6);
}

- (void)resolveIncidentTypeForReportIncident:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MAPSGetIncidentsReportingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [v6 incidentType];
    v10 = [v6 isClear];
    unsigned int v11 = [v10 BOOLValue];
    v12 = @"NO";
    if (v11) {
      v12 = @"YES";
    }
    v13 = v12;
    v14 = [v6 additionalDetails];
    *(_DWORD *)buf = 138412802;
    v26 = v9;
    __int16 v27 = 2112;
    v28 = v13;
    __int16 v29 = 2112;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received INReportIncidentIntent with type %@ isClear %@ additionalDetails %@", buf, 0x20u);
  }
  id v15 = objc_alloc((Class)GEOLocation);
  v16 = [v6 userLocation];
  v17 = [v16 location];
  id v18 = [v15 initWithCLLocation:v17];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100003B24;
  v21[3] = &unk_100008218;
  id v22 = v6;
  v23 = self;
  id v24 = v7;
  id v19 = v7;
  id v20 = v6;
  [(IntentHandler *)self _fetchTrafficIncidentsLayoutForLocation:v18 completion:v21];
}

- (void)_fetchTrafficIncidentsLayoutForLocation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[TrafficIncidentLayoutStorage sharedInstance];
  v8 = [v7 cachedIncidentLayout];

  if (v8 && ([v8 shouldInvalidateLayoutForLocation:v5] & 1) == 0)
  {
    if (v6) {
      v6[2](v6, v8);
    }
  }
  else
  {
    v9 = objc_alloc_init(TrafficIncidentLayoutFetcher);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003F38;
    v10[3] = &unk_100008240;
    unsigned int v11 = v6;
    [(TrafficIncidentLayoutFetcher *)v9 fetchTrafficIncidentsLayoutForLocation:v5 formType:7 completion:v10];
  }
}

- (id)_supportedIncidentTypesForIncidentLayout:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v15 = v3;
  id v5 = [v3 layoutItems];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        int64_t v10 = +[TrafficIncidentIntentSupport INTrafficIncidentTypeForincidentType:](TrafficIncidentIntentSupport, "INTrafficIncidentTypeForincidentType:", [*(id *)(*((void *)&v16 + 1) + 8 * i) incidentType]);
        id v11 = objc_alloc((Class)INSupportedTrafficIncidentType);
        v12 = +[TrafficIncidentIntentSupport localizedTitleForIncidentType:v10];
        id v13 = [v11 initWithType:v10 localizedDisplayString:v12];

        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

@end