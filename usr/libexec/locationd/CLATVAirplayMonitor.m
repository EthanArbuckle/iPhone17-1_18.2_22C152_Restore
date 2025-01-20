@interface CLATVAirplayMonitor
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)power;
- (CLATVAirplayMonitor)init;
- (CLTimer)scanDeliveryDelayTimer;
- (NSMutableArray)bufferedDevices;
- (NSMutableSet)clients;
- (WPAirPlaySolo)airplaySolo;
- (void)addClient:(id)a3;
- (void)airPlaySolo:(id)a3 failedToStartScanningWithError:(id)a4;
- (void)airPlaySolo:(id)a3 foundDevice:(id)a4 withData:(id)a5;
- (void)airPlaySoloDidUpdateState:(id)a3;
- (void)airPlaySoloStartedScanning:(id)a3;
- (void)airPlaySoloStoppedScanning:(id)a3;
- (void)beginService;
- (void)beginServiceWithAirPlaySolo:(id)a3;
- (void)dealloc;
- (void)endService;
- (void)getPowerWithCompletion:(id)a3;
- (void)releaseData;
- (void)removeClient:(id)a3;
- (void)sendBufferedScanNotifications;
- (void)setAirplaySolo:(id)a3;
- (void)setBufferedDevices:(id)a3;
- (void)setClients:(id)a3;
- (void)setPower:(BOOL)a3;
- (void)setScanDeliveryDelayTimer:(id)a3;
- (void)startMonitoringDevicesForClient:(id)a3;
- (void)startScan;
- (void)stopMonitoringDevicesForClient:(id)a3;
- (void)stopScan;
- (void)withClients:(id)a3;
@end

@implementation CLATVAirplayMonitor

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
  if (qword_10247ECB0 != -1) {
    dispatch_once(&qword_10247ECB0, &stru_1022CF700);
  }
  return (id)qword_10247ECA8;
}

