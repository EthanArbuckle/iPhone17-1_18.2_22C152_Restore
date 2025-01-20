@interface CLPressureStatsCollector
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPressureStatsCollector)init;
- (id).cxx_construct;
- (int)getFlightOfStairsIn24Hr;
- (void)beginService;
- (void)cleanCache;
- (void)disableCollection;
- (void)displayCache;
- (void)enableCollection;
- (void)endService;
- (void)onDaemonStatus:(const int *)a3 data:(const NotificationData *)a4;
- (void)onPressureData:(const Sample *)a3;
- (void)reset;
- (void)saveFeaturesToCache:(id *)a3;
- (void)sendCAMetric:(id *)a3;
- (void)submitAWDMetric;
@end

@implementation CLPressureStatsCollector

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
  if (qword_1024814B0 != -1) {
    dispatch_once(&qword_1024814B0, &stru_1022F7378);
  }
  return (id)qword_1024814A8;
}

+ (BOOL)isSupported
{
  if (qword_1024814C0 != -1) {
    dispatch_once(&qword_1024814C0, &stru_1022F7398);
  }
  return byte_1024814B8;
}

- (CLPressureStatsCollector)init
{
  uint64_t v15 = 86400 * ((uint64_t)CFAbsoluteTimeGetCurrent() / 86400) + 86400;
  uint64_t v3 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v3 + 936))();
  uint64_t v4 = sub_1000A6958();
  if (byte_1024814A7 >= 0) {
    unint64_t v5 = (const char *)&qword_102481490;
  }
  else {
    unint64_t v5 = (const char *)qword_102481490;
  }
  if ((sub_1004D0EA0(v4, v5, &v15) & 1) == 0)
  {
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022F73B8);
    }
    v6 = qword_1024190D8;
    if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190D0 != -1) {
        dispatch_once(&qword_1024190D0, &stru_1022F73B8);
      }
      __int16 v14 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector init]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    uint64_t v7 = sub_1000A6958();
    if (byte_1024814A7 >= 0) {
      v8 = (const char *)&qword_102481490;
    }
    else {
      v8 = (const char *)qword_102481490;
    }
    sub_1004D31B8(v7, v8, &v15);
    uint64_t v9 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v9 + 944))();
    uint64_t v10 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v10 + 936))();
  }
  v13.receiver = self;
  v13.super_class = (Class)CLPressureStatsCollector;
  return [(CLPressureStatsCollector *)&v13 initWithInboundProtocol:&OBJC_PROTOCOL___CLPressureStatsCollectorProtocol outboundProtocol:&OBJC_PROTOCOL___CLPressureStatsCollectorClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
}

- (void)enableCollection
{
  if (sub_100862C50())
  {
    uint64_t v3 = sub_100862C50();
    value = self->fPressureDispatcher.__ptr_.__value_;
    sub_1009D1EC4(v3, 0, (uint64_t)value, 0.0399999991);
  }
}

- (void)disableCollection
{
  if (sub_100862C50())
  {
    uint64_t v3 = sub_100862C50();
    value = self->fPressureDispatcher.__ptr_.__value_;
    sub_1009D26C4(v3, 0, (uint64_t)value);
  }
}

