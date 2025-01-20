@interface CLNatalimetryNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLNatalimetryNotifierAdapter)init;
- (id)syncgetUserProfile;
- (id)syncgetUserProfileInternal;
- (int)syncgetQueryExerciseMinuteDataSince:(CLExerciseMinuteData *)a3 records:(void *)a4;
- (int)syncgetQueryNatalieDataSince:(CLNatalieData *)a3 records:(void *)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)onCalorieAggregationActivity:(id)a3;
- (void)pause;
- (void)queryMetMinutesInTimeRange:(id)a3 withReply:(id)a4;
- (void)queryVO2MaxInputsFromRecord:(VO2MaxInput *)a3 withReply:(id)a4;
- (void)queryWorkoutMets:(id)a3 withReply:(id)a4;
- (void)refreshMetrics;
- (void)resetUserProfileForKeys:(id)a3;
- (void)resume;
- (void)setActiveVo2maxOverride:(BOOL)a3;
- (void)setUserProfile:(id)a3 merge:(BOOL)a4;
- (void)setUserProfileFromCMNatalimeter:(id)a3;
- (void)updatePAL:(double)a3;
@end

@implementation CLNatalimetryNotifierAdapter

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
  if (qword_102486A88 != -1) {
    dispatch_once(&qword_102486A88, &stru_10231B578);
  }
  return (id)qword_102486A80;
}

- (CLNatalimetryNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNatalimetryNotifierAdapter;
  return [(CLNatalimetryNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLNatalimetryNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLNatalimetryNotifierClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AABC98();
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
  v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLNatalimetryNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)updatePAL:(double)a3
{
  v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  float v5 = a3;
  sub_10128E994((uint64_t)v4, v5);
}

- (void)pause
{
  v2 = *(void (**)(void))(**((void **)[(CLNatalimetryNotifierAdapter *)self adaptee] + 346) + 24);

  v2();
}

- (void)resume
{
  v2 = *(void (**)(void))(**((void **)[(CLNatalimetryNotifierAdapter *)self adaptee] + 346) + 32);

  v2();
}

- (void)refreshMetrics
{
  v2 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_10128EB74((uint64_t)v2);
}

- (void)setActiveVo2maxOverride:(BOOL)a3
{
  v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_10128F3C0((uint64_t)v4, a3);
}

- (id)syncgetUserProfile
{
  v2 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  return sub_10128F5F0((uint64_t)v2);
}

- (id)syncgetUserProfileInternal
{
  v2 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  return sub_10128F778((uint64_t)v2);
}

- (void)setUserProfileFromCMNatalimeter:(id)a3
{
  v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_10128F9EC((uint64_t)v4, a3);
}

- (void)setUserProfile:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_101297350((uint64_t)v6, a3, v4, 0);
}

- (void)resetUserProfileForKeys:(id)a3
{
  BOOL v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_10128FC08((uint64_t)v4, a3);
}

- (int)syncgetQueryNatalieDataSince:(CLNatalieData *)a3 records:(void *)a4
{
  uint64_t v4 = *((void *)[(CLNatalimetryNotifierAdapter *)self adaptee] + 16);

  return sub_10146DCFC(v4);
}

- (int)syncgetQueryExerciseMinuteDataSince:(CLExerciseMinuteData *)a3 records:(void *)a4
{
  uint64_t v4 = *((void *)[(CLNatalimetryNotifierAdapter *)self adaptee] + 24);

  return sub_100A22CE4(v4);
}

- (void)queryMetMinutesInTimeRange:(id)a3 withReply:(id)a4
{
  __p = 0;
  v11 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = sub_1012902FC((uint64_t)[(CLNatalimetryNotifierAdapter *)self adaptee], (uint64_t)&__p, a3.var0);
  if (v5 == 100)
  {
    v6 = +[NSMutableArray arrayWithCapacity:((char *)v11 - (unsigned char *)__p) >> 4];
    v7 = (double *)__p;
    v8 = v11;
    if (__p != v11)
    {
      do
      {
        id v9 = [objc_alloc((Class)CMMetMinute) initWithSample:*v7, v7[1]];
        [(NSMutableArray *)v6 addObject:v9];

        v7 += 2;
      }
      while (v7 != v8);
    }
    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v6, 100);
  }
  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v5);
  }
  if (__p)
  {
    v11 = (double *)__p;
    operator delete(__p);
  }
}

