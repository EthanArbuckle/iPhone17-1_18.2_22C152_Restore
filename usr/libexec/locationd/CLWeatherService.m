@interface CLWeatherService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLWeatherService)init;
- (NSMutableSet)clients;
- (void)dealloc;
- (void)localLocationForecastUpdatedForConditions:(id)a3;
- (void)registerForWeatherUpdates:(id)a3;
- (void)setClients:(id)a3;
- (void)unregisterForWeatherUpdates:(id)a3;
- (void)weatherForecastUpdated:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 location:(id)a7;
@end

@implementation CLWeatherService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1024817B0 != -1) {
    dispatch_once(&qword_1024817B0, &stru_1022F9230);
  }
  return (id)qword_1024817A8;
}

- (CLWeatherService)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLWeatherService;
  v2 = [(CLWeatherService *)&v4 initWithInboundProtocol:&OBJC_PROTOCOL___CLWeatherServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLWeatherServiceClientProtocol];
  if (v2) {
    [(CLWeatherService *)v2 setClients:objc_opt_new()];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLWeatherService;
  [(CLWeatherService *)&v3 dealloc];
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)registerForWeatherUpdates:(id)a3
{
  objc_super v4 = [(CLWeatherService *)self clients];

  [(NSMutableSet *)v4 addObject:a3];
}

- (void)unregisterForWeatherUpdates:(id)a3
{
  objc_super v4 = [(CLWeatherService *)self clients];

  [(NSMutableSet *)v4 removeObject:a3];
}

- (void)weatherForecastUpdated:(id)a3 airQualityConditions:(id)a4 hourlyForecasts:(id)a5 dailyForecasts:(id)a6 location:(id)a7
{
}

- (void)localLocationForecastUpdatedForConditions:(id)a3
{
  [self universe].silo
  if (!a3)
  {
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    v12 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "received weather update with nil weather conditions", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    LOWORD(v60) = 0;
    goto LABEL_22;
  }
  id v5 = [a3 objectForKeyedSubscript:@"CLWeatherDate"];
  if (!v5)
  {
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    v13 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "received weather update with nil date", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    LOWORD(v60) = 0;
LABEL_22:
    v14 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n");
LABEL_23:
    if (v14 != buf) {
      free(v14);
    }
    return;
  }
  v6 = v5;
  id v7 = [a3 objectForKeyedSubscript:@"CLWeatherPressurePascal"];
  id v8 = v7;
  if (v7)
  {
    [v7 floatValue];
    float v10 = v9;
    if (sub_1001A58C0())
    {
      uint64_t v11 = sub_1001A58C0();
      sub_1014331CC(v11, v10);
    }
  }
  else
  {
    float v10 = -1.0;
  }
  id v15 = [a3 objectForKeyedSubscript:@"CLWeatherPrecipitationType"];
  if (v15) {
    CFStringRef v16 = +[NSString stringWithString:v15];
  }
  else {
    CFStringRef v16 = @"Null";
  }
  id v17 = [a3 objectForKeyedSubscript:@"CLWeatherTemperatureCelsius"];
  id v18 = v17;
  if (v17)
  {
    [v17 floatValue];
    int v20 = v19;
  }
  else
  {
    int v20 = -8388609;
  }
  id v21 = [a3 objectForKeyedSubscript:@"CLWeatherFeelsLikeTemperatureCelsius"];
  if (v21)
  {
    [v21 floatValue];
    int v23 = v22;
LABEL_34:
    id v24 = (id)objc_opt_new();
    [v6 timeIntervalSinceReferenceDate];
    [v24 setTimestamp:];
    *(float *)&double v25 = v10;
    [v24 setWeatherPressure:v25];
    [v24 setPrecipitationType:[NSString stringWithString:v16]];
    LODWORD(v26) = v20;
    [v24 setTemperature:v26];
    LODWORD(v27) = v23;
    [v24 setFeelsLikeTemperature:v27];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v28 = [(CLWeatherService *)self clients];
    id v29 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v56 objects:v72 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v57;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v57 != v31) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v56 + 1) + 8 * i) didUpdateWeather:v24];
        }
        id v30 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v56 objects:v72 count:16];
      }
      while (v30);
    }
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    v33 = qword_102418FD8;
    if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_INFO))
    {
      [v24 timestamp];
      uint64_t v35 = v34;
      [v24 weatherPressure];
      double v37 = v36;
      id v38 = [v24 precipitationType];
      [v24 temperature];
      double v40 = v39;
      [v24 feelsLikeTemperature];
      *(_DWORD *)buf = 138544642;
      v74 = v6;
      __int16 v75 = 2050;
      uint64_t v76 = v35;
      __int16 v77 = 2048;
      double v78 = v37;
      __int16 v79 = 2112;
      id v80 = v38;
      __int16 v81 = 2048;
      double v82 = v40;
      __int16 v83 = 2048;
      double v84 = v41;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Notified weather update for local location, date, %{public}@, timestamp, %{public}f, pressure(Pa), %.8f, precipitationType, %@, temperature(C), %f, feelsLikeTemperature(C), %f", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FD0 != -1) {
        dispatch_once(&qword_102418FD0, &stru_1022F9250);
      }
      [v24 timestamp];
      uint64_t v48 = v47;
      [v24 weatherPressure];
      double v50 = v49;
      id v51 = [v24 precipitationType];
      [v24 temperature];
      double v53 = v52;
      [v24 feelsLikeTemperature];
      int v60 = 138544642;
      v61 = v6;
      __int16 v62 = 2050;
      uint64_t v63 = v48;
      __int16 v64 = 2048;
      double v65 = v50;
      __int16 v66 = 2112;
      id v67 = v51;
      __int16 v68 = 2048;
      double v69 = v53;
      __int16 v70 = 2048;
      double v71 = v54;
      v55 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n", v55);
      if (v55 != (char *)buf) {
        free(v55);
      }
    }
    if (v8)
    {
      if (sub_100B7CA64())
      {
        uint64_t v42 = sub_100B7CA64();
        [v24 timestamp];
        double v44 = v43;
        [v24 weatherPressure];
        sub_100B7CD60(v42, v44, v45);
      }
    }
    return;
  }
  int v23 = -8388609;
  if (v8 || v15 || v18) {
    goto LABEL_34;
  }
  if (qword_102418FD0 != -1) {
    dispatch_once(&qword_102418FD0, &stru_1022F9250);
  }
  v46 = qword_102418FD8;
  if (os_log_type_enabled((os_log_t)qword_102418FD8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "received weather update with all nil fields of interest", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102418FD0 != -1) {
      dispatch_once(&qword_102418FD0, &stru_1022F9250);
    }
    LOWORD(v60) = 0;
    v14 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWeatherService localLocationForecastUpdatedForConditions:]", "%s\n");
    goto LABEL_23;
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

@end