- (void)onPressureData:(const Sample *)a3
{
  p_fK2Detector = &self->fK2Detector;
  sub_10126CCC0((uint64_t)p_fK2Detector, (uint64_t)p_fK2Detector, a3->var1.var0 * 1000.0);
  sub_10126CCC0((uint64_t)p_fK2Detector, (uint64_t)&p_fK2Detector->fBufTemperatureRaw, a3->var1.var1);
  p_fSlopeEstimator = &self->fSlopeEstimator;
  sub_100B82838((uint64_t)&self->fSlopeEstimator, (__n128 *)a3);
  sub_10126D2F8((uint64_t)p_fK2Detector, a3->var1.var0);
  sub_10126D314((uint64_t)p_fK2Detector, a3->var1.var1);
  if (sub_10126CC78((uint64_t)p_fK2Detector))
  {
    sub_10126D0C0(p_fK2Detector);
    begin = p_fK2Detector->fFeatures.__begin_;
    end = p_fK2Detector->fFeatures.__end_;
    if ((int)(-1431655765 * ((unint64_t)(end - (unsigned char *)begin) >> 3)) >= 301)
    {
      v56 = self;
      __p = 0;
      v76 = 0;
      v77 = 0;
      v72 = 0;
      v73 = 0;
      v74 = 0;
      if (end != (unsigned char *)begin)
      {
        unint64_t v9 = 0;
        do
        {
          uint64_t v10 = (_DWORD *)begin[3 * v9];
          v11 = v76;
          if (v76 >= v77)
          {
            objc_super v13 = (char *)__p;
            uint64_t v14 = (v76 - (unsigned char *)__p) >> 2;
            unint64_t v15 = v14 + 1;
            if ((unint64_t)(v14 + 1) >> 62) {
              goto LABEL_85;
            }
            uint64_t v16 = v77 - (unsigned char *)__p;
            if ((v77 - (unsigned char *)__p) >> 1 > v15) {
              unint64_t v15 = v16 >> 1;
            }
            if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v15;
            }
            if (v17)
            {
              v18 = (char *)sub_10017EA34((uint64_t)&v77, v17);
              objc_super v13 = (char *)__p;
              v11 = v76;
            }
            else
            {
              v18 = 0;
            }
            v19 = &v18[4 * v14];
            *(_DWORD *)v19 = *v10;
            v12 = v19 + 4;
            while (v11 != v13)
            {
              int v20 = *((_DWORD *)v11 - 1);
              v11 -= 4;
              *((_DWORD *)v19 - 1) = v20;
              v19 -= 4;
            }
            __p = v19;
            v76 = v12;
            v77 = &v18[4 * v17];
            if (v13) {
              operator delete(v13);
            }
          }
          else
          {
            *(_DWORD *)v76 = *v10;
            v12 = v11 + 4;
          }
          v76 = v12;
          uint64_t v21 = *((void *)p_fK2Detector->fFeatures.__begin_ + 3 * v9);
          v22 = v73;
          if (v73 >= v74)
          {
            v24 = (char *)v72;
            uint64_t v25 = (v73 - (unsigned char *)v72) >> 2;
            unint64_t v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) >> 62) {
LABEL_85:
            }
              sub_1001D7FD4();
            uint64_t v27 = v74 - (unsigned char *)v72;
            if ((v74 - (unsigned char *)v72) >> 1 > v26) {
              unint64_t v26 = v27 >> 1;
            }
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v28 = v26;
            }
            if (v28)
            {
              v29 = (char *)sub_10017EA34((uint64_t)&v74, v28);
              v24 = (char *)v72;
              v22 = v73;
            }
            else
            {
              v29 = 0;
            }
            v30 = &v29[4 * v25];
            *(_DWORD *)v30 = *(_DWORD *)(v21 + 4);
            v23 = v30 + 4;
            while (v22 != v24)
            {
              int v31 = *((_DWORD *)v22 - 1);
              v22 -= 4;
              *((_DWORD *)v30 - 1) = v31;
              v30 -= 4;
            }
            v72 = v30;
            v73 = v23;
            v74 = &v29[4 * v28];
            if (v24) {
              operator delete(v24);
            }
          }
          else
          {
            *(_DWORD *)v73 = *(_DWORD *)(v21 + 4);
            v23 = v22 + 4;
          }
          v73 = v23;
          ++v9;
          begin = p_fK2Detector->fFeatures.__begin_;
        }
        while (0xAAAAAAAAAAAAAAABLL * (((char *)p_fK2Detector->fFeatures.__end_ - (char *)begin) >> 3) > v9);
      }
      float v32 = sub_100DA14A4((uint64_t)&__p);
      float v33 = sub_100DA14A4((uint64_t)&v72);
      sub_100B81F68((uint64_t)p_fSlopeEstimator, 2, (uint64_t)v69);
      v34 = v56;
      *(_DWORD *)((char *)v68 + 3) = 0;
      v68[0] = 0;
      float v35 = sub_10126D330((uint64_t)p_fK2Detector);
      float v36 = sub_10126D33C((uint64_t)p_fK2Detector);
      int v37 = v69[0];
      int v38 = v69[1];
      unsigned int v39 = [(CLPressureStatsCollector *)v56 getFlightOfStairsIn24Hr];
      sub_100103240();
      sub_10073B95C((uint64_t)&__str);
      std::string::basic_string(&v78, &__str, 3uLL, 2uLL, (std::allocator<char> *)&size);
      long long v40 = *(_OWORD *)&v78.__r_.__value_.__l.__data_;
      v68[0] = v78.__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v68 + 3) = *(_DWORD *)((char *)&v78.__r_.__value_.__r.__words[2] + 3);
      int v41 = SHIBYTE(v78.__r_.__value_.__r.__words[2]);
      *((unsigned char *)&v78.__r_.__value_.__s + 23) = 0;
      v78.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      char v42 = v70;
      *(float *)v63 = v32;
      *(float *)&v63[1] = v33;
      *(float *)&v63[2] = v35;
      *(float *)&v63[3] = v36;
      v63[4] = v37;
      v63[5] = v38;
      v63[6] = v39;
      if (v41 < 0)
      {
        sub_1000DC48C(&v64, (void *)v40, *((unint64_t *)&v40 + 1));
      }
      else
      {
        long long v64 = v40;
        *(_DWORD *)v65 = v68[0];
        *(_DWORD *)&v65[3] = *(_DWORD *)((char *)v68 + 3);
        char v66 = v41;
      }
      char v67 = v42;
      [(CLPressureStatsCollector *)v56 saveFeaturesToCache:v63];
      if (v66 < 0) {
        operator delete((void *)v64);
      }
      [(CLPressureStatsCollector *)v56 submitAWDMetric];
      uint64_t Current = (uint64_t)CFAbsoluteTimeGetCurrent();
      int64_t size = 86400 * (Current / 86400) + 86400;
      uint64_t v44 = sub_1000A6958();
      if (byte_1024814A7 >= 0) {
        v45 = (const char *)&qword_102481490;
      }
      else {
        v45 = (const char *)qword_102481490;
      }
      if (sub_1004D0EA0(v44, v45, &size))
      {
        sub_100DA3274((unsigned __int8 *)&v78, "PressureStatsCAEnabledTimestamp", &size, 0);
        int64_t size = v78.__r_.__value_.__l.__size_;
        if (qword_1024190D0 != -1) {
          dispatch_once(&qword_1024190D0, &stru_1022F73B8);
        }
        v46 = qword_1024190D8;
        if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v78.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)v78.__r_.__value_.__r.__words + 4) = Current;
          WORD2(v78.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v78.__r_.__value_.__r.__words[1] + 6) = size;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] currentTime,%ld,CAEnabledTime,%ld", (uint8_t *)&v78, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&v78, 0x65CuLL);
          if (qword_1024190D0 != -1) {
            dispatch_once(&qword_1024190D0, &stru_1022F73B8);
          }
          LODWORD(__str.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)__str.__r_.__value_.__r.__words + 4) = Current;
          WORD2(__str.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&__str.__r_.__value_.__r.__words[1] + 6) = size;
          v55 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector onPressureData:]", "%s\n", (const char *)v55);
          if (v55 != &v78) {
            free(v55);
          }
          v34 = v56;
        }
        if (size < Current)
        {
          *(float *)v57 = v32;
          *(float *)&v57[1] = v33;
          *(float *)&v57[2] = v35;
          *(float *)&v57[3] = v36;
          v57[4] = v37;
          v57[5] = v38;
          v57[6] = v39;
          if (v41 < 0)
          {
            sub_1000DC48C(&v58, (void *)v40, *((unint64_t *)&v40 + 1));
          }
          else
          {
            long long v58 = v40;
            *(_DWORD *)v59 = v68[0];
            *(_DWORD *)&v59[3] = *(_DWORD *)((char *)v68 + 3);
            char v60 = v41;
          }
          char v61 = v42;
          [(CLPressureStatsCollector *)v34 sendCAMetric:v57];
          if (v60 < 0) {
            operator delete((void *)v58);
          }
        }
      }
      else
      {
        if (qword_1024190D0 != -1) {
          dispatch_once(&qword_1024190D0, &stru_1022F73B8);
        }
        v47 = qword_1024190D8;
        if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v78.__r_.__value_.__l.__data_) = 0;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Key CLPressureStatsCollector_CAEnabledTimestamp not found in cache.plist.", (uint8_t *)&v78, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&v78, 0x65CuLL);
          if (qword_1024190D0 != -1) {
            dispatch_once(&qword_1024190D0, &stru_1022F73B8);
          }
          LOWORD(__str.__r_.__value_.__l.__data_) = 0;
          v48 = (std::string *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector onPressureData:]", "%s\n", (const char *)v48);
          if (v48 != &v78) {
            free(v48);
          }
          v34 = v56;
        }
      }
      CFAbsoluteTime v49 = CFAbsoluteTimeGetCurrent();
      int64_t size = (uint64_t)v49 + 86400 + 86400 * ((uint64_t)v49 / 86400) - (uint64_t)v49;
      uint64_t v50 = sub_1000A6958();
      (*(void (**)(uint64_t))(*(void *)v50 + 936))(v50);
      uint64_t v51 = sub_1000A6958();
      if (byte_1024814A7 >= 0) {
        v52 = (const char *)&qword_102481490;
      }
      else {
        v52 = (const char *)qword_102481490;
      }
      sub_1004D31B8(v51, v52, &size);
      uint64_t v53 = sub_1000A6958();
      (*(void (**)(uint64_t))(*(void *)v53 + 944))(v53);
      uint64_t v54 = sub_1000A6958();
      (*(void (**)(uint64_t))(*(void *)v54 + 936))(v54);
      [(CLPressureStatsCollector *)v34 reset];
      if (v41 < 0) {
        operator delete((void *)v40);
      }
      sub_10041F48C(v71);
      if (v72)
      {
        v73 = (char *)v72;
        operator delete(v72);
      }
      if (__p)
      {
        v76 = (char *)__p;
        operator delete(__p);
      }
    }
  }
}

