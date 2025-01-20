@interface SDBonjourResolver
- (NSNumber)portNumber;
- (NSString)domain;
- (NSString)hostName;
- (NSString)name;
- (NSString)path;
- (NSString)type;
- (NSURL)url;
- (SDBonjourResolver)initWithName:(id)a3 type:(id)a4 domain:(id)a5 path:(id)a6 timeout:(BOOL)a7;
- (SDBonjourResolverDelegate)delegate;
- (_DNSServiceRef_t)service;
- (int)error;
- (void)cancel;
- (void)dealloc;
- (void)notifyClient:(int)a3;
- (void)parseResults:(const char *)a3 port:(unsigned __int16)a4 txtLen:(unsigned __int16)a5 txtRecord:(const char *)a6 interface:(unsigned int)a7;
- (void)resolve;
- (void)setDelegate:(id)a3;
- (void)setHostName:(id)a3;
- (void)setPath:(id)a3;
- (void)setPortNumber:(id)a3;
@end

@implementation SDBonjourResolver

- (SDBonjourResolver)initWithName:(id)a3 type:(id)a4 domain:(id)a5 path:(id)a6 timeout:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SDBonjourResolver;
  v17 = [(SDBonjourResolver *)&v24 init];
  v18 = v17;
  if (v17)
  {
    v17->_connection = 0;
    objc_storeStrong((id *)&v17->_domain, a5);
    v18->_error = 0;
    hostName = v18->_hostName;
    v18->_hostName = 0;

    objc_storeStrong((id *)&v18->_name, a3);
    objc_storeStrong((id *)&v18->_path, a6);
    portNumber = v18->_portNumber;
    v18->_portNumber = 0;

    v18->_resolve = 0;
    v18->_timeout = a7;
    timer = v18->_timer;
    v18->_timer = 0;

    objc_storeStrong((id *)&v18->_type, a4);
    url = v18->_url;
    v18->_url = 0;
  }
  return v18;
}

- (void)dealloc
{
  [(SDBonjourResolver *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)SDBonjourResolver;
  [(SDBonjourResolver *)&v3 dealloc];
}

- (void)notifyClient:(int)a3
{
  [(SDBonjourResolver *)self cancel];
  self->_error = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bonjourResolverDidChange:self];
}

- (void)parseResults:(const char *)a3 port:(unsigned __int16)a4 txtLen:(unsigned __int16)a5 txtRecord:(const char *)a6 interface:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v10 = a4;
  CFStringRef v12 = CFStringCreateWithCString(0, a3, 0x8000100u);
  if (v12)
  {
    CFStringRef v13 = v12;
    id v14 = sub_1001B4338(v12);
    hostName = self->_hostName;
    self->_hostName = &v14->isa;

    CFRelease(v13);
  }
  id v16 = +[NSNumber numberWithUnsignedShort:v10];
  portNumber = self->_portNumber;
  self->_portNumber = v16;

  if (!self->_path)
  {
    LOBYTE(v38) = 0;
    ValuePtr = TXTRecordGetValuePtr(a5, a6, "path", (uint8_t *)&v38);
    if (ValuePtr)
    {
      v19 = ValuePtr;
      id v20 = objc_alloc((Class)NSString);
      v21 = (NSString *)[v20 initWithBytes:v19 length:v38 encoding:4];
      path = self->_path;
      self->_path = v21;
    }
  }
  v23 = sub_1000D9A10(self->_type);
  if (v23)
  {
    objc_super v24 = v23;
    int v25 = CFEqual(v23, kSFNodeProtocolAirDrop);
    v26 = +[SDStatusMonitor sharedMonitor];
    v27 = v26;
    if (!v25
      || ([v26 browseAllInterfaces] & 1) != 0
      || sub_1001B423C() == v7)
    {
      v28 = airdrop_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        v30 = sub_1001B1A70(v7);
        v31 = v30;
        if (!v30)
        {
          v31 = +[NSNumber numberWithInt:v7];
        }
        int v38 = 138412546;
        v39 = name;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Bonjour resolved %@ over %@", (uint8_t *)&v38, 0x16u);
        if (!v30) {
      }
        }
      v32 = (NSURL *)sub_1000D8564(v24, 0, 0, (__CFString *)self->_hostName, [(NSNumber *)self->_portNumber intValue], (const __CFString *)self->_path, 0, 0);
      url = self->_url;
      self->_url = v32;

      [(SDBonjourResolver *)self notifyClient:0];
    }
    else
    {
      v34 = airdrop_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = self->_name;
        v36 = sub_1001B1A70(v7);
        v37 = v36;
        if (!v36)
        {
          v37 = +[NSNumber numberWithInt:v7];
        }
        int v38 = 138412546;
        v39 = v35;
        __int16 v40 = 2112;
        v41 = v37;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Ignoring Bonjour resolve of %@ over %@", (uint8_t *)&v38, 0x16u);
        if (!v36) {
      }
        }
    }
  }
  else
  {
    v27 = browser_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100239ACC(v27);
    }
  }
}

