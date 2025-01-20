@interface CLNotifierClientAdapter
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)valid;
- (CLNotifierClientAdapter)init;
- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3;
- (NSString)debugDescription;
- (void)invalidate;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLNotifierClientAdapter

- (void)invalidate
{
  self->_client = 0;
}

- (CLNotifierClientAdapter)initWithClient:(CLNotifierClientBase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLNotifierClientAdapter;
  v4 = [(CLNotifierClientAdapter *)&v7 init];
  v5 = v4;
  if (v4) {
    v4->_client = a3;
  }
  [(CLNotifierClientAdapter *)v4 setValid:1];
  return v5;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  client = self->_client;
  if (!client) {
    sub_101AB7214();
  }
  v5 = (void (*)(void))*((void *)client->var0 + 2);

  v5();
}

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

- (CLNotifierClientAdapter)init
{
  if (qword_102419580 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_102419588;
    if (os_log_type_enabled((os_log_t)qword_102419588, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419580 != -1) {
        dispatch_once(&qword_102419580, &stru_1023284E0);
      }
    }
    v3 = qword_102419588;
    if (os_signpost_enabled((os_log_t)qword_102419588))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Assertion failed", "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419580 != -1) {
        dispatch_once(&qword_102419580, &stru_1023284E0);
      }
    }
    v4 = qword_102419588;
    if (os_log_type_enabled((os_log_t)qword_102419588, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "0";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Assertion failed\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_102419580, &stru_1023284E0);
  }
}

- (NSString)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)CLNotifierClientAdapter;
  return +[NSString stringWithFormat:@"%@\nCLNotifierClientBase: %p", [(CLNotifierClientAdapter *)&v3 debugDescription], self->_client];
}

@end