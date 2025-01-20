@interface CLHomeNearbyRangeBridge
- (BOOL)reactivationInProgress;
- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withUniverse:(id)a4;
- (CLTimer)customRangeRateTimer;
- (NISession)session;
- (OS_dispatch_queue)rangingCallbackQueue;
- (double)reactivationDelayInSeconds;
- (void)createRangeSession;
- (void)dealloc;
- (void)invalidateRangingSession;
- (void)reactivate;
- (void)resetRangingRate;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5;
- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4;
- (void)sessionDidStartRunning:(id)a3;
- (void)sessionSuspensionEnded:(id)a3;
- (void)sessionWasSuspended:(id)a3;
- (void)setCustomRangeRateTimer:(id)a3;
- (void)setRangingCallbackQueue:(id)a3;
- (void)setRangingRateWithConfiguration:(id)a3;
- (void)setReactivationDelayInSeconds:(double)a3;
- (void)setReactivationInProgress:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)startRanging;
- (void)stopRanging;
@end

@implementation CLHomeNearbyRangeBridge

- (CLHomeNearbyRangeBridge)initWithDelegate:(CLMicroLocationUwbBridgeWrapper *)a3 withUniverse:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CLHomeNearbyRangeBridge;
  v6 = [(CLHomeNearbyRangeBridge *)&v11 init];
  if (v6)
  {
    if (+[NISession isSupported])
    {
      if (a3)
      {
        v6->_cppWrapper = a3;
        id v7 = [a4 silo];
        v6->_rangingCallbackQueue = (OS_dispatch_queue *)[v7 queue];
        v6->_customRangeRateTimer = (CLTimer *)[v7 newTimer];
        v6->_reactivationInProgress = 0;
        v6->_reactivationDelayInSeconds = 3.0;
        return v6;
      }
    }
    else
    {
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      v8 = qword_102419458;
      if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "ranging is not supported on this platform", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419450 != -1) {
          dispatch_once(&qword_102419450, &stru_1022D6230);
        }
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge initWithDelegate:withUniverse:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];

  self->_customRangeRateTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLHomeNearbyRangeBridge;
  [(CLHomeNearbyRangeBridge *)&v3 dealloc];
}

- (void)startRanging
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  objc_super v3 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: startRanging: starting a ranging session", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge startRanging]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];
  [(CLHomeNearbyRangeBridge *)self createRangeSession];
  [(NISession *)self->_session runWithConfiguration:objc_alloc_init((Class)NIHomeDeviceConfiguration)];
}

- (void)setRangingRateWithConfiguration:(id)a3
{
  if (self->_session)
  {
    id v5 = objc_alloc_init((Class)NIHomeDeviceConfiguration);
    [v5 setMinimumPreferredUpdatedRate:[a3 updateRate]];
    [(NISession *)self->_session runWithConfiguration:v5];
    double Current_5 = j__CFAbsoluteTimeGetCurrent_5();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100988CFC;
    v14[3] = &unk_10229FED8;
    v14[4] = self;
    [(CLTimer *)self->_customRangeRateTimer setHandler:v14];
    [a3 rateDurationInSeconds];
    double v8 = Current_5 + v7;
    [(CLTimer *)self->_customRangeRateTimer setNextFireTime:Current_5 + v7];
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    v9 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [a3 updateRate];
      [a3 rateDurationInSeconds];
      *(_DWORD *)buf = 68290050;
      __int16 v17 = 2082;
      int v16 = 0;
      v18 = "";
      __int16 v19 = 1026;
      unsigned int v20 = v10;
      __int16 v21 = 2050;
      double v22 = Current_5;
      __int16 v23 = 2050;
      uint64_t v24 = v11;
      __int16 v25 = 2050;
      double v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMicroLocationHomeNearbyRangeBridge: set high ranging rate\", \"rate\":%{public}d, \"now\":\"%{public}.3f\", \"duration\":\"%{public}f\", \"expected end time\":\"%{public}.3f\"}", buf, 0x36u);
    }
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    v12 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set high ranging rate without an active ranging session!", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHomeNearbyRangeBridge setRangingRateWithConfiguration:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)resetRangingRate
{
  if (self->_session)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    objc_super v3 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: set default ranging rate", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge resetRangingRate]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
    id v4 = objc_alloc_init((Class)NIHomeDeviceConfiguration);
    [v4 setMinimumPreferredUpdatedRate:3];
    [(NISession *)self->_session runWithConfiguration:v4];
    [(CLTimer *)self->_customRangeRateTimer invalidate];
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    id v5 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "CLMicroLocationHomeNearbyRangeBridge: tried to set default ranging rate without an active ranging session!", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      double v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHomeNearbyRangeBridge resetRangingRate]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)stopRanging
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  objc_super v3 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: stopRanging: stopping a ranging session", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge stopRanging]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLTimer *)self->_customRangeRateTimer invalidate];
  sub_100223E3C((uint64_t)self->_cppWrapper);
  [(NISession *)self->_session pause];
}