- (void)onDaemonStatus:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 7)
  {
    int v5 = *((unsigned __int8 *)a4 + 9);
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022F73B8);
    }
    v6 = qword_1024190D8;
    if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] charging,%d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190D0 != -1) {
        dispatch_once(&qword_1024190D0, &stru_1022F73B8);
      }
      int v19 = 67109120;
      LODWORD(v20) = v5;
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    if (v5 != self->fCharging)
    {
      self->fCharging = v5;
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v8 = *(void *)sub_1000A6958();
      (*(void (**)(void))(v8 + 936))();
      if (self->fCharging)
      {
        double v18 = 0.0;
        uint64_t v9 = sub_1000A6958();
        if (byte_1024813B7 >= 0) {
          uint64_t v10 = (const char *)&qword_1024813A0;
        }
        else {
          uint64_t v10 = (const char *)qword_1024813A0;
        }
        sub_1000A699C(v9, v10, &v18);
        uint64_t v11 = (uint64_t)(Current - v18);
        sub_100DA3274(buf, "PressureStatsMinLoggingWinInSec", &qword_101D8DF70, 0);
        uint64_t v12 = *(void *)&v24[4];
        if (qword_1024190D0 != -1) {
          dispatch_once(&qword_1024190D0, &stru_1022F73B8);
        }
        objc_super v13 = qword_1024190D8;
        if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v24 = v11;
          *(_WORD *)&v24[8] = 2048;
          *(void *)&v24[10] = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] timeSinceLastUpdate,%ld,minLoggingWinInSec,%ld", buf, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024190D0 != -1) {
            dispatch_once(&qword_1024190D0, &stru_1022F73B8);
          }
          int v19 = 134218240;
          uint64_t v20 = v11;
          __int16 v21 = 2048;
          uint64_t v22 = v12;
          unint64_t v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v17);
          if (v17 != (char *)buf) {
            free(v17);
          }
        }
        if (v12 <= v11)
        {
          self->fAllowLogging = 1;
          [(CLPressureStatsCollector *)self enableCollection];
          if (qword_1024190D0 != -1) {
            dispatch_once(&qword_1024190D0, &stru_1022F73B8);
          }
          uint64_t v14 = qword_1024190D8;
          if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Collection enabled", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024190D0 != -1) {
              dispatch_once(&qword_1024190D0, &stru_1022F73B8);
            }
            LOWORD(v19) = 0;
            unint64_t v15 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector onDaemonStatus:data:]", "%s\n", v15);
            if (v15 != (char *)buf) {
              free(v15);
            }
          }
        }
      }
      else if (self->fAllowLogging)
      {
        [(CLPressureStatsCollector *)self reset];
      }
    }
  }
}

