@interface CLTelephonyCallObserver
- (CLTelephonyCallObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyCallObserverHelper *)a4;
- (CLTelephonyCallObserverHelper)fHelper;
- (CXCallObserver)fCallObserver;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)shutdown;
@end

@implementation CLTelephonyCallObserver

- (CLTelephonyCallObserver)initWithQueue:(id)a3 helperObj:(CLTelephonyCallObserverHelper *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)CLTelephonyCallObserver;
  v6 = [(CLTelephonyCallObserver *)&v11 init];
  if (v6)
  {
    v7 = (CXCallObserver *)objc_alloc((Class)CXCallObserver);
    v6->_fCallObserver = v7;
    if (v7)
    {
      [(CXCallObserver *)v7 init];
      [(CXCallObserver *)v6->_fCallObserver setDelegate:v6 queue:a3];
      v6->_fHelper = a4;
    }
    else
    {
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BB348);
      }
      v8 = qword_102419608;
      if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#CLT CXCallObserver alloc failed", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419600 != -1) {
          dispatch_once(&qword_102419600, &stru_1022BB348);
        }
        v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTelephonyCallObserver initWithQueue:helperObj:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
  }
  return v6;
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5 = [objc_msgSend(a3, "calls") count];
  if (self->_fHelper)
  {
    id v6 = v5;
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022BB348);
    }
    v7 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#CLT CXCallObserver call count, %{public}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BB348);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTelephonyCallObserver callObserver:callChanged:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    if (qword_102489FB0)
    {
      (*(void (**)(void))(*(void *)qword_102489FB0 + 264))();
      if (qword_102489FB0) {
        (*(void (**)(uint64_t, const __CFString *, void))(*(void *)qword_102489FB0 + 264))(qword_102489FB0, @"kCallStatusChangeNotification", 0);
      }
    }
  }
}

- (void)shutdown
{
  p_fCallObserver = &self->_fCallObserver;
  fCallObserver = self->_fCallObserver;
  if (fCallObserver)
  {
    [(CXCallObserver *)fCallObserver setDelegate:0 queue:0];

    *p_fCallObserver = 0;
    p_fCallObserver[1] = 0;
  }
}

- (CXCallObserver)fCallObserver
{
  return self->_fCallObserver;
}

- (CLTelephonyCallObserverHelper)fHelper
{
  return self->_fHelper;
}

@end