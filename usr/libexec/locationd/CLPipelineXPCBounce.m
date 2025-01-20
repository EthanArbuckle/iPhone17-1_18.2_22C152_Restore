@interface CLPipelineXPCBounce
- (CLIndoorMaintenance)daemonControl;
- (CLIndoorPositionProvider)indoord;
- (CLPipelineXPCBounce)init;
- (CLPipelineXPCBounce)initWithProvider:(void *)a3 onSilo:(id)a4;
- (CLSilo)silo;
- (CLTimer)debounceTimer;
- (CLTimer)routeHintWatchdogTimer;
- (NSBundle)indoorBundle;
- (void)dealloc;
- (void)indoorDidFailWithError:(id)a3;
- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4;
- (void)indoorGivesUpWithLocation:(id)a3;
- (void)indoorIsUncertainWithLocation:(id)a3;
- (void)invalidate;
- (void)provider;
- (void)setDaemonControl:(id)a3;
- (void)setDebounceTimer:(id)a3;
- (void)setIndoorBundle:(id)a3;
- (void)setIndoord:(id)a3;
- (void)setRouteHintWatchdogTimer:(id)a3;
@end

@implementation CLPipelineXPCBounce

- (CLIndoorPositionProvider)indoord
{
  return self->_indoord;
}

- (CLPipelineXPCBounce)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLPipelineXPCBounce;
  [(CLPipelineXPCBounce *)&v4 doesNotRecognizeSelector:a2];

  return 0;
}

- (CLPipelineXPCBounce)initWithProvider:(void *)a3 onSilo:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLPipelineXPCBounce;
  v6 = [(CLPipelineXPCBounce *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_provider = a3;
    v6->_silo = (CLSilo *)a4;
  }
  return v7;
}

- (void)dealloc
{
  self->_daemonControl = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPipelineXPCBounce;
  [(CLPipelineXPCBounce *)&v3 dealloc];
}

- (void)invalidate
{
  self->_provider = 0;
  [(CLTimer *)[(CLPipelineXPCBounce *)self debounceTimer] invalidate];
  [(CLPipelineXPCBounce *)self setDebounceTimer:0];
  [(CLTimer *)[(CLPipelineXPCBounce *)self routeHintWatchdogTimer] invalidate];

  [(CLPipelineXPCBounce *)self setRouteHintWatchdogTimer:0];
}

- (void)indoorDidFailWithError:(id)a3
{
  id v6 = [a3 description];
  id v7 = [a3 localizedFailureReason];
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_10231A1C8);
  }
  v8 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "pipelined failure: %{public}@ because %{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10231A1C8);
    }
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    objc_super v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPipelineXPCBounce indoorDidFailWithError:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_101249DB0;
  v10[3] = &unk_10229FEB0;
  v10[4] = self;
  v10[5] = a3;
  [(CLSilo *)[(CLPipelineXPCBounce *)self silo] async:v10];
}

- (void)indoorIsUncertainWithLocation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10124A024;
  v3[3] = &unk_1022BDC60;
  objc_super v4 = self;
  unsigned __int8 v5 = [a3 requestsGpsAssistance];
  [(CLSilo *)[(CLPipelineXPCBounce *)v4 silo] async:v3];
}

- (void)indoorGivesUpWithLocation:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10124A338;
  v3[3] = &unk_1022BDC60;
  objc_super v4 = self;
  unsigned __int8 v5 = [a3 requestsGpsAssistance];
  [(CLSilo *)[(CLPipelineXPCBounce *)v4 silo] async:v3];
}

