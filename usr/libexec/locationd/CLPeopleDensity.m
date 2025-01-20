@interface CLPeopleDensity
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isBluetoothPoweredOn;
- (CLPeopleDensity)init;
- (id).cxx_construct;
- (id)shouldServiceQuery;
- (void)beginService;
- (void)endService;
- (void)initiateScanSession;
- (void)isUserCurrentlyAloneWithHints:(id)a3 withReply:(id)a4;
- (void)onBTLEAdvertisement:(id)a3;
- (void)onBTLEInvalidated;
- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4;
- (void)prepareBTLEScanner;
- (void)registerForBluetoothPowerNotification;
- (void)replyRequestsWithErrorCode:(int64_t)a3;
- (void)replyRequestsWithResult;
- (void)setIsBluetoothPoweredOn:(BOOL)a3;
- (void)terminateScanSessionFor:(int)a3;
@end

@implementation CLPeopleDensity

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
  if (qword_102480A30 != -1) {
    dispatch_once(&qword_102480A30, &stru_1022F0AE0);
  }
  return (id)qword_102480A28;
}

+ (BOOL)isSupported
{
  BOOL v6 = 0;
  sub_1000C7F88(&v4);
  char v2 = sub_1000D2988(v4, "TrackingAvoidanceOn", &v6);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  if (v6) {
    return 1;
  }
  else {
    return v2 ^ 1;
  }
}

- (CLPeopleDensity)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPeopleDensity;
  return [(CLPeopleDensity *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPeopleDensityProtocol outboundProtocol:&OBJC_PROTOCOL___CLIntersiloClientProtocol];
}

- (void)beginService
{
  self->_scanAllowance = 10;
  objc_super v3 = (CLTimer *)[objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo") newTimer];
  self->_scanAllowanceRefreshTimer = v3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C9B170;
  v6[3] = &unk_10229FED8;
  v6[4] = self;
  [(CLTimer *)v3 setHandler:v6];
  [(CLTimer *)self->_scanAllowanceRefreshTimer setNextFireDelay:86400.0 interval:86400.0];
  self->_scanSessionTimer = 0;
  self->_cuScanner = 0;
  self->_requests = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  self->_classifier = 0;
  self->_isBluetoothPoweredOn = 1;
  [(CLPeopleDensity *)self registerForBluetoothPowerNotification];
  if (qword_1024195D0 != -1) {
    dispatch_once(&qword_1024195D0, &stru_1022F0B50);
  }
  uint64_t v4 = qword_1024195D8;
  if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BeginService: done", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity beginService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)endService
{
  if (qword_1024195D0 != -1) {
    dispatch_once(&qword_1024195D0, &stru_1022F0B50);
  }
  objc_super v3 = qword_1024195D8;
  if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "EndService: entry", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity endService]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  scanSessionTimer = self->_scanSessionTimer;
  if (scanSessionTimer)
  {
    dispatch_source_cancel(scanSessionTimer);
    dispatch_release((dispatch_object_t)self->_scanSessionTimer);
    self->_scanSessionTimer = 0;
  }
  cuScanner = self->_cuScanner;
  if (cuScanner)
  {
    [(CUBLEScanner *)cuScanner invalidate];

    self->_cuScanner = 0;
  }
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:9];
    v7 = self->_bluetoothServiceClient.__ptr_.__value_;
    self->_bluetoothServiceClient.__ptr_.__value_ = 0;
    if (v7) {
      (*(void (**)(Client *))(*(void *)v7 + 8))(v7);
    }
  }
  self->_isBluetoothPoweredOn = 0;
  scanAllowanceRefreshTimer = self->_scanAllowanceRefreshTimer;
  if (scanAllowanceRefreshTimer)
  {
    [(CLTimer *)scanAllowanceRefreshTimer invalidate];

    self->_scanAllowanceRefreshTimer = 0;
  }
  self->_scanAllowance = -1;

  classifier = self->_classifier;
  if (classifier) {
}
  }

- (void)isUserCurrentlyAloneWithHints:(id)a3 withReply:(id)a4
{
  [self universe].silo
  id v7 = [(CLPeopleDensity *)self shouldServiceQuery];
  if (v7)
  {
    v8 = v7;
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    v9 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      v10 = (char *)[v8 code];
      if ((unint64_t)(v10 - 2) > 3) {
        v11 = "Bluetooth powered off";
      }
      else {
        v11 = (&off_1022F0B70)[(void)(v10 - 2)];
      }
      *(_DWORD *)buf = 136380675;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Invalid query, %{private}s, not handling", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      [v8 code];
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity isUserCurrentlyAloneWithHints:withReply:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    (*((void (**)(id, void *, void))a4 + 2))(a4, v8, 0);
  }
  else
  {
    v12 = [[CLPeopleDensityRequest alloc] initWithRequestTimestamp:a3 hints:a4 replyBlock:CFAbsoluteTimeGetCurrent()];
    [(NSMutableArray *)self->_requests addObject:v12];

    [(CLPeopleDensity *)self initiateScanSession];
  }
}

