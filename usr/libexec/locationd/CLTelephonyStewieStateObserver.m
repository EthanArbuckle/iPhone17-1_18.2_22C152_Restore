@interface CLTelephonyStewieStateObserver
- (CLTelephonyStewieStateObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyStewieStateObserverHelper *)a4;
- (CLTelephonyStewieStateObserverHelper)fHelper;
- (CTStewieStateMonitor)fStewieStateObserver;
- (void)shutdown;
- (void)stateChanged:(id)a3;
@end

@implementation CLTelephonyStewieStateObserver

- (CLTelephonyStewieStateObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyStewieStateObserverHelper *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CLTelephonyStewieStateObserver;
  v6 = [(CLTelephonyStewieStateObserver *)&v12 init];
  if (!v6) {
    return v6;
  }
  v7 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v6 queue:a3];
  v6->_fStewieStateObserver = v7;
  if (v7)
  {
    v6->_fHelper = a4;
    [(CTStewieStateMonitor *)v7 start];
    if (_os_feature_enabled_impl())
    {
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BB348);
      }
      v8 = qword_102419608;
      if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,started", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419600 == -1)
        {
LABEL_19:
          v11 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTelephonyStewieStateObserver initWithQueue:helperObj:]", "%s\n", v11);
          if (v11 != (char *)buf) {
            free(v11);
          }
          return v6;
        }
LABEL_21:
        dispatch_once(&qword_102419600, &stru_1022BB348);
        goto LABEL_19;
      }
    }
  }
  else if (_os_feature_enabled_impl())
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022BB348);
    }
    v9 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,alloc failed", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 == -1) {
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
  return v6;
}

- (void)stateChanged:(id)a3
{
  if (a3)
  {
    unsigned int v5 = [a3 isStewieActive];
    char v18 = v5;
    unsigned int v6 = [a3 status];
    unsigned int v7 = [a3 reason];
    unsigned int v8 = [a3 allowedServices];
    unsigned int v9 = [a3 transportType];
    if (self->_fHelper)
    {
      unsigned int v10 = v9;
      if (_os_feature_enabled_impl())
      {
        if (qword_102419600 != -1) {
          dispatch_once(&qword_102419600, &stru_1022BB348);
        }
        v11 = qword_102419608;
        if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67241216;
          *(_DWORD *)&buf[4] = v6;
          __int16 v29 = 1026;
          unsigned int v30 = v7;
          __int16 v31 = 1026;
          unsigned int v32 = v8;
          __int16 v33 = 1026;
          unsigned int v34 = v10;
          __int16 v35 = 1026;
          unsigned int v36 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#CLT,CTStewieStateMonitor,status,%{public}d,reason,%{public}d,service,%{public}d,transport,%{public}d,usecaseactive,%{public}d", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419600 != -1) {
            dispatch_once(&qword_102419600, &stru_1022BB348);
          }
          LODWORD(values) = 67241216;
          HIDWORD(values) = v6;
          __int16 v20 = 1026;
          unsigned int v21 = v7;
          __int16 v22 = 1026;
          unsigned int v23 = v8;
          __int16 v24 = 1026;
          unsigned int v25 = v10;
          __int16 v26 = 1026;
          unsigned int v27 = v5;
          v16 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTelephonyStewieStateObserver stateChanged:]", "%s\n", v16);
          if (v16 != (char *)buf) {
            free(v16);
          }
        }
      }
      objc_super v12 = (void *)sub_100007264(&v18);
      *(void *)buf = @"kStewieUseCaseActiveKey";
      values = v12;
      CFDictionaryRef v13 = CFDictionaryCreate(0, (const void **)buf, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryRef v14 = v13;
      if (qword_102489FB0) {
        (*(void (**)(uint64_t, const __CFString *, CFDictionaryRef))(*(void *)qword_102489FB0 + 256))(qword_102489FB0, @"kStewieStatus", v13);
      }
      if (v12) {
        CFRelease(v12);
      }
    }
  }
  else if (_os_feature_enabled_impl())
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022BB348);
    }
    v15 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "unexpected CTStewieState null pointer in delegate callback", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BB348);
      }
      LOWORD(values) = 0;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTelephonyStewieStateObserver stateChanged:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
  }
}

- (void)shutdown
{
  p_fStewieStateObserver = &self->_fStewieStateObserver;
  fStewieStateObserver = self->_fStewieStateObserver;
  if (fStewieStateObserver)
  {

    *p_fStewieStateObserver = 0;
    p_fStewieStateObserver[1] = 0;
  }
}

- (CTStewieStateMonitor)fStewieStateObserver
{
  return self->_fStewieStateObserver;
}

- (CLTelephonyStewieStateObserverHelper)fHelper
{
  return self->_fHelper;
}

@end