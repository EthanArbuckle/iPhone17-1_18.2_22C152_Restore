@interface CLAccessoryObserver
- (BOOL)getAllowGPGGAOnlyAccessory;
- (BOOL)getEnableAggressiveLocationScreening;
- (BOOL)getEnableCourseScreening;
- (BOOL)iAPTimeSyncEnable;
- (BOOL)isOnDenyList:(id)a3;
- (BOOL)sendEphemeris:(id)a3;
- (BOOL)sendReferenceTime:(double)a3;
- (BOOL)sendReferenceTime:(double)a3 locationLatitude:(double)a4 longitude:(double)a5 accuracy:(double)a6;
- (BOOL)setupAccessory:(id)a3 withListenerCall:(BOOL)a4;
- (BOOL)setupEphemeris;
- (BOOL)startLocation;
- (BOOL)stopLocation;
- (CLAccessoryObserver)initWithListener:(const CLAccessoryObserverListener *)a3 silo:(id)a4 timeSync:(BOOL)a5;
- (EAAccessory)activeAccessory;
- (double)getCourseUncertaintyForCarPlayDRModeAtLowSpeedsInDeg;
- (double)getMaxGPSUncertaintyForAggressiveBlockingAccessory;
- (double)getSpeedThresholdForCarPlayDRModeCourseUncSettingInMPS;
- (id).cxx_construct;
- (int)getLocationDiffThresholdForAggressiveScreening;
- (int)getMinContinuousFailureCountForBlockingAccessory;
- (int)getMinContinuousSuccessCountForUnblockingAccessory;
- (void)accessoryConnected:(id)a3;
- (void)accessoryDidDisconnect:(id)a3;
- (void)accessoryDisconnected:(id)a3;
- (void)dealloc;
- (void)ephemerisURLRequested:(id)a3;
- (void)locationPointDataRequested:(id)a3;
- (void)nmeaReceived:(id)a3;
- (void)onStarkTimeSyncNotification:(id)a3;
- (void)readMobileAssetConfiguration:(CLNameValuePair)a3;
- (void)sendGPRMCDataStatusValues:(BOOL)a3;
- (void)setIAPTimeSyncEnable:(BOOL)a3;
- (void)timeRequested:(id)a3;
@end

@implementation CLAccessoryObserver

- (EAAccessory)activeAccessory
{
  return self->fAccessory;
}

- (CLAccessoryObserver)initWithListener:(const CLAccessoryObserverListener *)a3 silo:(id)a4 timeSync:(BOOL)a5
{
  v21.receiver = self;
  v21.super_class = (Class)CLAccessoryObserver;
  v8 = [(CLAccessoryObserver *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->fAccessory = 0;
    long long v10 = *(_OWORD *)&a3->info;
    long long v11 = *(_OWORD *)&a3->onReferenceTime;
    onEphemerisURL = a3->onEphemerisURL;
    *(_OWORD *)&v8->fListener.onDisconnected = *(_OWORD *)&a3->onDisconnected;
    *(_OWORD *)&v8->fListener.onReferenceTime = v11;
    *(_OWORD *)&v8->fListener.info = v10;
    v8->fListener.onEphemerisURL = onEphemerisURL;
    v8->fSilo = (CLSilo *)a4;
    v8->_iAPTimeSyncEnable = a5;
    [+[NSNotificationCenter defaultCenter] addObserver:v8 selector:"accessoryConnected:" name:EAAccessoryDidConnectNotification object:0];
    [+[NSNotificationCenter defaultCenter] addObserver:v9 selector:"accessoryDisconnected:" name:EAAccessoryDidDisconnectNotification object:0];
    v13 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v13 addObserver:v9 selector:"nmeaReceived:" name:EAAccessoryDidReceiveNMEASentenceNotification object:0];
    v14 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v14 addObserver:v9 selector:"timeRequested:" name:EAAccessoryDidRequestGPSTimeNotification object:0];
    v15 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v15 addObserver:v9 selector:"locationPointDataRequested:" name:EAAccessoryDidReceiveLocationPointDataNotification object:0];
    v16 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v16 addObserver:v9 selector:"ephemerisURLRequested:" name:EAAccessoryDidReceiveEphemerisURLNotification object:0];
    v17 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v17 addObserver:v9 selector:"ephemerisURLRequested:" name:EAAccessoryDidReceiveEphemerisRefreshInterval object:0];
    v18 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v18 addObserver:v9 selector:"ephemerisURLRequested:" name:EAAccessoryDidReceiveEphemerisExpirationInterval object:0];
    if ([(CLAccessoryObserver *)v9 iAPTimeSyncEnable])
    {
      v19 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v19 addObserver:v9 selector:"onStarkTimeSyncNotification:" name:EAAccessoryTimeSyncInfoUpdateNotification object:0];
    }
  }
  return v9;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CLAccessoryObserver;
  [(CLAccessoryObserver *)&v3 dealloc];
}

