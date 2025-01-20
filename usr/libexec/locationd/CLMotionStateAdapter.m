@interface CLMotionStateAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionStateAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)queryMotionStatesWithStartTime:(double)a3 endTime:(double)a4 isFromInternalClient:(BOOL)a5 withReply:(id)a6;
@end

@implementation CLMotionStateAdapter

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
  if (qword_10247C640 != -1) {
    dispatch_once(&qword_10247C640, &stru_1022BCCE0);
  }
  return (id)qword_10247C638;
}

- (CLMotionStateAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionStateAdapter;
  return [(CLMotionStateAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionStateProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionStateClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6626C();
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
  v4 = [(CLMotionStateAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMotionStateAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)queryMotionStatesWithStartTime:(double)a3 endTime:(double)a4 isFromInternalClient:(BOOL)a5 withReply:(id)a6
{
  BOOL v7 = a5;
  v35 = 0;
  v36 = 0;
  uint64_t v37 = 0;
  v10 = [(CLMotionStateAdapter *)self adaptee];
  (*(void (**)(void *, BOOL, char **, double, double))(*(void *)v10 + 216))(v10, v7, &v35, a3, a4);
  v12 = v35;
  v11 = v36;
  unint64_t v13 = 0xF0F0F0F0F0F0F0F1 * ((v36 - v35) >> 3);
  v14 = +[NSMutableArray arrayWithCapacity:v13];
  if (v11 != v12)
  {
    uint64_t v15 = 0;
    unint64_t v16 = v13 - 1;
    if (v13 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v13;
    }
    do
    {
      long long v18 = *(_OWORD *)&v35[v15 + 112];
      long long v32 = *(_OWORD *)&v35[v15 + 96];
      long long v33 = v18;
      uint64_t v34 = *(void *)&v35[v15 + 128];
      long long v19 = *(_OWORD *)&v35[v15 + 48];
      long long v28 = *(_OWORD *)&v35[v15 + 32];
      long long v29 = v19;
      long long v20 = *(_OWORD *)&v35[v15 + 80];
      long long v30 = *(_OWORD *)&v35[v15 + 64];
      long long v31 = v20;
      long long v21 = *(_OWORD *)&v35[v15 + 16];
      long long v26 = *(_OWORD *)&v35[v15];
      long long v27 = v21;
      double v22 = a4;
      if (v16) {
        double v22 = *(double *)&v35[v15 + 216] + -2.22044605e-16;
      }
      id v23 = objc_alloc((Class)CMMotionActivity);
      id v24 = [v23 initWithMotionActivity:&v25 endDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v22, v26, v27, v28, v29, v30, v31, v32, v33, v34)];
      [(NSMutableArray *)v14 addObject:v24];

      --v16;
      v15 += 136;
      --v17;
    }
    while (v17);
  }
  (*((void (**)(id, NSMutableArray *))a6 + 2))(a6, v14);
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
}

@end