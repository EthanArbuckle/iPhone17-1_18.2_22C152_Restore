@interface CLLocationAwarenessProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLLocationAwarenessProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)onScenarioTrigger:(id)a3;
@end

@implementation CLLocationAwarenessProviderAdapter

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
  if (qword_102485AE8 != -1) {
    dispatch_once(&qword_102485AE8, &stru_102314FA8);
  }
  return (id)qword_102485AE0;
}

- (CLLocationAwarenessProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationAwarenessProviderAdapter;
  return [(CLLocationAwarenessProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationAwarenessProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationAwarenessProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA4448();
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
  v4 = [(CLLocationAwarenessProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLLocationAwarenessProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)onScenarioTrigger:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(CLLocationAwarenessProviderAdapter *)self adaptee];
    int v5 = 1;
LABEL_5:
    sub_101175084((uint64_t)v4, v5);
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(CLLocationAwarenessProviderAdapter *)self adaptee];
    int v5 = 0;
    goto LABEL_5;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102315150);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
  {
    int v9 = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2081;
    id v14 = [[[objc_opt_class() description] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Awareness Received unexpected Routine notification\", \"triggerClass\":%{private, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102315150);
    }
  }
  v7 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    id v8 = [[objc_msgSend((id)objc_opt_class(), "description") UTF8String];
    int v9 = 68289283;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2081;
    id v14 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Awareness Received unexpected Routine notification", "{\"msg%{public}.0s\":\"#Awareness Received unexpected Routine notification\", \"triggerClass\":%{private, location:escape_only}s}", (uint8_t *)&v9, 0x1Cu);
  }
}

@end