- (BOOL)startLocation
{
  if (qword_102419360 != -1) {
    dispatch_once(&qword_102419360, &stru_1022BED80);
  }
  objc_super v3 = qword_102419368;
  if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self->fAccessory != 0;
    *(_DWORD *)buf = 67240192;
    *(_DWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,starting accessory location,alreadyConnected,%{public}d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    BOOL v16 = self->fAccessory != 0;
    int v38 = 67240192;
    LODWORD(v39) = v16;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver startLocation]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  v5 = +[EAAccessoryManager sharedAccessoryManager];
  [(EAAccessoryManager *)v5 registerForLocalNotifications];
  [(EAAccessoryManager *)v5 setAreLocationAccessoriesEnabled:1];
  if (!self->fAccessory)
  {
    v6 = [(EAAccessoryManager *)v5 connectedAccessories];
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v7 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v8 = [(NSArray *)v6 count];
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "AccessoryObserver,examining %{public}lu connected accessories", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      int v38 = 134349056;
      NSUInteger v39 = [(NSArray *)v6 count];
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver startLocation]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v34;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if ([(CLAccessoryObserver *)self setupAccessory:v12 withListenerCall:0])
          {
            long long v48 = 0u;
            memset(v49, 0, sizeof(v49));
            *(_OWORD *)v46 = 0u;
            *(_OWORD *)v47 = 0u;
            *(_OWORD *)v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            *(_OWORD *)v43 = 0u;
            *(_OWORD *)buf = 0u;
            *(_OWORD *)v41 = 0u;
            __int16 v50 = 257;
            sub_1006225EC(v12, (uint64_t)buf);
            info = self->fListener.info;
            onConnected = (void (*)(void *, void **, void))self->fListener.onConnected;
            sub_100627DD8((char *)__dst, (long long *)buf);
            onConnected(info, __dst, 0);
            if (v32 < 0) {
              operator delete(__p);
            }
            if (v30 < 0) {
              operator delete(v29);
            }
            if (v28 < 0) {
              operator delete(v27);
            }
            if (v26 < 0) {
              operator delete(v25);
            }
            if (v24 < 0) {
              operator delete(v23);
            }
            if (v22 < 0) {
              operator delete(v21);
            }
            if (v20 < 0) {
              operator delete(__dst[0]);
            }
            if ((v49[23] & 0x80000000) != 0) {
              operator delete(*(void **)v49);
            }
            if (SHIBYTE(v48) < 0) {
              operator delete(v47[1]);
            }
            if (SHIBYTE(v47[0]) < 0) {
              operator delete(v46[0]);
            }
            if (SHIBYTE(v45) < 0) {
              operator delete(v44[1]);
            }
            if (SHIBYTE(v44[0]) < 0) {
              operator delete(v43[0]);
            }
            if (SHIBYTE(v42) < 0) {
              operator delete(v41[1]);
            }
            if (SHIBYTE(v41[0]) < 0) {
              operator delete(*(void **)buf);
            }
          }
        }
        id v9 = [(NSArray *)v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v9);
    }
  }
  return self->fAccessory != 0;
}

- (BOOL)stopLocation
{
  if (qword_102419360 != -1) {
    dispatch_once(&qword_102419360, &stru_1022BED80);
  }
  objc_super v3 = qword_102419368;
  if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,stopping accessory location", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver stopLocation]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  BOOL v4 = +[EAAccessoryManager sharedAccessoryManager];
  [(EAAccessoryManager *)v4 setAreLocationAccessoriesEnabled:0];
  [(EAAccessoryManager *)v4 unregisterForLocalNotifications];
  fAccessory = self->fAccessory;
  if (fAccessory)
  {

    self->fAccessory = 0;
  }
  return 1;
}

- (void)accessoryDidDisconnect:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10062332C;
  v4[3] = &unk_10229FEB0;
  v4[4] = a3;
  v4[5] = self;
  [(CLSilo *)fSilo async:v4];
}

