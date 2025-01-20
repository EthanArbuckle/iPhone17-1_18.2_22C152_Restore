@interface CLMotionHintLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionHintLoggerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLMotionHintLoggerAdapter

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
  if (qword_102489910 != -1) {
    dispatch_once(&qword_102489910, &stru_10234E0F0);
  }
  return (id)qword_102489908;
}

- (CLMotionHintLoggerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionHintLoggerAdapter;
  return [(CLMotionHintLoggerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionHintLoggerProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionHintLoggerClientProtocol];
}

- (void)beginService
{
  uint64_t block = (uint64_t)_NSConcreteStackBlock;
  *(void *)v7 = 3221225472;
  *(void *)&v7[8] = sub_101A48014;
  *(void *)&v7[16] = &unk_10229FED8;
  *(void *)&v7[24] = [(CLMotionHintLoggerAdapter *)self universe];
  if (qword_102489918 != -1) {
    dispatch_once(&qword_102489918, &block);
  }
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:qword_102489900];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    if (qword_102419580 != -1) {
      dispatch_once(&qword_102419580, &stru_10234E220);
    }
    objc_super v3 = qword_102419588;
    if (os_log_type_enabled((os_log_t)qword_102419588, OS_LOG_TYPE_FAULT))
    {
      uint64_t block = 68289539;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
      if (qword_102419580 != -1) {
        dispatch_once(&qword_102419580, &stru_10234E220);
      }
    }
    v4 = qword_102419588;
    if (os_signpost_enabled((os_log_t)qword_102419588))
    {
      uint64_t block = 68289539;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
      if (qword_102419580 != -1) {
        dispatch_once(&qword_102419580, &stru_10234E220);
      }
    }
    unint64_t v5 = qword_102419588;
    if (os_log_type_enabled((os_log_t)qword_102419588, OS_LOG_TYPE_INFO))
    {
      uint64_t block = 68289539;
      *(_WORD *)v7 = 2082;
      *(void *)&v7[2] = "";
      *(_WORD *)&v7[10] = 2082;
      *(void *)&v7[12] = "assert";
      *(_WORD *)&v7[20] = 2081;
      *(void *)&v7[22] = "__null != self.notifier";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", (uint8_t *)&block, 0x26u);
    }
    abort_report_np();
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
  v4 = [(CLMotionHintLoggerAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMotionHintLoggerAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return 1;
}

@end