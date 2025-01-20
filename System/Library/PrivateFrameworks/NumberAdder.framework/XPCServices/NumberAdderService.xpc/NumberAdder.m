@interface NumberAdder
- (NumberAdder)init;
- (NumberAdder)initWithConnection:()unique_ptr<CLConnection onQueue:(CLConnectionDeleter>)a3;
- (OS_dispatch_queue)connectionQueue;
- (id).cxx_construct;
- (void)dealloc;
- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3;
- (void)numberOne:(int)a3 numberTwo:(int)a4 withCompletionHandler:(id)a5;
- (void)setConnectionQueue:(id)a3;
- (void)setup;
@end

@implementation NumberAdder

- (NumberAdder)init
{
  v8.receiver = self;
  v8.super_class = (Class)NumberAdder;
  v2 = [(NumberAdder *)&v8 init];
  if (v2)
  {
    [(NumberAdder *)v2 setConnectionQueue:dispatch_queue_create("com.apple.NumberAdder.serialQ", 0)];
    objc_initWeak(&location, v2);
    v3 = [(NumberAdder *)v2 connectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005AD0;
    block[3] = &unk_100008498;
    objc_copyWeak(&v6, &location);
    block[4] = v2;
    dispatch_async(v3, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NumberAdder)initWithConnection:()unique_ptr<CLConnection onQueue:(CLConnectionDeleter>)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NumberAdder;
  id v6 = [(NumberAdder *)&v11 init];
  v7 = v6;
  if (v6)
  {
    [(NumberAdder *)v6 setConnectionQueue:a4];
    objc_super v8 = *(CLConnection **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    sub_100006398(&v7->_connection.__ptr_.__value_, v8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005C94;
    block[3] = &unk_1000084C0;
    block[4] = v7;
    dispatch_async((dispatch_queue_t)[(NumberAdder *)v7 connectionQueue], block);
  }
  return v7;
}

- (void)dealloc
{
  value = self->_connection.__ptr_.__value_;
  self->_connection.__ptr_.__value_ = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D48;
  block[3] = &unk_1000084E0;
  block[4] = value;
  dispatch_async((dispatch_queue_t)[(NumberAdder *)self connectionQueue], block);
  [(NumberAdder *)self setConnectionQueue:0];
  v4.receiver = self;
  v4.super_class = (Class)NumberAdder;
  [(NumberAdder *)&v4 dealloc];
}

- (void)setup
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(NumberAdder *)self connectionQueue]);
  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  CLConnection::setDefaultMessageHandler();
  CLConnection::start(self->_connection.__ptr_.__value_);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)numberOne:(int)a3 numberTwo:(int)a4 withCompletionHandler:(id)a5
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = sub_100005FA4;
  v11[4] = sub_100005FB4;
  id v12 = 0;
  id v12 = [a5 copy];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005FC0;
  block[3] = &unk_100008558;
  int v9 = a3;
  int v10 = a4;
  block[4] = self;
  void block[5] = v11;
  dispatch_async((dispatch_queue_t)[(NumberAdder *)self connectionQueue], block);
  _Block_object_dispose(v11, 8);
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  uint64_t v4 = CLConnectionMessage::name(*(CLConnectionMessage **)a3.var0);
  if (*(char *)(v4 + 23) < 0)
  {
    sub_100004CD0(__p, *(void **)v4, *(void *)(v4 + 8));
  }
  else
  {
    long long v5 = *(_OWORD *)v4;
    uint64_t v11 = *(void *)(v4 + 16);
    *(_OWORD *)__p = v5;
  }
  id v6 = _os_activity_create((void *)&_mh_execute_header, "CL: #NumberAdder Handling message from service", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v9);

  if (qword_10000C1D0 != -1) {
    dispatch_once(&qword_10000C1D0, &stru_100008578);
  }
  v7 = qword_10000C1D8;
  if (os_log_type_enabled((os_log_t)qword_10000C1D8, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = __p;
    if (v11 < 0) {
      objc_super v8 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289794;
    int v13 = 0;
    __int16 v14 = 2082;
    v15 = "";
    __int16 v16 = 2082;
    v17 = "activity";
    __int16 v18 = 2082;
    v19 = v8;
    __int16 v20 = 2050;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NumberAdder Handling message from service\", \"event\":%{public, location:escape_only}s, \"messageName\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  os_activity_scope_leave(&v9);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end