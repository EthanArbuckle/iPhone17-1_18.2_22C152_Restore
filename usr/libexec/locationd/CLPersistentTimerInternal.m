@interface CLPersistentTimerInternal
- (CLPersistentTimerInternal)initWithFireTime:(double)a3 timeInterval:(double)a4 serviceIdentifier:(const char *)a5 wakeDevice:(BOOL)a6 clTimer:(void *)a7 silo:(id)a8 minimumEarlyFireProportion:(double)a9;
- (id).cxx_construct;
- (void)bounce_timerFired:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setNextFireTime:(double)a3;
- (void)setTimerWithInterval:(double)a3;
- (void)timerFired:(id)a3;
@end

@implementation CLPersistentTimerInternal

- (void)setTimerWithInterval:(double)a3
{
  [(CLSilo *)self->_silo assertInside];
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022D6570);
  }
  v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
      p_strIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_strIdentifier->__r_.__value_.var0.var1.__data_;
    }
    double v7 = -1.0;
    if (a3 != 1.79769313e308) {
      double v7 = a3;
    }
    *(_DWORD *)buf = 136315394;
    v20 = p_strIdentifier;
    __int16 v21 = 2048;
    double v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, %.1lf", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  [(CLPersistentTimerInternal *)self invalidate];
  if (a3 <= 0.0)
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    v11 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      data = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
        data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315394;
      v20 = data;
      __int16 v21 = 2048;
      double v22 = 1.0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "interval, %s, %.5lf, flooring to 1.0, interval", buf, 0x16u);
    }
    a3 = 1.0;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022D6570);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
  }
  else if (a3 == 1.79769313e308)
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    v8 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      v9 = &self->_strIdentifier;
      if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
        v9 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v9->__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315138;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, DBL_MAX", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022D6570);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return;
  }
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022D6570);
  }
  v13 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    v14 = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
      v14 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)v14->__r_.__value_.var0.var1.__data_;
    }
    *(_DWORD *)buf = 136315394;
    v20 = v14;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "setTimerWithInterval, %s, interval, %.1lf", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  v15 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:*(void *)&self->_strIdentifier.__r_.var0 serviceIdentifier:self target:"bounce_timerFired:" selector:0 userInfo:a3];
  self->_pcTimer = v15;
  [(PCPersistentTimer *)v15 setMinimumEarlyFireProportion:*(double *)&self->_wakeDevice];
  [(PCPersistentTimer *)self->_pcTimer setDisableSystemWaking:LOBYTE(self->_strIdentifier.var0) == 0];
  [(PCPersistentTimer *)self->_pcTimer scheduleInRunLoop:+[NSRunLoop mainRunLoop]];
}

- (void)setNextFireTime:(double)a3
{
  [(CLSilo *)self->_silo assertInside];
  double v5 = a3 - CFAbsoluteTimeGetCurrent();

  [(CLPersistentTimerInternal *)self setTimerWithInterval:v5];
}

- (void)invalidate
{
  [(CLSilo *)self->_silo assertInside];
  pcTimer = self->_pcTimer;
  if (pcTimer)
  {
    v4 = pcTimer;
    self->_pcTimer = 0;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000DC48C(__dst, self->_strIdentifier.__r_.__value_.var0.var1.__data_, self->_strIdentifier.__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__dst = *(_OWORD *)self->_strIdentifier.__r_.__value_.var0.var0.__data_;
      uint64_t v14 = *((void *)&self->_strIdentifier.__r_.__value_.var0.var1 + 2);
    }
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    double v5 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
    {
      v6 = __dst;
      if (v14 < 0) {
        v6 = (void **)__dst[0];
      }
      *(_DWORD *)buf = 136315394;
      v20 = v6;
      __int16 v21 = 2048;
      double v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Scheduling invalidation, %s, %p", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022D6570);
      }
      v8 = __dst;
      if (v14 < 0) {
        v8 = (void **)__dst[0];
      }
      int v15 = 136315394;
      v16 = v8;
      __int16 v17 = 2048;
      v18 = v4;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal invalidate]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    id v7 = +[CLSilo main];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3321888768;
    v10[2] = sub_10011EB18;
    v10[3] = &unk_1022D6540;
    if (SHIBYTE(v14) < 0)
    {
      sub_1000DC48C(&__p, __dst[0], (unint64_t)__dst[1]);
    }
    else
    {
      long long __p = *(_OWORD *)__dst;
      uint64_t v12 = v14;
    }
    v10[4] = v4;
    [v7 async:v10];
    if (SHIBYTE(v12) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v14) < 0) {
      operator delete(__dst[0]);
    }
  }
}

- (CLPersistentTimerInternal)initWithFireTime:(double)a3 timeInterval:(double)a4 serviceIdentifier:(const char *)a5 wakeDevice:(BOOL)a6 clTimer:(void *)a7 silo:(id)a8 minimumEarlyFireProportion:(double)a9
{
  [a8 assertInside];
  if (!a7) {
    sub_101A75764();
  }
  v19.receiver = self;
  v19.super_class = (Class)CLPersistentTimerInternal;
  __int16 v17 = [(CLPersistentTimerInternal *)&v19 init];
  if (v17)
  {
    *((void *)v17 + 7) = [objc_alloc((Class)NSString) initWithCString:a5 encoding:4];
    std::string::assign((std::string *)(v17 + 32), a5);
    v17[64] = a6;
    *((void *)v17 + 2) = a7;
    *((void *)v17 + 3) = a8;
    *((double *)v17 + 9) = a4;
    *((double *)v17 + 10) = a9;
    if (a3 >= 0.0) {
      a4 = a3 - CFAbsoluteTimeGetCurrent();
    }
    [v17 setTimerWithInterval:a4];
  }
  return (CLPersistentTimerInternal *)v17;
}

- (void)dealloc
{
  if (self->_pcTimer) {
    sub_101A75A54();
  }
  if (!self->_clTimer) {
    sub_101A758DC();
  }

  *(void *)&self->_strIdentifier.__r_.var0 = 0;
  self->_silo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPersistentTimerInternal;
  [(CLPersistentTimerInternal *)&v3 dealloc];
}

- (void)bounce_timerFired:(id)a3
{
  silo = self->_silo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100998688;
  v4[3] = &unk_10229FEB0;
  v4[4] = self;
  v4[5] = a3;
  [(CLSilo *)silo async:v4];
}

- (void)timerFired:(id)a3
{
  [(CLSilo *)self->_silo assertInside];
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022D6570);
  }
  double v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
      p_strIdentifier = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_strIdentifier->__r_.__value_.var0.var1.__data_;
    }
    clTimer = self->_clTimer;
    *(_DWORD *)buf = 136315650;
    v10 = p_strIdentifier;
    __int16 v11 = 2048;
    id v12 = a3;
    __int16 v13 = 2048;
    uint64_t v14 = clTimer;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "timerFired: timer, _clTimer, %s, %p, %p", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022D6570);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPersistentTimerInternal timerFired:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (self->_pcTimer == a3)
  {
    if (*(double *)&self->_serviceIdentifier != 1.79769313e308) {
      -[CLPersistentTimerInternal setTimerWithInterval:](self, "setTimerWithInterval:");
    }
    sub_1009988CC((uint64_t)self->_clTimer);
  }
}

- (void).cxx_destruct
{
  if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_strIdentifier.__r_.__value_.var0.var1.__data_);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0uLL;
  *((void *)self + 6) = 0;
  return self;
}

@end