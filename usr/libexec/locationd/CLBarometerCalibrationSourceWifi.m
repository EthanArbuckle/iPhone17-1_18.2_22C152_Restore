@interface CLBarometerCalibrationSourceWifi
- (CLBarometerCalibrationSourceWifi)initWithUniverse:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData>)convertAPToWifiData:(AccessPoint *)a3;
- (void)dealloc;
- (void)disableSource;
- (void)enableSource;
- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)processActiveScan:(const void *)a3;
- (void)processScanCache:(const void *)a3;
- (void)writeWifiAPToJson:(id)a3 withData:(const void *)a4;
@end

@implementation CLBarometerCalibrationSourceWifi

- (CLBarometerCalibrationSourceWifi)initWithUniverse:(id)a3 delegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLBarometerCalibrationSourceWifi;
  v5 = [(CLBarometerCalibrationSource *)&v7 initWithUniverse:a3 delegate:a4];
  if (v5)
  {
    v5->_wifiServiceProxy = (CLWifiServiceProtocol *)[objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", @"CLWifiService")];
    sub_1001AE6FC();
  }
  return 0;
}

- (void)enableSource
{
  if (!self->super._sourceEnabled) {
    sub_1005E05AC();
  }
}

- (void)disableSource
{
  if (self->super._sourceEnabled)
  {
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3];
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
    self->super._sourceEnabled = 0;
  }
}

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  if (a3 == 12)
  {
    if (sub_101118CF4(*(_DWORD *)(a4 + 140)))
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102321E50);
      }
      objc_super v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        v8 = sub_100D54ED8(*(_DWORD *)(a4 + 140));
        *(_DWORD *)buf = 136446210;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "ignoring NotificationScanCache source %{public}s", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_102321E50);
        }
        sub_100D54ED8(*(_DWORD *)(a4 + 140));
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102321E50);
      }
      v10 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "received wifi scan cache notification", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_102321E50);
        }
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      [a1 processScanCache:a4 + 112];
    }
  }
  else if (a3 == 3)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102321E50);
    }
    v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received wifi scan notification", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102321E50);
      }
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi onWifiServiceNotification:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    [a1 processActiveScan:a4 + 112];
  }
}

- (void)processActiveScan:(const void *)a3
{
  if (self->lastSubmissionToSourceAggregator == 1.79769313e308) {
    self->double lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
  }
  if (CFAbsoluteTimeGetCurrent() > self->lastSubmissionToSourceAggregator + 5.0)
  {
    v35 = a3;
    sub_10137CF90((uint64_t)&self->activeScanBuffer, 0xAu, (uint64_t *)&v47);
    v6 = v47;
    v5 = v48;
    if (v47 != v48)
    {
      while (1)
      {
        v8 = *v6;
        objc_super v7 = (std::__shared_weak_count *)v6[1];
        if (v7)
        {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
          delegate = self->super._delegate;
          v46 = v7;
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          delegate = self->super._delegate;
          v46 = 0;
        }
        v45 = v8;
        [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:2 withData:&v45];
        if (v46) {
          sub_1000DB0A0(v46);
        }
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_102321E50);
        }
        v10 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
        {
          sub_10006DE8C(&__p);
          p_p = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          int v12 = *((_DWORD *)v8 + 4);
          int v13 = *((_DWORD *)v8 + 6);
          uint64_t v14 = *v8;
          *(_DWORD *)buf = 68290051;
          *(_DWORD *)&uint8_t buf[4] = 0;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "";
          *(_WORD *)&buf[18] = 2081;
          *(void *)&buf[20] = p_p;
          *(_WORD *)&buf[28] = 1025;
          *(_DWORD *)&buf[30] = v12;
          *(_WORD *)&buf[34] = 1025;
          *(_DWORD *)&buf[36] = v13;
          *(_WORD *)&buf[40] = 2049;
          *(void *)&buf[42] = v14;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"submit wifi scan data\", \"mac\":%{private, location:escape_only}s, \"channel\":%{private}d, \"rssi\":%{private}d, \"scan time stamp_s\":\"%{private}.09f\"}", buf, 0x32u);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            break;
          }
        }
        if (v7) {
          goto LABEL_17;
        }
