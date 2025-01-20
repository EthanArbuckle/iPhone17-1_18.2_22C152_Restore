@interface CLAvailabilityRegionChangeMonitor
- (CLAvailabilityRegionChangeMonitor)initWithSilo:(id)a3 andMonitorRegion:(id)a4 andOnRegionChangedCallback:(id)a5;
- (CLDispatchSilo)silo;
- (NSString)lastCountryCode;
- (id)regionChangeCallback;
- (int)countryCodeNotificationToken;
- (void)dealloc;
- (void)onGeoCountryCodeChangeNotification:(int)a3 andMonitorRegion:(id)a4;
- (void)setCountryCodeNotificationToken:(int)a3;
- (void)setLastCountryCode:(id)a3;
- (void)setRegionChangeCallback:(id)a3;
- (void)setSilo:(id)a3;
- (void)stopMonitoring;
@end

@implementation CLAvailabilityRegionChangeMonitor

- (CLAvailabilityRegionChangeMonitor)initWithSilo:(id)a3 andMonitorRegion:(id)a4 andOnRegionChangedCallback:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)CLAvailabilityRegionChangeMonitor;
  v8 = [(CLAvailabilityRegionChangeMonitor *)&v19 init];
  if (v8)
  {
    v8->_silo = (CLDispatchSilo *)a3;
    v8->_int countryCodeNotificationToken = -1;
    v8->_regionChangeCallback = [a5 copy];
    v8->_lastCountryCode = (NSString *)[[+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration") countryCode];
    v9 = (const char *)GEOCountryConfigurationCountryCodeChangedDarwinNotification;
    v10 = [(CLDispatchSilo *)v8->_silo queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100B39C90;
    handler[3] = &unk_1022E5B58;
    handler[4] = v8;
    handler[5] = a4;
    notify_register_dispatch(v9, &v8->_countryCodeNotificationToken, v10, handler);
  }
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022E5B78);
  }
  v11 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    lastCountryCode = v8->_lastCountryCode;
    int countryCodeNotificationToken = v8->_countryCodeNotificationToken;
    *(_DWORD *)buf = 138478083;
    v25 = lastCountryCode;
    __int16 v26 = 1026;
    int v27 = countryCodeNotificationToken;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#availabilityregionmonitor, monitor initialize, country code, %{private}@, token, %{public}d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022E5B78);
    }
    v15 = v8->_lastCountryCode;
    int v16 = v8->_countryCodeNotificationToken;
    int v20 = 138478083;
    v21 = v15;
    __int16 v22 = 1026;
    int v23 = v16;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAvailabilityRegionChangeMonitor initWithSilo:andMonitorRegion:andOnRegionChangedCallback:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  return v8;
}

- (void)dealloc
{
  self->_silo = 0;
  self->_regionChangeCallback = 0;

  self->_lastCountryCode = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAvailabilityRegionChangeMonitor;
  [(CLAvailabilityRegionChangeMonitor *)&v3 dealloc];
}

- (void)onGeoCountryCodeChangeNotification:(int)a3 andMonitorRegion:(id)a4
{
  id v7 = [[+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration") countryCode];
  if (!a4) {
    goto LABEL_14;
  }
  if ([(NSString *)[(CLAvailabilityRegionChangeMonitor *)self lastCountryCode] isEqualToString:a4])
  {
    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = [v7 isEqualToString:a4];
  }
  if ([(NSString *)[(CLAvailabilityRegionChangeMonitor *)self lastCountryCode] isEqualToString:a4])
  {
    unsigned int v9 = [v7 isEqualToString:a4] ^ 1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022E5B78);
  }
  v10 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478851;
    v13 = [(CLAvailabilityRegionChangeMonitor *)self lastCountryCode];
    __int16 v14 = 2113;
    id v15 = v7;
    __int16 v16 = 1026;
    int v17 = a3;
    __int16 v18 = 1025;
    unsigned int v19 = v8;
    __int16 v20 = 1025;
    unsigned int v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#availabilityregionmonitor, last, %{private}@, new, %{private}@, token, %{public}d, entered, %{private}d, exited, %{private}d", buf, 0x28u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022E5B78);
    }
    [(CLAvailabilityRegionChangeMonitor *)self lastCountryCode];
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAvailabilityRegionChangeMonitor onGeoCountryCodeChangeNotification:andMonitorRegion:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  if ((v8 | v9) == 1) {
LABEL_14:
  }
    (*((void (**)(void))[(CLAvailabilityRegionChangeMonitor *)self regionChangeCallback] + 2))();
  [(CLAvailabilityRegionChangeMonitor *)self setLastCountryCode:v7];
}

- (void)stopMonitoring
{
  int countryCodeNotificationToken = self->_countryCodeNotificationToken;
  if (countryCodeNotificationToken != -1) {
    notify_cancel(countryCodeNotificationToken);
  }
}

- (CLDispatchSilo)silo
{
  return self->_silo;
}

- (void)setSilo:(id)a3
{
}

- (id)regionChangeCallback
{
  return self->_regionChangeCallback;
}

- (void)setRegionChangeCallback:(id)a3
{
}

- (int)countryCodeNotificationToken
{
  return self->_countryCodeNotificationToken;
}

- (void)setCountryCodeNotificationToken:(int)a3
{
  self->_int countryCodeNotificationToken = a3;
}

- (NSString)lastCountryCode
{
  return self->_lastCountryCode;
}

- (void)setLastCountryCode:(id)a3
{
}

@end