@interface CLPeopleDensityLocTool
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPeopleDensityLocTool)init;
- (void)registerForBluetoothPowerNotification;
- (void)registerTerminatingBlock:(id)a3 onQueue:(id)a4;
@end

@implementation CLPeopleDensityLocTool

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
  if (qword_102484FF8 != -1) {
    dispatch_once(&qword_102484FF8, &stru_10230DEA8);
  }
  return (id)qword_102484FF0;
}

- (CLPeopleDensityLocTool)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLPeopleDensityLocTool;
  v2 = [(CLPeopleDensity *)&v5 init];
  if (v2)
  {
    id v3 = +[CLIntersiloInterface sharedInterface];
    v6[0] = &OBJC_PROTOCOL___CLIntersiloServiceProtocol;
    v6[1] = &OBJC_PROTOCOL___CLIntersiloClientProtocol;
    [v3 extendSelectorInfoWithProtocol:&OBJC_PROTOCOL___CLPeopleDensityLocToolProtocol bases:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2)];
  }
  return v2;
}

- (void)registerForBluetoothPowerNotification
{
  id v3 = dispatch_group_create();
  *(void *)(&self->super._isBluetoothPoweredOn + 1) = v3;
  dispatch_group_enter(v3);
  v4 = sub_100132EFC(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitting one-shot query", 49);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(*v4 - 24)));
  objc_super v5 = std::locale::use_facet(&v11, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
  std::locale::~locale(&v11);
  std::ostream::put();
  std::ostream::flush();
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1010950DC;
  v8[3] = &unk_10230DED0;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(CLPeopleDensity *)self isUserCurrentlyAloneWithHints:0 withReply:v8];
  v6 = sub_100132EFC(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitted one-shot-query", 48);
  std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(*v6 - 24)));
  v7 = std::locale::use_facet(&v11, &std::ctype<char>::id);
  ((void (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10);
  std::locale::~locale(&v11);
  std::ostream::put();
  std::ostream::flush();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)registerTerminatingBlock:(id)a3 onQueue:(id)a4
{
  if (*(void *)(&self->super._isBluetoothPoweredOn + 1))
  {
    v7 = sub_100132EFC(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitting terminating block", 52);
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(*v7 - 24)));
    v8 = std::locale::use_facet(&v14, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
    std::locale::~locale(&v14);
    std::ostream::put();
    std::ostream::flush();
    dispatch_group_notify(*(dispatch_group_t *)(&self->super._isBluetoothPoweredOn + 1), (dispatch_queue_t)a4, a3);
    id v9 = sub_100132EFC(&std::cout, (uint64_t)"CLPeopleDensityLocTool, submitted terminating block", 51);
    std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(void *)(*v9 - 24)));
    v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale(&v14);
    std::ostream::put();
    std::ostream::flush();
  }
  else
  {
    std::locale v11 = sub_100132EFC(&std::cout, (uint64_t)"CLPeopleDensityLocTool, terminating block submitted while service is not established, exiting", 93);
    std::ios_base::getloc((const std::ios_base *)((char *)v11 + *(void *)(*v11 - 24)));
    v12 = std::locale::use_facet(&v14, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 10);
    std::locale::~locale(&v14);
    std::ostream::put();
    std::ostream::flush();
    v13 = (void (*)(id))*((void *)a3 + 2);
    v13(a3);
  }
}

@end