LABEL_18:
        v6 += 2;
        if (v6 == v5) {
          goto LABEL_22;
        }
      }
      operator delete(__p.__r_.__value_.__l.__data_);
      if (!v7) {
        goto LABEL_18;
      }
LABEL_17:
      sub_1000DB0A0(v7);
      goto LABEL_18;
    }
LABEL_22:
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102321E50);
    }
    v15 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      unint64_t value = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      uint64_t v18 = (uint64_t)v47;
      v17 = v48;
      double lastSubmissionToSourceAggregator = self->lastSubmissionToSourceAggregator;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 134218752;
      *(void *)&uint8_t buf[4] = value;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = ((uint64_t)v17 - v18) >> 4;
      *(_WORD *)&buf[22] = 2048;
      *(double *)&buf[24] = lastSubmissionToSourceAggregator;
      *(_WORD *)&buf[32] = 2048;
      *(CFAbsoluteTime *)&buf[34] = Current;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "buffered %zu samples, submitted %zu samples, between %f and %f", buf, 0x2Au);
    }
    a3 = v35;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102321E50);
      }
      unint64_t v29 = self->activeScanBuffer.buffer.__table_.__p2_.__value_;
      uint64_t v31 = (uint64_t)v47;
      v30 = v48;
      double v32 = self->lastSubmissionToSourceAggregator;
      CFAbsoluteTime v33 = CFAbsoluteTimeGetCurrent();
      LODWORD(__p.__r_.__value_.__l.__data_) = 134218752;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = v29;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = ((uint64_t)v30 - v31) >> 4;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
      double v50 = v32;
      __int16 v51 = 2048;
      CFAbsoluteTime v52 = v33;
      v34 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSourceWifi processActiveScan:]", "%s\n", v34);
      if (v34 != buf) {
        free(v34);
      }
      a3 = v35;
    }
    sub_10017F9E4((uint64_t)&self->activeScanBuffer);
    self->double lastSubmissionToSourceAggregator = CFAbsoluteTimeGetCurrent();
    *(void *)buf = &v47;
    sub_1000C5954((void ***)buf);
  }
  uint64_t v21 = *(void *)a3;
  uint64_t v22 = *((void *)a3 + 1);
  if (v21 != v22)
  {
    v23 = (long long *)(v21 + 8);
    do
    {
      uint64_t v24 = (uint64_t)v23 - 8;
      *(void *)buf = *((void *)v23 - 1);
      if (*((char *)v23 + 23) < 0)
      {
        sub_1000DC48C(&buf[8], *(void **)v23, *((void *)v23 + 1));
      }
      else
      {
        long long v25 = *v23;
        *(void *)&buf[24] = *((void *)v23 + 2);
        *(_OWORD *)&buf[8] = v25;
      }
      long long v26 = *(long long *)((char *)v23 + 24);
      long long v27 = *(long long *)((char *)v23 + 40);
      long long v28 = *(long long *)((char *)v23 + 56);
      uint64_t v55 = *((void *)v23 + 9);
      *(_OWORD *)&buf[48] = v27;
      long long v54 = v28;
      *(_OWORD *)&buf[32] = v26;
      if (!sub_10137D058((uint64_t)buf))
      {
        uint64_t v36 = *(void *)buf;
        if ((buf[31] & 0x80000000) != 0)
        {
          sub_1000DC48C(&v37, *(void **)&buf[8], *(unint64_t *)&buf[16]);
        }
        else
        {
          long long v37 = *(_OWORD *)&buf[8];
          uint64_t v38 = *(void *)&buf[24];
        }
        long long v39 = *(_OWORD *)&buf[32];
        long long v40 = *(_OWORD *)&buf[48];
        long long v41 = v54;
        uint64_t v42 = v55;
        [(CLBarometerCalibrationSourceWifi *)self convertAPToWifiData:&v36];
        sub_10137D130(&self->activeScanBuffer.buffer.__table_.__bucket_list_.__ptr_.__value_, &v43);
        if (v44) {
          sub_1000DB0A0(v44);
        }
        if (SHIBYTE(v38) < 0) {
          operator delete((void *)v37);
        }
      }
      if ((buf[31] & 0x80000000) != 0) {
        operator delete(*(void **)&buf[8]);
      }
      v23 = (long long *)((char *)v23 + 88);
    }
    while (v24 + 88 != v22);
  }
}

