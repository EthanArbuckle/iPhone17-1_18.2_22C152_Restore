@interface CLGestureReportReceiver
+ (BOOL)isSupported;
- (CLGestureReportReceiver)init;
- (id).cxx_construct;
- (void)onWakeGesture:(const Sample *)a3;
- (void)setDelegate:(CLGestureReportReceiverDelegate *)a3;
@end

@implementation CLGestureReportReceiver

- (void)setDelegate:(CLGestureReportReceiverDelegate *)a3
{
  self->_delegate = a3;
}

+ (BOOL)isSupported
{
  if (qword_102487120 != -1) {
    dispatch_once(&qword_102487120, &stru_102321A30);
  }
  return byte_102487118;
}

- (CLGestureReportReceiver)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLGestureReportReceiver;
  v2 = [(CLGestureReportReceiver *)&v4 init];
  if (v2 && +[CLGestureReportReceiver isSupported]) {
    operator new();
  }
  return v2;
}

- (void)onWakeGesture:(const Sample *)a3
{
  objc_super v4 = *(_OWORD **)&a3->var1.var0;
  long long v5 = *(_OWORD *)((char *)v4 + 12);
  v16[0] = *v4;
  *(_OWORD *)((char *)v16 + 12) = v5;
  *(void *)v15 = 0;
  *(void *)&v15[8] = 0;
  v14 = &off_1022EDEA8;
  *(_DWORD *)&v15[15] = 0;
  sub_1012EB948(v16, (uint64_t)&v14);
  if (!v15[16])
  {
    sub_100103240();
    if (!sub_10010145C()) {
      goto LABEL_17;
    }
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102321A50);
    }
    v8 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[CLGestureReportReceiver] failed to visit WakeGesture", buf, 2u);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_17;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419030 == -1)
    {
LABEL_19:
      __int16 v13 = 0;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLGestureReportReceiver onWakeGesture:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
      goto LABEL_17;
    }
LABEL_21:
    dispatch_once(&qword_102419030, &stru_102321A50);
    goto LABEL_19;
  }
  delegate = self->_delegate;
  if (delegate)
  {
    uint64_t v12 = *(void *)&v15[16];
    long long v11 = *(_OWORD *)v15;
    (*((void (**)(CLGestureReportReceiverDelegate *, long long *))delegate->var0 + 2))(delegate, &v11);
    goto LABEL_17;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102321A50);
  }
  v9 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[CLGestureReportReceiver] No delegate set", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 == -1) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_17:
  nullsub_41(&v14, v7);
}

- (void).cxx_destruct
{
  value = self->_wakeGestureNotificationVisitor.__ptr_.__value_;
  self->_wakeGestureNotificationVisitor.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CMWakeGestureNotificationVisitor *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_super v4 = self->_wakeDispatcher.__ptr_.__value_;
  self->_wakeDispatcher.__ptr_.__value_ = 0;
  if (v4)
  {
    long long v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end