@interface W5DNSSDBrowser
- (BOOL)addServiceInstance:(const char *)a3 serviceType:(const char *)a4 domain:(const char *)a5;
- (_DNSServiceRef_t)serviceRef;
- (id)_deconstructServiceType:(const void *)a3 rdlen:(unsigned __int16)a4;
- (id)_ipStringFromAddress:(const sockaddr *)a3;
- (id)addDomain:(const void *)a3 rdlen:(unsigned __int16)a4;
- (id)addServiceType:(const void *)a3 rdlen:(unsigned __int16)a4 fullname:(const char *)a5;
- (id)browseAllResults;
- (id)init:(BOOL)a3;
- (int)startBrowsing;
- (void)addBrowseContext:(id)a3;
- (void)addBrowseResult:(id)a3 hostname:(const char *)a4 address:(const sockaddr *)a5 interfaceIndex:(unsigned int)a6;
- (void)dealloc;
- (void)stopBrowsing;
@end

@implementation W5DNSSDBrowser

- (id)init:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)W5DNSSDBrowser;
  v4 = [(W5DNSSDBrowser *)&v14 init];
  if (!v4) {
    return v4;
  }
  *((void *)v4 + 2) = dispatch_queue_create("com.apple.wifivelocity.dnssd", 0);
  v5 = (DNSServiceRef *)(v4 + 8);
  DNSServiceErrorType Connection = DNSServiceCreateConnection((DNSServiceRef *)v4 + 1);
  if (Connection || !*v5)
  {
    v10 = sub_10009756C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      v16 = "-[W5DNSSDBrowser init:]";
      __int16 v17 = 2080;
      v18 = "W5LogManager.m";
      __int16 v19 = 1024;
      int v20 = 10075;
      __int16 v21 = 1024;
      DNSServiceErrorType v22 = Connection;
LABEL_12:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    DNSServiceErrorType v7 = DNSServiceSetDispatchQueue(*v5, *((dispatch_queue_t *)v4 + 2));
    if (!v7)
    {
      *((void *)v4 + 3) = +[NSMutableArray array];
      *((void *)v4 + 4) = +[NSMutableDictionary dictionary];
      v4[40] = 0;
      *((void *)v4 + 6) = 0;
      *((void *)v4 + 7) = 0;
      if (v3)
      {
        v4[40] = 1;
        v8 = objc_opt_new();
        *((void *)v4 + 6) = v8;
        [v8 setMaxConcurrentOperationCount:-1];
        *((void *)v4 + 7) = objc_opt_new();
      }
      return v4;
    }
    DNSServiceErrorType v11 = v7;
    v12 = sub_10009756C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      v16 = "-[W5DNSSDBrowser init:]";
      __int16 v17 = 2080;
      v18 = "W5LogManager.m";
      __int16 v19 = 1024;
      int v20 = 10078;
      __int16 v21 = 1024;
      DNSServiceErrorType v22 = v11;
      goto LABEL_12;
    }
  }
  v13 = sub_10009756C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    v16 = "-[W5DNSSDBrowser init:]";
    __int16 v17 = 2080;
    v18 = "W5LogManager.m";
    __int16 v19 = 1024;
    int v20 = 10103;
    _os_log_send_and_compose_impl();
  }
  return 0;
}

- (_DNSServiceRef_t)serviceRef
{
  return self->_sdRef;
}

- (int)startBrowsing
{
  DNSServiceRef sdRef = self->_sdRef;
  return DNSServiceQueryRecord(&sdRef, 0x4000u, 0xFFFFFFFF, "b._dns-sd._udp.local.", 0xCu, 1u, (DNSServiceQueryRecordReply)sub_10007C7DC, self);
}

- (id)addDomain:(const void *)a3 rdlen:(unsigned __int16)a4
{
  if (sub_1000990C8((unsigned __int8 *)a3, 0, v8, 0))
  {
    DNSServiceErrorType v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    return 0;
  }
  else
  {
    v5 = +[NSString stringWithFormat:@"%s", v8];
    [(NSMutableDictionary *)self->browseResults setObject:+[NSMutableDictionary dictionary] forKeyedSubscript:v5];
  }
  return v5;
}