- (void)processScanCache:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (*(void *)a3 != v3)
  {
    uint64_t v5 = *(void *)a3 + 8;
    do
    {
      uint64_t v6 = v5 - 8;
      uint64_t v21 = *(void *)(v5 - 8);
      if (*(char *)(v5 + 23) < 0)
      {
        sub_1000DC48C(&v22, *(void **)v5, *(void *)(v5 + 8));
      }
      else
      {
        long long v7 = *(_OWORD *)v5;
        uint64_t v23 = *(void *)(v5 + 16);
        long long v22 = v7;
      }
      long long v8 = *(_OWORD *)(v5 + 24);
      long long v9 = *(_OWORD *)(v5 + 40);
      long long v10 = *(_OWORD *)(v5 + 56);
      uint64_t v27 = *(void *)(v5 + 72);
      long long v25 = v9;
      long long v26 = v10;
      long long v24 = v8;
      if (!sub_10137D058((uint64_t)&v21))
      {
        delegate = self->super._delegate;
        uint64_t v12 = v21;
        if (SHIBYTE(v23) < 0)
        {
          sub_1000DC48C(&__p, (void *)v22, *((unint64_t *)&v22 + 1));
        }
        else
        {
          long long __p = v22;
          uint64_t v14 = v23;
        }
        long long v15 = v24;
        long long v16 = v25;
        long long v17 = v26;
        uint64_t v18 = v27;
        [(CLBarometerCalibrationSourceWifi *)self convertAPToWifiData:&v12];
        long long v20 = v19;
        long long v19 = 0uLL;
        [(CLBarometerCalibrationSourceClient *)delegate didUpdateSource:2 withData:&v20];
        if (*((void *)&v20 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v20 + 1));
        }
        if (*((void *)&v19 + 1)) {
          sub_1000DB0A0(*((std::__shared_weak_count **)&v19 + 1));
        }
        if (SHIBYTE(v14) < 0) {
          operator delete((void *)__p);
        }
      }
      if (SHIBYTE(v23) < 0) {
        operator delete((void *)v22);
      }
      v5 += 88;
    }
    while (v6 + 88 != v3);
  }
}

- (shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationWifiData>)convertAPToWifiData:(AccessPoint *)a3
{
  uint64_t v5 = v3;
  uint64_t v6 = (CLBarometerCalibrationWifiData *)sub_10137EA90(v3);
  uint64_t v8 = *v5;
  *(void *)(v8 + 8) = a3->var0.var0;
  *(_DWORD *)(v8 + 16) = a3->var1.var0;
  *(_DWORD *)(v8 + 24) = a3->var1.__r_.var0;
  if (*((char *)&a3->var1.__r_.__value_.var0.var1 + 23) < 0)
  {
    uint64_t v6 = (CLBarometerCalibrationWifiData *)sub_1000DC48C(__p, a3->var1.__r_.__value_.var0.var1.__data_, a3->var1.__r_.__value_.var0.var1.__size_);
    uint64_t v8 = *v5;
  }
  else
  {
    *(_OWORD *)long long __p = *(_OWORD *)a3->var1.__r_.__value_.var0.var0.__data_;
    uint64_t v11 = *((void *)&a3->var1.__r_.__value_.var0.var1 + 2);
  }
  long long v9 = (void *)HIBYTE(v11);
  if (v11 < 0) {
    long long v9 = __p[1];
  }
  *(unsigned char *)(v8 + 20) = v9 == 0;
  if (SHIBYTE(v11) < 0)
  {
    operator delete(__p[0]);
    uint64_t v8 = *v5;
  }
  *(void *)uint64_t v8 = a3[1].var1.__r_.__value_.var0.var1.__data_;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)dealloc
{
  unint64_t value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }

  self->_wifiServiceProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLBarometerCalibrationSourceWifi;
  [(CLBarometerCalibrationSource *)&v4 dealloc];
}