- (void)initiateScanSession
{
  if (self->_scanSessionTimer || self->_classifier || self->_cuScanner)
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    objc_super v3 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initiate: already initiated, returning", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      __int16 v14 = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity initiateScanSession]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  else
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    uint64_t v4 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Initiate: setting up", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      __int16 v14 = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity initiateScanSession]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    unint64_t v5 = [[CLPeopleDensityMediumSignalClassifierConfig alloc] initWithDefaults];
    self->_classifier = (CLPeopleDensityClassifier *)[[CLPeopleDensityClassifier alloc] initAndMarkScanningStarted:v5];

    if (self->_classifier)
    {
      BOOL v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo") queue]);
      self->_scanSessionTimer = v6;
      dispatch_time_t v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 60000000000);
      dispatch_source_set_timer((dispatch_source_t)v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
      scanSessionTimer = self->_scanSessionTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100C9BDF0;
      handler[3] = &unk_10229FED8;
      handler[4] = self;
      dispatch_source_set_event_handler(scanSessionTimer, handler);
      [(CLPeopleDensity *)self prepareBTLEScanner];
      dispatch_resume((dispatch_object_t)self->_scanSessionTimer);
      [(CUBLEScanner *)self->_cuScanner activate];
      --self->_scanAllowance;
    }
    else
    {
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      v9 = qword_1024195D8;
      if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Failed to instantiate the classifier; something is wrong w/ the configuration",
          buf,
          2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195D0 != -1) {
          dispatch_once(&qword_1024195D0, &stru_1022F0B50);
        }
        __int16 v14 = 0;
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPeopleDensity initiateScanSession]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      [(CLPeopleDensity *)self replyRequestsWithErrorCode:5];
    }
  }
}

- (void)terminateScanSessionFor:(int)a3
{
  scanSessionTimer = self->_scanSessionTimer;
  if (scanSessionTimer)
  {
    if (self->_cuScanner)
    {
      if (self->_classifier)
      {
        dispatch_source_cancel(scanSessionTimer);
        dispatch_release((dispatch_object_t)self->_scanSessionTimer);
        self->_scanSessionTimer = 0;
        [(CUBLEScanner *)self->_cuScanner invalidate];

        self->_cuScanner = 0;
        [(CLPeopleDensityClassifier *)self->_classifier markScanningStopped];
        switch(a3)
        {
          case 0:
            if (qword_1024195D0 != -1) {
              dispatch_once(&qword_1024195D0, &stru_1022F0B50);
            }
            BOOL v6 = qword_1024195D8;
            if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Terminate: time out when scanning, classifying", buf, 2u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_54;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1024195D0 != -1) {
              goto LABEL_65;
            }
            goto LABEL_61;
          case 1:
            if (qword_1024195D0 != -1) {
              dispatch_once(&qword_1024195D0, &stru_1022F0B50);
            }
            v11 = qword_1024195D8;
            if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Terminate: bluetooth failed, replying error", buf, 2u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_48;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1024195D0 == -1) {
              goto LABEL_58;
            }
            goto LABEL_66;
          case 2:
            if (qword_1024195D0 != -1) {
              dispatch_once(&qword_1024195D0, &stru_1022F0B50);
            }
            v12 = qword_1024195D8;
            if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Terminate: invalidated while timer is running, replying error", buf, 2u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_48;
            }
            bzero(buf, 0x65CuLL);
            if (qword_1024195D0 == -1) {
              goto LABEL_58;
            }
LABEL_66:
            dispatch_once(&qword_1024195D0, &stru_1022F0B50);
LABEL_58:
            __int16 v14 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v14);
            if (v14 != (char *)buf) {
              free(v14);
            }
LABEL_48:
            [(CLPeopleDensity *)self replyRequestsWithErrorCode:4];
LABEL_55:

            self->_classifier = 0;
            break;
          case 3:
            if (qword_1024195D0 != -1) {
              dispatch_once(&qword_1024195D0, &stru_1022F0B50);
            }
            v13 = qword_1024195D8;
            if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Terminate: collected enough scans, classifying", buf, 2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024195D0 != -1) {
LABEL_65:
              }
                dispatch_once(&qword_1024195D0, &stru_1022F0B50);
LABEL_61:
              v15 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n", v15);
              if (v15 != (char *)buf) {
                free(v15);
              }
            }