- (id)addServiceType:(const void *)a3 rdlen:(unsigned __int16)a4 fullname:(const char *)a5
{
  id result = [(W5DNSSDBrowser *)self _deconstructServiceType:a3 rdlen:a4];
  if (result)
  {
    id v8 = result;
    v9 = -[NSString substringFromIndex:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a5), "substringFromIndex:", [@"_services._dns-sd._udp." length]);
    id result = [(NSMutableDictionary *)self->browseResults objectForKey:v9];
    if (result)
    {
      [[self->browseResults objectForKeyedSubscript:v9] setObject:+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary") forKeyedSubscript:v8];
      v10[0] = v8;
      v10[1] = v9;
      return +[NSArray arrayWithObjects:v10 count:2];
    }
  }
  return result;
}

- (BOOL)addServiceInstance:(const char *)a3 serviceType:(const char *)a4 domain:(const char *)a5
{
  id v8 = [(NSMutableDictionary *)self->browseResults objectForKey:+[NSString stringWithFormat:@"%s", a5]];
  if (v8)
  {
    id v8 = [v8 objectForKey:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a4)];
    if (v8)
    {
      v9 = v8;
      if (DNSServiceConstructFullName(fullName, a3, a4, a5))
      {
        LOBYTE(v8) = 0;
      }
      else
      {
        [v9 setValue:+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", a3)), +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", fullName) forKey];
        LOBYTE(v8) = 1;
      }
    }
  }
  return (char)v8;
}

- (void)addBrowseResult:(id)a3 hostname:(const char *)a4 address:(const sockaddr *)a5 interfaceIndex:(unsigned int)a6
{
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v10 = [(NSMutableDictionary *)self->browseResults allValues];
  id v11 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    v32 = a5;
    v33 = self;
    v31 = a4;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v16 = [v15 allValues];
        id v17 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (!v17) {
          continue;
        }
        id v18 = v17;
        uint64_t v19 = *(void *)v38;
        while (2)
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v38 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) objectForKey:a3];
            if (v21)
            {
              DNSServiceErrorType v22 = v21;
              if_indextoname(a6, v48);
              v23 = +[NSString stringWithFormat:@"%s", v48];
              int v36 = 0;
              SocketGetInterfaceInfo();
              id v24 = -[W5DNSSDBrowser _ipStringFromAddress:](v33, "_ipStringFromAddress:", v32, 0, &v36);
              v47[0] = +[NSString stringWithFormat:@"%s", v31];
              v47[1] = v23;
              if (v36 <= 31)
              {
                v25 = "Enet";
                switch(v36)
                {
                  case 1:
                    goto LABEL_36;
                  case 2:
                    v25 = "WiFi";
                    break;
                  case 3:
                  case 5:
                  case 6:
                  case 7:
                    goto LABEL_29;
                  case 4:
                    v25 = "AWDL";
                    break;
                  case 8:
                    v25 = "USB";
                    break;
                  default:
                    if (v36 != 16) {
                      goto LABEL_29;
                    }
                    v25 = "Direct";
                    break;
                }
                goto LABEL_36;
              }
              if (v36 > 127)
              {
                if (v36 == 128)
                {
                  v25 = "NAN";
                }
                else
                {
                  if (v36 != 256) {
                    goto LABEL_29;
                  }
                  v25 = "IPsecBT";
                }
              }
              else
              {
                if (v36 != 32)
                {
                  if (v36 == 64)
                  {
                    v25 = "WFD";
                    goto LABEL_36;
                  }
LABEL_29:
                  v25 = "?";
                  if (v36 == 512) {
                    v25 = "IPSecWiFi";
                  }
                  goto LABEL_36;
                }
                v25 = "BTLE";
              }
LABEL_36:
              v47[2] = +[NSString stringWithFormat:@"%s", v25];
              v47[3] = v24;
              [v22 addObject:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4)];
              if (v33->doPing
                && v24
                && ((v36 - 2) <= 0x3E && ((1 << (v36 - 2)) & 0x4000000040000005) != 0
                 || v36 == 128)
                && ([(NSMutableSet *)v33->pingedIPAddresses containsObject:v24] & 1) == 0)
              {
                int sa_family = v32->sa_family;
                if (sa_family == 30)
                {
                  v45[0] = v24;
                  v45[1] = @"-c 1";
                  v45[2] = @"-B";
                  v45[3] = v23;
                  v45[4] = @"-I";
                  v45[5] = v23;
                  v27 = +[NSArray arrayWithObjects:v45 count:6];
                  CFStringRef v28 = @"/sbin/ping6";
                }
                else if (sa_family == 2)
                {
                  v46[0] = v24;
                  v46[1] = @"-c 1";
                  v27 = +[NSArray arrayWithObjects:v46 count:2];
                  CFStringRef v28 = @"/sbin/ping";
                }
                else
                {
                  CFStringRef v28 = 0;
                  v27 = 0;
                }
                pingQueue = v33->pingQueue;
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_10007D20C;
                v35[3] = &unk_1000DD8E0;
                v35[4] = v28;
                v35[5] = v27;
                v35[6] = v33;
                [(NSOperationQueue *)pingQueue addOperationWithBlock:v35];
                pingedIPAddresses = v33->pingedIPAddresses;
                ++v33->addedCount;
                [(NSMutableSet *)pingedIPAddresses addObject:v24];
              }
              return;
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v12);
  }
}

