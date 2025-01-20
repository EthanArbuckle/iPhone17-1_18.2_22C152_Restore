@interface RouteMarkerFormatterETA
- (MNNavigationService)navigationService;
- (RouteMarkerFormatterETA)initWithNavigationService:(id)a3;
- (RouteMarkerFormatterETADelegate)delegate;
- (id)_comparisonInfoForRouteWithRemainingMinutes:(unint64_t)a3 comparedToRouteWithRemainingMinutes:(unint64_t)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6;
- (id)markerInfoForRoute:(id)a3;
- (id)markerInfosForLegsInRoute:(id)a3;
- (void)dealloc;
- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation RouteMarkerFormatterETA

- (RouteMarkerFormatterETA)initWithNavigationService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RouteMarkerFormatterETA;
  v6 = [(RouteMarkerFormatterETA *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationService, a3);
    [(MNNavigationService *)v7->_navigationService registerObserver:v7];
    v7->_similarTimeDelta = GEOConfigGetUint64();
  }

  return v7;
}

- (void)dealloc
{
  [(MNNavigationService *)self->_navigationService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)RouteMarkerFormatterETA;
  [(RouteMarkerFormatterETA *)&v3 dealloc];
}

- (id)markerInfoForRoute:(id)a3
{
  id v4 = a3;
  if (![(MNNavigationService *)self->_navigationService isInNavigatingState]) {
    goto LABEL_4;
  }
  id v5 = [v4 legs];
  v6 = [v5 count];
  int64_t v7 = v6 - (unsigned char *)[(MNNavigationService *)self->_navigationService targetLegIndex];

  if (v7 == 1)
  {
    v8 = [(MNNavigationService *)self->_navigationService route];
    unsigned __int8 v9 = [v4 isEqual:v8];

    if (v9)
    {
LABEL_4:
      v10 = 0;
      goto LABEL_7;
    }
    v12 = [(MNNavigationService *)self->_navigationService displayETAInfoForRoute:v4];
    navigationService = self->_navigationService;
    v18 = [(MNNavigationService *)navigationService route];
    v15 = [(MNNavigationService *)navigationService displayETAInfoForRoute:v18];

    v10 = 0;
    if (v12 && v15)
    {
      id v19 = [v12 displayRemainingMinutesToEndOfRoute];
      id v20 = [v15 displayRemainingMinutesToEndOfRoute];
      id v21 = [v4 tollCurrencyType];
      v22 = [v4 advisoriesStyleAttributes];
      v10 = [(RouteMarkerFormatterETA *)self _comparisonInfoForRouteWithRemainingMinutes:v19 comparedToRouteWithRemainingMinutes:v20 tollCurrency:v21 styleAttributes:v22];
    }
  }
  else
  {
    [v4 travelAndChargingDuration];
    v12 = +[NSString _navigation_stringWithSeconds:(unint64_t)v11 andAbbreviationType:1];
    v13 = [RouteMarkerFormatterInfo alloc];
    id v14 = [v4 tollCurrencyType];
    v15 = [v4 advisoriesStyleAttributes];
    v10 = [(RouteMarkerFormatterInfo *)v13 initWithRouteDescription:v12 etaComparison:0 tollCurrency:v14 styleAttributes:v15];
  }

LABEL_7:

  return v10;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v4 = a3;
  if ([(MNNavigationService *)self->_navigationService isInNavigatingState]
    && ([v4 legs],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        (unint64_t)v6 >= 2))
  {
    v8 = [(MNNavigationService *)self->_navigationService displayETAInfoForRoute:v4];
    unsigned __int8 v9 = [v8 legInfos];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1007E9904;
    v27[3] = &unk_1012F95B0;
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
    id v28 = v10;
    [v8 enumerateLegsWithBlock:v27];
    id v11 = objc_alloc((Class)NSMutableArray);
    v12 = [v4 legs];
    id v13 = [v11 initWithCapacity:[v12 count]];

    id v14 = [v4 legs];
    id v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        v17 = +[NSNumber numberWithUnsignedInteger:v16];
        [v13 addObject:v17];

        ++v16;
        v18 = [v4 legs];
        id v19 = [v18 count];
      }
      while (v16 < (unint64_t)v19);
    }
    id v20 = [v13 count];
    if (v20 < [v9 count])
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = [NSString stringWithFormat:@"We have more ETA infos than legs: %lu legs, %lu ETA infos" count:[v13 count] count:[v9 count]];
        *(_DWORD *)buf = 136316162;
        v30 = "-[RouteMarkerFormatterETA markerInfosForLegsInRoute:]";
        __int16 v31 = 2080;
        v32 = "RouteMarkerFormatterETA.m";
        __int16 v33 = 1024;
        int v34 = 126;
        __int16 v35 = 2080;
        v36 = "legIndexes.count >= legInfos.count";
        __int16 v37 = 2112;
        v38 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    id v21 = [[RouteMarkerFormatterInfo alloc] initWithRouteDescription:&stru_101324E70 etaComparison:0 tollCurrency:0 styleAttributes:0];
    int64_t v7 = [v10 objectsForKeys:v13 notFoundMarker:v21];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)_comparisonInfoForRouteWithRemainingMinutes:(unint64_t)a3 comparedToRouteWithRemainingMinutes:(unint64_t)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  if (a3 <= a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = a3;
  }
  if (a3 >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = a3;
  }
  if (v11 - v12 <= self->_similarTimeDelta)
  {
    id v13 = +[NSBundle mainBundle];
    v17 = [v13 localizedStringForKey:@"Similar ETA [Route Label Marker]" value:@"localized string not found" table:0];
    uint64_t v18 = 1;
  }
  else
  {
    id v13 = +[NSString _navigation_stringWithMinutes:andAbbreviationType:](NSString, "_navigation_stringWithMinutes:andAbbreviationType:");
    id v14 = +[NSBundle mainBundle];
    id v15 = v14;
    if (a3 <= a4)
    {
      id v19 = [v14 localizedStringForKey:@"<# min> faster [Route Label Marker]" value:@"localized string not found" table:0];
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v13);

      uint64_t v18 = 3;
    }
    else
    {
      unint64_t v16 = [v14 localizedStringForKey:@"<# min> slower [Route Label Marker]" value:@"localized string not found" table:0];
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v13);

      uint64_t v18 = 2;
    }
  }

  id v20 = [[RouteMarkerFormatterInfo alloc] initWithRouteDescription:v17 etaComparison:v18 tollCurrency:v6 styleAttributes:v10];

  return v20;
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v7 = a3;
  v8 = [v7 alternateRoutes];
  unsigned __int8 v9 = +[NSSet setWithArray:v8];

  id v10 = [v7 route];

  id v12 = [v9 setByAddingObject:v10];

  unint64_t v11 = [(RouteMarkerFormatterETA *)self delegate];
  [v11 routeMarkerFormatterETA:self didUpdateMarkerInfoForRoutes:v12];
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (RouteMarkerFormatterETADelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteMarkerFormatterETADelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end