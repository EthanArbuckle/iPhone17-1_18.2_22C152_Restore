@interface CLEmergencyWifiAvailability
- (CLEmergencyWifiAvailability)initWithUniverse:(id)a3;
- (void)_processReceivedWiFiDeviceLinkScore:(unsigned int)a3;
- (void)_registerForEventsNotification;
- (void)_registerForLinkChangedNotifications;
- (void)_registerForLqmScoreNotifications;
- (void)_registerForWowChangeNotifications;
- (void)_scheduleWifiArtifactsAllocation:(const char *)a3;
- (void)_setup;
- (void)_setupMonitoringEvent;
- (void)_submitWifiAvailabilityEventToBiome;
- (void)_submitWowChangeEventToBiome;
- (void)_unregisterForEventsNotification;
- (void)_unregisterForLinkChangedNotifications;
- (void)_unregisterForLqmScoreNotifications;
- (void)_unregisterForWowChangeNotifications;
- (void)dealloc;
- (void)processReceivedWiFiDeviceLinkScore:(unsigned int)a3;
- (void)registerForEventsNotification;
- (void)setup;
- (void)submitWifiAvailabilityEventToBiome;
- (void)submitWowChangeEventToBiome;
- (void)unregisterForEventsNotification;
@end

@implementation CLEmergencyWifiAvailability

- (void)_processReceivedWiFiDeviceLinkScore:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (fReceivedCallBacks)
  {
    if (![(NSMutableDictionary *)fReceivedCallBacks objectForKey:@"lqmKey"]
      || [(NSMutableDictionary *)self->fReceivedCallBacks objectForKey:@"lqmKey"]
      && objc_msgSend(-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", @"lqmKey"), "unsignedIntValue") != v3)
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      v6 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
        __int16 v12 = 1024;
        int v13 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s, linkScore, %u", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B2208);
        }
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      [(NSMutableDictionary *)self->fReceivedCallBacks setObject:+[NSNumber numberWithUnsignedInt:v3] forKey:@"lqmKey"];
      [(CLEmergencyWifiAvailability *)self submitWifiAvailabilityEventToBiome];
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _processReceivedWiFiDeviceLinkScore:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)processReceivedWiFiDeviceLinkScore:(unsigned int)a3
{
  fQueue = self->fQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10017B3BC;
  v4[3] = &unk_1022B21E8;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(fQueue, v4);
}

- (CLEmergencyWifiAvailability)initWithUniverse:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  unsigned int v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CLEmergencyWifiAvailability initWithUniverse:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v11 = 136315138;
    __int16 v12 = "-[CLEmergencyWifiAvailability initWithUniverse:]";
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability initWithUniverse:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CLEmergencyWifiAvailability;
  v6 = [(CLEmergencyWifiAvailability *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->fUniverse = (CLIntersiloUniverse *)a3;
    v6->fQueue = (OS_dispatch_queue *)[objc_msgSend(objc_msgSend(a3, "silo"), "queue")];
    [(CLEmergencyWifiAvailability *)v7 setup];
  }
  return v7;
}

- (void)setup
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004223C0;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_setup
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CLEmergencyWifiAvailability _setup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    unsigned int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setup]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  v4 = (CWFInterface *)objc_alloc_init((Class)CWFInterface);
  self->fCoreWiFiInterface = v4;
  if (v4)
  {
    [(CWFInterface *)v4 activate];
    self->fWifiDevice = 0;
    self->fWifiManager = 0;
    self->fReceivedCallBacks = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)self->fReceivedCallBacks setObject:+[NSNumber numberWithBool:[(CWFInterface *)self->fCoreWiFiInterface wakeOnWirelessEnabled]] forKey:@"isWoWEnabledKey"];
    [(CLEmergencyWifiAvailability *)self submitWowChangeEventToBiome];
    [(CLEmergencyWifiAvailability *)self registerForEventsNotification];
  }
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[CLEmergencyWifiAvailability dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v6 = 136315138;
    v7 = "-[CLEmergencyWifiAvailability dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if (self->fCoreWiFiInterface)
  {
    [(CLEmergencyWifiAvailability *)self _unregisterForEventsNotification];
    [(CWFInterface *)self->fCoreWiFiInterface invalidate];
  }
  if (self->fWifiDevice) {
    [(CLEmergencyWifiAvailability *)self _unregisterForLqmScoreNotifications];
  }
  v5.receiver = self;
  v5.super_class = (Class)CLEmergencyWifiAvailability;
  [(CLEmergencyWifiAvailability *)&v5 dealloc];
}