- (void)addBrowseContext:(id)a3
{
}

- (id)browseAllResults
{
  return self->browseResults;
}

- (id)_deconstructServiceType:(const void *)a3 rdlen:(unsigned __int16)a4
{
  v4 = (char *)a3;
  v5 = (char *)a3 + a4;
  v6 = __dst;
  char v7 = 1;
  while (1)
  {
    char v8 = v7;
    if (v5 - v4 < 1) {
      break;
    }
    unint64_t v9 = *v4;
    if ((v9 - 64) < 0xFFFFFFC1 || v5 - v4 <= v9) {
      break;
    }
    unint64_t v10 = v9 + 1;
    memcpy(v6, v4, v9 + 1);
    char v7 = 0;
    v4 += v10;
    v6 += v10;
    if ((v8 & 1) == 0)
    {
      unsigned __int8 *v6 = 0;
      if (!sub_1000990C8(__dst, 0, v13, 0)) {
        return +[NSString stringWithFormat:@"%s", v13];
      }
      id v12 = sub_10009756C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        _os_log_send_and_compose_impl();
      }
      return 0;
    }
  }
  return 0;
}

- (id)_ipStringFromAddress:(const sockaddr *)a3
{
  int sa_family = a3->sa_family;
  if (sa_family == 30)
  {
    v4 = &a3->sa_data[6];
    int v5 = 30;
    socklen_t v6 = 46;
  }
  else
  {
    if (sa_family != 2)
    {
      *(_OWORD *)char v8 = *(_OWORD *)"Unsupported";
      memset(v9, 0, sizeof(v9));
      return +[NSString stringWithFormat:@"%s", v8];
    }
    v4 = &a3->sa_data[2];
    int v5 = 2;
    socklen_t v6 = 16;
  }
  inet_ntop(v5, v4, v8, v6);
  return +[NSString stringWithFormat:@"%s", v8];
}

- (void)stopBrowsing
{
  DNSServiceRef sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  self->_DNSServiceRef sdRef = 0;
  pingQueue = self->pingQueue;
  if (pingQueue) {
    [(NSOperationQueue *)pingQueue cancelAllOperations];
  }

  self->browseContexts = 0;
  int v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

- (void)dealloc
{
  DNSServiceRef sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  dsnsdQueue = self->dsnsdQueue;
  if (dsnsdQueue) {
    dispatch_release(dsnsdQueue);
  }
  browseContexts = self->browseContexts;
  if (browseContexts) {

  }
  pingQueue = self->pingQueue;
  if (pingQueue) {

  }
  pingedIPAddresses = self->pingedIPAddresses;
  if (pingedIPAddresses) {

  }
  v8.receiver = self;
  v8.super_class = (Class)W5DNSSDBrowser;
  [(W5DNSSDBrowser *)&v8 dealloc];
}

@end