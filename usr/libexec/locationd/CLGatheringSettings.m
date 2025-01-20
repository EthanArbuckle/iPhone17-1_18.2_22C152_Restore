@interface CLGatheringSettings
- (BOOL)advertiseEnabled;
- (BOOL)evalScanForceScreenOffOnly;
- (BOOL)getSettings:(id)a3 fallback:(BOOL)a4;
- (BOOL)loggingPersistentEnabled;
- (BOOL)loggingPersistentInTempFolder;
- (BOOL)scanEnabled;
- (BOOL)scanForceNoAopPolicy;
- (BOOL)scanForceScreenOffOnly;
- (BOOL)scanWithDuplicates;
- (CLGatheringSettings)initWithUniverse:(id)a3;
- (NSDictionary)otaSettings;
- (id).cxx_construct;
- (int64_t)advertisePeriod;
- (int64_t)loggingPersistentMaxAge;
- (int64_t)loggingVolatileMaxAge;
- (int64_t)scanAonDutyCycle;
- (int64_t)scanBackoffTimeout;
- (int64_t)scanDutyCycle;
- (int64_t)scanPeriodicInterval;
- (void)_setupSettings;
- (void)dealloc;
- (void)onUpdatedSettings:(id)a3;
- (void)overrideWithConfiguration:(id)a3;
- (void)registerForOTASettingsNotification;
- (void)setAdvertiseEnabled:(BOOL)a3;
- (void)setAdvertisePeriod:(int64_t)a3;
- (void)setLoggingPersistentEnabled:(BOOL)a3;
- (void)setLoggingPersistentInTempFolder:(BOOL)a3;
- (void)setLoggingPersistentMaxAge:(int64_t)a3;
- (void)setLoggingVolatileMaxAge:(int64_t)a3;
- (void)setOtaSettings:(id)a3;
- (void)setScanAonDutyCycle:(int64_t)a3;
- (void)setScanBackoffTimeout:(int64_t)a3;
- (void)setScanDutyCycle:(int64_t)a3;
- (void)setScanEnabled:(BOOL)a3;
- (void)setScanForceNoAopPolicy:(BOOL)a3;
- (void)setScanForceScreenOffOnly:(BOOL)a3;
- (void)setScanPeriodicInterval:(int64_t)a3;
- (void)setScanWithDuplicates:(BOOL)a3;
- (void)unregisterForOTASettingsNotification;
@end

@implementation CLGatheringSettings

- (CLGatheringSettings)initWithUniverse:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CLGatheringSettings;
  if ([(CLGatheringSettings *)&v4 init]) {
    operator new();
  }
  [0 _setupSettings];
  return 0;
}

- (void)dealloc
{
  [(CLGatheringSettings *)self setOtaSettings:0];
  [(CLGatheringSettings *)self unregisterForOTASettingsNotification];
  v3.receiver = self;
  v3.super_class = (Class)CLGatheringSettings;
  [(CLGatheringSettings *)&v3 dealloc];
}

- (void)registerForOTASettingsNotification
{
}

- (void)unregisterForOTASettingsNotification
{
}