- (BOOL)sendReferenceTime:(double)a3
{
  if (self->fAccessory)
  {
    int v11 = 0;
    v12[0] = 0;
    double v4 = sub_1004BD8CC((int *)v12, &v11, a3);
    LODWORD(v4) = v11;
    unsigned __int8 v5 = [(EAAccessory *)self->fAccessory sendGpsWeek:v12[0] gpsTOW:(double)*(unint64_t *)&v4 / 1000.0];
    if ((v5 & 1) == 0)
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v6 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendGpsWeek failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAccessoryObserver sendReferenceTime:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
    }
  }
  else
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    NSUInteger v8 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      LOWORD(v12[0]) = 0;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver sendReferenceTime:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return 0;
  }
  return v5;
}

- (BOOL)sendReferenceTime:(double)a3 locationLatitude:(double)a4 longitude:(double)a5 accuracy:(double)a6
{
  if (self->fAccessory)
  {
    int v17 = 0;
    v18[0] = 0;
    double v10 = sub_1004BD8CC((int *)v18, &v17, a3);
    LODWORD(v10) = v17;
    unsigned __int8 v11 = [(EAAccessory *)self->fAccessory sendEphemerisPointDataGpsWeek:v18[0] gpsTOW:(int)a6 latitude:(double)*(unint64_t *)&v10 / 1000.0 longitude:a4 accuracy:a5];
    if ((v11 & 1) == 0)
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v12 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendEphemerisPointDataGpsWeek failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAccessoryObserver sendReferenceTime:locationLatitude:longitude:accuracy:]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
    }
  }
  else
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v14 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      LOWORD(v18[0]) = 0;
      BOOL v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver sendReferenceTime:locationLatitude:longitude:accuracy:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    return 0;
  }
  return v11;
}

- (BOOL)sendEphemeris:(id)a3
{
  fAccessory = self->fAccessory;
  if (!fAccessory)
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    unsigned __int8 v5 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "AccessoryObserver,no location accessory available", buf, 2u);
    }
    BOOL v4 = sub_10013D1A0(115, 2);
    if (!v4) {
      return v4;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v6 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver sendEphemeris:]", "%s\n");
LABEL_21:
    if (v6 != buf) {
      free(v6);
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  if ([(EAAccessory *)fAccessory sendEphemeris:a3])
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if (qword_102419360 != -1) {
    dispatch_once(&qword_102419360, &stru_1022BED80);
  }
  v7 = qword_102419368;
  if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "AccessoryObserver,sendEphemeris failed", buf, 2u);
  }
  BOOL v8 = sub_10013D1A0(115, 0);
  LOBYTE(v4) = 0;
  if (v8)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v6 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAccessoryObserver sendEphemeris:]", "%s\n");
    goto LABEL_21;
  }
  return v4;
}

