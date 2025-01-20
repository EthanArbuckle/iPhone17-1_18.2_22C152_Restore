@interface GEOURLOptions
+ (id)accumulateObjects:(id)a3;
@end

@implementation GEOURLOptions

+ (id)accumulateObjects:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 firstObject];
    id v5 = [v4 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = [v3 subarrayWithRange:1, [v3 count] - 1];
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v11 hasEnableTraffic]) {
            [v5 setEnableTraffic:[v11 enableTraffic]];
          }
          if ([v11 hasMapType]) {
            [v5 setMapType:[v11 mapType]];
          }
          if ([v11 hasTransportType]) {
            [v5 setTransportType:[v11 transportType]];
          }
          if ([v11 hasReferralIdentifier])
          {
            v12 = [v11 referralIdentifier];
            [v5 setReferralIdentifier:v12];
          }
          if ([v11 hasRouteHandle])
          {
            v13 = [v11 routeHandle];
            [v5 setRouteHandle:v13];
          }
          if ([v11 hasTimePoint])
          {
            v14 = [v11 timePoint];
            [v5 setTimePoint:v14];
          }
          if ([v11 hasConnectedToCar]) {
            [v5 setConnectedToCar:[v11 connectedToCar]];
          }
          if ([v11 hasUserTrackingMode])
          {
            [v5 setCamera:0];
            [v5 setCenterSpan:0];
            [v5 setUserTrackingMode:[v11 userTrackingMode]];
          }
          if ([v11 hasCenterSpan])
          {
            [v5 setCenterSpan:0];
            [v5 setHasUserTrackingMode:0];
            v15 = [v11 centerSpan];
            [v5 setCenterSpan:v15];
          }
          if ([v11 hasCamera])
          {
            [v5 setHasUserTrackingMode:0];
            [v5 setCenterSpan:0];
            v16 = [v11 camera];
            [v5 setCamera:v16];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end