- (int)getFlightOfStairsIn24Hr
{
  if (objc_opt_class()
    && objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed"))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v5 = CFAbsoluteTimeGetCurrent() + -86400.0;
    id v3 = [[objc_msgSend(-[CLPressureStatsCollector universe](self, "universe", 0, 0, 0, 0), "vendor") proxyForService:@"CLStepCountNotifier"];
    if (v3)
    {
      [v3 syncgetQueryStartTime:&v5 andStopTime:&Current];
      LODWORD(v3) = 0;
    }
  }
  else
  {
    LODWORD(v3) = 0x7FFFFFFF;
  }
  return (int)v3;
}

- (void)reset
{
  sub_10126CE24((uint64_t)&self->fK2Detector);
  sub_100B831F4((uint64_t)&self->fSlopeEstimator);
  self->fCharging = 0;
  self->fAllowLogging = 0;

  [(CLPressureStatsCollector *)self disableCollection];
}

- (void)saveFeaturesToCache:(id *)a3
{
  uint64_t v4 = sub_1000A6958();
  if (byte_1024813B7 >= 0) {
    double v5 = (const char *)&qword_1024813A0;
  }
  else {
    double v5 = (const char *)qword_1024813A0;
  }
  *(double *)buf = CFAbsoluteTimeGetCurrent();
  sub_10016332C(v4, v5, buf);
  uint64_t v6 = sub_1000A6958();
  if (byte_1024813CF >= 0) {
    uint64_t v7 = (const char *)&qword_1024813B8;
  }
  else {
    uint64_t v7 = (const char *)qword_1024813B8;
  }
  *(double *)buf = a3->var0;
  sub_1004D51BC(v6, v7, buf);
  uint64_t v8 = sub_1000A6958();
  if (byte_1024813E7 >= 0) {
    uint64_t v9 = (const char *)&qword_1024813D0;
  }
  else {
    uint64_t v9 = (const char *)qword_1024813D0;
  }
  *(double *)buf = a3->var1;
  sub_1004D51BC(v8, v9, buf);
  uint64_t v10 = sub_1000A6958();
  if (byte_1024813FF >= 0) {
    uint64_t v11 = (const char *)&qword_1024813E8;
  }
  else {
    uint64_t v11 = (const char *)qword_1024813E8;
  }
  *(double *)buf = a3->var2;
  sub_1004D51BC(v10, v11, buf);
  uint64_t v12 = sub_1000A6958();
  if (byte_102481417 >= 0) {
    objc_super v13 = (const char *)&qword_102481400;
  }
  else {
    objc_super v13 = (const char *)qword_102481400;
  }
  *(double *)buf = a3->var3;
  sub_1004D51BC(v12, v13, buf);
  uint64_t v14 = sub_1000A6958();
  if (byte_102481447 >= 0) {
    unint64_t v15 = (const char *)&qword_102481430;
  }
  else {
    unint64_t v15 = (const char *)qword_102481430;
  }
  *(double *)buf = a3->var5;
  sub_1004D51BC(v14, v15, buf);
  uint64_t v16 = sub_1000A6958();
  if (byte_10248142F >= 0) {
    unint64_t v17 = (const char *)&qword_102481418;
  }
  else {
    unint64_t v17 = (const char *)qword_102481418;
  }
  *(double *)buf = a3->var4;
  sub_1004D51BC(v16, v17, buf);
  uint64_t v18 = sub_1000A6958();
  if (byte_10248145F >= 0) {
    int v19 = (const char *)&qword_102481448;
  }
  else {
    int v19 = (const char *)qword_102481448;
  }
  sub_1004D4BD4(v18, v19, &a3->var6);
  uint64_t v20 = sub_1000A6958();
  if (byte_102481477 >= 0) {
    __int16 v21 = (const char *)&qword_102481460;
  }
  else {
    __int16 v21 = (const char *)qword_102481460;
  }
  sub_1004D57AC(v20, v21, a3->var7.__r_.__value_.var0.var0.__data_);
  uint64_t v22 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v22 + 944))();
  uint64_t v23 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v23 + 936))();
  if (qword_1024190D0 != -1) {
    dispatch_once(&qword_1024190D0, &stru_1022F73B8);
  }
  v24 = qword_1024190D8;
  if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] A new record saved to cache.plist", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022F73B8);
    }
    uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector saveFeaturesToCache:]", "%s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
  }
}

