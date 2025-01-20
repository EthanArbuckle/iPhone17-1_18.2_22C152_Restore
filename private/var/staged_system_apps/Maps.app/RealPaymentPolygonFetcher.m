@interface RealPaymentPolygonFetcher
- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4;
@end

@implementation RealPaymentPolygonFetcher

- (BOOL)paymentPolygonsAtLocation:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    v13 = sub_100021338();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
      __int16 v22 = 1024;
      int v23 = 20;
      __int16 v24 = 2082;
      v25 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      __int16 v26 = 2082;
      v27 = "nil == completion";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil", buf, 0x26u);
    }

    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
    __int16 v22 = 1024;
    int v23 = 20;
    __int16 v24 = 2082;
    v25 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    __int16 v26 = 2082;
    v27 = "nil == completion";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Completion handler cannot be nil";
    goto LABEL_12;
  }
  if (!v5)
  {
    v15 = sub_100021338();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
      __int16 v22 = 1024;
      int v23 = 21;
      __int16 v24 = 2082;
      v25 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
      __int16 v26 = 2082;
      v27 = "nil == location";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil", buf, 0x26u);
    }

    v12 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)buf = 136446978;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Feature Discovery/Sources/RealPaymentPolygonFetcher.m";
    __int16 v22 = 1024;
    int v23 = 21;
    __int16 v24 = 2082;
    v25 = "-[RealPaymentPolygonFetcher paymentPolygonsAtLocation:completion:]";
    __int16 v26 = 2082;
    v27 = "nil == location";
    v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Location cannot be nil";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, v14, buf, 0x26u);
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  v7 = +[GEOMapService sharedService];
  id v19 = v5;
  BOOL v8 = 1;
  v9 = +[NSArray arrayWithObjects:&v19 count:1];
  v10 = +[GEOMapService sharedService];
  v11 = [v10 defaultTraits];
  v12 = [v7 ticketForNearbyTransitPaymentInfoForLocations:v9 traits:v11];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10076F2B0;
  v17[3] = &unk_1012E7710;
  id v18 = v6;
  [v12 submitWithHandler:v17 networkActivity:0];

LABEL_14:
  return v8;
}

@end