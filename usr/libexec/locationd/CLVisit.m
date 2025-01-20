@interface CLVisit
+ (id)_visitWithVisit:(id)a3 authDate:(id)a4;
- (CLVisit)initWithVisit:(id)a3;
@end

@implementation CLVisit

- (CLVisit)initWithVisit:(id)a3
{
  if (a3)
  {
    [objc_msgSend(a3, "location") latitude];
    CLLocationDegrees v6 = v5;
    [objc_msgSend(a3, "location") longitude];
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
    if ([a3 placeInference]) {
      id v9 = [objc_alloc((Class)_CLPlaceInference) _initWithRTPlaceInference:[a3 placeInference]];
    }
    else {
      id v9 = 0;
    }
    [objc_msgSend(a3, "location") horizontalUncertainty];
    double v12 = v11;
    id v13 = [a3 entry];
    id v14 = [a3 exit];
    id v15 = [a3 date];
    return -[CLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:](self, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:placeInference:", v13, v14, v15, v9, v8.latitude, v8.longitude, v12);
  }
  else
  {

    return 0;
  }
}

+ (id)_visitWithVisit:(id)a3 authDate:(id)a4
{
  if (!a4) {
    return 0;
  }
  if (objc_msgSend(objc_msgSend(a3, "departureDate"), "compare:", objc_msgSend(a3, "arrivalDate")) == (id)-1)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B598);
    }
    v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Malformed visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B598);
      }
    }
    v19 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v20 = 68289283;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      __int16 v24 = 2113;
      id v25 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Malformed visit", "{\"msg%{public}.0s\":\"#slv Malformed visit\", \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v20, 0x1Cu);
    }
    return 0;
  }
  id v6 = [a4 compare:[a3 departureDate]];
  id v7 = [a4 compare:[a3 arrivalDate]];
  unint64_t v8 = 0;
  if ([a3 hasArrivalDate] && v7 == (id)-1) {
    unint64_t v8 = (unint64_t)[a3 arrivalDate];
  }
  unint64_t v9 = 0;
  if ([a3 hasDepartureDate] && v6 == (id)-1) {
    unint64_t v9 = (unint64_t)[a3 departureDate];
  }
  if (!(v8 | v9)) {
    return 0;
  }
  id v10 = objc_alloc((Class)CLVisit);
  [a3 coordinate];
  double v12 = v11;
  double v14 = v13;
  [a3 horizontalAccuracy];
  id v16 = [v10 initWithCoordinate:v8 horizontalAccuracy:v9 arrivalDate:objc_msgSend(a3, "detectionDate") departureDate:objc_msgSend(a3, "_placeInference") detectionDate:v12 placeInference:v14];

  return v16;
}

@end