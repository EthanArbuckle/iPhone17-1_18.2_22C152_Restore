@interface CLWMWatchOrientation
- (CLWMWatchOrientation)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5;
- (id).cxx_construct;
- (int)getSampleCount;
- (void)onWatchOrientationNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3;
- (void)setupListener;
- (void)stop;
- (void)teardownListeners;
- (void)writeWatchOnWristStatus;
- (void)writeWatchOrientation;
@end

@implementation CLWMWatchOrientation

- (CLWMWatchOrientation)initWithDelegate:(id)a3 universeCopy:(id)a4 settings:(SettingStructure *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CLWMWatchOrientation;
  result = [(CLWMBase *)&v9 init];
  if (result)
  {
    *((void *)result + 5) = a3;
    *((void *)result + 6) = a4;
    *((unsigned char *)result + 96) = a5->disableWatchOrientation;
    *((unsigned char *)result + 97) = a5->disableWatchOnWristStatus;
    *((void *)result + 7) = 0x200000002;
    *((void *)result + 8) = 0;
    *((_DWORD *)result + 18) = 0;
    *((void *)result + 10) = 0;
    *(_DWORD *)((char *)result + 87) = 0;
    *((_DWORD *)result + 25) = 0;
  }
  return result;
}

- (void)stop
{
  [(CLWMWatchOrientation *)self writeWatchOrientation];

  [(CLWMWatchOrientation *)self writeWatchOnWristStatus];
}

- (void)setupListener
{
  if (!*((void *)self + 2)) {
    sub_100871608();
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234DA00);
  }
  v2 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA00);
    }
  }
  v3 = qword_102419198;
  if (os_signpost_enabled((os_log_t)qword_102419198))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Duplicate creation of watch orientation listener.", "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234DA00);
    }
  }
  v4 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&buf[4] = 0;
    __int16 v6 = 2082;
    v7 = "";
    __int16 v8 = 2082;
    objc_super v9 = "assert";
    __int16 v10 = 2081;
    v11 = "!_watchOrientationObserverClient";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Duplicate creation of watch orientation listener.\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }
  abort_report_np();
}

- (void)teardownListeners
{
  uint64_t v3 = *((void *)self + 2);
  *((void *)self + 2) = 0;
  if (v3) {
    (*(void (**)(void))(*(void *)v3 + 8))();
  }
}

- (void)onWatchOrientationNotification:(const int *)a3 data:(const NotificationData *)a4
{
  ++*((_DWORD *)self + 25);
  if (*a3 == 1)
  {
    long long v4 = *((_OWORD *)a4 + 1);
    *((_OWORD *)self + 4) = *(_OWORD *)a4;
    *((_OWORD *)self + 5) = v4;
    [(CLWMWatchOrientation *)self writeWatchOnWristStatus];
  }
  else if (!*a3)
  {
    *((void *)self + 7) = *(void *)a4;
    [(CLWMWatchOrientation *)self writeWatchOrientation];
  }
}

- (void)writeWatchOrientation
{
  uint64_t v2 = *((void *)self + 3);
  if (v2 && *(unsigned char *)(v2 + 136) && !*((unsigned char *)self + 96))
  {
    sub_10170140C(v9);
    [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
    v11 |= 1u;
    v9[77] = v4;
    sub_1017240C8((uint64_t)v9);
    sub_101760FDC(v10);
    uint64_t v5 = v10;
    uint64_t v6 = *(void *)(v10 + 8);
    int v7 = *((_DWORD *)self + 15);
    *(unsigned char *)(v6 + 16) |= 1u;
    *(_DWORD *)(v6 + 8) = v7;
    uint64_t v8 = *(void *)(v5 + 8);
    LODWORD(v6) = *((_DWORD *)self + 14);
    *(unsigned char *)(v8 + 16) |= 2u;
    *(_DWORD *)(v8 + 12) = v6;
    sub_1016F8A70(*((void *)self + 3), (uint64_t)v9);
    sub_101706914((PB::Base *)v9);
  }
}

- (void)writeWatchOnWristStatus
{
  uint64_t v2 = *((void *)self + 3);
  if (v2 && *(unsigned char *)(v2 + 136) && !*((unsigned char *)self + 97))
  {
    sub_10170140C(v17);
    [(CLWMBase *)self makeSafeCFAbsoluteTime:CFAbsoluteTimeGetCurrent()];
    v19 |= 1u;
    v17[77] = v4;
    sub_101725088((uint64_t)v17);
    sub_101760B00(v18);
    uint64_t v5 = v18;
    uint64_t v6 = *(void *)(v18 + 8);
    int v7 = *((_DWORD *)self + 16);
    *(unsigned char *)(v6 + 40) |= 4u;
    *(_DWORD *)(v6 + 24) = v7;
    uint64_t v8 = *(void *)(v5 + 8);
    int v9 = *((_DWORD *)self + 17);
    *(unsigned char *)(v8 + 40) |= 0x10u;
    *(_DWORD *)(v8 + 32) = v9;
    uint64_t v10 = *(void *)(v5 + 8);
    int v11 = *((_DWORD *)self + 18);
    *(unsigned char *)(v10 + 40) |= 8u;
    *(_DWORD *)(v10 + 28) = v11;
    uint64_t v12 = *(void *)(v5 + 8);
    LOBYTE(v11) = *((unsigned char *)self + 88);
    *(unsigned char *)(v12 + 40) |= 0x40u;
    *(unsigned char *)(v12 + 37) = v11;
    uint64_t v13 = *(void *)(v5 + 8);
    LOBYTE(v11) = *((unsigned char *)self + 89);
    *(unsigned char *)(v13 + 40) |= 0x20u;
    *(unsigned char *)(v13 + 36) = v11;
    uint64_t v14 = *(void *)(v5 + 8);
    LOBYTE(v11) = *((unsigned char *)self + 90);
    *(unsigned char *)(v14 + 40) |= 0x80u;
    *(unsigned char *)(v14 + 38) = v11;
    uint64_t v15 = *(void *)(v5 + 8);
    [(CLWMBase *)self makeSafeCFAbsoluteTime:(double)*((unint64_t *)self + 10)];
    *(unsigned char *)(v15 + 40) |= 2u;
    *(void *)(v15 + 16) = (unint64_t)v16;
    sub_1016F8A70(*((void *)self + 3), (uint64_t)v17);
    sub_101706914((PB::Base *)v17);
  }
}

- (void)setWriter:(shared_ptr<CMMsl::WriterManager>)a3
{
  uint64_t v3 = (void *)((char *)self + 24);
  uint64_t v5 = *(void *)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)self + 4);
  void *v3 = v5;
  v3[1] = v4;
  if (v6) {
    sub_1000DB0A0(v6);
  }
}

- (int)getSampleCount
{
  return *((_DWORD *)self + 25);
}

- (void).cxx_destruct
{
  uint64_t v3 = (std::__shared_weak_count *)*((void *)self + 4);
  if (v3) {
    sub_1000DB0A0(v3);
  }
  uint64_t v4 = *((void *)self + 2);
  *((void *)self + 2) = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end