- (BOOL)isOnDenyList:(id)a3
{
  BOOL v4 = [CLAccessoryObserverHelper isDenyListAccessory:[a3 manufacturer] name:[a3 name] model:[a3 modelNumber] serialNumber:[a3 serialNumber] firmware:[a3 firmwareRevision] hardwareRevision:[a3 hardwareRevision]];
  if (v4)
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    unsigned __int8 v5 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136381955;
      id v9 = [[objc_msgSend(a3, "manufacturer") UTF8String];
      __int16 v10 = 2081;
      id v11 = [[objc_msgSend(a3, "modelNumber") UTF8String];
      __int16 v12 = 2081;
      id v13 = [[[a3 firmwareRevision] UTF8String];
      __int16 v14 = 2081;
      id v15 = [[objc_msgSend(a3, "serialNumber") UTF8String];
      __int16 v16 = 2081;
      id v17 = [[objc_msgSend(a3, "name") UTF8String];
      __int16 v18 = 2081;
      id v19 = [[objc_msgSend(a3, "hardwareRevision") UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,AccessoryInDenyList,manufacturer,%{private}s,model,%{private}s,firmware,%{private}s,serialNumber,%{private}s,name,%{private}s,hardwareRevision,%{private}s", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      [objc_msgSend(a3, "manufacturer") UTF8String];
      [objc_msgSend(a3, "modelNumber") UTF8String];
      [objc_msgSend(a3, "firmwareRevision") UTF8String];
      [objc_msgSend(a3, "serialNumber") UTF8String];
      [objc_msgSend(a3, "name") UTF8String];
      [objc_msgSend(a3, "hardwareRevision") UTF8String];
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver isOnDenyList:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  return v4;
}

- (void)readMobileAssetConfiguration:(CLNameValuePair)a3
{
}

- (BOOL)getEnableCourseScreening
{
  return self->fAccessoryMobileAssetConfig.fEnableCourseScreening;
}

- (BOOL)getEnableAggressiveLocationScreening
{
  return self->fAccessoryMobileAssetConfig.fEnableAggressiveNMEAScreening;
}

- (int)getLocationDiffThresholdForAggressiveScreening
{
  return self->fAccessoryMobileAssetConfig.fLocationDiffThresholdForAggressiveScreening;
}

- (int)getMinContinuousFailureCountForBlockingAccessory
{
  return self->fAccessoryMobileAssetConfig.fMinContinuousFailureCountForBlockingAccessory;
}

- (int)getMinContinuousSuccessCountForUnblockingAccessory
{
  return self->fAccessoryMobileAssetConfig.fMinContinuousSuccessCountForUnblockingAccessory;
}

- (double)getMaxGPSUncertaintyForAggressiveBlockingAccessory
{
  return self->fAccessoryMobileAssetConfig.fMaxGPSUncertaintyForAggressiveBlockingAccessory;
}

- (BOOL)getAllowGPGGAOnlyAccessory
{
  return self->fAccessoryMobileAssetConfig.fAllowGPGGAOnlyAccessory;
}

- (double)getCourseUncertaintyForCarPlayDRModeAtLowSpeedsInDeg
{
  return self->fAccessoryMobileAssetConfig.fCourseUncertaintyForCarPlayDRModeAtLowSpeedsInDeg;
}

- (double)getSpeedThresholdForCarPlayDRModeCourseUncSettingInMPS
{
  return self->fAccessoryMobileAssetConfig.fSpeedThresholdForCarPlayDRModeCourseUncSettingInMPS;
}

- (BOOL)setupAccessory:(id)a3 withListenerCall:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[EAAccessory isEqual:](self->fAccessory, "isEqual:"))
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    v7 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000FECE0((const __CFString *)[a3 name], (uint64_t)__p);
      BOOL v8 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,already connected to accessory %s (%p)", buf, 0x16u);
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      sub_1000FECE0((const __CFString *)[a3 name], (uint64_t)buf);
      if ((buf[23] & 0x80u) == 0) {
        char v30 = buf;
      }
      else {
        char v30 = *(uint8_t **)buf;
      }
      *(_DWORD *)v80 = 136315394;
      *(void *)&v80[4] = v30;
      __int16 v81 = 2048;
      id v82 = a3;
      v31 = (char *)_os_log_send_and_compose_impl();
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v31);
      if (v31 != (char *)__p) {
        free(v31);
      }
    }
    return 0;
  }
  long long v92 = 0u;
  memset(v93, 0, sizeof(v93));
  *(_OWORD *)v90 = 0u;
  *(_OWORD *)v91 = 0u;
  *(_OWORD *)v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  *(_OWORD *)v87 = 0u;
  memset(buf, 0, sizeof(buf));
  __int16 v94 = 257;
  sub_1006225EC(a3, (uint64_t)buf);
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022BEDA0);
  }
  __int16 v10 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = *(uint8_t **)buf;
    if ((buf[23] & 0x80u) == 0) {
      id v11 = buf;
    }
    __int16 v12 = v87;
    if (SHIBYTE(v88[0]) < 0) {
      __int16 v12 = (void **)v87[0];
    }
    LODWORD(__p[0]) = 136315394;
    *(void **)((char *)__p + 4) = v11;
    WORD2(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 6) = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "@ClxAccessory, state, 1, model, %s, %s", (uint8_t *)__p, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BEDA0);
    }
    char v32 = *(uint8_t **)buf;
    if ((buf[23] & 0x80u) == 0) {
      char v32 = buf;
    }
    long long v33 = v87;
    if (SHIBYTE(v88[0]) < 0) {
      long long v33 = (void **)v87[0];
    }
    *(_DWORD *)v80 = 136315394;
    *(void *)&v80[4] = v32;
    __int16 v81 = 2080;
    id v82 = v33;
    long long v34 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v34);
    if (v34 != (char *)__p) {
      free(v34);
    }
  }
  sub_100134750(v76, "AccessoryObserver,setting up accessory");
  sub_100625C10((uint64_t *)buf, (uint64_t *)v76);
  if (v77 < 0) {
    operator delete(v76[0]);
  }
  if (![(CLAccessoryObserver *)self isOnDenyList:a3]
    && !sub_100DF11E4((uint64_t **)&self->fAccessoryMobileAssetConfig, buf))
  {
    if (([a3 supportsLocation] & 1) == 0)
    {
      LOBYTE(v94) = 0;
      info = self->fListener.info;
      onConnected = (void (*)(void *, void **, uint64_t))self->fListener.onConnected;
      sub_100627DD8((char *)v48, (long long *)buf);
      onConnected(info, v48, 1);
      if (v61 < 0) {
        operator delete(v60);
      }
      if (v59 < 0) {
        operator delete(v58);
      }
      if (v57 < 0) {
        operator delete(v56);
      }
      if (v55 < 0) {
        operator delete(v54);
      }
      if (v53 < 0) {
        operator delete(v52);
      }
      if (v51 < 0) {
        operator delete(v50);
      }
      if (v49 < 0) {
        operator delete(v48[0]);
      }
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      char v28 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,detected new non-location accessory", (uint8_t *)__p, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_44;
      }
      bzero(__p, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      *(_WORD *)v80 = 0;
      v29 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v29);
      goto LABEL_138;
    }
    if (!self->fAccessory)
    {
LABEL_84:
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      v23 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(__p[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,connected to new location accessory", (uint8_t *)__p, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(__p, 0x65CuLL);
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        *(_WORD *)v80 = 0;
        long long v35 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v35);
        if (v35 != (char *)__p) {
          free(v35);
        }
      }
      self->fAccessory = (EAAccessory *)a3;
      id v24 = a3;
      [(EAAccessory *)self->fAccessory setDelegate:self];
      [(EAAccessory *)self->fAccessory setNMEASentencesToFilter:+[NSArray arrayWithObjects:@"GPGGA", @"GPRMC", @"GPGSV", @"PASCD", @"PAGCD", @"PAACD", @"GPHDT", 0]];
      [(CLAccessoryObserver *)self setupEphemeris];
      if ([(CLAccessoryObserver *)self iAPTimeSyncEnable])
      {
        v78[0] = EATimeSyncOffsetUncertaintyThreshold;
        v78[1] = EATimeSyncOffsetMeasurementInterval;
        v79[0] = &off_102392918;
        v79[1] = &off_102392930;
        [(EAAccessory *)self->fAccessory setIAPTimeSyncParams:+[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2]];
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        v25 = qword_102419368;
        if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(__p[0]) = 134349312;
          *(void **)((char *)__p + 4) = (void *)100;
          WORD2(__p[1]) = 1026;
          *(_DWORD *)((char *)&__p[1] + 6) = 10000;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "AccessoryObserver,STARK:setIAPTimeSyncParams,uncThresholdMs,%{public}llu,intervalMs,%{public}u", (uint8_t *)__p, 0x12u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(__p, 0x65CuLL);
          if (qword_102419360 != -1) {
            dispatch_once(&qword_102419360, &stru_1022BED80);
          }
          *(_DWORD *)v80 = 134349312;
          *(void *)&v80[4] = 100;
          __int16 v81 = 1026;
          LODWORD(v82) = 10000;
          v40 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v40);
          if (v40 != (char *)__p) {
            free(v40);
          }
        }
      }
      BOOL v9 = 1;
      goto LABEL_45;
    }
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    id v17 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
    {
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory manufacturer], (uint64_t)v80);
      if (v83 >= 0) {
        __int16 v18 = v80;
      }
      else {
        __int16 v18 = *(unsigned char **)v80;
      }
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory modelNumber], (uint64_t)v46);
      if (v47 >= 0) {
        id v19 = v46;
      }
      else {
        id v19 = (void **)v46[0];
      }
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory name], (uint64_t)v44);
      if (v45 >= 0) {
        char v20 = v44;
      }
      else {
        char v20 = (void **)v44[0];
      }
      LODWORD(__p[0]) = 136381187;
      *(void **)((char *)__p + 4) = v18;
      WORD2(__p[1]) = 2081;
      *(void **)((char *)&__p[1] + 6) = v19;
      HIWORD(__p[2]) = 2081;
      __p[3] = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,discarding old location accessory and handling new,oldManufacturer,%{private}s,oldModel,%{private}s,oldName,%{private}s", (uint8_t *)__p, 0x20u);
      if (v45 < 0) {
        operator delete(v44[0]);
      }
      if (v47 < 0) {
        operator delete(v46[0]);
      }
      if (SHIBYTE(v83) < 0) {
        operator delete(*(void **)v80);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory manufacturer], (uint64_t)v46);
      if (v47 >= 0) {
        long long v36 = v46;
      }
      else {
        long long v36 = (void **)v46[0];
      }
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory modelNumber], (uint64_t)v44);
      if (v45 >= 0) {
        v37 = v44;
      }
      else {
        v37 = (void **)v44[0];
      }
      sub_1000FECE0((const __CFString *)[(EAAccessory *)self->fAccessory name], (uint64_t)v42);
      if (v43 >= 0) {
        int v38 = v42;
      }
      else {
        int v38 = (void **)v42[0];
      }
      *(_DWORD *)v80 = 136381187;
      *(void *)&v80[4] = v36;
      __int16 v81 = 2081;
      id v82 = v37;
      __int16 v83 = 2081;
      v84 = v38;
      NSUInteger v39 = (char *)_os_log_send_and_compose_impl();
      if (v43 < 0) {
        operator delete(v42[0]);
      }
      if (v45 < 0) {
        operator delete(v44[0]);
      }
      if (v47 < 0) {
        operator delete(v46[0]);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v39);
      if (v39 != (char *)__p) {
        free(v39);
      }
      if (!v4) {
        goto LABEL_83;
      }
    }
    else if (!v4)
    {
LABEL_83:

      self->fAccessory = 0;
      goto LABEL_84;
    }
    memset(v103, 0, sizeof(v103));
    long long v102 = 0u;
    long long v101 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v96 = 0u;
    memset(__p, 0, sizeof(__p));
    __int16 v104 = 257;
    sub_1006225EC(self->fAccessory, (uint64_t)__p);
    onDisconnected = (void (*)(void *, char *))self->fListener.onDisconnected;
    char v22 = self->fListener.info;
    sub_100627DD8(v41, (long long *)__p);
    onDisconnected(v22, v41);
    sub_100628000((uint64_t)v41);
    sub_100628000((uint64_t)__p);
    goto LABEL_83;
  }
  v93[24] = 1;
  id v13 = self->fListener.info;
  __int16 v14 = (void (*)(void *, void **, uint64_t))self->fListener.onConnected;
  sub_100627DD8((char *)__dst, (long long *)buf);
  v14(v13, __dst, 1);
  if (v75 < 0) {
    operator delete(v74);
  }
  if (v73 < 0) {
    operator delete(v72);
  }
  if (v71 < 0) {
    operator delete(v70);
  }
  if (v69 < 0) {
    operator delete(v68);
  }
  if (v67 < 0) {
    operator delete(v66);
  }
  if (v65 < 0) {
    operator delete(v64);
  }
  if (v63 < 0) {
    operator delete(__dst[0]);
  }
  if (qword_102419360 != -1) {
    dispatch_once(&qword_102419360, &stru_1022BED80);
  }
  id v15 = qword_102419368;
  if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "AccessoryObserver,accessory is on deny list", (uint8_t *)__p, 2u);
  }
  if (!sub_10013D1A0(115, 2)) {
    goto LABEL_44;
  }
  bzero(__p, 0x65CuLL);
  if (qword_102419360 != -1) {
    dispatch_once(&qword_102419360, &stru_1022BED80);
  }
  *(_WORD *)v80 = 0;
  v29 = (char *)_os_log_send_and_compose_impl();
  sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupAccessory:withListenerCall:]", "%s\n", v29);