- (void)createRangeSession
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  objc_super v3 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: createRangeSession: creating a ranging session", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge createRangeSession]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  self->_session = (NISession *)+[NISession observerSession];
  sub_100223E14((uint64_t)self->_cppWrapper);
  [(NISession *)self->_session setDelegate:self];
  [(NISession *)self->_session setDelegateQueue:self->_rangingCallbackQueue];
}

- (void)reactivate
{
  if (!self->_reactivationInProgress)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    objc_super v3 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      double reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134217984;
      double v14 = reactivationDelayInSeconds;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: reactivate: start ranging session in %.3fsec", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      double v8 = self->_reactivationDelayInSeconds;
      int v11 = 134217984;
      double v12 = v8;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge reactivate]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    self->_reactivationInProgress = 1;
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(self->_reactivationDelayInSeconds * 1000000000.0));
    rangingCallbackQueue = self->_rangingCallbackQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10098975C;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_after(v5, rangingCallbackQueue, block);
    sub_100223E64((uint64_t)self->_cppWrapper);
    double v7 = self->_reactivationDelayInSeconds + self->_reactivationDelayInSeconds;
    if (v7 > 120.0) {
      double v7 = 120.0;
    }
    self->_double reactivationDelayInSeconds = v7;
  }
}

- (void)invalidateRangingSession
{
  if (self->_session)
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    objc_super v3 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLMicroLocationHomeNearbyRangeBridge: invalidateRangingSession: invalidating a ranging session", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      id v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge invalidateRangingSession]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    [(NISession *)self->_session invalidate];

    self->_session = 0;
  }
}

- (void)session:(id)a3 didRemoveNearbyObjects:(id)a4 withReason:(int64_t)a5
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v7)
  {
    double v8 = "unknown";
    uint64_t v9 = *(void *)v26;
    if (a5 == 1) {
      double v8 = "PeerEnded";
    }
    if (!a5) {
      double v8 = "Timeout";
    }
    __s = (char *)v8;
    unsigned int v10 = &qword_102419000;
    do
    {
      int v11 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(a4);
        }
        double v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v11);
        if (v10[138] != -1) {
          dispatch_once(&qword_102419450, &stru_1022D6230);
        }
        v13 = qword_102419458;
        if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
        {
          sub_100134750(__p, __s);
          double v14 = v10;
          if (v32 >= 0) {
            v15 = __p;
          }
          else {
            v15 = *(unsigned char **)__p;
          }
          id v16 = [[[v12 discoveryToken] description] UTF8String];
          *(_DWORD *)buf = 134349570;
          id v35 = a3;
          __int16 v36 = 2082;
          v37 = v15;
          __int16 v38 = 2082;
          id v39 = v16;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "NI, Session %{public}p did remove nearby object with reason: '%{public}s'. %{public}s", buf, 0x20u);
          if (SHIBYTE(v32) < 0) {
            operator delete(*(void **)__p);
          }
          unsigned int v10 = v14;
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v10[138] != -1) {
            dispatch_once(&qword_102419450, &stru_1022D6230);
          }
          sub_100134750(v23, __s);
          if (v24 >= 0) {
            __int16 v17 = v23;
          }
          else {
            __int16 v17 = (void **)v23[0];
          }
          id v18 = [[[v12 discoveryToken] description] UTF8String];
          *(_DWORD *)__p = 134349570;
          *(void *)&__p[4] = a3;
          __int16 v30 = 2082;
          v31 = v17;
          __int16 v32 = 2082;
          id v33 = v18;
          __int16 v19 = (char *)_os_log_send_and_compose_impl();
          if (v24 < 0) {
            operator delete(v23[0]);
          }
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didRemoveNearbyObjects:withReason:]", "%s\n", v19);
          unsigned int v10 = &qword_102419000;
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        int v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v20 = [a4 countByEnumeratingWithState:&v25 objects:v40 count:16];
      id v7 = v20;
    }
    while (v20);
  }
}