- (void)cleanCache
{
  uint64_t v2 = sub_1000A6958();
  if (byte_1024813CF >= 0) {
    id v3 = (const char *)&qword_1024813B8;
  }
  else {
    id v3 = (const char *)qword_1024813B8;
  }
  sub_1004CF7DC(v2, v3, 0xFFFFFFFFLL);
  uint64_t v4 = sub_1000A6958();
  if (byte_1024813E7 >= 0) {
    double v5 = (const char *)&qword_1024813D0;
  }
  else {
    double v5 = (const char *)qword_1024813D0;
  }
  sub_1004CF7DC(v4, v5, 0xFFFFFFFFLL);
  uint64_t v6 = sub_1000A6958();
  if (byte_1024813FF >= 0) {
    uint64_t v7 = (const char *)&qword_1024813E8;
  }
  else {
    uint64_t v7 = (const char *)qword_1024813E8;
  }
  sub_1004CF7DC(v6, v7, 0xFFFFFFFFLL);
  uint64_t v8 = sub_1000A6958();
  if (byte_102481417 >= 0) {
    uint64_t v9 = (const char *)&qword_102481400;
  }
  else {
    uint64_t v9 = (const char *)qword_102481400;
  }
  sub_1004CF7DC(v8, v9, 0xFFFFFFFFLL);
  uint64_t v10 = sub_1000A6958();
  if (byte_102481447 >= 0) {
    uint64_t v11 = (const char *)&qword_102481430;
  }
  else {
    uint64_t v11 = (const char *)qword_102481430;
  }
  sub_1004CF7DC(v10, v11, 0xFFFFFFFFLL);
  uint64_t v12 = sub_1000A6958();
  if (byte_10248142F >= 0) {
    objc_super v13 = (const char *)&qword_102481418;
  }
  else {
    objc_super v13 = (const char *)qword_102481418;
  }
  sub_1004CF7DC(v12, v13, 0xFFFFFFFFLL);
  uint64_t v14 = sub_1000A6958();
  if (byte_10248145F >= 0) {
    unint64_t v15 = (const char *)&qword_102481448;
  }
  else {
    unint64_t v15 = (const char *)qword_102481448;
  }
  sub_1004CF7DC(v14, v15, 0xFFFFFFFFLL);
  uint64_t v16 = sub_1000A6958();
  if (byte_102481477 >= 0) {
    unint64_t v17 = (const char *)&qword_102481460;
  }
  else {
    unint64_t v17 = (const char *)qword_102481460;
  }
  sub_1004CF7DC(v16, v17, 0xFFFFFFFFLL);
  uint64_t v18 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v18 + 944))();
  uint64_t v19 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v19 + 936))();
  if (qword_1024190D0 != -1) {
    dispatch_once(&qword_1024190D0, &stru_1022F73B8);
  }
  uint64_t v20 = qword_1024190D8;
  if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] cache.plist reset", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022F73B8);
    }
    __int16 v21 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector cleanCache]", "%s\n", v21);
    if (v21 != (char *)buf) {
      free(v21);
    }
  }
}

