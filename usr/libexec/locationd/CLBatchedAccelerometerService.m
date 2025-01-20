@interface CLBatchedAccelerometerService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLBatchedAccelerometerService)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)onBatchedData:(void *)a3 N:(int)a4;
- (void)registerForData:(id)a3;
- (void)unregisterForData:(id)a3;
@end

@implementation CLBatchedAccelerometerService

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
  if (qword_102481800 != -1) {
    dispatch_once(&qword_102481800, &stru_1022F94A8);
  }
  return (id)qword_1024817F8;
}

+ (BOOL)isSupported
{
  return +[CLBatchedSensorService isSupported];
}

- (CLBatchedAccelerometerService)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLBatchedAccelerometerService;
  v2 = [(CLBatchedSensorService *)&v10 initWithClientProtocol:&OBJC_PROTOCOL___CLBatchedAccelerometerServiceClientProtocol];
  v3 = v2;
  if (v2)
  {
    int64_t var0 = v2->super._info.name.var0;
    v3->super._info.name.int64_t var0 = 0;
    if (var0) {
      (*(void (**)(int64_t))(*(void *)var0 + 8))(var0);
    }
    if (byte_1024817CF < 0)
    {
      sub_1000DC48C(__p, (void *)xmmword_1024817B8, *((unint64_t *)&xmmword_1024817B8 + 1));
    }
    else
    {
      *(_OWORD *)__p = xmmword_1024817B8;
      uint64_t v8 = unk_1024817C8;
    }
    int v9 = dword_1024817D0;
    v6.receiver = v3;
    v6.super_class = (Class)CLBatchedAccelerometerService;
    [(CLBatchedSensorService *)&v6 setInfo:__p];
    if (SHIBYTE(v8) < 0) {
      operator delete(__p[0]);
    }
  }
  return v3;
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)CLBatchedAccelerometerService;
  [(CLBatchedSensorService *)&v6 disableProvider];
  int64_t var0 = self->super._info.name.var0;
  if (var0)
  {
    sub_100BCB7C8(var0);
    int64_t v4 = self->super._info.name.var0;
    self->super._info.name.int64_t var0 = 0;
    if (v4) {
      (*(void (**)(int64_t))(*(void *)v4 + 8))(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)CLBatchedAccelerometerService;
  [(CLBatchedSensorService *)&v5 dealloc];
}

- (void)registerForData:(id)a3
{
  if (!self->super._info.name.var0)
  {
    v11.receiver = self;
    v11.super_class = (Class)CLBatchedAccelerometerService;
    [(CLBatchedSensorService *)&v11 enableProvider];
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022F94C8);
    }
    int64_t v4 = qword_102419318;
    if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_DEFAULT))
    {
      v10.receiver = self;
      v10.super_class = (Class)CLBatchedAccelerometerService;
      [(CLBatchedSensorService *)&v10 info];
      objc_super v5 = v15 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[service-%{public}s] first client, creating manager", buf, 0xCu);
      if (v15 < 0) {
        operator delete(__p[0]);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419310 != -1) {
        dispatch_once(&qword_102419310, &stru_1022F94C8);
      }
      v9.receiver = self;
      v9.super_class = (Class)CLBatchedAccelerometerService;
      [(CLBatchedSensorService *)&v9 info];
      if (v17 >= 0) {
        objc_super v6 = buf;
      }
      else {
        objc_super v6 = *(unsigned char **)buf;
      }
      int v12 = 136446210;
      v13 = v6;
      v7 = (char *)_os_log_send_and_compose_impl();
      if (v17 < 0) {
        operator delete(*(void **)buf);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedAccelerometerService registerForData:]", "%s\n", v7);
      if (v7 != (char *)__p) {
        free(v7);
      }
    }
    [[-[CLBatchedAccelerometerService universe](self, "universe")] silo];
    operator new();
  }
  v8.receiver = self;
  v8.super_class = (Class)CLBatchedAccelerometerService;
  [(CLBatchedSensorService *)&v8 registerForData:a3];
  sub_100BCB9DC(self->super._info.name.var0, 0.5);
}

- (void)unregisterForData:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLBatchedAccelerometerService;
  [(CLBatchedSensorService *)&v8 unregisterForData:a3];
  v7.receiver = self;
  v7.super_class = (Class)CLBatchedAccelerometerService;
  if (![(NSMutableSet *)[(CLBatchedSensorService *)&v7 clients] count])
  {
    v6.receiver = self;
    v6.super_class = (Class)CLBatchedAccelerometerService;
    [(CLBatchedSensorService *)&v6 disableProvider];
    int64_t var0 = self->super._info.name.var0;
    if (var0)
    {
      sub_100BCB7C8(var0);
      int64_t v5 = self->super._info.name.var0;
      self->super._info.name.int64_t var0 = 0;
      if (v5) {
        (*(void (**)(int64_t))(*(void *)v5 + 8))(v5);
      }
    }
  }
}

- (void)onBatchedData:(void *)a3 N:(int)a4
{
  if (qword_102419310 != -1) {
    dispatch_once(&qword_102419310, &stru_1022F94C8);
  }
  objc_super v7 = qword_102419318;
  if (os_log_type_enabled((os_log_t)qword_102419318, OS_LOG_TYPE_INFO))
  {
    v22.receiver = self;
    v22.super_class = (Class)CLBatchedAccelerometerService;
    [(CLBatchedSensorService *)&v22 info];
    objc_super v8 = v33 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = v8;
    __int16 v25 = 1026;
    int v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[service-%{public}s] notifying %{public}d samples", buf, 0x12u);
    if (v33 < 0) {
      operator delete(__p[0]);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_102419310 != -1) {
      dispatch_once(&qword_102419310, &stru_1022F94C8);
    }
    v21.receiver = self;
    v21.super_class = (Class)CLBatchedAccelerometerService;
    [(CLBatchedSensorService *)&v21 info];
    if (v27 >= 0) {
      v14 = buf;
    }
    else {
      v14 = *(unsigned char **)buf;
    }
    int v28 = 136446466;
    v29 = v14;
    __int16 v30 = 1026;
    int v31 = a4;
    char v15 = (char *)_os_log_send_and_compose_impl();
    if (v27 < 0) {
      operator delete(*(void **)buf);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBatchedAccelerometerService onBatchedData:N:]", "%s\n", v15);
    if (v15 != (char *)__p) {
      free(v15);
    }
  }
  objc_super v9 = [[CLBatchedAccelerometerBufferWrapper alloc] initWithMovedBuffer:a3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v16.receiver = self;
  v16.super_class = (Class)CLBatchedAccelerometerService;
  objc_super v10 = [(CLBatchedSensorService *)&v16 clients];
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) onBatchedAccelerometerData:v9];
      }
      id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void).cxx_destruct
{
  int64_t var0 = self->super._info.name.var0;
  self->super._info.name.int64_t var0 = 0;
  if (var0) {
    (*(void (**)(void))(*(void *)var0 + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  return self;
}

@end