- (void)writeWifiAPToJson:(id)a3 withData:(const void *)a4
{
  id v5 = [objc_alloc((Class)NSOutputStream) initToFileAtPath:a3 append:1];
  [v5 open];
  std::string::size_type v24 = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = *((void *)a4 + 1);
  if (*(void *)a4 != v7)
  {
    double v8 = Current;
    uint64_t v9 = *(void *)a4 + 8;
    do
    {
      uint64_t v11 = v9 - 8;
      uint64_t v10 = *(void *)(v9 - 8);
      *(void *)buf = v10;
      if (*(char *)(v9 + 23) < 0)
      {
        sub_1000DC48C(&buf[8], *(void **)v9, *(void *)(v9 + 8));
        uint64_t v10 = *(void *)buf;
      }
      else
      {
        long long v12 = *(_OWORD *)v9;
        uint64_t v26 = *(void *)(v9 + 16);
        *(_OWORD *)&buf[8] = v12;
      }
      long long v13 = *(_OWORD *)(v9 + 24);
      long long v14 = *(_OWORD *)(v9 + 40);
      long long v15 = *(_OWORD *)(v9 + 56);
      uint64_t v30 = *(void *)(v9 + 72);
      long long v28 = v14;
      long long v29 = v15;
      long long v27 = v13;
      v32[0] = @"mac";
      uint64_t v23 = v10;
      sub_10006DE8C(&v31);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v16 = &v31;
      }
      else {
        long long v16 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      v33[0] = +[NSString stringWithUTF8String:v16];
      v32[1] = @"channel";
      v33[1] = +[NSNumber numberWithInt:DWORD2(v27)];
      v32[2] = @"rssi";
      v33[2] = +[NSNumber numberWithInt:v27];
      v32[3] = @"hidden";
      if (SHIBYTE(v26) < 0)
      {
        sub_1000DC48C(__p, *(void **)&buf[8], *(unint64_t *)&buf[16]);
      }
      else
      {
        *(_OWORD *)long long __p = *(_OWORD *)&buf[8];
        uint64_t v22 = v26;
      }
      long long v17 = (void *)HIBYTE(v22);
      if (v22 < 0) {
        long long v17 = __p[1];
      }
      v33[3] = +[NSNumber numberWithBool:v17 == 0];
      v32[4] = @"timestamp";
      v33[4] = +[NSNumber numberWithDouble:*((double *)&v28 + 1)];
      v32[5] = @"collectionTime";
      v33[5] = +[NSNumber numberWithDouble:v8];
      uint64_t v18 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:6];
      if (SHIBYTE(v22) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      +[NSJSONSerialization writeJSONObject:v18 toStream:v5 options:8 error:&v24];
      if (SHIBYTE(v26) < 0) {
        operator delete(*(void **)&buf[8]);
      }
      v9 += 88;
    }
    while (v11 + 88 != v7);
  }
  if (v24)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_102321E50);
    }
    long long v19 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to serialize dictionary data to json stream. Error: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_102321E50);
      }
      LODWORD(v31.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = v24;
      long long v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBarometerCalibrationSourceWifi writeWifiAPToJson:withData:]", "%s\n", v20);
      if (v20 != buf) {
        free(v20);
      }
    }
  }
  [v5 close:Current];
}

- (void).cxx_destruct
{
  sub_10017FBB4((uint64_t)&self->activeScanBuffer);
  unint64_t value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value)
  {
    objc_super v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

@end