LABEL_138:
  if (v29 != (char *)__p) {
    free(v29);
  }
LABEL_44:
  BOOL v9 = 0;
LABEL_45:
  if ((v93[23] & 0x80000000) != 0) {
    operator delete(*(void **)v93);
  }
  if (SHIBYTE(v92) < 0) {
    operator delete(v91[1]);
  }
  if (SHIBYTE(v91[0]) < 0) {
    operator delete(v90[0]);
  }
  if (SHIBYTE(v89) < 0) {
    operator delete(v88[1]);
  }
  if (SHIBYTE(v88[0]) < 0) {
    operator delete(v87[0]);
  }
  if (SHIBYTE(v86) < 0) {
    operator delete(*(void **)&buf[24]);
  }
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  return v9;
}

- (BOOL)setupEphemeris
{
  fAccessory = self->fAccessory;
  if (fAccessory)
  {
    *(void *)buf = 0;
    unsigned int v4 = [(EAAccessory *)fAccessory getEphemerisURL:buf];
    uint64_t v5 = *(void *)buf;
    if (v4) {
      BOOL v6 = *(void *)buf == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      v14[0] = 0;
      v7 = self->fAccessory;
      if (!v7
        || ([(EAAccessory *)v7 getEphemerisRecommendRefreshInterval:v14] & 1) == 0)
      {
        v14[0] = 0x7FEFFFFFFFFFFFFFLL;
      }
      uint64_t v13 = 0;
      BOOL v8 = self->fAccessory;
      if (!v8
        || ([(EAAccessory *)v8 getEphemerisExpirationInterval:&v13] & 1) == 0)
      {
        uint64_t v13 = 0x7FEFFFFFFFFFFFFFLL;
      }
      ((void (*)(void *, void, void *, uint64_t *))self->fListener.onEphemerisURL)(self->fListener.info, *(void *)buf, v14, &v13);
      uint64_t v5 = *(void *)buf;
    }
    LOBYTE(v9) = v5 != 0;
  }
  else
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    __int16 v10 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "no location accessory available", buf, 2u);
    }
    BOOL v9 = sub_10013D1A0(115, 2);
    if (v9)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      LOWORD(v14[0]) = 0;
      id v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver setupEphemeris]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (void)sendGPRMCDataStatusValues:(BOOL)a3
{
  fAccessory = self->fAccessory;
  if (fAccessory)
  {
    if (([(EAAccessory *)fAccessory sendGPRMCDataStatusValueA:1 ValueV:1 ValueX:a3] & 1) == 0)
    {
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      unsigned int v4 = qword_102419368;
      if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "sendGPRMCDataStatus failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419360 != -1) {
          dispatch_once(&qword_102419360, &stru_1022BED80);
        }
        uint64_t v5 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAccessoryObserver sendGPRMCDataStatusValues:]", "%s\n");
LABEL_20:
        if (v5 != buf) {
          free(v5);
        }
      }
    }
  }
  else
  {
    if (qword_102419360 != -1) {
      dispatch_once(&qword_102419360, &stru_1022BED80);
    }
    BOOL v6 = qword_102419368;
    if (os_log_type_enabled((os_log_t)qword_102419368, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "no location accessory available", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419360 != -1) {
        dispatch_once(&qword_102419360, &stru_1022BED80);
      }
      uint64_t v5 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAccessoryObserver sendGPRMCDataStatusValues:]", "%s\n");
      goto LABEL_20;
    }
  }
}