- (void)indoorDidUpdateToLocation:(id)a3 fromLocation:(id)a4
{
  if ([a3 locationId])
  {
    if (a3)
    {
      [a3 location];
      if (v64 == 11 || ([a3 location], v59 == 10))
      {
        [a3 location];
        if (v64 == 10)
        {
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_10231A1C8);
          }
          id v6 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            [a3 location];
            double v7 = v61;
            [a3 location];
            double v8 = v58[0];
            [a3 location];
            [a3 location];
            *(_DWORD *)buf = 134284289;
            double v40 = v7;
            __int16 v41 = 2049;
            double v42 = v8;
            __int16 v43 = 2050;
            uint64_t v44 = *(void *)&v38[20];
            __int16 v45 = 2050;
            uint64_t v46 = v37;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@ClxIndoor, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", buf, 0x2Au);
          }
          if (!sub_10013D1A0(115, 2)) {
            goto LABEL_26;
          }
          bzero(v60, 0x65CuLL);
          if (qword_1024193A0 == -1)
          {
LABEL_60:
            [a3 location];
            v21 = v57;
            [a3 location];
            [a3 location];
            [a3 location];
            int v48 = 134284289;
            v49 = v21;
            __int16 v50 = 2049;
            uint64_t v51 = *(void *)&v38[12];
            __int16 v52 = 2050;
            uint64_t v53 = v36;
            __int16 v54 = 2050;
            uint64_t v55 = v47;
            v22 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v22);
            if (v22 != (char *)v60) {
              free(v22);
            }
LABEL_26:
            [a3 location];
            if (v64 == 10) {
              id v14 = "indoor";
            }
            else {
              id v14 = "regional";
            }
            sub_100134750(v38, v14);
            [a3 location];
            double v15 = v61;
            [a3 location];
            if (sub_1000EF668(v15, v58[0]))
            {
              if (qword_1024193A0 != -1) {
                dispatch_once(&qword_1024193A0, &stru_10231A1C8);
              }
              id v16 = qword_1024193A8;
              if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
              {
                __int16 v17 = v38;
                if (v38[23] < 0) {
                  __int16 v17 = *(unsigned char **)v38;
                }
                *(_DWORD *)v60 = 136380931;
                double v61 = COERCE_DOUBLE("pipeline, null");
                __int16 v62 = 2081;
                v63 = v17;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "ClxMetric, islands, %{private}s, %{private}s", v60, 0x16u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(v60, 0x65CuLL);
                if (qword_1024193A0 != -1) {
                  dispatch_once(&qword_1024193A0, &stru_10231A1C8);
                }
                v23 = v38;
                if (v38[23] < 0) {
                  v23 = *(unsigned char **)v38;
                }
                int v56 = 136380931;
                v57 = "pipeline, null";
                LOWORD(v58[0]) = 2081;
                *(void *)((char *)v58 + 2) = v23;
                v24 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v24);
                if (v24 != (char *)v60) {
                  free(v24);
                }
              }
              v30 = _NSConcreteStackBlock;
              uint64_t v31 = 3321888768;
              v32 = sub_10124B0EC;
              v33 = &unk_1022C21F0;
              if ((v38[23] & 0x80000000) != 0)
              {
                sub_1000DC48C(&__p, *(void **)v38, *(unint64_t *)&v38[8]);
              }
              else
              {
                long long __p = *(_OWORD *)v38;
                uint64_t v35 = *(void *)&v38[16];
              }
              AnalyticsSendEventLazy();
              if (SHIBYTE(v35) < 0) {
                operator delete((void *)__p);
              }
            }
            [a3 location];
            double v18 = v61;
            if (v61 == -1.0)
            {
              [a3 location:v61];
              double v18 = v58[0];
              if (v58[0] == -1.0)
              {
                if (qword_1024193A0 != -1) {
                  dispatch_once(&qword_1024193A0, &stru_10231A1C8);
                }
                v19 = qword_1024193A8;
                if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
                {
                  v20 = v38;
                  if (v38[23] < 0) {
                    v20 = *(unsigned char **)v38;
                  }
                  *(_DWORD *)v60 = 136380931;
                  double v61 = COERCE_DOUBLE("pipeline, sentinel");
                  __int16 v62 = 2081;
                  v63 = v20;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "ClxMetric, islands, %{private}s, %{private}s", v60, 0x16u);
                }
                if (sub_10013D1A0(115, 2))
                {
                  bzero(v60, 0x65CuLL);
                  if (qword_1024193A0 != -1) {
                    dispatch_once(&qword_1024193A0, &stru_10231A1C8);
                  }
                  v25 = v38;
                  if (v38[23] < 0) {
                    v25 = *(unsigned char **)v38;
                  }
                  int v56 = 136380931;
                  v57 = "pipeline, sentinel";
                  LOWORD(v58[0]) = 2081;
                  *(void *)((char *)v58 + 2) = v25;
                  v26 = (char *)_os_log_send_and_compose_impl();
                  sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v26);
                  if (v26 != (char *)v60) {
                    free(v26);
                  }
                }
                v27[6] = _NSConcreteStackBlock;
                v27[7] = 3321888768;
                v27[8] = sub_10124B1A4;
                v27[9] = &unk_1022C21F0;
                if ((v38[23] & 0x80000000) != 0)
                {
                  sub_1000DC48C(&v28, *(void **)v38, *(unint64_t *)&v38[8]);
                }
                else
                {
                  long long v28 = *(_OWORD *)v38;
                  uint64_t v29 = *(void *)&v38[16];
                }
                AnalyticsSendEventLazy();
                if (SHIBYTE(v29) < 0) {
                  operator delete((void *)v28);
                }
              }
            }
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_10124B25C;
            v27[3] = &unk_10229FEB0;
            v27[4] = self;
            v27[5] = a3;
            [(CLSilo *)[(CLPipelineXPCBounce *)self silo] async:v27];
            if ((v38[23] & 0x80000000) != 0) {
              operator delete(*(void **)v38);
            }
            return;
          }
        }
        else
        {
          if (qword_1024193A0 != -1) {
            dispatch_once(&qword_1024193A0, &stru_10231A1C8);
          }
          int v11 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            [a3 location];
            double v12 = v61;
            [a3 location];
            double v13 = v58[0];
            [a3 location];
            [a3 location];
            *(_DWORD *)buf = 134284289;
            double v40 = v12;
            __int16 v41 = 2049;
            double v42 = v13;
            __int16 v43 = 2050;
            uint64_t v44 = *(void *)&v38[20];
            __int16 v45 = 2050;
            uint64_t v46 = v37;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "@ClxWifi2, Fix, 1, ll, %{private}.7f, %{private}.7f, acc, %{public}.2f, course, -1.0, timestamp, %{public}.3f", buf, 0x2Au);
          }
          if (!sub_10013D1A0(115, 2)) {
            goto LABEL_26;
          }
          bzero(v60, 0x65CuLL);
          if (qword_1024193A0 == -1) {
            goto LABEL_60;
          }
        }
        dispatch_once(&qword_1024193A0, &stru_10231A1C8);
        goto LABEL_60;
      }
    }
    sub_101AA93C4();
    __break(1u);