- (void)onUpdatedSettings:(id)a3
{
  if (qword_1024194B0 != -1) {
    dispatch_once(&qword_1024194B0, &stru_1022B3C58);
  }
  v5 = qword_1024194B8;
  if (os_log_type_enabled((os_log_t)qword_1024194B8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 138477827;
    *(void *)((char *)buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLGatheringSettings Received OTA settings %{private}@", (uint8_t *)buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024194B0 != -1) {
      dispatch_once(&qword_1024194B0, &stru_1022B3C58);
    }
    int v8 = 138477827;
    id v9 = a3;
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLGatheringSettings onUpdatedSettings:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [(CLGatheringSettings *)self setOtaSettings:a3];
  if ([(NSDictionary *)self->_otaSettings objectForKeyedSubscript:@"ADPD"])
  {
    id v6 = [(NSDictionary *)self->_otaSettings objectForKeyedSubscript:@"ADPD"];
    if (objc_msgSend(v6, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CLGatheringScanForceScreenOffOnly")))
    {
      LOBYTE(v8) = [[objc_msgSend(v6, "objectForKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CLGatheringScanForceScreenOffOnly")) BOOLValue];
      sub_1000C7F88(buf);
      sub_1000EA238(*(uint64_t *)&buf[0], "CLGatheringScanForceScreenOffOnly", &v8);
      if (*((void *)&buf[0] + 1)) {
        sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
      }
    }
  }
}

- (void)_setupSettings
{
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  char v3 = sub_1000D2988(v28, "CLGatheringScanEnabled", (BOOL *)&v30);
  if ((_BYTE)v30) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  self->_scanEnabled = v4;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  char v5 = sub_1000D2988(v28, "CLGatheringScanForceNoAopPolicy", (BOOL *)&v30);
  if ((_BYTE)v30) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
  self->_scanForceNoAopPolicy = v6;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  self->_scanForceScreenOffOnly = [(CLGatheringSettings *)self evalScanForceScreenOffOnly];
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v7 = sub_1004D0EA0(v28, "CLGatheringScanDutyCyle", &v30);
  int64_t v8 = v30;
  if (!v7) {
    int64_t v8 = 35;
  }
  self->_scanDutyCycle = v8;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v9 = sub_1004D0EA0(v28, "CLGatheringScanBackgroundDutyCyle", &v30);
  int64_t v10 = v30;
  if (!v9) {
    int64_t v10 = 20;
  }
  self->_scanAonDutyCycle = v10;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v11 = sub_1004D0EA0(v28, "CLGatheringScanBackoffTimeout", &v30);
  int64_t v12 = v30;
  if (!v11) {
    int64_t v12 = 15;
  }
  self->_scanBackoffTimeout = v12;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v13 = sub_1004D0EA0(v28, "CLGatheringScanPeriodicInterval", &v30);
  int64_t v14 = v30;
  if (!v13) {
    int64_t v14 = 360;
  }
  self->_scanPeriodicInterval = v14;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  char v15 = sub_1000D2988(v28, "CLGatheringScanWithDuplicates", (BOOL *)&v30);
  if ((_BYTE)v30) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = 0;
  }
  self->_scanWithDuplicates = v16;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  char v17 = sub_1000D2988(v28, "CLGatheringAdvertiseEnabled", (BOOL *)&v30);
  if ((_BYTE)v30) {
    BOOL v18 = v17;
  }
  else {
    BOOL v18 = 0;
  }
  self->_advertiseEnabled = v18;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v19 = sub_1004D0EA0(v28, "CLGatheringAdvertisePeriod", &v30);
  int64_t v20 = v30;
  if (!v19) {
    int64_t v20 = 10;
  }
  self->_advertisePeriod = v20;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v21 = sub_1004D0EA0(v28, "CLGatheringLoggingVolatileMaxAge", &v30);
  int64_t v22 = v30;
  if (!v21) {
    int64_t v22 = 1800;
  }
  self->_loggingVolatileMaxAge = v22;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  char v23 = sub_1000D2988(v28, "CLGatheringLoggingPersistentEnabled", (BOOL *)&v30);
  if ((_BYTE)v30) {
    BOOL v24 = v23;
  }
  else {
    BOOL v24 = 0;
  }
  self->_loggingPersistentEnabled = v24;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  int64_t v30 = 0;
  int v25 = sub_1004D0EA0(v28, "CLGatheringLoggingPersistentMaxAge", &v30);
  int64_t v26 = v30;
  if (!v25) {
    int64_t v26 = 604800;
  }
  self->_loggingPersistentMaxAge = v26;
  if (v29) {
    sub_1000DB0A0(v29);
  }
  sub_1000C7F88(&v28);
  LOBYTE(v30) = 0;
  int v27 = sub_1000D2988(v28, "CLGatheringLoggingPersistentInTempFolder", (BOOL *)&v30) ^ 1;
  if ((_BYTE)v30) {
    LOBYTE(v27) = 1;
  }
  self->_loggingPersistentInTempFolder = v27;
  if (v29) {
    sub_1000DB0A0(v29);
  }
}

- (BOOL)getSettings:(id)a3 fallback:(BOOL)a4
{
  BOOL v12 = 0;
  sub_1000C7F88(&v10);
  int v7 = sub_1000D2988(v10, (const char *)[a3 cStringUsingEncoding:1], &v12);
  if (v11) {
    sub_1000DB0A0(v11);
  }
  if (v7) {
    return v12;
  }
  if ([(NSDictionary *)self->_otaSettings objectForKeyedSubscript:@"ADPD"])
  {
    id v8 = [(NSDictionary *)self->_otaSettings objectForKeyedSubscript:@"ADPD"];
    if ([v8 objectForKeyedSubscript:a3]) {
      return [[v8 objectForKeyedSubscript:a3] BOOLValue];
    }
  }
  return a4;
}

- (BOOL)evalScanForceScreenOffOnly
{
  char v3 = +[NSString stringWithUTF8String:"CLGatheringScanForceScreenOffOnly"];

  return [(CLGatheringSettings *)self getSettings:v3 fallback:0];
}

- (void)overrideWithConfiguration:(id)a3
{
  int var1 = a3.var1;
  if (a3.var0 == 1)
  {
    sub_1000C7F88(&v23);
    LOBYTE(v25) = 0;
    int v7 = sub_1000D2988(v23, "CLGatheringAdvertiseEnabled", (BOOL *)&v25) ^ 1;
    if ((_BYTE)v25) {
      LOBYTE(v7) = 1;
    }
    self->_advertiseEnabled = v7;
    if (v24) {
      sub_1000DB0A0(v24);
    }
    sub_1000C7F88(&v23);
    int64_t v25 = 0;
    int v8 = sub_1004D0EA0(v23, "CLGatheringAdvertisePeriod", &v25);
    int64_t v9 = v25;
    if (!v8) {
      int64_t v9 = 10;
    }
    self->_advertisePeriod = v9;
  }
  else
  {
    if (a3.var0) {
      goto LABEL_16;
    }
    sub_1000C7F88(&v23);
    LOBYTE(v25) = 0;
    char v5 = sub_1000D2988(v23, "CLGatheringAdvertiseEnabled", (BOOL *)&v25);
    if ((_BYTE)v25) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = 0;
    }
    self->_advertiseEnabled = v6;
  }
  if (v24) {
    sub_1000DB0A0(v24);
  }
LABEL_16:
  if (var1 == 2)
  {
    sub_1000C7F88(&v23);
    LOBYTE(v25) = 0;
    int v12 = sub_1000D2988(v23, "CLGatheringScanEnabled", (BOOL *)&v25) ^ 1;
    if ((_BYTE)v25) {
      LOBYTE(v12) = 1;
    }
    self->_scanEnabled = v12;
    if (v24) {
      sub_1000DB0A0(v24);
    }
    sub_1000C7F88(&v23);
    int64_t v25 = 0;
    int v13 = sub_1004D0EA0(v23, "CLGatheringScanBackgroundDutyCyle", &v25);
    int64_t v14 = v25;
    if (!v13) {
      int64_t v14 = 10;
    }
    self->_scanAonDutyCycle = v14;
    if (v24) {
      sub_1000DB0A0(v24);
    }
    sub_1000C7F88(&v23);
    int64_t v25 = 0;
    int v15 = sub_1004D0EA0(v23, "CLGatheringScanDutyCyle", &v25);
    int64_t v16 = v25;
    BOOL v17 = v15 == 0;
    uint64_t v18 = 30;
    goto LABEL_41;
  }
  if (var1 == 1)
  {
    sub_1000C7F88(&v23);
    LOBYTE(v25) = 0;
    int v19 = sub_1000D2988(v23, "CLGatheringScanEnabled", (BOOL *)&v25) ^ 1;
    if ((_BYTE)v25) {
      LOBYTE(v19) = 1;
    }
    self->_scanEnabled = v19;
    if (v24) {
      sub_1000DB0A0(v24);
    }
    sub_1000C7F88(&v23);
    int64_t v25 = 0;
    int v20 = sub_1004D0EA0(v23, "CLGatheringScanBackgroundDutyCyle", &v25);
    int64_t v21 = v25;
    if (!v20) {
      int64_t v21 = 20;
    }
    self->_scanAonDutyCycle = v21;
    if (v24) {
      sub_1000DB0A0(v24);
    }
    sub_1000C7F88(&v23);
    int64_t v25 = 0;
    int v22 = sub_1004D0EA0(v23, "CLGatheringScanDutyCyle", &v25);
    int64_t v16 = v25;
    BOOL v17 = v22 == 0;
    uint64_t v18 = 35;
LABEL_41:
    if (v17) {
      int64_t v16 = v18;
    }
    self->_scanDutyCycle = v16;
    goto LABEL_45;
  }
  if (var1) {
    return;
  }
  sub_1000C7F88(&v23);
  LOBYTE(v25) = 0;
  char v10 = sub_1000D2988(v23, "CLGatheringScanEnabled", (BOOL *)&v25);
  if ((_BYTE)v25) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }
  self->_scanEnabled = v11;
LABEL_45:
  if (v24) {
    sub_1000DB0A0(v24);
  }
}

- (BOOL)scanEnabled
{
  return self->_scanEnabled;
}

- (void)setScanEnabled:(BOOL)a3
{
  self->_scanEnabled = a3;
}

- (BOOL)scanForceNoAopPolicy
{
  return self->_scanForceNoAopPolicy;
}

- (void)setScanForceNoAopPolicy:(BOOL)a3
{
  self->_scanForceNoAopPolicy = a3;
}

- (BOOL)scanForceScreenOffOnly
{
  return self->_scanForceScreenOffOnly;
}

- (void)setScanForceScreenOffOnly:(BOOL)a3
{
  self->_scanForceScreenOffOnly = a3;
}

- (int64_t)scanAonDutyCycle
{
  return self->_scanAonDutyCycle;
}

- (void)setScanAonDutyCycle:(int64_t)a3
{
  self->_scanAonDutyCycle = a3;
}

- (int64_t)scanDutyCycle
{
  return self->_scanDutyCycle;
}

- (void)setScanDutyCycle:(int64_t)a3
{
  self->_scanDutyCycle = a3;
}

- (int64_t)scanBackoffTimeout
{
  return self->_scanBackoffTimeout;
}

- (void)setScanBackoffTimeout:(int64_t)a3
{
  self->_scanBackoffTimeout = a3;
}

- (int64_t)scanPeriodicInterval
{
  return self->_scanPeriodicInterval;
}

- (void)setScanPeriodicInterval:(int64_t)a3
{
  self->_scanPeriodicInterval = a3;
}

- (BOOL)scanWithDuplicates
{
  return self->_scanWithDuplicates;
}

- (void)setScanWithDuplicates:(BOOL)a3
{
  self->_scanWithDuplicates = a3;
}

- (BOOL)advertiseEnabled
{
  return self->_advertiseEnabled;
}

- (void)setAdvertiseEnabled:(BOOL)a3
{
  self->_advertiseEnabled = a3;
}

- (int64_t)advertisePeriod
{
  return self->_advertisePeriod;
}

- (void)setAdvertisePeriod:(int64_t)a3
{
  self->_advertisePeriod = a3;
}

- (int64_t)loggingVolatileMaxAge
{
  return self->_loggingVolatileMaxAge;
}

- (void)setLoggingVolatileMaxAge:(int64_t)a3
{
  self->_loggingVolatileMaxAge = a3;
}

- (BOOL)loggingPersistentEnabled
{
  return self->_loggingPersistentEnabled;
}

- (void)setLoggingPersistentEnabled:(BOOL)a3
{
  self->_loggingPersistentEnabled = a3;
}

- (int64_t)loggingPersistentMaxAge
{
  return self->_loggingPersistentMaxAge;
}

- (void)setLoggingPersistentMaxAge:(int64_t)a3
{
  self->_loggingPersistentMaxAge = a3;
}

- (BOOL)loggingPersistentInTempFolder
{
  return self->_loggingPersistentInTempFolder;
}

- (void)setLoggingPersistentInTempFolder:(BOOL)a3
{
  self->_loggingPersistentInTempFolder = a3;
}

- (NSDictionary)otaSettings
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOtaSettings:(id)a3
{
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