LABEL_54:
            [(CLPeopleDensity *)self replyRequestsWithResult];
            goto LABEL_55;
          default:
            goto LABEL_55;
        }
        return;
      }
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      v10 = qword_1024195D8;
      if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67174657;
        int v17 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Terminate: called with no active classifier, %{private}d, returning", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195D0 == -1)
        {
LABEL_33:
          v9 = (uint8_t *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n");
LABEL_34:
          if (v9 != buf) {
            free(v9);
          }
          return;
        }
LABEL_63:
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
        goto LABEL_33;
      }
    }
    else
    {
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      v8 = qword_1024195D8;
      if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67174657;
        int v17 = a3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Terminate: called with no active scanner, %{private}d, returning", buf, 8u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195D0 != -1) {
          dispatch_once(&qword_1024195D0, &stru_1022F0B50);
        }
        v9 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPeopleDensity terminateScanSessionFor:]", "%s\n");
        goto LABEL_34;
      }
    }
  }
  else
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    dispatch_time_t v7 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67174657;
      int v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Terminate: called with no active timer, %{private}d, returning", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 == -1) {
        goto LABEL_33;
      }
      goto LABEL_63;
    }
  }
}

- (void)onBTLEAdvertisement:(id)a3
{
  if (qword_1024195D0 != -1) {
    dispatch_once(&qword_1024195D0, &stru_1022F0B50);
  }
  unint64_t v5 = qword_1024195D8;
  if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136380675;
    *(void *)&uint8_t buf[4] = [(NSString *)sub_10065E130(a3) UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BTLEAdv, payload, %{private}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    [(NSString *)sub_10065E130(a3) UTF8String];
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v15);
    if (v15 != buf) {
      free(v15);
    }
  }
  if ([a3 addressData] && objc_msgSend(objc_msgSend(a3, "addressData"), "length") == (id)6)
  {
    if ([a3 manufacturerData]
      && (unint64_t)objc_msgSend(objc_msgSend(a3, "manufacturerData"), "length") > 2)
    {
      v8 = [objc_msgSend(a3, "manufacturerData") bytes];
      v9 = v8;
      if (*v8 == 76 && !v8[1])
      {
        classifier = self->_classifier;
        sub_100134750(buf, (char *)[a3 addressData]);
        char v21 = v9[2];
        unsigned int v22 = [a3 rawRSSI];
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        unsigned __int8 v12 = [(CLPeopleDensityClassifier *)classifier ingestBTLEAdvertisement:buf];
        if (v20 < 0) {
          operator delete(*(void **)buf);
        }
        if (qword_1024195D0 != -1) {
          dispatch_once(&qword_1024195D0, &stru_1022F0B50);
        }
        v13 = qword_1024195D8;
        if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "BTLEAdv, ingested advertisement to classifier", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024195D0 != -1) {
            dispatch_once(&qword_1024195D0, &stru_1022F0B50);
          }
          int v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v17);
          if (v17 != buf) {
            free(v17);
          }
        }
        if ((v12 & 1) == 0)
        {
          if (qword_1024195D0 != -1) {
            dispatch_once(&qword_1024195D0, &stru_1022F0B50);
          }
          __int16 v14 = qword_1024195D8;
          if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "BTLEAdv, enough scan collected, terminating", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024195D0 != -1) {
              dispatch_once(&qword_1024195D0, &stru_1022F0B50);
            }
            v18 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v18);
            if (v18 != buf) {
              free(v18);
            }
          }
          [(CLPeopleDensity *)self terminateScanSessionFor:3];
        }
      }
      else
      {
        if (qword_1024195D0 != -1) {
          dispatch_once(&qword_1024195D0, &stru_1022F0B50);
        }
        v10 = qword_1024195D8;
        if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "BTLEAdv, not an apple packet, discarding result", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024195D0 == -1)
          {
LABEL_51:
            v16 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEAdvertisement:]", "%s\n", v16);
            if (v16 != buf) {
              free(v16);
            }
            return;
          }
LABEL_61:
          dispatch_once(&qword_1024195D0, &stru_1022F0B50);
          goto LABEL_51;
        }
      }
    }
    else
    {
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      BOOL v6 = qword_1024195D8;
      if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "BTLEAdv, manufacturer data too short, discarding result", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024195D0 == -1) {
          goto LABEL_51;
        }
        goto LABEL_61;
      }
    }
  }
  else
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    dispatch_time_t v7 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "BTLEAdv, invalid address data, discarding result", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 == -1) {
        goto LABEL_51;
      }
      goto LABEL_61;
    }
  }
}