- (void)displayCache
{
  uint64_t v29 = 0x47EFFFFFE0000000;
  uint64_t v30 = 0x47EFFFFFE0000000;
  uint64_t v27 = 0x47EFFFFFE0000000;
  uint64_t v28 = 0x47EFFFFFE0000000;
  uint64_t v25 = 0x47EFFFFFE0000000;
  uint64_t v26 = 0x47EFFFFFE0000000;
  int v24 = 0x7FFFFFFF;
  sub_100134750(&__p, "");
  uint64_t v2 = sub_1000A6958();
  (*(void (**)(uint64_t))(*(void *)v2 + 936))(v2);
  uint64_t v3 = sub_1000A6958();
  if (byte_1024813CF >= 0) {
    uint64_t v4 = (const char *)&qword_1024813B8;
  }
  else {
    uint64_t v4 = (const char *)qword_1024813B8;
  }
  int v5 = sub_1004D5D9C(v3, v4);
  if (v5 >= 1)
  {
    int v6 = 0;
    do
    {
      uint64_t v7 = sub_1000A6958();
      if (byte_1024813CF >= 0) {
        uint64_t v8 = (const char *)&qword_1024813B8;
      }
      else {
        uint64_t v8 = (const char *)qword_1024813B8;
      }
      sub_1000A699C(v7, v8, &v30);
      uint64_t v9 = sub_1000A6958();
      if (byte_1024813E7 >= 0) {
        uint64_t v10 = (const char *)&qword_1024813D0;
      }
      else {
        uint64_t v10 = (const char *)qword_1024813D0;
      }
      sub_1000A699C(v9, v10, &v29);
      uint64_t v11 = sub_1000A6958();
      if (byte_1024813FF >= 0) {
        uint64_t v12 = (const char *)&qword_1024813E8;
      }
      else {
        uint64_t v12 = (const char *)qword_1024813E8;
      }
      sub_1000A699C(v11, v12, &v28);
      uint64_t v13 = sub_1000A6958();
      if (byte_102481417 >= 0) {
        uint64_t v14 = (const char *)&qword_102481400;
      }
      else {
        uint64_t v14 = (const char *)qword_102481400;
      }
      sub_1000A699C(v13, v14, &v27);
      uint64_t v15 = sub_1000A6958();
      if (byte_102481447 >= 0) {
        uint64_t v16 = (const char *)&qword_102481430;
      }
      else {
        uint64_t v16 = (const char *)qword_102481430;
      }
      sub_1000A699C(v15, v16, &v26);
      uint64_t v17 = sub_1000A6958();
      if (byte_10248142F >= 0) {
        uint64_t v18 = (const char *)&qword_102481418;
      }
      else {
        uint64_t v18 = (const char *)qword_102481418;
      }
      sub_1000A699C(v17, v18, &v25);
      uint64_t v19 = sub_1000A6958();
      if (byte_10248145F >= 0) {
        uint64_t v20 = (const char *)&qword_102481448;
      }
      else {
        uint64_t v20 = (const char *)qword_102481448;
      }
      sub_10006EF84(v19, v20, &v24);
      uint64_t v21 = sub_1000A6958();
      if (byte_102481477 >= 0) {
        uint64_t v22 = (const char *)&qword_102481460;
      }
      else {
        uint64_t v22 = (const char *)qword_102481460;
      }
      sub_1004D1284(v21, v22, &__p);
      ++v6;
    }
    while (v5 != v6);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)submitAWDMetric
{
  uint64_t v2 = sub_1000A6958();
  if (byte_1024813CF >= 0) {
    uint64_t v3 = (const char *)&qword_1024813B8;
  }
  else {
    uint64_t v3 = (const char *)qword_1024813B8;
  }
  int v105 = sub_1004D5D9C(v2, v3);
  if (v105 >= 7)
  {
    double v129 = 3.40282347e38;
    v130[0] = 3.40282347e38;
    double v127 = 3.40282347e38;
    double v128 = 3.40282347e38;
    double v125 = 3.40282347e38;
    double v126 = 3.40282347e38;
    int v124 = 0x7FFFFFFF;
    sub_100134750(&v123, "");
    v107[0] = 0;
    long long v109 = 0u;
    *(_OWORD *)v110 = 0u;
    long long v111 = 0u;
    *(_OWORD *)v112 = 0u;
    *(_OWORD *)v113 = 0u;
    long long v114 = 0u;
    *(_OWORD *)v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long __p = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    unint64_t v122 = 0;
    int v4 = 0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime v108 = Current;
    do
    {
      uint64_t v5 = sub_1000A6958();
      if (byte_1024813CF >= 0) {
        int v6 = (const char *)&qword_1024813B8;
      }
      else {
        int v6 = (const char *)qword_1024813B8;
      }
      sub_1000A699C(v5, v6, v130);
      uint64_t v7 = sub_1000A6958();
      if (byte_1024813E7 >= 0) {
        uint64_t v8 = (const char *)&qword_1024813D0;
      }
      else {
        uint64_t v8 = (const char *)qword_1024813D0;
      }
      sub_1000A699C(v7, v8, &v129);
      uint64_t v9 = sub_1000A6958();
      if (byte_1024813FF >= 0) {
        uint64_t v10 = (const char *)&qword_1024813E8;
      }
      else {
        uint64_t v10 = (const char *)qword_1024813E8;
      }
      sub_1000A699C(v9, v10, &v128);
      uint64_t v11 = sub_1000A6958();
      if (byte_102481417 >= 0) {
        uint64_t v12 = (const char *)&qword_102481400;
      }
      else {
        uint64_t v12 = (const char *)qword_102481400;
      }
      sub_1000A699C(v11, v12, &v127);
      uint64_t v13 = sub_1000A6958();
      if (byte_102481447 >= 0) {
        uint64_t v14 = (const char *)&qword_102481430;
      }
      else {
        uint64_t v14 = (const char *)qword_102481430;
      }
      sub_1000A699C(v13, v14, &v126);
      uint64_t v15 = sub_1000A6958();
      if (byte_10248142F >= 0) {
        uint64_t v16 = (const char *)&qword_102481418;
      }
      else {
        uint64_t v16 = (const char *)qword_102481418;
      }
      sub_1000A699C(v15, v16, &v125);
      uint64_t v17 = sub_1000A6958();
      if (byte_10248145F >= 0) {
        uint64_t v18 = (const char *)&qword_102481448;
      }
      else {
        uint64_t v18 = (const char *)qword_102481448;
      }
      sub_10006EF84(v17, v18, &v124);
      uint64_t v19 = sub_1000A6958();
      if (byte_102481477 >= 0) {
        uint64_t v20 = (const char *)&qword_102481460;
      }
      else {
        uint64_t v20 = (const char *)qword_102481460;
      }
      sub_1004D1284(v19, v20, &v123);
      float v21 = v126;
      uint64_t v22 = (char *)*((void *)&__p + 1);
      if (*((void *)&__p + 1) >= (unint64_t)v119)
      {
        int v24 = (char *)__p;
        uint64_t v25 = (uint64_t)(*((void *)&__p + 1) - __p) >> 2;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62) {
          sub_1001D7FD4();
        }
        uint64_t v27 = v119 - __p;
        if ((uint64_t)(v119 - __p) >> 1 > v26) {
          unint64_t v26 = v27 >> 1;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          uint64_t v29 = (char *)sub_10017EA34((uint64_t)&v119, v28);
          uint64_t v22 = (char *)*((void *)&__p + 1);
          int v24 = (char *)__p;
        }
        else
        {
          uint64_t v29 = 0;
        }
        uint64_t v30 = (float *)&v29[4 * v25];
        float *v30 = v21;
        uint64_t v23 = v30 + 1;
        while (v22 != v24)
        {
          int v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30-- - 1) = v31;
        }
        *(void *)&long long __p = v30;
        *((void *)&__p + 1) = v23;
        *(void *)&long long v119 = &v29[4 * v28];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        **((float **)&__p + 1) = v21;
        uint64_t v23 = (float *)(v22 + 4);
      }
      *((void *)&__p + 1) = v23;
      float v32 = v130[0];
      float v33 = (char *)v111;
      if ((unint64_t)v111 >= *((void *)&v111 + 1))
      {
        float v35 = (char *)v110[1];
        uint64_t v36 = (uint64_t)(v111 - (unint64_t)v110[1]) >> 2;
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 62) {
          sub_1001D7FD4();
        }
        int64_t v38 = *((void *)&v111 + 1) - (unint64_t)v110[1];
        if ((uint64_t)(*((void *)&v111 + 1) - (unint64_t)v110[1]) >> 1 > v37) {
          unint64_t v37 = v38 >> 1;
        }
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v39 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v37;
        }
        if (v39)
        {
          long long v40 = (char *)sub_10017EA34((uint64_t)&v111 + 8, v39);
          float v35 = (char *)v110[1];
          float v33 = (char *)v111;
        }
        else
        {
          long long v40 = 0;
        }
        int v41 = (float *)&v40[4 * v36];
        *int v41 = v32;
        v34 = v41 + 1;
        while (v33 != v35)
        {
          int v42 = *((_DWORD *)v33 - 1);
          v33 -= 4;
          *((_DWORD *)v41-- - 1) = v42;
        }
        v110[1] = v41;
        *(void *)&long long v111 = v34;
        *((void *)&v111 + 1) = &v40[4 * v39];
        if (v35) {
          operator delete(v35);
        }
      }
      else
      {
        *(float *)long long v111 = v32;
        v34 = (float *)(v33 + 4);
      }
      *(void *)&long long v111 = v34;
      float v43 = v129;
      uint64_t v44 = (char *)v112[1];
      if (v112[1] >= v113[0])
      {
        v46 = (char *)v112[0];
        int64_t v47 = ((char *)v112[1] - (char *)v112[0]) >> 2;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62) {
          sub_1001D7FD4();
        }
        int64_t v49 = (char *)v113[0] - (char *)v112[0];
        if (((char *)v113[0] - (char *)v112[0]) >> 1 > v48) {
          unint64_t v48 = v49 >> 1;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          uint64_t v51 = (char *)sub_10017EA34((uint64_t)v113, v50);
          v46 = (char *)v112[0];
          uint64_t v44 = (char *)v112[1];
        }
        else
        {
          uint64_t v51 = 0;
        }
        v52 = (float *)&v51[4 * v47];
        float *v52 = v43;
        v45 = v52 + 1;
        while (v44 != v46)
        {
          int v53 = *((_DWORD *)v44 - 1);
          v44 -= 4;
          *((_DWORD *)v52-- - 1) = v53;
        }
        v112[0] = v52;
        v112[1] = v45;
        v113[0] = &v51[4 * v50];
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *(float *)v112[1] = v43;
        v45 = v44 + 4;
      }
      v112[1] = v45;
      float v54 = v128;
      v55 = (char *)v114;
      if ((unint64_t)v114 >= *((void *)&v114 + 1))
      {
        v57 = (char *)v113[1];
        uint64_t v58 = (uint64_t)(v114 - (unint64_t)v113[1]) >> 2;
        unint64_t v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 62) {
          sub_1001D7FD4();
        }
        int64_t v60 = *((void *)&v114 + 1) - (unint64_t)v113[1];
        if ((uint64_t)(*((void *)&v114 + 1) - (unint64_t)v113[1]) >> 1 > v59) {
          unint64_t v59 = v60 >> 1;
        }
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v61 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v61 = v59;
        }
        if (v61)
        {
          v62 = (char *)sub_10017EA34((uint64_t)&v114 + 8, v61);
          v57 = (char *)v113[1];
          v55 = (char *)v114;
        }
        else
        {
          v62 = 0;
        }
        v63 = (float *)&v62[4 * v58];
        float *v63 = v54;
        v56 = v63 + 1;
        while (v55 != v57)
        {
          int v64 = *((_DWORD *)v55 - 1);
          v55 -= 4;
          *((_DWORD *)v63-- - 1) = v64;
        }
        v113[1] = v63;
        *(void *)&long long v114 = v56;
        *((void *)&v114 + 1) = &v62[4 * v61];
        if (v57) {
          operator delete(v57);
        }
      }
      else
      {
        *(float *)long long v114 = v54;
        v56 = (float *)(v55 + 4);
      }
      *(void *)&long long v114 = v56;
      float v65 = v127;
      char v66 = (char *)v115[1];
      if (v115[1] >= (void *)v116)
      {
        v68 = (char *)v115[0];
        int64_t v69 = ((char *)v115[1] - (char *)v115[0]) >> 2;
        unint64_t v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 62) {
          sub_1001D7FD4();
        }
        uint64_t v71 = v116 - (unint64_t)v115[0];
        if ((uint64_t)(v116 - (unint64_t)v115[0]) >> 1 > v70) {
          unint64_t v70 = v71 >> 1;
        }
        if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v72 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v72 = v70;
        }
        if (v72)
        {
          v73 = (char *)sub_10017EA34((uint64_t)&v116, v72);
          v68 = (char *)v115[0];
          char v66 = (char *)v115[1];
        }
        else
        {
          v73 = 0;
        }
        v74 = (float *)&v73[4 * v69];
        float *v74 = v65;
        char v67 = v74 + 1;
        while (v66 != v68)
        {
          int v75 = *((_DWORD *)v66 - 1);
          v66 -= 4;
          *((_DWORD *)v74-- - 1) = v75;
        }
        v115[0] = v74;
        v115[1] = v67;
        *(void *)&long long v116 = &v73[4 * v72];
        if (v68) {
          operator delete(v68);
        }
      }
      else
      {
        *(float *)v115[1] = v65;
        char v67 = v66 + 4;
      }
      v115[1] = v67;
      float v76 = v125;
      v77 = (char *)v117;
      if ((unint64_t)v117 >= *((void *)&v117 + 1))
      {
        v79 = (char *)*((void *)&v116 + 1);
        uint64_t v80 = (uint64_t)(v117 - *((void *)&v116 + 1)) >> 2;
        unint64_t v81 = v80 + 1;
        if ((unint64_t)(v80 + 1) >> 62) {
          sub_1001D7FD4();
        }
        uint64_t v82 = *((void *)&v117 + 1) - *((void *)&v116 + 1);
        if ((uint64_t)(*((void *)&v117 + 1) - *((void *)&v116 + 1)) >> 1 > v81) {
          unint64_t v81 = v82 >> 1;
        }
        if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v83 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v83 = v81;
        }
        if (v83)
        {
          v84 = (char *)sub_10017EA34((uint64_t)&v117 + 8, v83);
          v79 = (char *)*((void *)&v116 + 1);
          v77 = (char *)v117;
        }
        else
        {
          v84 = 0;
        }
        v85 = (float *)&v84[4 * v80];
        float *v85 = v76;
        std::string v78 = v85 + 1;
        while (v77 != v79)
        {
          int v86 = *((_DWORD *)v77 - 1);
          v77 -= 4;
          *((_DWORD *)v85-- - 1) = v86;
        }
        *((void *)&v116 + 1) = v85;
        *(void *)&long long v117 = v78;
        *((void *)&v117 + 1) = &v84[4 * v83];
        if (v79) {
          operator delete(v79);
        }
      }
      else
      {
        *(float *)long long v117 = v76;
        std::string v78 = (float *)(v77 + 4);
      }
      *(void *)&long long v117 = v78;
      int v87 = v124;
      v88 = (char *)v120;
      if ((unint64_t)v120 >= *((void *)&v120 + 1))
      {
        v90 = (char *)*((void *)&v119 + 1);
        uint64_t v91 = (uint64_t)(v120 - *((void *)&v119 + 1)) >> 2;
        unint64_t v92 = v91 + 1;
        if ((unint64_t)(v91 + 1) >> 62) {
          sub_1001D7FD4();
        }
        uint64_t v93 = *((void *)&v120 + 1) - *((void *)&v119 + 1);
        if ((uint64_t)(*((void *)&v120 + 1) - *((void *)&v119 + 1)) >> 1 > v92) {
          unint64_t v92 = v93 >> 1;
        }
        if ((unint64_t)v93 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v94 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v94 = v92;
        }
        if (v94)
        {
          v95 = (char *)sub_10017EA34((uint64_t)&v120 + 8, v94);
          v90 = (char *)*((void *)&v119 + 1);
          v88 = (char *)v120;
        }
        else
        {
          v95 = 0;
        }
        v96 = (int *)&v95[4 * v91];
        int *v96 = v87;
        v89 = v96 + 1;
        while (v88 != v90)
        {
          int v97 = *((_DWORD *)v88 - 1);
          v88 -= 4;
          *--v96 = v97;
        }
        *((void *)&v119 + 1) = v96;
        *(void *)&long long v120 = v89;
        *((void *)&v120 + 1) = &v95[4 * v94];
        if (v90) {
          operator delete(v90);
        }
      }
      else
      {
        *(_DWORD *)long long v120 = v124;
        v89 = v88 + 4;
      }
      *(void *)&long long v120 = v89;
      v98 = (_OWORD *)*((void *)&v121 + 1);
      if (*((void *)&v121 + 1) >= v122)
      {
        uint64_t v100 = sub_1016FD368((uint64_t *)&v121, (long long *)&v123);
      }
      else
      {
        if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_1000DC48C(*((unsigned char **)&v121 + 1), v123.__r_.__value_.__l.__data_, v123.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v99 = *(_OWORD *)&v123.__r_.__value_.__l.__data_;
          *(void *)(*((void *)&v121 + 1) + 16) = *((void *)&v123.__r_.__value_.__l + 2);
          _OWORD *v98 = v99;
        }
        uint64_t v100 = (uint64_t)v98 + 24;
      }
      *((void *)&v121 + 1) = v100;
      ++v4;
    }
    while (v4 != v105);
    [(CLPressureStatsCollector *)self cleanCache];
    uint64_t v101 = sub_1000A6958();
    if (byte_10248148F >= 0) {
      v102 = (const char *)&qword_102481478;
    }
    else {
      v102 = (const char *)qword_102481478;
    }
    sub_10016332C(v101, v102, &Current);
    uint64_t v103 = sub_1000A6958();
    (*(void (**)(uint64_t))(*(void *)v103 + 944))(v103);
    sub_100DA3188((uint64_t)v107);
    if (SHIBYTE(v123.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v123.__r_.__value_.__l.__data_);
    }
  }
}