- (void)registerForEventsNotification
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100422864;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_registerForEventsNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[CLEmergencyWifiAvailability _registerForEventsNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForEventsNotification]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLEmergencyWifiAvailability *)self _setupMonitoringEvent];
  [(CLEmergencyWifiAvailability *)self _registerForLinkChangedNotifications];
  [(CLEmergencyWifiAvailability *)self _registerForWowChangeNotifications];
  [(CLEmergencyWifiAvailability *)self _registerForLqmScoreNotifications];
}

- (void)unregisterForEventsNotification
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100422AC0;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_unregisterForEventsNotification
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[CLEmergencyWifiAvailability _unregisterForEventsNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForEventsNotification]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLEmergencyWifiAvailability *)self _unregisterForLinkChangedNotifications];
  [(CLEmergencyWifiAvailability *)self _unregisterForWowChangeNotifications];
  [(CLEmergencyWifiAvailability *)self _unregisterForLqmScoreNotifications];
}

- (void)_scheduleWifiArtifactsAllocation:(const char *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  objc_super v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v13 = "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]";
    __int16 v14 = 2080;
    v15 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, reason, %s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v8 = 136315394;
    v9 = "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]";
    __int16 v10 = 2080;
    int v11 = a3;
    int v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _scheduleWifiArtifactsAllocation:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100422EE8;
  block[3] = &unk_10229FED8;
  block[4] = self;
  if (qword_10247A9B8 != -1) {
    dispatch_once(&qword_10247A9B8, block);
  }
}

