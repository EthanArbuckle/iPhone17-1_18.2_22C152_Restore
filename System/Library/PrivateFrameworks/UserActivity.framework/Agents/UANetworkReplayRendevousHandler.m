@interface UANetworkReplayRendevousHandler
- (BOOL)listenForIncomingConnections:(id)a3 port:(int)a4 type:(id)a5;
- (BOOL)resume;
- (BOOL)scanForPeersOfType:(id)a3 domain:(id)a4;
- (BOOL)suspend;
- (NSNetService)listeningService;
- (NSNetServiceBrowser)browserLookup;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (UANetworkReplayRendevousHandler)initWithManager:(id)a3;
- (id)statusString;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)netServiceWillPublish:(id)a3;
- (void)netServiceWillResolve:(id)a3;
- (void)setBrowserLookup:(id)a3;
- (void)setDomain:(id)a3;
- (void)setListeningService:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(id)a3;
@end

@implementation UANetworkReplayRendevousHandler

- (UANetworkReplayRendevousHandler)initWithManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UANetworkReplayRendevousHandler;
  return [(UACornerActionManagerHandler *)&v4 initWithManager:a3 name:@"ReplayRendevousHandler"];
}

- (void)dealloc
{
  v3 = [(UANetworkReplayRendevousHandler *)self browserLookup];

  if (v3)
  {
    objc_super v4 = [(UANetworkReplayRendevousHandler *)self browserLookup];
    [v4 stop];

    v5 = [(UANetworkReplayRendevousHandler *)self browserLookup];
    v6 = +[NSRunLoop mainRunLoop];
    [v5 removeFromRunLoop:v6 forMode:NSRunLoopCommonModes];
  }
  v7.receiver = self;
  v7.super_class = (Class)UANetworkReplayRendevousHandler;
  [(UANetworkReplayRendevousHandler *)&v7 dealloc];
}

- (BOOL)scanForPeersOfType:(id)a3 domain:(id)a4
{
  if (a3) {
    CFStringRef v5 = (const __CFString *)a3;
  }
  else {
    CFStringRef v5 = @"_handoff._tcp.";
  }
  v6 = (__CFString *)a4;
  [(UANetworkReplayRendevousHandler *)self setType:v5];
  if (v6) {
    CFStringRef v7 = v6;
  }
  else {
    CFStringRef v7 = @"local";
  }
  [(UANetworkReplayRendevousHandler *)self setDomain:v7];

  v8 = [(UANetworkReplayRendevousHandler *)self browserLookup];

  if (!v8)
  {
    id v9 = objc_alloc_init((Class)NSNetServiceBrowser);
    [(UANetworkReplayRendevousHandler *)self setBrowserLookup:v9];

    v10 = [(UANetworkReplayRendevousHandler *)self browserLookup];
    [v10 setDelegate:self];

    v11 = [(UANetworkReplayRendevousHandler *)self browserLookup];
    v12 = +[NSRunLoop mainRunLoop];
    [v11 scheduleInRunLoop:v12 forMode:NSRunLoopCommonModes];
  }
  if (![(UACornerActionManagerHandler *)self suspended])
  {
    v13 = [(UANetworkReplayRendevousHandler *)self browserLookup];
    v14 = [(UANetworkReplayRendevousHandler *)self type];
    v15 = [(UANetworkReplayRendevousHandler *)self domain];
    [v13 searchForServicesOfType:v14 inDomain:v15];
  }
  return 1;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)UANetworkReplayRendevousHandler;
  BOOL v3 = [(UACornerActionManagerHandler *)&v7 suspend];
  if (v3)
  {
    objc_super v4 = [(UANetworkReplayRendevousHandler *)self browserLookup];

    if (v4)
    {
      CFStringRef v5 = [(UANetworkReplayRendevousHandler *)self browserLookup];
      [v5 stop];
    }
  }
  return v3;
}