- (void)queryWorkoutMets:(id)a3 withReply:(id)a4
{
  if (a3)
  {
    uuid_clear(v13);
    uuid_clear(v14);
    uint64_t v15 = 0;
    *(void *)buf = 0;
    uint64_t v12 = 0;
    v10[0] = 0;
    v10[1] = 0;
    [a3 getUUIDBytes:v10];
    uint64_t v7 = sub_10146F3D8(*((void *)[(CLNatalimetryNotifierAdapter *)self adaptee] + 16), (const unsigned __int8 *)v10, (uint64_t)buf);
    if (v7 == 100) {
      (*((void (**)(id, id, uint64_t))a4 + 2))(a4, [objc_alloc((Class)CMWorkoutMetsData) initWithCLWorkoutMets:buf], 100);
    }
    else {
      (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v7);
    }
  }
  else
  {
    if (qword_102418FF0 != -1) {
      dispatch_once(&qword_102418FF0, &stru_10231B970);
    }
    v8 = qword_102418FF8;
    if (os_log_type_enabled((os_log_t)qword_102418FF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "queryWorkoutMets nil sessionId", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102418FF0 != -1) {
        dispatch_once(&qword_102418FF0, &stru_10231B970);
      }
      LOWORD(v10[0]) = 0;
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNatalimetryNotifierAdapter queryWorkoutMets:withReply:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, 107);
  }
}

- (void)queryVO2MaxInputsFromRecord:(VO2MaxInput *)a3 withReply:(id)a4
{
  __p = 0;
  v17 = 0;
  uint64_t v18 = 0;
  v6 = (uint64_t *)*((void *)[(CLNatalimetryNotifierAdapter *)self adaptee] + 393);
  long long v7 = *(_OWORD *)&a3->var12;
  long long v24 = *(_OWORD *)&a3->var8;
  long long v25 = v7;
  long long v26 = *(_OWORD *)&a3->var14;
  long long v8 = *(_OWORD *)&a3->var1[8];
  long long v20 = *(_OWORD *)&a3->var0;
  long long v21 = v8;
  long long v9 = *(_OWORD *)&a3->var6;
  long long v22 = *(_OWORD *)&a3->var3;
  long long v23 = v9;
  uint64_t v10 = sub_1009F3A8C(v6, &v20, (uint64_t)&__p);
  if (v10 == 100)
  {
    v11 = +[NSMutableArray arrayWithCapacity:0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (unsigned char *)__p) >> 4)];
    uint64_t v12 = (long long *)__p;
    v13 = v17;
    if (__p != v17)
    {
      do
      {
        long long v23 = v12[3];
        long long v24 = v12[4];
        long long v25 = v12[5];
        long long v26 = v12[6];
        long long v20 = *v12;
        long long v21 = v12[1];
        long long v22 = v12[2];
        id v14 = objc_alloc((Class)CMVO2MaxInputs);
        v19[4] = v24;
        v19[5] = v25;
        v19[6] = v26;
        v19[0] = v20;
        v19[1] = v21;
        v19[2] = v22;
        v19[3] = v23;
        id v15 = [v14 initWithSample:v19];
        [(NSMutableArray *)v11 addObject:v15];

        v12 += 7;
      }
      while (v12 != v13);
    }
    (*((void (**)(id, NSMutableArray *, uint64_t))a4 + 2))(a4, v11, 100);
  }
  else
  {
    (*((void (**)(id, void, uint64_t))a4 + 2))(a4, 0, v10);
  }
  if (__p)
  {
    v17 = (long long *)__p;
    operator delete(__p);
  }
}

- (void)onCalorieAggregationActivity:(id)a3
{
  uint64_t v4 = [(CLNatalimetryNotifierAdapter *)self adaptee];

  sub_101290804((uint64_t)v4, (xpc_activity_t)a3);
}

+ (BOOL)isSupported
{
  if (qword_102486A98 != -1) {
    dispatch_once(&qword_102486A98, &stru_10231B598);
  }
  return byte_102486A90;
}

@end