- (void)_registerForLqmScoreNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  uint64_t v3 = &qword_102419000;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    *(_DWORD *)v25 = 136315138;
    *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v17);
    if (v17 != buf) {
      free(v17);
    }
  }
  if (self->fWifiDevice)
  {
    WiFiDeviceClientRegisterLQMCallback();
    CFRelease(self->fWifiDevice);
    self->fWifiDevice = 0;
  }
  if (self->fWifiManager) {
    goto LABEL_11;
  }
  objc_super v5 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->fWifiManager = v5;
  if (v5)
  {
    sub_1001C2710();
    WiFiManagerClientScheduleWithRunLoop();
LABEL_11:
    CFArrayRef v6 = (const __CFArray *)WiFiManagerClientCopyDevices();
    CFArrayRef v7 = v6;
    if (v6)
    {
      if (!CFArrayGetCount(v6))
      {
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B2208);
        }
        int v8 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s, wifi zero devices", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024193E0 != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022B2208);
          }
          *(_DWORD *)v25 = 136315138;
          *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v20);
          uint64_t v3 = &qword_102419000;
          if (v20 != buf) {
            free(v20);
          }
        }
        [(CLEmergencyWifiAvailability *)self _scheduleWifiArtifactsAllocation:"DevicesZero"];
      }
      ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v7, 0);
      self->fWifiDevice = ValueAtIndex;
      if (ValueAtIndex && (CFTypeID v10 = CFGetTypeID(ValueAtIndex), v10 == WiFiDeviceClientGetTypeID()))
      {
        CFRetain(self->fWifiDevice);
        if (v3[124] != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B2208);
        }
        int v11 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef InterfaceName = (const __CFString *)WiFiDeviceClientGetInterfaceName();
          sub_1000FECE0(InterfaceName, (uint64_t)buf);
          int v13 = v34 >= 0 ? buf : *(unsigned char **)buf;
          *(_DWORD *)v25 = 136315394;
          *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          __int16 v26 = 2080;
          v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s, wifi interface, %s", v25, 0x16u);
          if (v34 < 0) {
            operator delete(*(void **)buf);
          }
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v3[124] != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022B2208);
          }
          CFStringRef v21 = (const __CFString *)WiFiDeviceClientGetInterfaceName();
          sub_1000FECE0(v21, (uint64_t)v25);
          if (v28 >= 0) {
            v22 = v25;
          }
          else {
            v22 = *(unsigned char **)v25;
          }
          int v29 = 136315394;
          v30 = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          __int16 v31 = 2080;
          v32 = v22;
          v23 = (char *)_os_log_send_and_compose_impl();
          if (v28 < 0) {
            operator delete(*(void **)v25);
          }
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v23);
          if (v23 != buf) {
            free(v23);
          }
        }
        WiFiDeviceClientRegisterLQMCallback();
        CFRelease(v7);
      }
      else
      {
        if (v3[124] != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B2208);
        }
        __int16 v14 = qword_1024193E8;
        if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s, wifi device failure", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (v3[124] != -1) {
            dispatch_once(&qword_1024193E0, &stru_1022B2208);
          }
          *(_DWORD *)v25 = 136315138;
          *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
          v18 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v18);
          if (v18 != buf) {
            free(v18);
          }
        }
        [(CLEmergencyWifiAvailability *)self _scheduleWifiArtifactsAllocation:"DeviceFail"];
        self->fWifiDevice = 0;
        CFRelease(v7);
      }
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      v15 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s, wifi devices failure", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_1022B2208);
        }
        *(_DWORD *)v25 = 136315138;
        *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v19);
        if (v19 != buf) {
          free(v19);
        }
      }
      [(CLEmergencyWifiAvailability *)self _scheduleWifiArtifactsAllocation:"DevicesNull"];
    }
    return;
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  v16 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s, WiFiManagerClientCreate failed", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    *(_DWORD *)v25 = 136315138;
    *(void *)&v25[4] = "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]";
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEmergencyWifiAvailability _registerForLqmScoreNotifications]", "%s\n", v24);
    if (v24 != buf) {
      free(v24);
    }
  }
  [(CLEmergencyWifiAvailability *)self _scheduleWifiArtifactsAllocation:"ManagerNull"];
}

- (void)_unregisterForLqmScoreNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    CFArrayRef v6 = "-[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForLqmScoreNotifications]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if (self->fWifiDevice)
  {
    WiFiDeviceClientRegisterLQMCallback();
    CFRelease(self->fWifiDevice);
    self->fWifiDevice = 0;
  }
}

- (void)_registerForLinkChangedNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v10 = 136315138;
    int v11 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
    CFArrayRef v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v9 = 0;
  [(CWFInterface *)self->fCoreWiFiInterface startMonitoringEventType:6 error:&v9];
  if (v9)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v9 description];
      *(_DWORD *)buf = 136315394;
      v15 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      id v7 = [v9 description];
      int v10 = 136315394;
      int v11 = "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]";
      __int16 v12 = 2112;
      id v13 = v7;
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForLinkChangedNotifications]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)_unregisterForLinkChangedNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    CFArrayRef v6 = "-[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForLinkChangedNotifications]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CWFInterface *)self->fCoreWiFiInterface stopMonitoringEventType:6];
}

- (void)_registerForWowChangeNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v10 = 136315138;
    int v11 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
    CFArrayRef v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  id v9 = 0;
  [(CWFInterface *)self->fCoreWiFiInterface startMonitoringEventType:9 error:&v9];
  if (v9)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [v9 description];
      *(_DWORD *)buf = 136315394;
      v15 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      id v7 = [v9 description];
      int v10 = 136315394;
      int v11 = "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]";
      __int16 v12 = 2112;
      id v13 = v7;
      int v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _registerForWowChangeNotifications]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)_unregisterForWowChangeNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    CFArrayRef v6 = "-[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _unregisterForWowChangeNotifications]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CWFInterface *)self->fCoreWiFiInterface stopMonitoringEventType:9];
}

