@interface DispatchMonotonicTimer
- (DispatchMonotonicTimer)initWithName:(id)a3;
- (void)dealloc;
- (void)implOnQueuePause;
- (void)implOnQueueResume;
- (void)implOnQueueUpdateTimer;
- (void)invalidate;
- (void)onQueueInvalidate;
@end

@implementation DispatchMonotonicTimer

- (void)implOnQueueResume
{
  if (qword_10047BED8 == -1)
  {
    v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BED8, &stru_1004684E0);
  v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    int64_t rep = self->super._delay.__rep_;
    int64_t v5 = self->super._interval.__rep_;
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218240;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = rep;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "resume dispatch timer. delay = %lld ns, interval = %lld ns", (uint8_t *)&buf, 0x16u);
  }
LABEL_4:
  if (self->_suspendCount != 1)
  {
    sub_1000AE4B0(v7, "");
    sub_1003026A8("Cannot resume a non-suspended timer. cnt = ", &buf);
    sub_1002A3880(&self->_suspendCount, &v10);
    sub_10016A2C4((uint64_t)v7, (uint64_t)&buf, 2);
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v10.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_10:
        if ((v8 & 0x80000000) == 0) {
          goto LABEL_11;
        }
LABEL_14:
        operator delete(v7[0]);
LABEL_11:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_10;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v8 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  dispatch_resume((dispatch_object_t)self->_timer);
  --self->_suspendCount;
}

- (void)implOnQueuePause
{
  p_suspendCount = &self->_suspendCount;
  if (self->_suspendCount)
  {
    sub_1000AE4B0(v5, "");
    sub_100282374("Cannot suspend an already-suspended timer. cnt = ", &buf);
    sub_1002A3880(p_suspendCount, &v8);
    sub_10016A2C4((uint64_t)v5, (uint64_t)&buf, 2);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v8.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_8:
        if ((v6 & 0x80000000) == 0) {
          goto LABEL_9;
        }
LABEL_14:
        operator delete(v5[0]);
LABEL_9:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_8;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
  dispatch_suspend((dispatch_object_t)self->_timer);
  ++*p_suspendCount;
  if (qword_10047BED8 == -1)
  {
    v3 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    goto LABEL_4;
  }
  dispatch_once(&qword_10047BED8, &stru_1004684E0);
  v3 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_4:
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "dispatch timer paused", (uint8_t *)&buf, 2u);
  }
}

- (void)implOnQueueUpdateTimer
{
  int64_t rep = self->super._interval.__rep_;
  if (qword_10047BED8 != -1) {
    dispatch_once(&qword_10047BED8, &stru_1004684E0);
  }
  v4 = qword_10047BEE0;
  if (os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_DEBUG))
  {
    int64_t v5 = self->super._delay.__rep_;
    int64_t v6 = self->super._interval.__rep_;
    *(_DWORD *)std::string buf = 134218240;
    int64_t v31 = v5;
    __int16 v32 = 2048;
    int64_t v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Updating timer with delay = %lld ns, interval = %lld ns", buf, 0x16u);
  }
  timer = self->_timer;
  int64_t v8 = self->super._delay.__rep_;
  if (v8 < 0)
  {
    char v24 = 0;
    LOBYTE(v23) = 0;
    memset(&v28, 0, sizeof(v28));
    std::string::assign(&v28, "Do not support negative delays: ");
    memset(&v29, 0, sizeof(v29));
    v35 = &buf[2];
    v36 = v34;
    v25[0] = -v8;
    v25[1] = v34;
    char v26 = 48;
    int v27 = 48;
    uint64_t v10 = sub_100169AA8((uint64_t)v25);
    v11 = &v29;
    *(unsigned char *)(v10 - 1) = 45;
    v12 = (std::string::value_type *)(v10 - 1);
    v35 = (uint8_t *)(v10 - 1);
    v36 = v34;
    unint64_t v13 = (unint64_t)&v34[-v10 + 1];
    if (v13 >= 0x17)
    {
      std::string::__grow_by(&v29, 0x16uLL, v13 - 22, 0, 0, 0, 0);
      v29.__r_.__value_.__l.__size_ = 0;
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        v11 = (std::string *)v29.__r_.__value_.__r.__words[0];
      }
    }
    if (v12 == v34)
    {
      v15 = v11;
    }
    else
    {
      v14 = &buf[-v10 + 42];
      if ((unint64_t)v14 >= 0x20)
      {
        if ((unint64_t)v11->__r_.__value_.__r.__words - v10 + 1 >= 0x20)
        {
          v15 = (std::string *)((char *)v11 + ((unint64_t)v14 & 0xFFFFFFFFFFFFFFE0));
          v12 += (unint64_t)v14 & 0xFFFFFFFFFFFFFFE0;
          v16 = (long long *)(v10 + 15);
          v17 = &v11->__r_.__value_.__r.__words[2];
          unint64_t v18 = (unint64_t)v14 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            long long v19 = *v16;
            *((_OWORD *)v17 - 1) = *(v16 - 1);
            *(_OWORD *)v17 = v19;
            v16 += 2;
            v17 += 4;
            v18 -= 32;
          }
          while (v18);
          if (v14 == (uint8_t *)((unint64_t)v14 & 0xFFFFFFFFFFFFFFE0)) {
            goto LABEL_21;
          }
        }
        else
        {
          v15 = v11;
        }
      }
      else
      {
        v15 = v11;
      }
      do
      {
        std::string::value_type v20 = *v12++;
        v15->__r_.__value_.__s.__data_[0] = v20;
        v15 = (std::string *)((char *)v15 + 1);
      }
      while (v12 != v34);
    }
