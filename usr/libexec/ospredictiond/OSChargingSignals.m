@interface OSChargingSignals
+ (id)sharedInstance;
- (OSChargingSignals)init;
- (OSICalendarMonitor)calendarMonitor;
- (OSILocationMonitor)locationMonitor;
- (OSIWalletMonitor)walletMonitor;
- (OS_os_log)log;
- (id)determineNextEvent;
- (void)setCalendarMonitor:(id)a3;
- (void)setLocationMonitor:(id)a3;
- (void)setLog:(id)a3;
- (void)setWalletMonitor:(id)a3;
@end

@implementation OSChargingSignals

+ (id)sharedInstance
{
  if (qword_10007A880 != -1) {
    dispatch_once(&qword_10007A880, &stru_100064EE0);
  }
  v2 = (void *)qword_10007A888;

  return v2;
}

- (OSChargingSignals)init
{
  v12.receiver = self;
  v12.super_class = (Class)OSChargingSignals;
  v2 = [(OSChargingSignals *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(OSIWalletMonitor);
    walletMonitor = v2->_walletMonitor;
    v2->_walletMonitor = v3;

    v5 = objc_alloc_init(OSICalendarMonitor);
    calendarMonitor = v2->_calendarMonitor;
    v2->_calendarMonitor = v5;

    v7 = objc_alloc_init(OSILocationMonitor);
    locationMonitor = v2->_locationMonitor;
    v2->_locationMonitor = v7;

    os_log_t v9 = os_log_create("com.apple.osintelligence", "chargingsignals");
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;
  }
  return v2;
}

- (id)determineNextEvent
{
  v3 = [(OSChargingSignals *)self walletMonitor];
  v4 = [v3 relevantEventDeadline];

  v5 = [(OSChargingSignals *)self calendarMonitor];
  v6 = [v5 relevantEventDeadline];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "walletEvent %@, calendarEvent %@", (uint8_t *)&v15, 0x16u);
  }
  v8 = +[NSDate distantFuture];
  if ([v4 isEqualToDate:v8])
  {
    os_log_t v9 = +[NSDate distantFuture];
    unsigned __int8 v10 = [v6 isEqualToDate:v9];

    if (v10)
    {
      uint64_t v11 = +[NSDate distantFuture];
      goto LABEL_10;
    }
  }
  else
  {
  }
  objc_super v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Found flight information at %@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v11 = +[NSDate distantPast];
LABEL_10:
  v13 = (void *)v11;

  return v13;
}

- (OSIWalletMonitor)walletMonitor
{
  return (OSIWalletMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWalletMonitor:(id)a3
{
}

- (OSICalendarMonitor)calendarMonitor
{
  return (OSICalendarMonitor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCalendarMonitor:(id)a3
{
}

- (OSILocationMonitor)locationMonitor
{
  return (OSILocationMonitor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLocationMonitor:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_calendarMonitor, 0);

  objc_storeStrong((id *)&self->_walletMonitor, 0);
}

@end