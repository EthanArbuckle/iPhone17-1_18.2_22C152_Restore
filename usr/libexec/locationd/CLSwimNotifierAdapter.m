@interface CLSwimNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4;
- (CLSwimNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)clearCalibrations;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)querySessionSWOLF:(id)a3 withReply:(id)a4;
- (void)queryUsingRecord:(CLSwimEntry *)a3 withReply:(id)a4;
@end

@implementation CLSwimNotifierAdapter

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
  if (qword_102488E60 != -1) {
    dispatch_once(&qword_102488E60, &stru_10232EA70);
  }
  return (id)qword_102488E58;
}

- (CLSwimNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLSwimNotifierAdapter;
  return [(CLSwimNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLSwimNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLSwimNotifierClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_10158F0F4((uint64_t)[(CLSwimNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101ABDA00();
    sub_10158F0F4(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLSwimNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLSwimNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102488E70 != -1) {
    dispatch_once(&qword_102488E70, &stru_10232EA90);
  }
  return byte_102488E68;
}

- (void)queryUsingRecord:(CLSwimEntry *)a3 withReply:(id)a4
{
  sub_10158F520((uint64_t)[(CLSwimNotifierAdapter *)self adaptee], (uint64_t)a3, (uint64_t *)&__p);
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:0x86BCA1AF286BCA1BLL * ((v17 - (unsigned char *)__p) >> 3)];
  v6 = __p;
  v7 = v17;
  if (__p != v17)
  {
    do
    {
      long long v8 = v6[1];
      v18[0] = *v6;
      v18[1] = v8;
      long long v9 = v6[2];
      long long v10 = v6[3];
      long long v11 = v6[5];
      v18[4] = v6[4];
      v18[5] = v11;
      v18[2] = v9;
      v18[3] = v10;
      long long v12 = v6[6];
      long long v13 = v6[7];
      long long v14 = v6[8];
      uint64_t v19 = *((void *)v6 + 18);
      v18[7] = v13;
      v18[8] = v14;
      v18[6] = v12;
      id v15 = [objc_alloc((Class)CMSwimData) initWithSwimEntry:v18];
      [(NSMutableArray *)v5 addObject:v15];

      v6 = (_OWORD *)((char *)v6 + 152);
    }
    while (v6 != (_OWORD *)v7);
  }
  (*((void (**)(id, NSMutableArray *))a4 + 2))(a4, v5);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
}

- (void)querySessionSWOLF:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    uuid_clear(v13);
    uuid_clear(v14);
    *(void *)buf = 0;
    uint64_t v12 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v17 = 0;
    v10[0] = 0;
    v10[1] = 0;
    [a3 getUUIDBytes:v10];
    uint64_t v7 = sub_10158F7BC((uint64_t)[(CLSwimNotifierAdapter *)self adaptee], (const unsigned __int8 *)v10, (uint64_t)buf);
    if (v7 == 100) {
      (*((void (**)(id, id, uint64_t))a4 + 2))(a4, [objc_alloc((Class)CMSWOLFSummary) initWithCLSWOLFSummary:buf], 100);
    }
    else {
      (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v7);
    }
  }
  else
  {
    if (qword_102419000 != -1) {
      dispatch_once(&qword_102419000, &stru_10232EC38);
    }
    long long v8 = qword_102419008;
    if (os_log_type_enabled((os_log_t)qword_102419008, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "session SWOLF query nil sessionId", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419000 != -1) {
        dispatch_once(&qword_102419000, &stru_10232EC38);
      }
      LOWORD(v10[0]) = 0;
      long long v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLSwimNotifierAdapter querySessionSWOLF:withReply:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, 107);
  }
}

- (void)clearCalibrations
{
  v2 = (char *)[(CLSwimNotifierAdapter *)self adaptee] + 168;

  sub_10041F180((uint64_t)v2);
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  return 1;
}

@end