LABEL_21:
    v15->__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
      v29.__r_.__value_.__l.__size_ = (std::string::size_type)&v34[-v10 + 1];
    }
    else {
      *((unsigned char *)&v29.__r_.__value_.__s + 23) = v13 & 0x7F;
    }
    sub_10016A2C4((uint64_t)&v23, (uint64_t)&v28, 2);
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v29.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_26:
        if ((v24 & 0x80000000) == 0) {
          goto LABEL_27;
        }
LABEL_35:
        operator delete(v23);
LABEL_27:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_26;
    }
    operator delete(v28.__r_.__value_.__l.__data_);
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    dispatch_time_t v9 = -1;
  }
  else {
    dispatch_time_t v9 = dispatch_time(0, v8);
  }
  if (rep == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v21 = -1;
  }
  else {
    uint64_t v21 = rep;
  }
  dispatch_source_set_timer(timer, v9, v21, 0);
}

- (DispatchMonotonicTimer)initWithName:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DispatchMonotonicTimer;
  id v3 = [(AbstractMonotonicTimer *)&v14 initWithName:a3];
  v4 = (DispatchMonotonicTimer *)v3;
  if (v3)
  {
    *((_DWORD *)v3 + 12) = 1;
    dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v3 + 3));
    timer = v4->_timer;
    v4->_timer = (OS_dispatch_source *)v5;

    objc_initWeak(&location, v4);
    v7 = v4->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3321888768;
    handler[2] = sub_100007E04;
    handler[3] = &unk_1004684B0;
    objc_copyWeak(&to, &location);
    objc_copyWeak(&v12, &to);
    dispatch_source_set_event_handler(v7, handler);
    objc_destroyWeak(&to);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    int64_t v8 = v4;
  }

  return v4;
}

- (void)dealloc
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._q);
  q = self->super._q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033A708;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(q, block);
  v4.receiver = self;
  v4.super_class = (Class)DispatchMonotonicTimer;
  [(DispatchMonotonicTimer *)&v4 dealloc];
}

- (void)invalidate
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->super._q);
  q = self->super._q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10033A7A0;
  block[3] = &unk_1004527B8;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)onQueueInvalidate
{
  p_suspendCount = &self->_suspendCount;
  if (self->_suspendCount)
  {
    sub_1000AE4B0(v6, "");
    sub_1002803AC("Timer is unbalanced - cannot be cancelled while suspended. cnt = ", &v8);
    sub_1002A3880(p_suspendCount, &v9);
    sub_10016A2C4((uint64_t)v6, (uint64_t)&v8, 2);
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v9.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v8.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((v7 & 0x80000000) == 0) {
          goto LABEL_6;
        }
LABEL_9:
        operator delete(v6[0]);
LABEL_6:
        sub_1000D11E0((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v8.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v8.__r_.__value_.__l.__data_);
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v4.receiver = self;
  v4.super_class = (Class)DispatchMonotonicTimer;
  [(AbstractMonotonicTimer *)&v4 onQueueInvalidate];
  int *p_suspendCount = 0;
}

- (void).cxx_destruct
{
}

@end