- (void)_setupMonitoringEvent
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  uint64_t v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    int v9 = 136315138;
    int v10 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
    CFArrayRef v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setupMonitoringEvent]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  fCoreWiFiInterface = self->fCoreWiFiInterface;
  if (fCoreWiFiInterface)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100424C30;
    v8[3] = &unk_1022B2180;
    v8[4] = self;
    [(CWFInterface *)fCoreWiFiInterface setEventHandler:v8];
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    id v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s, fCoreWiFiInterface is nill", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      int v9 = 136315138;
      int v10 = "-[CLEmergencyWifiAvailability _setupMonitoringEvent]";
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _setupMonitoringEvent]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)submitWifiAvailabilityEventToBiome
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100425348;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_submitWifiAvailabilityEventToBiome
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (fReceivedCallBacks)
  {
    if ([(NSMutableDictionary *)fReceivedCallBacks objectForKey:@"isWiFiStartingKey"]
      && [(NSMutableDictionary *)self->fReceivedCallBacks objectForKey:@"isWiFiSwitchOnKey"]
      && [(NSMutableDictionary *)self->fReceivedCallBacks objectForKey:@"lqmKey"])
    {
      [(NSMutableDictionary *)self->fReceivedCallBacks enumerateKeysAndObjectsUsingBlock:&stru_1022B21C0];
      id v4 = [objc_alloc((Class)BMDeviceWiFiAvailabilityStatus) initWithStarting:-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", @"isWiFiStartingKey") isWiFiSwitchOn:-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", @"isWiFiSwitchOnKey") quality:-[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", @"lqmKey")];
      id v5 = [[[[[(id)BiomeLibrary() Device] Wireless] WiFiAvailabilityStatus] source];
      [v5 sendEvent:v4];
      return;
    }
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    CFArrayRef v6 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s, skipping, did not receive all the parameters", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1)
      {
LABEL_22:
        int v8 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]", "%s\n", v8);
        if (v8 != (char *)buf) {
          free(v8);
        }
        return;
      }
LABEL_24:
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
      goto LABEL_22;
    }
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    id v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v10 = "-[CLEmergencyWifiAvailability _submitWifiAvailabilityEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 == -1) {
        goto LABEL_22;
      }
      goto LABEL_24;
    }
  }
}

- (void)submitWowChangeEventToBiome
{
  fQueue = self->fQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100425970;
  block[3] = &unk_10229FED8;
  block[4] = self;
  dispatch_async(fQueue, block);
}

- (void)_submitWowChangeEventToBiome
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  fReceivedCallBacks = self->fReceivedCallBacks;
  if (!fReceivedCallBacks)
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    id v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v12 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s, skipping, callbacks nil", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 == -1)
    {
LABEL_29:
      int v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
      return;
    }
LABEL_31:
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
    goto LABEL_29;
  }
  if ([(NSMutableDictionary *)fReceivedCallBacks objectForKey:@"isWoWEnabledKey"])
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_1022B2208);
    }
    id v4 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v5 = [[self->fReceivedCallBacks objectForKey:@"isWoWEnabledKey"] boolValue];
      CFStringRef v6 = @"NO";
      if (v5) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      __int16 v12 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
      __int16 v13 = 2112;
      CFStringRef v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s, fIsWowEnabled, %@", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_1022B2208);
      }
      [self->fReceivedCallBacks objectForKey:@"isWoWEnabledKey"] ? [self->fReceivedCallBacks objectForKey:@"isWoWEnabledKey"] : [NSNumber numberWithBool:NO];
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "Wireless"), "WakeOnWiFiStatus"), "source"), "sendEvent:", objc_msgSend(objc_alloc((Class)BMDeviceWakeOnWiFiStatus), "initWithStarting:", -[NSMutableDictionary objectForKey:](self->fReceivedCallBacks, "objectForKey:", @"isWoWEnabledKey")));
    return;
  }
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_1022B2208);
  }
  int v8 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[CLEmergencyWifiAvailability _submitWowChangeEventToBiome]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s, skipping, no WoW available", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 == -1) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
}

@end