- (void)accessoryConnected:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006264D8;
  v4[3] = &unk_10229FEB0;
  v4[4] = a3;
  v4[5] = self;
  [(CLSilo *)fSilo async:v4];
}

- (void)accessoryDisconnected:(id)a3
{
}

- (void)nmeaReceived:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006268A8;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [(CLSilo *)fSilo async:v4];
}

- (void)timeRequested:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100626C54;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [(CLSilo *)fSilo async:v4];
}

- (void)locationPointDataRequested:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100626CD8;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [(CLSilo *)fSilo async:v4];
}

- (void)ephemerisURLRequested:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100626D5C;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [(CLSilo *)fSilo async:v4];
}

- (void)onStarkTimeSyncNotification:(id)a3
{
  fSilo = self->fSilo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100626F64;
  v4[3] = &unk_10229FEB0;
  v4[4] = a3;
  void v4[5] = self;
  [(CLSilo *)fSilo async:v4];
}

- (BOOL)iAPTimeSyncEnable
{
  return self->_iAPTimeSyncEnable;
}

- (void)setIAPTimeSyncEnable:(BOOL)a3
{
  self->_iAPTimeSyncEnable = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((unsigned char *)self + 104) = 1;
  *(void *)((char *)self + 108) = 0xA00000041;
  *((_DWORD *)self + 29) = 180;
  *((void *)self + 15) = 0x403E000000000000;
  *((_WORD *)self + 64) = 1;
  *(_OWORD *)((char *)self + 136) = xmmword_101D24D90;
  return self;
}

@end