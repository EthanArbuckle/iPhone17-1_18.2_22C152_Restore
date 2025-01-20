@interface MXMSysmonRequest
+ (id)requestWithType:(unint64_t)a3 handler:(id)a4;
- (OS_dispatch_semaphore)wait_sema;
- (OS_sysmon_request)request;
- (double)convertToPercent:(double)a3 ncpus:(int)a4;
- (double)interval;
- (double)ncpus;
- (void)addAttributes:(unsigned int)a3;
- (void)cancel;
- (void)execute;
- (void)logTopUsageProcesses:(id)a3;
- (void)setInterval:(double)a3;
- (void)setNcpus:(double)a3;
- (void)setRequest:(id)a3;
- (void)setWait_sema:(id)a3;
- (void)wait;
@end

@implementation MXMSysmonRequest

+ (id)requestWithType:(unint64_t)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    int v19 = 0;
    size_t v18 = 4;
    if (sysctlbyname("hw.logicalcpu", &v19, &v18, 0, 0) < 0)
    {
      NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
      CFStringRef v21 = @"Error while deterimining number of logical CPU cores.";
      v8 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v7 = +[NSError errorWithDomain:@"InstrumentErrorDomain" code:0 userInfo:v8];
    }
    else
    {
      v7 = 0;
    }
    objc_initWeak(&location, v6);
    id v12 = v6;
    int v16 = v19;
    id v14 = v5;
    objc_copyWeak(&v15, &location);
    id v13 = v7;
    v9 = (void *)sysmon_request_create();
    [v12 setRequest:v9];

    [v12 setInterval:0.0];
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
    id v10 = v12;
  }
  return v6;
}

- (double)convertToPercent:(double)a3 ncpus:(int)a4
{
  return a3 / (double)(100 * a4) * 100.0;
}

- (void)logTopUsageProcesses:(id)a3
{
  id v3 = a3;
  v4 = [v3 keysSortedByValueUsingComparator:&stru_10000C578];
  if ((unint64_t)[v4 count] > 4) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = (uint64_t)[v4 count];
  }
  id v6 = objc_msgSend(v4, "subarrayWithRange:", 0, v5);

  v7 = +[NSMutableDictionary dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v14 = objc_msgSend(v3, "objectForKeyedSubscript:", v13, (void)v16);
        [v7 setValue:v14 forKey:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v10);
  }

  id v15 = _MXMGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Top five processes: %@", buf, 0xCu);
  }
}

- (void)addAttributes:(unsigned int)a3
{
  id v6 = &v7;
  if (a3)
  {
    do
    {
      v4 = [(MXMSysmonRequest *)self request];
      sysmon_request_add_attribute();

      uint64_t v5 = v6++;
    }
    while (*(_DWORD *)v5);
  }
}

- (void)execute
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  [(MXMSysmonRequest *)self setWait_sema:v3];

  id v4 = [(MXMSysmonRequest *)self request];
  sysmon_request_execute();
}

- (void)wait
{
  v2 = [(MXMSysmonRequest *)self wait_sema];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)cancel
{
  dispatch_semaphore_t v3 = [(MXMSysmonRequest *)self request];
  sysmon_request_cancel();

  id v4 = [(MXMSysmonRequest *)self wait_sema];
  dispatch_semaphore_signal(v4);
}

- (void)setInterval:(double)a3
{
  self->_interval = round(a3 + a3) * 0.5;
  id v3 = [(MXMSysmonRequest *)self request];
  sysmon_request_set_interval();
}

- (double)interval
{
  return self->_interval;
}

- (OS_sysmon_request)request
{
  return (OS_sysmon_request *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequest:(id)a3
{
}

- (OS_dispatch_semaphore)wait_sema
{
  return self->_wait_sema;
}

- (void)setWait_sema:(id)a3
{
}

- (double)ncpus
{
  return self->_ncpus;
}

- (void)setNcpus:(double)a3
{
  self->_ncpus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wait_sema, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end