- (void)resolve
{
  p_connection = &self->_connection;
  if (self->_connection) {
    return;
  }
  uint64_t Connection = DNSServiceCreateConnection(&self->_connection);
  if (!Connection)
  {
    self->_resolve = self->_connection;
    CFStringRef v13 = [(NSString *)self->_name UTF8String];
    id v14 = [(NSString *)self->_type UTF8String];
    id v15 = [(NSString *)self->_domain UTF8String];
    id v16 = +[SDStatusMonitor sharedMonitor];
    if ([(NSString *)self->_type isEqual:sub_1000D94A0()])
    {
      v48 = v13;
      if ([v16 enableDemoMode])
      {
        uint64_t v17 = 0;
        DNSServiceFlags v18 = 0x4000;
      }
      else
      {
        DNSServiceFlags v18 = 1064960;
        uint64_t v19 = sub_1001B423C();
        if (v19)
        {
          uint64_t v17 = v19;
        }
        else
        {
          id v20 = airdrop_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_100239BE8(v20);
          }

          uint64_t v17 = 0;
        }
      }
      v21 = airdrop_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        uint64_t v22 = sub_1001B1A70(v17);
        v23 = (void *)v22;
        v47 = v16;
        if (v22)
        {
          int v45 = 0;
          objc_super v24 = (__CFString *)v22;
        }
        else if (v17)
        {
          objc_super v24 = +[NSNumber numberWithInt:v17];
          int v45 = 1;
        }
        else
        {
          int v45 = 0;
          objc_super v24 = @"all interfaces";
        }
        *(_DWORD *)buf = 138412546;
        v51 = name;
        __int16 v52 = 2112;
        v53 = v24;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Bonjour resolving %@ over %@", buf, 0x16u);
        if (v45) {

        }
        id v16 = v47;
      }

      CFStringRef v13 = v48;
    }
    else
    {
      LODWORD(v17) = 0;
      DNSServiceFlags v18 = 0x4000;
    }
    uint64_t v25 = DNSServiceResolve(&self->_resolve, v18, v17, v13, v14, v15, (DNSServiceResolveReply)sub_1002398D4, self);
    if (v25)
    {
      uint64_t v26 = v25;
      v27 = browser_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100239B7C(v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      uint64_t v34 = DNSServiceSetDispatchQueue(*p_connection, (dispatch_queue_t)&_dispatch_main_q);
      if (!v34)
      {
        if (self->_timeout)
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100239904;
          v49[3] = &unk_1008CA4B8;
          v49[4] = self;
          sub_1001B1B10(0, &_dispatch_main_q, v49);
          v41 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
          timer = self->_timer;
          self->_timer = v41;

          v43 = self->_timer;
          dispatch_time_t v44 = sub_1001B1AF8(15.0);
          sub_1001B1BC4(v43, v44);
          dispatch_resume((dispatch_object_t)self->_timer);
        }
        goto LABEL_32;
      }
      uint64_t v26 = v34;
      v27 = browser_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_100239B10(v26, v27, v35, v36, v37, v38, v39, v40);
      }
    }

    [(SDBonjourResolver *)self notifyClient:v26];
LABEL_32:

    return;
  }
  uint64_t v5 = Connection;
  v6 = browser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100239C2C(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  [(SDBonjourResolver *)self notifyClient:v5];
}

- (void)cancel
{
  resolve = self->_resolve;
  if (resolve)
  {
    DNSServiceRefDeallocate(resolve);
    self->_resolve = 0;
  }
  connection = self->_connection;
  if (connection)
  {
    DNSServiceRefDeallocate(connection);
    self->_connection = 0;
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v6 = self->_timer;
    self->_timer = 0;
  }
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPath:(id)a3
{
}

- (NSString)hostName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHostName:(id)a3
{
}

- (NSNumber)portNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPortNumber:(id)a3
{
}

- (_DNSServiceRef_t)service
{
  return self->_service;
}

- (int)error
{
  return self->_error;
}

- (SDBonjourResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDBonjourResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_portNumber, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end