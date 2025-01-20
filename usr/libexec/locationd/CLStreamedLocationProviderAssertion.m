@interface CLStreamedLocationProviderAssertion
- (CLStreamedLocationProviderProtocol)proxy;
- (id)initInUniverse:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)releaseAssertion;
- (void)setProxy:(id)a3;
- (void)takeAssertion;
@end

@implementation CLStreamedLocationProviderAssertion

- (id)initInUniverse:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLStreamedLocationProviderAssertion;
  v4 = [(CLStreamedLocationProviderAssertion *)&v6 init];
  if (v4)
  {
    -[CLStreamedLocationProviderAssertion setProxy:](v4, "setProxy:[objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", @"CLStreamedLocationProvider")]");
    [(CLStreamedLocationProviderAssertion *)v4 takeAssertion];
  }
  return v4;
}

- (void)invalidate
{
  [(CLStreamedLocationProviderAssertion *)self releaseAssertion];

  [(CLStreamedLocationProviderAssertion *)self setProxy:0];
}

- (void)dealloc
{
  [(CLStreamedLocationProviderAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderAssertion;
  [(CLStreamedLocationProviderAssertion *)&v3 dealloc];
}

- (void)takeAssertion
{
  if (qword_102419540 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
    }
    objc_super v3 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Must be overridden", "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
    }
    v4 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_102419540, &stru_1022B31C0);
  }
}

- (void)releaseAssertion
{
  if (qword_102419540 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    v2 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
    }
    objc_super v3 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Must be overridden", "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
    }
    v4 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v6 = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 2082;
      v10 = "assert";
      __int16 v11 = 2081;
      v12 = "false";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Must be overridden\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_11:
    dispatch_once(&qword_102419540, &stru_1022B31C0);
  }
}

- (CLStreamedLocationProviderProtocol)proxy
{
  return self->_proxy;
}

- (void)setProxy:(id)a3
{
}

@end