LABEL_75:
    dispatch_once(&qword_1024193A0, &stru_10231A1C8);
LABEL_19:
    LOWORD(v56) = 0;
    v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPipelineXPCBounce indoorDidUpdateToLocation:fromLocation:]", "%s\n", v10);
    if (v10 != (char *)v60) {
      free(v10);
    }
    return;
  }
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_10231A1C8);
  }
  objc_super v9 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v60 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning, no floor available", v60, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(v60, 0x65CuLL);
    if (qword_1024193A0 == -1) {
      goto LABEL_19;
    }
    goto LABEL_75;
  }
}

- (void)provider
{
  return self->_provider;
}

- (CLSilo)silo
{
  return self->_silo;
}

- (NSBundle)indoorBundle
{
  return self->_indoorBundle;
}

- (void)setIndoorBundle:(id)a3
{
}

- (void)setIndoord:(id)a3
{
}

- (CLIndoorMaintenance)daemonControl
{
  return self->_daemonControl;
}

- (void)setDaemonControl:(id)a3
{
}

- (CLTimer)debounceTimer
{
  return self->_debounceTimer;
}

- (void)setDebounceTimer:(id)a3
{
}

- (CLTimer)routeHintWatchdogTimer
{
  return self->_routeHintWatchdogTimer;
}

- (void)setRouteHintWatchdogTimer:(id)a3
{
}

@end