- (void)sendCAMetric:(id *)a3
{
  v15[0] = @"medianAbsDevOfTCO";
  *(float *)&double v3 = a3->var5;
  v16[0] = +[NSNumber numberWithFloat:v3];
  v15[1] = @"meanAbsOfPressureError";
  *(float *)&double v5 = a3->var0;
  v16[1] = +[NSNumber numberWithFloat:v5];
  v15[2] = @"varianceOfPressureError";
  *(float *)&double v6 = a3->var1;
  v16[2] = +[NSNumber numberWithFloat:v6];
  v15[3] = @"deltaPressure";
  *(float *)&double v7 = a3->var2;
  v16[3] = +[NSNumber numberWithFloat:v7];
  v15[4] = @"deltaTemperature";
  *(float *)&double v8 = a3->var3;
  v16[4] = +[NSNumber numberWithFloat:v8];
  v15[5] = @"TCO";
  *(float *)&double v9 = a3->var4;
  v16[5] = +[NSNumber numberWithFloat:v9];
  v15[6] = @"flightsOfStairsIn24Hr";
  v16[6] = +[NSNumber numberWithInt:a3->var6];
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:7];
  if (qword_1024190D0 != -1) {
    dispatch_once(&qword_1024190D0, &stru_1022F73B8);
  }
  uint64_t v11 = qword_1024190D8;
  if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[CLPressureStatsCollector] Sending event, %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022F73B8);
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPressureStatsCollector sendCAMetric:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  AnalyticsSendEventLazy();
}

- (void).cxx_destruct
{
  sub_100B8191C(&self->fSlopeEstimator, a2);
  sub_10126CC74(&self->fK2Detector);
  value = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  int v4 = self->fPressureDispatcher.__ptr_.__value_;
  self->fPressureDispatcher.__ptr_.__value_ = 0;
  if (v4)
  {
    double v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  self->fPressureDispatcher.__ptr_.__value_ = 0;
  self->fStatusClient.__ptr_.__value_ = 0;
  sub_10126CBE4((uint64_t)&self->fK2Detector);
  sub_100B818A0((uint64_t)&self->fSlopeEstimator, 20, 55);
  return self;
}

@end