- (void)session:(id)a3 didUpdateNearbyObjects:(id)a4
{
  v37 = 0;
  __int16 v38 = 0;
  uint64_t v39 = 0;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = [a4 countByEnumeratingWithState:&v33 objects:v51 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v34;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(a4);
        }
        double v8 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v7);
        unsigned __int8 v9 = [v8 relationship];
        [v8 distance];
        if (v10 != NINearbyObjectDistanceNotAvailable && (v9 & 2) != 0)
        {
          if ([v8 deviceIdentifer])
          {
            long long v42 = 0u;
            long long v43 = 0u;
            long long v41 = 0u;
            memset(buf, 0, sizeof(buf));
            *(void *)buf = j__CFAbsoluteTimeGetCurrent_5();
            [v8 distance];
            *(_DWORD *)&buf[8] = v16;
            [v8 direction];
            *(_OWORD *)&buf[16] = v17;
            sub_100134750(__p, [objc_msgSend(objc_msgSend(v8, "deviceIdentifer"), "UTF8String") UTF8String]);
            long long v41 = *(_OWORD *)__p;
            *(void *)&long long v42 = v32;
            HIBYTE(v32) = 0;
            LOBYTE(__p[0]) = 0;
            BYTE8(v42) = 2;
            [v8 azimuth];
            HIDWORD(v42) = v18;
            [v8 elevation];
            LODWORD(v43) = v19;
            id v20 = [v8 distanceMeasurementQuality];
            if ((unint64_t)v20 >= 4) {
              char v21 = 0;
            }
            else {
              char v21 = (char)v20;
            }
            BYTE4(v43) = v21;
            sub_1009880F0((char *)buf, (uint64_t)v44);
            if (SHIBYTE(v32) < 0) {
              operator delete(__p[0]);
            }
            if (SBYTE7(v42) < 0) {
              operator delete((void *)v41);
            }
            if (qword_102419600 != -1) {
              dispatch_once(&qword_102419600, &stru_1022D6250);
            }
            double v22 = qword_102419608;
            if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
            {
              sub_100988180((float32x4_t *)v44);
              __int16 v23 = &v29;
              if (v30 < 0) {
                __int16 v23 = v29;
              }
              *(_DWORD *)buf = 68289283;
              *(_DWORD *)&uint8_t buf[4] = 0;
              *(_WORD *)&buf[8] = 2082;
              *(void *)&buf[10] = "";
              *(_WORD *)&buf[18] = 2081;
              *(void *)&buf[20] = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"NI, Session update: \", \"nearby object\":%{private, location:escape_only}s}", buf, 0x1Cu);
              if (v30 < 0) {
                operator delete(v29);
              }
            }
            sub_10098A1CC((uint64_t *)&v37, (uint64_t)v44);
            if (v50 < 0) {
              operator delete(v49);
            }
            goto LABEL_40;
          }
LABEL_33:
          if ([v8 deviceIdentifer])
          {
            if (qword_102419450 != -1) {
              dispatch_once(&qword_102419450, &stru_1022D6230);
            }
            uint64_t v24 = qword_102419458;
            if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
            {
              id v25 = [[objc_msgSend(v8, "deviceIdentifer") UTF8String];
              *(_DWORD *)v44 = 68289282;
              *(_DWORD *)&v44[4] = 0;
              __int16 v45 = 2082;
              v46 = "";
              __int16 v47 = 2082;
              id v48 = v25;
              v13 = v24;
              double v14 = "{\"msg%{public}.0s\":\"NI, known device's distance is not available\", \"deviceIdentifer\":%{public,"
                    " location:escape_only}s}";
              uint32_t v15 = 28;
              goto LABEL_38;
            }
          }
          else
          {
            sub_10031A59C(@"NI, known device but deviceIdentifier is nil");
          }
          goto LABEL_40;
        }
        if ((v9 & 2) != 0) {
          goto LABEL_33;
        }
        if (qword_102419450 != -1) {
          dispatch_once(&qword_102419450, &stru_1022D6230);
        }
        uint64_t v12 = qword_102419458;
        if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v44 = 68289026;
          *(_DWORD *)&v44[4] = 0;
          __int16 v45 = 2082;
          v46 = "";
          v13 = v12;
          double v14 = "{\"msg%{public}.0s\":\"NI, unknwon device, ignore\"}";
          uint32_t v15 = 18;