- (BOOL)resume
{
  v11.receiver = self;
  v11.super_class = (Class)UANetworkReplayRendevousHandler;
  BOOL v3 = [(UACornerActionManagerHandler *)&v11 resume];
  if (v3)
  {
    objc_super v4 = [(UANetworkReplayRendevousHandler *)self browserLookup];

    if (v4)
    {
      CFStringRef v5 = sub_10000BA18(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = [(UANetworkReplayRendevousHandler *)self type];
        objc_super v7 = [(UANetworkReplayRendevousHandler *)self domain];
        *(_DWORD *)buf = 138543618;
        v13 = v6;
        __int16 v14 = 2114;
        v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "NETWORK:Starting browse for rendezous items for %{public}@ %{public}@.", buf, 0x16u);
      }
      v8 = [(UANetworkReplayRendevousHandler *)self type];
      id v9 = [(UANetworkReplayRendevousHandler *)self domain];
      [(UANetworkReplayRendevousHandler *)self scanForPeersOfType:v8 domain:v9];
    }
  }
  return v3;
}

- (id)statusString
{
  objc_super v4 = [(UANetworkReplayRendevousHandler *)self listeningService];
  if (v4)
  {
    v2 = [(UANetworkReplayRendevousHandler *)self listeningService];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"listening, port=%ld", [v2 port]);
    CFStringRef v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFStringRef v5 = &stru_1000C6800;
  }
  v6 = [(UANetworkReplayRendevousHandler *)self browserLookup];
  if (v6)
  {
    objc_super v7 = [(UANetworkReplayRendevousHandler *)self type];
    v8 = [(UANetworkReplayRendevousHandler *)self domain];
    id v9 = +[NSString stringWithFormat:@"browsing for %@ in %@", v7, v8];
    v10 = +[NSString stringWithFormat:@"Network, %@  %@", v5, v9];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"Network, %@  %@", v5, &stru_1000C6800];
  }

  if (v4)
  {
  }

  return v10;
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_super v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v9 name];
    v13 = (void *)v12;
    CFStringRef v14 = @"NO";
    int v24 = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    if (v5) {
      CFStringRef v14 = @"YES";
    }
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2112;
    CFStringRef v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "NETWORK: browser=%@ service=%@/%@ more=%@", (uint8_t *)&v24, 0x2Au);
  }
  uint64_t v15 = [(UANetworkReplayRendevousHandler *)self name];
  if (!v15) {
    goto LABEL_7;
  }
  v16 = (void *)v15;
  v17 = [(UANetworkReplayRendevousHandler *)self name];
  v18 = [v9 name];
  unsigned __int8 v19 = [v17 isEqual:v18];

  if ((v19 & 1) == 0)
  {
LABEL_7:
    v20 = [UANetworkReplayController alloc];
    v21 = [(UACornerActionManagerHandler *)self manager];
    v22 = [(UANetworkReplayController *)v20 initWithManager:v21 service:v9];

    v23 = [(UACornerActionManagerHandler *)self manager];
    [v23 addHandler:v22];
  }
}