- (void)beginService
{
  [self universe].silo
  id v3 = [objc_alloc((Class)WPAirPlaySolo) initWithDelegate:self queue:[objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo") queue]];

  [(CLATVAirplayMonitor *)self beginServiceWithAirPlaySolo:v3];
}

- (void)beginServiceWithAirPlaySolo:(id)a3
{
  [self universe].silo
  [(CLATVAirplayMonitor *)self setClients:+[NSMutableSet set]];
  [(CLATVAirplayMonitor *)self setAirplaySolo:a3];
  [(CLATVAirplayMonitor *)self setPower:[(WPAirPlaySolo *)[(CLATVAirplayMonitor *)self airplaySolo] state] == (id)3];
  -[CLATVAirplayMonitor setScanDeliveryDelayTimer:](self, "setScanDeliveryDelayTimer:", [objc_msgSend(-[CLATVAirplayMonitor universe](self, "universe"), "silo") newTimer]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008AE190;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  [(CLTimer *)[(CLATVAirplayMonitor *)self scanDeliveryDelayTimer] setHandler:v5];
  [(CLATVAirplayMonitor *)self setBufferedDevices:+[NSMutableArray array]];
}

- (void)endService
{
  [self universe].silo

  [(CLATVAirplayMonitor *)self releaseData];
}

- (void)releaseData
{
  [(CLATVAirplayMonitor *)self setClients:0];
  [(WPAirPlaySolo *)[(CLATVAirplayMonitor *)self airplaySolo] invalidate];
  [(CLATVAirplayMonitor *)self setAirplaySolo:0];
  [(CLTimer *)[(CLATVAirplayMonitor *)self scanDeliveryDelayTimer] invalidate];
  [(CLATVAirplayMonitor *)self setScanDeliveryDelayTimer:0];

  [(CLATVAirplayMonitor *)self setBufferedDevices:0];
}

- (void)dealloc
{
  [(CLATVAirplayMonitor *)self releaseData];
  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayMonitor;
  [(CLATVAirplayMonitor *)&v3 dealloc];
}

- (void)addClient:(id)a3
{
  [self universe].silo
  unint64_t v5 = [(CLATVAirplayMonitor *)self clients];

  [(NSMutableSet *)v5 addObject:a3];
}

- (void)removeClient:(id)a3
{
  [self universe].silo
  unint64_t v5 = [(CLATVAirplayMonitor *)self clients];

  [(NSMutableSet *)v5 removeObject:a3];
}

- (void)startMonitoringDevicesForClient:(id)a3
{
  [self universe].silo

  [(CLATVAirplayMonitor *)self addClient:a3];
}

- (void)stopMonitoringDevicesForClient:(id)a3
{
  [self universe].silo
  if ([(NSMutableSet *)[(CLATVAirplayMonitor *)self clients] count] == (id)1) {
    [(CLATVAirplayMonitor *)self stopScan];
  }

  [(CLATVAirplayMonitor *)self removeClient:a3];
}

- (void)getPowerWithCompletion:(id)a3
{
  BOOL v4 = [(CLATVAirplayMonitor *)self power];
  unint64_t v5 = (void (*)(id, BOOL))*((void *)a3 + 2);

  v5(a3, v4);
}

- (CLATVAirplayMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLATVAirplayMonitor;
  return [(CLATVAirplayMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLATVAirplayMonitorServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLATVAirplayMonitorClientProtocol];
}

- (void)withClients:(id)a3
{
  [self universe].silo
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  clients = self->_clients;
  id v6 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)startScan
{
  [self universe].silo
  if (![(NSMutableSet *)[(CLATVAirplayMonitor *)self clients] count])
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022CF748);
    }
    id v6 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Warning Got a request for a scan but no one is interested. Ignoring", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419600 == -1)
    {
LABEL_20:
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLATVAirplayMonitor startScan]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
      return;
    }
LABEL_22:
    dispatch_once(&qword_102419600, &stru_1022CF748);
    goto LABEL_20;
  }
  if ([(CLATVAirplayMonitor *)self power])
  {
    [(WPAirPlaySolo *)[(CLATVAirplayMonitor *)self airplaySolo] startConnectionlessScanningWithData:&off_102397360];
    double Current_5 = j__CFAbsoluteTimeGetCurrent_5();
    double v4 = *(double *)&qword_10247ECA0;
    unint64_t v5 = [(CLATVAirplayMonitor *)self scanDeliveryDelayTimer];
    [(CLTimer *)v5 setNextFireTime:(v4 + Current_5 * 1000.0) / 1000.0];
    return;
  }
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022CF748);
  }
  id v7 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Bluetooth is OFF, ignoring request to scan", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 == -1) {
      goto LABEL_20;
    }
    goto LABEL_22;
  }
}

- (void)stopScan
{
  [(WPAirPlaySolo *)[(CLATVAirplayMonitor *)self airplaySolo] stopConnectionlessScanningWithData:&off_102397360];
  objc_super v3 = [(CLATVAirplayMonitor *)self scanDeliveryDelayTimer];

  [(CLTimer *)v3 setNextFireDelay:1.79769313e308];
}

- (void)sendBufferedScanNotifications
{
  [-[CLATVAirplayMonitor universe](self, "universe") silo];
  if ([(NSMutableArray *)[(CLATVAirplayMonitor *)self bufferedDevices] count])
  {
    id v3 = [(NSMutableArray *)[(CLATVAirplayMonitor *)self bufferedDevices] copy];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1008AE9E8;
    v4[3] = &unk_1022CF728;
    v4[4] = self;
    v4[5] = v3;
    [(CLATVAirplayMonitor *)self withClients:v4];

    [(NSMutableArray *)[(CLATVAirplayMonitor *)self bufferedDevices] removeAllObjects];
  }
}

- (void)airPlaySoloDidUpdateState:(id)a3
{
  BOOL v4 = [a3 state] == (id)3;

  [(CLATVAirplayMonitor *)self setPower:v4];
}