LABEL_38:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, v44, v15);
        }
LABEL_40:
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [a4 countByEnumeratingWithState:&v33 objects:v51 count:16];
    }
    while (v5);
  }
  cppWrapper = self->_cppWrapper;
  memset(v28, 0, sizeof(v28));
  sub_10098B2BC(v28, v37, v38, 0xCCCCCCCCCCCCCCCDLL * (v38 - v37));
  sub_100223EDC((uint64_t)cppWrapper, v28);
  *(void *)v44 = v28;
  sub_10098AFD4((void ***)v44);
  *(void *)v44 = &v37;
  sub_10098AFD4((void ***)v44);
}

- (void)sessionWasSuspended:(id)a3
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p was suspended.", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionWasSuspended:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  sub_100223E64((uint64_t)self->_cppWrapper);
}

- (void)sessionSuspensionEnded:(id)a3
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p suspension ended. Restarting...", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionSuspensionEnded:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  sub_100223E8C((uint64_t)self->_cppWrapper);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  if (a4)
  {
    sub_10031A59C((uint64_t)+[NSString stringWithFormat:@"%@ %@", @"Uwb range session invalidated error:", a4]);
  }
  else
  {
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    uint64_t v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [[[0 debugDescription] UTF8String];
      double reactivationDelayInSeconds = self->_reactivationDelayInSeconds;
      *(_DWORD *)buf = 134349570;
      id v11 = a3;
      __int16 v12 = 2080;
      id v13 = v7;
      __int16 v14 = 2048;
      double v15 = reactivationDelayInSeconds;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NI, Error: session %{public}p invalidated with error: %s next reactivation try in %fsec", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419450 != -1) {
        dispatch_once(&qword_102419450, &stru_1022D6230);
      }
      [objc_msgSend(0, "debugDescription") UTF8String];
      unsigned __int8 v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didInvalidateWithError:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  [(CLHomeNearbyRangeBridge *)self invalidateRangingSession];
  [(CLHomeNearbyRangeBridge *)self reactivate];
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v8 = [[objc_msgSend(a4, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NI, failed (non-fatal): %{public}s.", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    [objc_msgSend(a4, "description") UTF8String];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didFailWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    id v8 = [[[a4 description] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, discovered object: %{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    [objc_msgSend(a4, "description") UTF8String];
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge session:didDiscoverNearbyObject:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)sessionDidStartRunning:(id)a3
{
  if (qword_102419450 != -1) {
    dispatch_once(&qword_102419450, &stru_1022D6230);
  }
  id v5 = qword_102419458;
  if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NI, Session %{public}p Start Running", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022D6230);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHomeNearbyRangeBridge sessionDidStartRunning:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  self->_double reactivationDelayInSeconds = 3.0;
}

- (CLTimer)customRangeRateTimer
{
  return self->_customRangeRateTimer;
}

- (void)setCustomRangeRateTimer:(id)a3
{
}

- (NISession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (OS_dispatch_queue)rangingCallbackQueue
{
  return self->_rangingCallbackQueue;
}

- (void)setRangingCallbackQueue:(id)a3
{
  self->_rangingCallbackQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)reactivationInProgress
{
  return self->_reactivationInProgress;
}

- (void)setReactivationInProgress:(BOOL)a3
{
  self->_reactivationInProgress = a3;
}

- (double)reactivationDelayInSeconds
{
  return self->_reactivationDelayInSeconds;
}

- (void)setReactivationDelayInSeconds:(double)a3
{
  self->_double reactivationDelayInSeconds = a3;
}

@end