@interface TrafficIncidentLayoutFetcher
- (id)_generateRequestParamsForFormType:(int)a3;
- (void)fetchTrafficIncidentsLayoutForLocation:(id)a3 formType:(int)a4 completion:(id)a5;
@end

@implementation TrafficIncidentLayoutFetcher

- (void)fetchTrafficIncidentsLayoutForLocation:(id)a3 formType:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v10 = +[GEOMapService sharedService];
  v11 = [v10 defaultTraits];

  [v8 clearSensitiveFields:0];
  [v11 setDeviceLocation:v8];
  id v12 = objc_alloc((Class)GEORPFeedbackRequest);
  v13 = [(TrafficIncidentLayoutFetcher *)self _generateRequestParamsForFormType:v6];
  id v14 = [v12 initWithFeedbackRequestParameters:v13 traits:v11];

  v15 = +[MKMapService sharedService];
  v16 = [v15 ticketForFeedbackRequest:v14 traits:v11];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1007105C4;
  v20[3] = &unk_1012F6540;
  id v22 = v8;
  id v23 = v9;
  id v21 = v14;
  int v24 = v6;
  id v17 = v8;
  id v18 = v9;
  id v19 = v14;
  [v16 submitWithHandler:v20 networkActivity:0];
}

- (id)_generateRequestParamsForFormType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  id v5 = objc_alloc_init((Class)GEORPFeedbackLayoutConfigParameters);
  [v5 setFormType:v3];
  [v4 setLayoutConfigParameters:v5];

  return v4;
}

@end