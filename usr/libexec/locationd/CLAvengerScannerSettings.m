@interface CLAvengerScannerSettings
- (CLAvengerScannerSettings)initWithUniverse:(id)a3;
- (double)getSettings:(id)a3;
- (double)longAggressiveScanCoexImpactedDuration;
- (double)longAggressiveScanNonCoexImpactedDuration;
- (id).cxx_construct;
- (id)settingsDictionary;
- (void)dealloc;
- (void)onUpdatedSettings:(id)a3;
- (void)registerForOTASettingsNotification;
- (void)unregisterForOTASettingsNotification;
@end

@implementation CLAvengerScannerSettings

- (CLAvengerScannerSettings)initWithUniverse:(id)a3
{
  self->_otaSettings = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
  operator new();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerSettings;
  [(CLAvengerScannerSettings *)&v3 dealloc];
  [(CLAvengerScannerSettings *)self unregisterForOTASettingsNotification];
}

- (void)registerForOTASettingsNotification
{
}

- (void)unregisterForOTASettingsNotification
{
}

- (void)onUpdatedSettings:(id)a3
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_10230AD58);
  }
  v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLAvengerScannerSettings Received OTA settings %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10230AD58);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAvengerScannerSettings onUpdatedSettings:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  self->_otaSettings = (NSDictionary *)[a3 copy];
}

- (id)settingsDictionary
{
  v4[0] = +[NSString stringWithUTF8String:"AvengerScannerLongAggressiveScanNonCoexImpactedDuration"];
  [(CLAvengerScannerSettings *)self longAggressiveScanNonCoexImpactedDuration];
  v5[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[1] = +[NSString stringWithUTF8String:"AvengerScannerLongAggressiveScanCoexImpactedDuration"];
  [(CLAvengerScannerSettings *)self longAggressiveScanCoexImpactedDuration];
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
}

- (double)getSettings:(id)a3
{
  double v10 = 0.0;
  sub_1000C7F88(&v8);
  int v5 = sub_1000A699C(v8, (const char *)[a3 cStringUsingEncoding:1], &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  if (v5) {
    return v10;
  }
  if ([(NSDictionary *)self->_otaSettings objectForKeyedSubscript:a3])
  {
    [self->_otaSettings objectForKeyedSubscript:a3] doubleValue];
  }
  else
  {
    unsigned int v7 = [a3 isEqualToString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "AvengerScannerLongAggressiveScanNonCoexImpactedDuration")];
    double result = 120.0;
    if (v7) {
      return 39.0;
    }
  }
  return result;
}

- (double)longAggressiveScanNonCoexImpactedDuration
{
  objc_super v3 = +[NSString stringWithUTF8String:"AvengerScannerLongAggressiveScanNonCoexImpactedDuration"];

  [(CLAvengerScannerSettings *)self getSettings:v3];
  return result;
}

- (double)longAggressiveScanCoexImpactedDuration
{
  objc_super v3 = +[NSString stringWithUTF8String:"AvengerScannerLongAggressiveScanCoexImpactedDuration"];

  [(CLAvengerScannerSettings *)self getSettings:v3];
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end