- (BOOL)listenForIncomingConnections:(id)a3 port:(int)a4 type:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (__CFString *)a5;
  objc_super v11 = sub_10000BA18(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    name = self->name;
    *(_DWORD *)buf = 138543874;
    CFStringRef v31 = name;
    __int16 v32 = 2114;
    v33 = v9;
    __int16 v34 = 2048;
    uint64_t v35 = (int)v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "NETWORK: name=%{public}@ type=%{public}@ port=%ld", buf, 0x20u);
  }

  v13 = [(UANetworkReplayRendevousHandler *)self listeningService];

  if (v13)
  {
    CFStringRef v14 = [(UANetworkReplayRendevousHandler *)self listeningService];
    [v14 stop];

    [(UANetworkReplayRendevousHandler *)self setListeningService:0];
  }
  if (v8)
  {
    [(UANetworkReplayRendevousHandler *)self setName:v8];
  }
  else
  {
    uint64_t v15 = +[NSUUID UUID];
    v16 = [v15 UUIDString];
    v17 = +[NSString stringWithFormat:@"Handoff:%@", v16];
    [(UANetworkReplayRendevousHandler *)self setName:v17];
  }
  v18 = sub_10000BA18(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v19 = [(UANetworkReplayRendevousHandler *)self name];
    *(_DWORD *)buf = 138543874;
    CFStringRef v31 = v19;
    __int16 v32 = 2114;
    v33 = v9;
    __int16 v34 = 2048;
    uint64_t v35 = (int)v6;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "NETWORK: Setting up mDNS listener for connections, name=%{public}@ type=%{public}@ port=%ld", buf, 0x20u);
  }
  id v20 = objc_alloc((Class)NSNetService);
  if (v9) {
    CFStringRef v21 = v9;
  }
  else {
    CFStringRef v21 = @"_handoff._tcp.";
  }
  v22 = [(UANetworkReplayRendevousHandler *)self name];
  if (v22)
  {
    v23 = [(UANetworkReplayRendevousHandler *)self name];
  }
  else
  {
    v23 = &stru_1000C6800;
  }
  id v24 = [v20 initWithDomain:@"local" type:v21 name:v23 port:v6];
  [(UANetworkReplayRendevousHandler *)self setListeningService:v24];

  if (v22) {
  id v25 = [(UANetworkReplayRendevousHandler *)self listeningService];
  }
  [v25 setDelegate:self];

  __int16 v26 = [(UANetworkReplayRendevousHandler *)self listeningService];
  uint64_t v27 = +[NSRunLoop mainRunLoop];
  [v26 scheduleInRunLoop:v27 forMode:NSRunLoopCommonModes];

  __int16 v28 = [(UANetworkReplayRendevousHandler *)self listeningService];
  [v28 publishWithOptions:3];

  return 1;
}

- (void)netServiceWillPublish:(id)a3
{
  id v3 = a3;
}

- (void)netServiceDidPublish:(id)a3
{
  id v3 = a3;
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"NSNetServicesErrorDomain"];
  if (v8 == NSNetServicesErrorCode)
  {
    id v9 = sub_10000BA18(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v6 objectForKeyedSubscript:@"NSNetServicesErrorCode"];
      id v11 = [v10 integerValue];
      uint64_t v12 = [v6 description];
      v13 = sub_100063FF0(v12);
      int v14 = 134218242;
      id v15 = v11;
      __int16 v16 = 2114;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NETWORK: NSNetServicesErrorCode=%ld / %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)netServiceWillResolve:(id)a3
{
  id v3 = a3;
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v3 = a3;
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v6 = a3;
  id v5 = a4;
}

- (void)netServiceDidStop:(id)a3
{
  id v4 = a3;
  id v6 = sub_10000BA18(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138477827;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "NETWORK: netServicesDidStop, so terminating this listener, sender=%{private}@.", (uint8_t *)&v7, 0xCu);
  }

  [(UACornerActionManagerHandler *)self terminate];
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v11 = [UANetworkReplayController alloc];
  uint64_t v12 = [(UACornerActionManagerHandler *)self manager];
  v13 = [v16 name];
  int v14 = [(UANetworkReplayController *)v11 initWithManager:v12 inputStream:v8 outputStream:v9 name:v13];

  id v15 = [(UACornerActionManagerHandler *)self manager];
  [v15 addHandler:v14];
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setName:(id)a3
{
}

- (NSNetServiceBrowser)browserLookup
{
  return (NSNetServiceBrowser *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBrowserLookup:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setType:(id)a3
{
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDomain:(id)a3
{
}

- (NSNetService)listeningService
{
  return (NSNetService *)objc_getProperty(self, a2, 80, 1);
}

- (void)setListeningService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeningService, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_browserLookup, 0);

  objc_storeStrong((id *)&self->name, 0);
}

@end