- (void)airPlaySolo:(id)a3 foundDevice:(id)a4 withData:(id)a5
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022CF748);
  }
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136380931;
      id v22 = [[[a4 UUIDString] UTF8String];
      __int16 v23 = 2081;
      id v24 = [[objc_msgSend(a5, "description") UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Found device %{private}s withData: %{private}s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022CF748);
      }
      [objc_msgSend(a4, "UUIDString") UTF8String];
      [objc_msgSend(a5, "description") UTF8String];
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
  }
  if (a4)
  {
    id v9 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloAdvertisingData];
    if (v9 && (long long v10 = v9, [v9 length]))
    {
      if ((unint64_t)[v10 length] > 5)
      {
        uint64_t v15 = *(unsigned int *)((char *)[v10 bytes] + 2);
        id v16 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloRSSI];
        if (v16) {
          id v17 = [v16 intValue];
        }
        else {
          id v17 = 0;
        }
        id v18 = [a5 objectForKeyedSubscript:WPPuckTypeAirPlaySoloAdvertisingChannel];
        if (v18) {
          uint64_t v19 = (uint64_t)[v18 intValue];
        }
        else {
          uint64_t v19 = 0xFFFFFFFFLL;
        }
        [(NSMutableArray *)[(CLATVAirplayMonitor *)self bufferedDevices] addObject:[[CLATVAirplayDevice alloc] initWithTimestamp:v17 RSSI:a4 uuid:v15 ipv4:v19 channel:j__CFAbsoluteTimeGetCurrent_5()]];
      }
      else
      {
        if (qword_102419600 != -1) {
          dispatch_once(&qword_102419600, &stru_1022CF748);
        }
        long long v11 = qword_102419608;
        if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Not enough data provided for advertisement data. Ignoring", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419600 == -1) {
            goto LABEL_31;
          }
          goto LABEL_45;
        }
      }
    }
    else
    {
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022CF748);
      }
      long long v12 = qword_102419608;
      if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "No IP address provided. Ignoring device", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419600 == -1)
        {
LABEL_31:
          v14 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySolo:foundDevice:withData:]", "%s\n", v14);
          if (v14 != (char *)buf) {
            free(v14);
          }
          return;
        }
LABEL_45:
        dispatch_once(&qword_102419600, &stru_1022CF748);
        goto LABEL_31;
      }
    }
  }
  else
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022CF748);
    }
    long long v13 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Found a device but its UUID is nil", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 == -1) {
        goto LABEL_31;
      }
      goto LABEL_45;
    }
  }
}

- (void)airPlaySoloStartedScanning:(id)a3
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022CF748);
  }
  id v3 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo started scanning", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022CF748);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySoloStartedScanning:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)airPlaySoloStoppedScanning:(id)a3
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022CF748);
  }
  id v3 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AirPlaySolo stopped scanning", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022CF748);
    }
    BOOL v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLATVAirplayMonitor airPlaySoloStoppedScanning:]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)airPlaySolo:(id)a3 failedToStartScanningWithError:(id)a4
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022CF748);
  }
  unint64_t v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = [a4 description];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to start AirPlaySolo scanning. %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022CF748);
    }
    [a4 description];
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLATVAirplayMonitor airPlaySolo:failedToStartScanningWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (WPAirPlaySolo)airplaySolo
{
  return self->_airplaySolo;
}

- (void)setAirplaySolo:(id)a3
{
}

- (BOOL)power
{
  return self->_power;
}

- (void)setPower:(BOOL)a3
{
  self->_power = a3;
}

- (CLTimer)scanDeliveryDelayTimer
{
  return self->_scanDeliveryDelayTimer;
}

- (void)setScanDeliveryDelayTimer:(id)a3
{
}

- (NSMutableArray)bufferedDevices
{
  return self->_bufferedDevices;
}

- (void)setBufferedDevices:(id)a3
{
}

@end