- (void)onBTLEInvalidated
{
  if (self->_scanSessionTimer)
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    objc_super v3 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "BTLEInvalidationHandler: called before timer is canceled, terminating permaturely", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      unint64_t v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEInvalidated]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    [(CLPeopleDensity *)self terminateScanSessionFor:2];
  }
  else
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    uint64_t v4 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "BTLEInvalidationHanlder: called after timer is canceled, no-op", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      BOOL v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBTLEInvalidated]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)prepareBTLEScanner
{
  self->_cuScanner = (CUBLEScanner *)objc_alloc_init((Class)CUBLEScanner);
  -[CUBLEScanner setDispatchQueue:](self->_cuScanner, "setDispatchQueue:", [objc_msgSend(-[CLPeopleDensity universe](self, "universe"), "silo") queue]);
  [(CUBLEScanner *)self->_cuScanner setScanFlags:191];
  [(CUBLEScanner *)self->_cuScanner setScanRate:60];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100C9D3B4;
  v6[3] = &unk_10229FED8;
  v6[4] = self;
  [(CUBLEScanner *)self->_cuScanner setBluetoothStateChangedHandler:v6];
  [(CUBLEScanner *)self->_cuScanner setChangeFlags:16];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C9D414;
  v5[3] = &unk_1022F0B08;
  v5[4] = self;
  [(CUBLEScanner *)self->_cuScanner setDeviceChangedHandler:v5];
  [(CUBLEScanner *)self->_cuScanner setDeviceLostHandler:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100C9D420;
  v4[3] = &unk_1022F0B30;
  v4[4] = self;
  [(CUBLEScanner *)self->_cuScanner setDeviceFoundHandler:v4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C9D42C;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [(CUBLEScanner *)self->_cuScanner setInvalidationHandler:v3];
}

- (void)replyRequestsWithErrorCode:(int64_t)a3
{
  while ([(NSMutableArray *)self->_requests count])
  {
    unint64_t v5 = (void (**)(id, NSError *, void))[self->_requests objectAtIndex:0];
    v5[2](v5, +[NSError errorWithDomain:@"CLPeopleDensityErrorDomain" code:a3 userInfo:0], 0);
    [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
  }
}

- (void)replyRequestsWithResult
{
  while ([(NSMutableArray *)self->_requests count])
  {
    id v3 = [(NSMutableArray *)self->_requests objectAtIndex:0];
    classifier = self->_classifier;
    [v3 requestTimestamp];
    id v6 = -[CLPeopleDensityClassifier isUserAloneAt:withHints:](classifier, "isUserAloneAt:withHints:", [v3 hints], v5);
    dispatch_time_t v7 = (void (**)(id, void, id))[v3 reply];
    if (v6) {
      v7[2](v7, 0, v6);
    }
    else {
      ((void (**)(id, NSError *, id))v7)[2](v7, +[NSError errorWithDomain:@"CLPeopleDensityErrorDomain" code:5 userInfo:0], 0);
    }
    [(NSMutableArray *)self->_requests removeObjectAtIndex:0];
  }
}

- (id)shouldServiceQuery
{
  if (self->_scanAllowance < 1)
  {
    uint64_t v5 = 2;
  }
  else if (self->_isBluetoothPoweredOn)
  {
    if (!self->_scanSessionTimer) {
      return 0;
    }
    if (!self->_cuScanner) {
      return 0;
    }
    if (!self->_classifier) {
      return 0;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    [(NSDate *)[(CLPeopleDensityClassifier *)self->_classifier scanSessionStartTimestamp] timeIntervalSinceReferenceDate];
    if (Current <= v4 + 10.0) {
      return 0;
    }
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 1;
  }

  return +[NSError errorWithDomain:@"CLPeopleDensityErrorDomain" code:v5 userInfo:0];
}

- (void)registerForBluetoothPowerNotification
{
  self->_isBluetoothPoweredOn = 0;
  [(CLPeopleDensity *)self universe];
  sub_100C53368();
}

- (void)onBluetoothServiceNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 9)
  {
    self->_isBluetoothPoweredOn = *((unsigned char *)a4 + 113);
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    id v6 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *((unsigned __int8 *)a4 + 113);
      *(_DWORD *)buf = 67174657;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Bluetooth notification: power, state, %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPeopleDensity onBluetoothServiceNotification:data:]", "%s\n");
LABEL_19:
      if (v8 != buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_1024195D0 != -1) {
      dispatch_once(&qword_1024195D0, &stru_1022F0B50);
    }
    v10 = qword_1024195D8;
    if (os_log_type_enabled((os_log_t)qword_1024195D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67174657;
      int v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Bluetooth notification: unexpected type, %{private}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195D0 != -1) {
        dispatch_once(&qword_1024195D0, &stru_1022F0B50);
      }
      v8 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPeopleDensity onBluetoothServiceNotification:data:]", "%s\n");
      goto LABEL_19;
    }
  }
}

- (BOOL)isBluetoothPoweredOn
{
  return self->_isBluetoothPoweredOn;
}

- (void)setIsBluetoothPoweredOn:(BOOL)a3
{
  self->_isBluetoothPoweredOn = a3;
}

- (void).cxx_destruct
{
  value = self->_bluetoothServiceClient.__ptr_.__value_;
  self->_bluetoothServiceClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end