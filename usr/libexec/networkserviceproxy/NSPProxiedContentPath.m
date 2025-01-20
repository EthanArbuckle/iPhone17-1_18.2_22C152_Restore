@interface NSPProxiedContentPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFallback;
- (BOOL)fetchingSessionTickets;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)matchesMap:(id)a3;
- (BOOL)pathReady;
- (BOOL)proxiedContentAgentRegistered;
- (BOOL)unregisterResolverAgent;
- (NSArray)resolvedAddresses;
- (NSMutableArray)associatedMaps;
- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration;
- (NSPPrivacyProxyNetworkRegistration)quicRegistration;
- (NSPPrivacyProxyResolverInfo)resolver;
- (NSPProxiedContentPath)initWithCoder:(id)a3;
- (NSPProxiedContentPath)initWithDelegate:(id)a3 initialMap:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 resolver:(id)a7;
- (NSPProxiedContentPathDelegate)delegate;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)description;
- (NSUUID)fallbackAgentUUID;
- (NSUUID)quicAgentUUID;
- (NSUUID)resolverAgentUUID;
- (NWNetworkAgentRegistration)resolverRegistration;
- (id)bootstrapAddresses;
- (id)copyAddressesFromDoHAnswer:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDoHMessageForQuery:(id)a3 name:(const char *)a4;
- (id)createDoHQueryForName:(const char *)a3 type:(unsigned __int16)a4;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)shortName;
- (void)addMap:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchResumableSessionTickets;
- (void)removeProxyAgents;
- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetFallbackProxyAgent;
- (void)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3;
- (void)resetResolverAgentForceUpdateDelegate:(BOOL)a3;
- (void)resetResumableSessionTickets;
- (void)setAssociatedMaps:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setFallbackAgentUUID:(id)a3;
- (void)setFallbackRegistration:(id)a3;
- (void)setFetchingSessionTickets:(BOOL)a3;
- (void)setIngressProxy:(id)a3;
- (void)setProxiedContentAgentRegistered:(BOOL)a3;
- (void)setQuicAgentUUID:(id)a3;
- (void)setQuicRegistration:(id)a3;
- (void)setResolvedAddresses:(id)a3;
- (void)setResolver:(id)a3;
- (void)setResolverAgentUUID:(id)a3;
- (void)setResolverRegistration:(id)a3;
- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3;
- (void)startConnectionForSessionTicketsWithEndpoint:(id)a3 parameters:(id)a4 dohQueryType:(unsigned __int16)a5 completionHandler:(id)a6;
@end

@implementation NSPProxiedContentPath

- (NSPProxiedContentPath)initWithDelegate:(id)a3 initialMap:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 resolver:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)NSPProxiedContentPath;
  v17 = [(NSPProxiedContentPath *)&v25 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v12);
    v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    associatedMaps = v18->_associatedMaps;
    v18->_associatedMaps = v19;

    [(NSMutableArray *)v18->_associatedMaps addObject:v13];
    objc_storeStrong((id *)&v18->_ingressProxy, a5);
    objc_storeStrong((id *)&v18->_egressProxy, a6);
    objc_storeStrong((id *)&v18->_resolver, a7);
    v21 = v18;
  }
  else
  {
    v23 = nplog_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "[super init] failed", v24, 2u);
    }
  }
  return v18;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
  v8 = [(NSPProxiedContentPath *)self ingressProxy];
  sub_1000482D4(v7, v8, @"Ingress proxy", a3, a4);

  v9 = [(NSPProxiedContentPath *)self egressProxy];
  sub_1000482D4(v7, v9, @"Egress proxy", a3, a4);

  v10 = [(NSPProxiedContentPath *)self quicAgentUUID];
  sub_1000482D4(v7, v10, @"QUIC Agent UUID", a3, a4);

  v11 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
  sub_1000482D4(v7, v11, @"Fallback Agent UUID", a3, a4);

  id v12 = [(NSPProxiedContentPath *)self resolverAgentUUID];
  sub_1000482D4(v7, v12, @"Resolver Agent UUID", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)[(NSPProxiedContentPath *)self descriptionWithIndent:0 options:14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxiedContentPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NSPProxiedContentPath;
  v5 = [(NSPProxiedContentPath *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathIngressProxy"];
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathEgressProxy"];
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathResolver"];
    resolver = v5->_resolver;
    v5->_resolver = (NSPPrivacyProxyResolverInfo *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathQUICAgentUUID"];
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathFallbackAgentUUID"];
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathResolverAgentUUID"];
    resolverAgentUUID = v5->_resolverAgentUUID;
    v5->_resolverAgentUUID = (NSUUID *)v16;

    uint64_t v18 = objc_opt_class();
    v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"proxyPathResolvedAddresses"];
    resolvedAddresses = v5->_resolvedAddresses;
    v5->_resolvedAddresses = (NSArray *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"proxyPathAssociatedMaps"];

    if (v24)
    {
      objc_super v25 = (NSMutableArray *)[v24 mutableCopy];
      associatedMaps = v5->_associatedMaps;
      v5->_associatedMaps = v25;
    }
    if (v5->_resolver && v5->_resolverAgentUUID) {
      [(NSPProxiedContentPath *)v5 resetResolverAgentForceUpdateDelegate:0];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSPProxiedContentPath *)self ingressProxy];
  [v4 encodeObject:v5 forKey:@"proxyPathIngressProxy"];

  uint64_t v6 = [(NSPProxiedContentPath *)self egressProxy];
  [v4 encodeObject:v6 forKey:@"proxyPathEgressProxy"];

  id v7 = [(NSPProxiedContentPath *)self resolver];
  [v4 encodeObject:v7 forKey:@"proxyPathResolver"];

  uint64_t v8 = [(NSPProxiedContentPath *)self quicAgentUUID];
  [v4 encodeObject:v8 forKey:@"proxyPathQUICAgentUUID"];

  v9 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
  [v4 encodeObject:v9 forKey:@"proxyPathFallbackAgentUUID"];

  uint64_t v10 = [(NSPProxiedContentPath *)self resolverAgentUUID];
  [v4 encodeObject:v10 forKey:@"proxyPathResolverAgentUUID"];

  v11 = [(NSPProxiedContentPath *)self resolvedAddresses];
  [v4 encodeObject:v11 forKey:@"proxyPathResolvedAddresses"];

  id v12 = [(NSPProxiedContentPath *)self associatedMaps];
  [v4 encodeObject:v12 forKey:@"proxyPathAssociatedMaps"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPProxiedContentPath allocWithZone:a3] init];
  v5 = [(NSPProxiedContentPath *)self associatedMaps];
  [(NSPProxiedContentPath *)v4 setAssociatedMaps:v5];

  uint64_t v6 = [(NSPProxiedContentPath *)self ingressProxy];
  [(NSPProxiedContentPath *)v4 setIngressProxy:v6];

  id v7 = [(NSPProxiedContentPath *)self egressProxy];
  [(NSPProxiedContentPath *)v4 setEgressProxy:v7];

  uint64_t v8 = [(NSPProxiedContentPath *)self resolver];
  [(NSPProxiedContentPath *)v4 setResolver:v8];

  v9 = [(NSPProxiedContentPath *)self quicAgentUUID];
  [(NSPProxiedContentPath *)v4 setQuicAgentUUID:v9];

  uint64_t v10 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
  [(NSPProxiedContentPath *)v4 setFallbackAgentUUID:v10];

  v11 = [(NSPProxiedContentPath *)self resolverAgentUUID];
  [(NSPProxiedContentPath *)v4 setResolverAgentUUID:v11];

  id v12 = [(NSPProxiedContentPath *)self quicRegistration];
  [(NSPProxiedContentPath *)v4 setQuicRegistration:v12];

  id v13 = [(NSPProxiedContentPath *)self fallbackRegistration];
  [(NSPProxiedContentPath *)v4 setFallbackRegistration:v13];

  uint64_t v14 = [(NSPProxiedContentPath *)self resolverRegistration];
  [(NSPProxiedContentPath *)v4 setResolverRegistration:v14];

  id v15 = [(NSPProxiedContentPath *)self resolvedAddresses];
  [(NSPProxiedContentPath *)v4 setResolvedAddresses:v15];

  [(NSPProxiedContentPath *)v4 setProxiedContentAgentRegistered:[(NSPProxiedContentPath *)self proxiedContentAgentRegistered]];
  return v4;
}

- (id)shortName
{
  v3 = [(NSPProxiedContentPath *)self resolver];

  if (v3)
  {
    id v4 = [(NSPProxiedContentPath *)self resolver];
    uint64_t v5 = [v4 dohURL];
  }
  else
  {
    uint64_t v6 = [(NSPProxiedContentPath *)self egressProxy];
    id v4 = v6;
    if (v6) {
      uint64_t v6 = (void *)v6[3];
    }
    uint64_t v5 = [v6 vendor];
  }
  id v7 = (void *)v5;

  return v7;
}

- (BOOL)matchesMap:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(NSPProxiedContentPath *)self associatedMaps];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v4 proxiesCount];
        if (v10 == [v9 proxiesCount])
        {
          unsigned int v11 = [v4 hasResolver];
          if (v11 == [v9 hasResolver])
          {
            unsigned int v12 = [v4 isPrivacyProxy];
            if (v12 == [v9 isPrivacyProxy])
            {
              unsigned int v13 = [v4 resolver];
              if (v13 == [v9 resolver])
              {
                if ([v4 proxiesCount])
                {
                  unint64_t v14 = 0;
                  do
                  {
                    LODWORD(v6) = *((_DWORD *)[v4 proxies] + v14);
                    LOBYTE(v6) = v6 == *((_DWORD *)[v9 proxies] + v14);
                    if (!(_BYTE)v6) {
                      break;
                    }
                    ++v14;
                  }
                  while (v14 < (unint64_t)[v4 proxiesCount]);
                }
                else
                {
                  LOBYTE(v6) = 1;
                }
                goto LABEL_20;
              }
            }
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  return (char)v6;
}

- (void)addMap:(id)a3
{
  id v4 = a3;
  id v5 = [(NSPProxiedContentPath *)self associatedMaps];
  [v5 addObject:v4];
}

- (BOOL)matchIngress:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    id v5 = [(NSPProxiedContentPath *)self ingressProxy];

    if (v5)
    {
      uint64_t v6 = [(NSPProxiedContentPath *)self ingressProxy];
      uint64_t v7 = (void *)v6;
      if (v6) {
        uint64_t v8 = *(void **)(v6 + 24);
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;
      id v10 = [v9 proxyURL];
      unsigned int v11 = [v4[3] proxyURL];
      LOBYTE(v5) = [v10 isEqualToString:v11];
    }
  }
  else
  {
    unsigned int v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      id v15 = "-[NSPProxiedContentPath matchIngress:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v14, 0xCu);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (BOOL)matchEgress:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    id v5 = [(NSPProxiedContentPath *)self egressProxy];

    if (v5)
    {
      uint64_t v6 = [(NSPProxiedContentPath *)self egressProxy];
      uint64_t v7 = (void *)v6;
      if (v6) {
        uint64_t v8 = *(void **)(v6 + 24);
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;
      id v10 = [v9 proxyURL];
      unsigned int v11 = [v4[3] proxyURL];
      LOBYTE(v5) = [v10 isEqualToString:v11];
    }
  }
  else
  {
    unsigned int v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      id v15 = "-[NSPProxiedContentPath matchEgress:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v14, 0xCu);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (id *)a3;
  long long buffer = 0u;
  memset(v34, 0, sizeof(v34));
  id v9 = [a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v9)
  {
    unsigned int v11 = 0;
    goto LABEL_7;
  }
  id v10 = +[NWPath pathForClientID:v9];
  unsigned int v11 = v10;
  if (!v10)
  {
LABEL_7:
    long long v16 = 0;
    unsigned int v12 = 0;
    goto LABEL_13;
  }
  unsigned int v12 = [v10 interface];
  unsigned int v13 = [v11 parameters];
  int v14 = [v13 pid];
  if (!v14)
  {
LABEL_11:
    long long v16 = 0;
    goto LABEL_12;
  }
  int v15 = v14;
  if (proc_pidinfo(v14, 13, 1uLL, &buffer, 64) != 64)
  {
    long long v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v25 = 67109120;
      int v26 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v25, 8u);
    }

    goto LABEL_11;
  }
  long long v16 = (const char *)v34;
LABEL_12:

LABEL_13:
  long long v18 = nplog_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v16) {
      long long v19 = v16;
    }
    else {
      long long v19 = "none";
    }
    uint64_t v20 = sub_100049210(v8);
    v21 = [v12 interfaceName];
    int v25 = 67109890;
    int v26 = v6;
    __int16 v27 = 2080;
    objc_super v28 = v19;
    __int16 v29 = 2112;
    v30 = v20;
    __int16 v31 = 2112;
    v32 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for content-specific %@ agent on interface %@", (uint8_t *)&v25, 0x26u);
  }
  if (v6)
  {
    if (v6 == 1303)
    {
      uint64_t v22 = nplog_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Flushing resolved addresses", (uint8_t *)&v25, 2u);
      }

      [(NSPProxiedContentPath *)self setResolvedAddresses:0];
      [(NSPProxiedContentPath *)self resetQUICProxyAgentForceUpdateDelegate:0];
      [(NSPProxiedContentPath *)self resetResolverAgentForceUpdateDelegate:0];
      v23 = [(NSPProxiedContentPath *)self delegate];
      [v23 updateUserEventAgentData];
    }
    else if (v6 == 35)
    {
      [(NSPProxiedContentPath *)self resetResumableSessionTickets];
    }
    v24 = [(NSPProxiedContentPath *)self delegate];
    [v24 reportProxiedContentPathError:v6 interface:v12 proxiedContentPath:self registration:v8];
  }
}

- (void)reportErrorForDNSAgent:(id)a3 error:(int)a4 withOptions:(id)a5
{
  id v7 = a3;
  long long buffer = 0u;
  memset(v31, 0, sizeof(v31));
  uint64_t v8 = [a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v8)
  {
    id v10 = 0;
    goto LABEL_7;
  }
  id v9 = +[NWPath pathForClientID:v8];
  id v10 = v9;
  if (!v9)
  {
LABEL_7:
    int v15 = 0;
    unsigned int v11 = 0;
    goto LABEL_13;
  }
  unsigned int v11 = [v9 interface];
  unsigned int v12 = [v10 parameters];
  int v13 = [v12 pid];
  if (!v13)
  {
LABEL_11:
    int v15 = 0;
    goto LABEL_12;
  }
  int v14 = v13;
  if (proc_pidinfo(v13, 13, 1uLL, &buffer, 64) != 64)
  {
    long long v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v22 = 67109120;
      int v23 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v22, 8u);
    }

    goto LABEL_11;
  }
  int v15 = (const char *)v31;
LABEL_12:

LABEL_13:
  long long v17 = nplog_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v15) {
      long long v18 = v15;
    }
    else {
      long long v18 = "none";
    }
    long long v19 = [v7 resolver];
    uint64_t v20 = [v19 dohURL];
    v21 = [v11 interfaceName];
    int v22 = 67109890;
    int v23 = a4;
    __int16 v24 = 2080;
    int v25 = v18;
    __int16 v26 = 2112;
    __int16 v27 = v20;
    __int16 v28 = 2112;
    __int16 v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for content-specific %@ resolver agent on interface %@", (uint8_t *)&v22, 0x26u);
  }
}

- (BOOL)pathReady
{
  v3 = [(NSPProxiedContentPath *)self ingressProxy];
  if (sub_10000EDFC((uint64_t)v3))
  {
    id v4 = [(NSPProxiedContentPath *)self ingressProxy];
    unint64_t v5 = sub_100010F2C((uint64_t)v4);
    uint64_t v6 = [(NSPProxiedContentPath *)self ingressProxy];
    unint64_t v7 = sub_100011C74((uint64_t)v6);

    if (v5 <= v7)
    {
      uint64_t v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(NSPProxiedContentPath *)self ingressProxy];
        uint64_t v10 = sub_100010F2C((uint64_t)v9);
        unsigned int v11 = [(NSPProxiedContentPath *)self shortName];
        unsigned int v12 = [(NSPProxiedContentPath *)self ingressProxy];
        int v23 = 134218498;
        uint64_t v24 = v10;
        __int16 v25 = 2112;
        __int16 v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = sub_100011C74((uint64_t)v12);
        int v13 = "proxied content path is not ready due to insufficient ingress proxy tokens (cache+agent: %lu) for [%@], (i"
              "ngress proxy low-water mark: %lu)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v23, 0x20u);

        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  int v14 = [(NSPProxiedContentPath *)self egressProxy];
  if (sub_10000EDFC((uint64_t)v14))
  {
    int v15 = [(NSPProxiedContentPath *)self egressProxy];
    unint64_t v16 = sub_100010F2C((uint64_t)v15);
    long long v17 = [(NSPProxiedContentPath *)self egressProxy];
    unint64_t v18 = sub_100011C74((uint64_t)v17);

    if (v16 <= v18)
    {
      uint64_t v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(NSPProxiedContentPath *)self egressProxy];
        uint64_t v19 = sub_100010F2C((uint64_t)v9);
        unsigned int v11 = [(NSPProxiedContentPath *)self shortName];
        unsigned int v12 = [(NSPProxiedContentPath *)self egressProxy];
        int v23 = 134218498;
        uint64_t v24 = v19;
        __int16 v25 = 2112;
        __int16 v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = sub_100011C74((uint64_t)v12);
        int v13 = "proxied content path is not ready due to insufficient egress proxy tokens (cache+agent: %lu) for [%@], (eg"
              "ress proxy low-water mark: %lu)";
        goto LABEL_10;
      }
LABEL_11:
      BOOL v20 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v8 = nplog_obj();
  BOOL v20 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v21 = [(NSPProxiedContentPath *)self shortName];
    int v23 = 138412290;
    uint64_t v24 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "proxied content path [%@] is ready", (uint8_t *)&v23, 0xCu);
  }
LABEL_15:

  return v20;
}

- (BOOL)allowFallback
{
  uint64_t v3 = [(NSPProxiedContentPath *)self egressProxy];
  id v4 = (void *)v3;
  if (v3) {
    unint64_t v5 = *(void **)(v3 + 24);
  }
  else {
    unint64_t v5 = 0;
  }
  id v6 = v5;
  if ([v6 supportsFallback])
  {
    unint64_t v7 = [(NSPProxiedContentPath *)self ingressProxy];
    if (v7)
    {
      uint64_t v8 = [(NSPProxiedContentPath *)self ingressProxy];
      id v9 = v8;
      if (v8) {
        uint64_t v8 = (void *)v8[3];
      }
      unsigned __int8 v10 = [v8 supportsFallback];
    }
    else
    {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)resetResumableSessionTickets
{
  uint64_t v3 = [(NSPProxiedContentPath *)self quicRegistration];
  if (v3)
  {
    id v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = [(NSPProxiedContentPath *)self shortName];
      int v6 = 138412290;
      unint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Flushing session tickets for proxied content path [%@]", (uint8_t *)&v6, 0xCu);
    }
    [v3[3] flushTokens];
    [(NSPProxiedContentPath *)self fetchResumableSessionTickets];
  }
}

- (id)createDoHQueryForName:(const char *)a3 type:(unsigned __int16)a4
{
  if (a3)
  {
    memset(&buffer[17], 0, 256);
    if (!DomainNameFromString())
    {
      memset(buffer, 0, 272);
      DNSMessageWriteQuery();
    }
  }
  else
  {
    id v4 = nplog_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buffer[0]) = 136315138;
      *(void *)((char *)buffer + 4) = "-[NSPProxiedContentPath createDoHQueryForName:type:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%s called with null name", (uint8_t *)buffer, 0xCu);
    }
  }

  return 0;
}

- (id)createDoHMessageForQuery:(id)a3 name:(const char *)a4
{
  unint64_t v5 = a3;
  int v6 = nw_content_context_create("DoH Message");
  metadata = nw_http_create_metadata();
  nw_http_metadata_set_method();
  nw_http_metadata_set_path();
  uint64_t v8 = +[NSString stringWithFormat:@"https://%s/dns-query", a4];
  nw_endpoint_t url = nw_endpoint_create_url((const char *)[v8 UTF8String]);
  nw_http_metadata_set_endpoint();

  nw_http_metadata_add_header();
  nw_http_metadata_add_header();
  size_t size = dispatch_data_get_size(v5);

  *(void *)__str = 0;
  uint64_t v13 = 0;
  snprintf(__str, 0x10uLL, "%zu", size);
  nw_http_metadata_add_header();
  nw_content_context_set_metadata_for_protocol(v6, metadata);
  nw_content_context_set_is_final(v6, 1);

  return v6;
}

- (id)copyAddressesFromDoHAnswer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    int v8 = 0;
    uint64_t v7 = 0;
    [v3 bytes];
    [v3 length];
    unint64_t v5 = (void *)DNSMessageCollapse();
    if (v5) {
      free(v5);
    }
  }

  return v4;
}

- (void)startConnectionForSessionTicketsWithEndpoint:(id)a3 parameters:(id)a4 dohQueryType:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v7 = a5;
  unsigned __int8 v10 = a3;
  unsigned int v11 = a4;
  id v12 = a6;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100005D5C;
  __int16 v29 = sub_10000F6B0;
  nw_connection_t v30 = nw_connection_create(v10, v11);
  uint64_t v13 = v26[5];
  int v14 = NPGetInternalQueue();
  nw_connection_set_queue(v13, v14);

  location[1] = _NSConcreteStackBlock;
  location[2] = (id)3221225472;
  location[3] = sub_100018DF4;
  location[4] = &unk_100105910;
  location[5] = &v25;
  nw_connection_set_event_handler();
  hostname = nw_endpoint_get_hostname(v10);
  unint64_t v16 = [(NSPProxiedContentPath *)self createDoHQueryForName:hostname type:v7];
  long long v17 = [(NSPProxiedContentPath *)self createDoHMessageForQuery:v16 name:hostname];
  nw_connection_send((nw_connection_t)v26[5], v16, v17, 1, _nw_connection_send_idempotent_content);
  nw_connection_start((nw_connection_t)v26[5]);
  objc_initWeak(location, self);
  unint64_t v18 = v26[5];
  completion[0] = _NSConcreteStackBlock;
  completion[1] = 3221225472;
  completion[2] = sub_100018F40;
  completion[3] = &unk_100105938;
  objc_copyWeak(&v23, location);
  id v19 = v12;
  id v21 = v19;
  int v22 = &v25;
  nw_connection_receive_message(v18, completion);

  objc_destroyWeak(&v23);
  objc_destroyWeak(location);

  _Block_object_dispose(&v25, 8);
}

- (id)bootstrapAddresses
{
  id v3 = [(NSPProxiedContentPath *)self ingressProxy];
  if (v3) {
    [(NSPProxiedContentPath *)self ingressProxy];
  }
  else {
  id v4 = [(NSPProxiedContentPath *)self egressProxy];
  }

  if (v4) {
    unint64_t v5 = (void *)v4[3];
  }
  else {
    unint64_t v5 = 0;
  }
  int v6 = [v5 bootstrapAddresses];
  if ([v6 count])
  {
    uint64_t v7 = [v6 sortedArrayUsingComparator:&stru_100105978];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)fetchResumableSessionTickets
{
  if (![(NSPProxiedContentPath *)self fetchingSessionTickets])
  {
    [(NSPProxiedContentPath *)self setResolvedAddresses:0];
    id v3 = [(NSPProxiedContentPath *)self quicRegistration];
    selfa = v3;
    if (v3)
    {
      id v5 = objc_getProperty(v3, v4, 48, 1);
      if (v5)
      {
        int v51 = 4;
        nw_protocol_definition_t v6 = nw_protocol_copy_tcp_definition();
        id v29 = v5;
        __int16 v26 = (void *)nw_proxy_config_copy_protocol_stack();

        if (v26)
        {
          endpoint = nw_proxy_config_copy_endpoint();
          if (endpoint)
          {
            uint64_t v7 = nw_proxy_config_copy_parameters_to_proxy();
            int v8 = v7;
            if (v7)
            {
              stack = nw_parameters_copy_default_protocol_stack(v7);
              if (stack)
              {
                os_log_t oslog = [(NSPProxiedContentPath *)self bootstrapAddresses];
                if ([oslog count]
                  && (nw_endpoint_get_type(endpoint) == nw_endpoint_type_host
                   || nw_endpoint_get_type(endpoint) == nw_endpoint_type_url))
                {
                  nw_endpoint_get_port(endpoint);
                  direct = (void *)nw_proxy_config_create_direct();
                  nw_proxy_config_set_prohibit_direct();
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v47 = 0u;
                  long long v48 = 0u;
                  unsigned __int8 v10 = oslog;
                  id v11 = [v10 countByEnumeratingWithState:&v47 objects:v57 count:16];
                  if (v11)
                  {
                    char v12 = 0;
                    uint64_t v13 = *(void *)v48;
                    do
                    {
                      for (i = 0; i != v11; i = (char *)i + 1)
                      {
                        if (*(void *)v48 != v13) {
                          objc_enumerationMutation(v10);
                        }
                        [*(id *)(*((void *)&v47 + 1) + 8 * i) UTF8String:v26];
                        host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
                        unint64_t v16 = host_with_numeric_port;
                        if (host_with_numeric_port
                          && nw_endpoint_get_type(host_with_numeric_port) == nw_endpoint_type_address)
                        {
                          nw_proxy_config_add_resolved_endpoint();
                          char v12 = 1;
                        }
                      }
                      id v11 = [v10 countByEnumeratingWithState:&v47 objects:v57 count:16];
                    }
                    while (v11);

                    if (v12) {
                      nw_parameters_add_custom_proxy_config();
                    }
                  }
                  else
                  {
                  }
                }
                nw_parameters_set_fast_open_enabled(v8, 1);
                uint64_t v17 = [(NSPProxiedContentPath *)self egressProxy];
                unint64_t v18 = (void *)v17;
                if (v17) {
                  id v19 = *(void **)(v17 + 24);
                }
                else {
                  id v19 = 0;
                }
                BOOL v20 = [v19 proxyURL:v26];

                nw_endpoint_t url = nw_endpoint_create_url((const char *)[v20 UTF8String]);
                nw_parameters_set_url_endpoint();

                objc_initWeak(&location, self);
                iterate_block[0] = _NSConcreteStackBlock;
                iterate_block[1] = 3221225472;
                iterate_block[2] = sub_1000198D4;
                iterate_block[3] = &unk_1001059C8;
                objc_copyWeak(&v45, &location);
                nw_protocol_stack_iterate_application_protocols(stack, iterate_block);
                [(NSPProxiedContentPath *)self setFetchingSessionTickets:1];
                *(void *)&long long buf = 0;
                *((void *)&buf + 1) = &buf;
                uint64_t v53 = 0x3032000000;
                v54 = sub_100005D5C;
                v55 = sub_10000F6B0;
                id v56 = (id)os_transaction_create();
                int v22 = dispatch_group_create();
                dispatch_group_enter(v22);
                v42[0] = 0;
                v42[1] = v42;
                v42[2] = 0x3032000000;
                v42[3] = sub_100005D5C;
                v42[4] = sub_10000F6B0;
                id v43 = &__NSArray0__struct;
                v40[0] = 0;
                v40[1] = v40;
                v40[2] = 0x3032000000;
                v40[3] = sub_100005D5C;
                v40[4] = sub_10000F6B0;
                id v41 = &__NSArray0__struct;
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v37[2] = sub_100019B10;
                v37[3] = &unk_1001059F0;
                v39 = v42;
                id v23 = v22;
                v38 = v23;
                [(NSPProxiedContentPath *)self startConnectionForSessionTicketsWithEndpoint:endpoint parameters:v8 dohQueryType:1 completionHandler:v37];
                dispatch_group_enter(v23);
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_100019B7C;
                _OWORD v34[3] = &unk_1001059F0;
                v36 = v40;
                uint64_t v24 = v23;
                v35 = v24;
                [(NSPProxiedContentPath *)self startConnectionForSessionTicketsWithEndpoint:endpoint parameters:v8 dohQueryType:28 completionHandler:v34];
                uint64_t v25 = NPGetInternalQueue();
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_100019BE8;
                block[3] = &unk_100105A18;
                block[4] = &buf;
                objc_copyWeak(&v33, &location);
                block[5] = v40;
                block[6] = v42;
                dispatch_group_notify(v24, v25, block);

                objc_destroyWeak(&v33);
                _Block_object_dispose(v40, 8);

                _Block_object_dispose(v42, 8);
                _Block_object_dispose(&buf, 8);

                objc_destroyWeak(&v45);
                objc_destroyWeak(&location);
              }
              else
              {
                nplog_obj();
                os_log_t oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(buf) = 136315138;
                  *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                  _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "%s called with null proxyStack", (uint8_t *)&buf, 0xCu);
                }
              }
            }
            else
            {
              stack = nplog_obj();
              if (os_log_type_enabled(stack, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 136315138;
                *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
                _os_log_fault_impl((void *)&_mh_execute_header, stack, OS_LOG_TYPE_FAULT, "%s called with null proxyParameters", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          else
          {
            int v8 = nplog_obj();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
            {
              LODWORD(buf) = 136315138;
              *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
              _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null proxyEndpoint", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        else
        {
          endpoint = nplog_obj();
          if (os_log_type_enabled(endpoint, OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf) = 136315138;
            *(void *)((char *)&buf + 4) = "-[NSPProxiedContentPath fetchResumableSessionTickets]";
            _os_log_fault_impl((void *)&_mh_execute_header, endpoint, OS_LOG_TYPE_FAULT, "%s called with null stack", (uint8_t *)&buf, 0xCu);
          }
        }

        id v5 = v29;
      }

      id v3 = selfa;
    }
  }
}

- (void)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  id v4 = [(NSPProxiedContentPath *)self egressProxy];

  if (v4)
  {
    id v5 = [(NSPProxiedContentPath *)self quicAgentUUID];

    if (!v5)
    {
      nw_protocol_definition_t v6 = +[NSUUID UUID];
      [(NSPProxiedContentPath *)self setQuicAgentUUID:v6];
    }
    uint64_t v7 = [(NSPProxiedContentPath *)self quicRegistration];

    if (!v7)
    {
      int v8 = [NSPPrivacyProxyProxiedContentNetworkRegistration alloc];
      id v9 = [(NSPProxiedContentPath *)self quicAgentUUID];
      unsigned __int8 v10 = [(NSPProxiedContentPath *)self shortName];
      id v11 = sub_10004D474((id *)&v8->super.super.isa, v9, (uint64_t)v10, self);
      [(NSPProxiedContentPath *)self setQuicRegistration:v11];

      char v12 = [(NSPProxiedContentPath *)self quicRegistration];

      if (!v12)
      {
        v95 = nplog_obj();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          v97 = "-[NSPProxiedContentPath resetQUICProxyAgentForceUpdateDelegate:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_FAULT, "%s called with null self.quicRegistration", buf, 0xCu);
        }
        goto LABEL_85;
      }
    }
    uint64_t v13 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
    if (v13)
    {
      int v14 = (void *)v13;
      uint64_t v15 = [(NSPProxiedContentPath *)self fallbackRegistration];
      if (!v15)
      {
        v88 = 0;
        v95 = 0;
        goto LABEL_10;
      }
      unint64_t v16 = (void *)v15;
      unsigned int v17 = [*(id *)(v15 + 24) isRegistered];

      if (v17)
      {
        v95 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
        int v14 = [(NSPProxiedContentPath *)self fallbackRegistration];
        v88 = sub_10004A110((uint64_t)v14);
LABEL_10:

        goto LABEL_12;
      }
    }
    v88 = 0;
    v95 = 0;
LABEL_12:
    unint64_t v18 = [(NSPProxiedContentPath *)self delegate];
    unsigned int v19 = [v18 disableDoHBootstrapResults];

    if (v19)
    {
      [(NSPProxiedContentPath *)self setResolvedAddresses:0];
    }
    else
    {
      BOOL v20 = [(NSPProxiedContentPath *)self resolvedAddresses];

      if (!v20)
      {
        id v21 = [(NSPProxiedContentPath *)self bootstrapAddresses];
        [(NSPProxiedContentPath *)self setResolvedAddresses:v21];
      }
    }
    int v22 = [(NSPProxiedContentPath *)self ingressProxy];
    if (v22) {
      [(NSPProxiedContentPath *)self ingressProxy];
    }
    else {
    uint64_t v23 = [(NSPProxiedContentPath *)self egressProxy];
    }

    uint64_t v24 = [(NSPProxiedContentPath *)self ingressProxy];
    if (v24)
    {
      uint64_t v25 = [(NSPProxiedContentPath *)self egressProxy];
    }
    else
    {
      uint64_t v25 = 0;
    }

    __int16 v26 = [(NSPProxiedContentPath *)self quicRegistration];
    uint64_t v27 = sub_10004A110((uint64_t)v26);
    sub_100049324(v26, 4);
    if (v23) {
      uint64_t v28 = *(void **)(v23 + 24);
    }
    else {
      uint64_t v28 = 0;
    }
    id v29 = v28;
    v94 = [v29 proxyURL];
    if (v25) {
      nw_connection_t v30 = (void *)v25[3];
    }
    else {
      nw_connection_t v30 = 0;
    }
    id v31 = v30;
    v93 = [v31 proxyURL];
    if (v23) {
      v32 = *(void **)(v23 + 24);
    }
    else {
      v32 = 0;
    }
    id v33 = v32;
    v92 = [v33 proxyKeyInfos];
    if (v25) {
      v34 = (void *)v25[3];
    }
    else {
      v34 = 0;
    }
    id v35 = v34;
    v91 = [v35 proxyKeyInfos];
    if (v23) {
      v36 = *(void **)(v23 + 24);
    }
    else {
      v36 = 0;
    }
    id v37 = v36;
    v90 = [v37 proxyVersion];
    if (v25) {
      v38 = (void *)v25[3];
    }
    else {
      v38 = 0;
    }
    id v78 = v38;
    v89 = [v78 proxyVersion];
    if (v23) {
      v39 = *(void **)(v23 + 24);
    }
    else {
      v39 = 0;
    }
    id v77 = v39;
    int v74 = [v77 supportsResumption];
    if (v25) {
      v40 = (void *)v25[3];
    }
    else {
      v40 = 0;
    }
    id v76 = v40;
    char v73 = [v76 supportsResumption];
    BOOL v75 = sub_10000EDFC(v23);
    if (v75)
    {
      if (v23) {
        id v41 = *(void **)(v23 + 48);
      }
      else {
        id v41 = 0;
      }
      id v87 = v41;
    }
    else
    {
      id v87 = 0;
    }
    BOOL v72 = sub_10000EDFC((uint64_t)v25);
    if (v72)
    {
      if (v25) {
        v42 = (void *)v25[6];
      }
      else {
        v42 = 0;
      }
      id v71 = v42;
    }
    else
    {
      id v71 = 0;
    }
    v83 = v29;
    v81 = v33;
    if (v23) {
      id v43 = *(void **)(v23 + 24);
    }
    else {
      id v43 = 0;
    }
    id v44 = v43;
    uint64_t v45 = [v44 tokenChallenge];
    v46 = (void *)v45;
    v86 = (void *)v23;
    v84 = (void *)v27;
    v82 = v31;
    v79 = v37;
    v80 = v35;
    long long v47 = v26;
    if (v25) {
      long long v48 = (void *)v25[3];
    }
    else {
      long long v48 = 0;
    }
    BOOL v49 = v45 != 0;
    id v50 = v48;
    int v51 = [v50 tokenChallenge];
    v52 = [(NSPProxiedContentPath *)self resolvedAddresses];
    v85 = self;
    uint64_t v53 = [(NSPProxiedContentPath *)self associatedMaps];
    v54 = [v53 firstObject];
    BYTE1(v69) = v51 != 0;
    LOBYTE(v69) = v49;
    sub_10004D524(v47, v94, v93, v92, v91, v90, v89, v74, v73, v87, v71, v69, v52, v95, v88, (char)[v54 isPrivacyProxy]);

    if (v72) {
    if (v75)
    }

    v55 = sub_10004A110((uint64_t)v47);
    uint64_t v56 = [(NSPProxiedContentPath *)v85 resolver];
    if (v56)
    {
      v57 = (void *)v56;
      unsigned __int8 v58 = [v55 isEqualToData:v84];

      if ((v58 & 1) == 0) {
        [(NSPProxiedContentPath *)v85 unregisterResolverAgent];
      }
    }
    if (v86) {
      v59 = (void *)v86[3];
    }
    else {
      v59 = 0;
    }
    if ([v59 supportsResumption])
    {
      if (v47) {
        unint64_t v60 = [v47[3] tokenCount];
      }
      else {
        unint64_t v60 = 0;
      }
      v61 = nplog_obj();
      v62 = v61;
      if (v60 > 3)
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v68 = [(NSPProxiedContentPath *)v85 shortName];
          *(_DWORD *)long long buf = 138412546;
          v97 = v68;
          __int16 v98 = 1024;
          int v99 = v60;
          _os_log_debug_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEBUG, "proxied content path [%@] has %u tickets, not fetching more", buf, 0x12u);
        }
      }
      else
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v63 = [(NSPProxiedContentPath *)v85 shortName];
          *(_DWORD *)long long buf = 138412546;
          v97 = v63;
          __int16 v98 = 1024;
          int v99 = v60;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "proxied content path [%@] has %u tickets, fetching more", buf, 0x12u);
        }
        [(NSPProxiedContentPath *)v85 fetchResumableSessionTickets];
      }
    }
    if (!v47 || ![v47[3] isRegistered]) {
      goto LABEL_84;
    }
    uint64_t v64 = [(NSPProxiedContentPath *)v85 resolver];
    if (v64)
    {
      v65 = (void *)v64;
      v66 = [(NSPProxiedContentPath *)v85 resolverRegistration];
      if (([v66 isRegistered] & 1) == 0)
      {

LABEL_83:
        goto LABEL_84;
      }
      if (v70)
      {
      }
      else
      {
        unsigned __int8 v67 = [(NSPProxiedContentPath *)v85 proxiedContentAgentRegistered];

        if (v67)
        {
LABEL_84:

LABEL_85:
          return;
        }
      }
    }
    else if ((v70 & 1) == 0 {
           && [(NSPProxiedContentPath *)v85 proxiedContentAgentRegistered])
    }
    {
      goto LABEL_84;
    }
    [(NSPProxiedContentPath *)v85 setProxiedContentAgentRegistered:1];
    v65 = [(NSPProxiedContentPath *)v85 delegate];
    [v65 proxiedContentAgentRegistered:v85];
    goto LABEL_83;
  }
}

- (void)resetFallbackProxyAgent
{
  id v3 = [(NSPProxiedContentPath *)self egressProxy];

  if (v3 && [(NSPProxiedContentPath *)self allowFallback])
  {
    id v4 = [(NSPProxiedContentPath *)self fallbackAgentUUID];

    if (!v4)
    {
      id v5 = +[NSUUID UUID];
      [(NSPProxiedContentPath *)self setFallbackAgentUUID:v5];
    }
    nw_protocol_definition_t v6 = [(NSPProxiedContentPath *)self fallbackRegistration];

    if (v6) {
      goto LABEL_7;
    }
    uint64_t v7 = [NSPPrivacyProxyProxiedContentFallbackNetworkRegistration alloc];
    int v8 = [(NSPProxiedContentPath *)self fallbackAgentUUID];
    id v9 = [(NSPProxiedContentPath *)self shortName];
    unsigned __int8 v10 = sub_10004DFD8((id *)&v7->super.super.isa, v8, (uint64_t)v9, self);
    [(NSPProxiedContentPath *)self setFallbackRegistration:v10];

    id v11 = [(NSPProxiedContentPath *)self fallbackRegistration];

    if (v11)
    {
LABEL_7:
      char v12 = [(NSPProxiedContentPath *)self ingressProxy];
      if (v12) {
        [(NSPProxiedContentPath *)self ingressProxy];
      }
      else {
      v66 = [(NSPProxiedContentPath *)self egressProxy];
      }

      uint64_t v13 = [(NSPProxiedContentPath *)self ingressProxy];
      if (v13)
      {
        int v14 = [(NSPProxiedContentPath *)self egressProxy];
      }
      else
      {
        int v14 = 0;
      }

      uint64_t v15 = [(NSPProxiedContentPath *)self fallbackRegistration];
      if (v66) {
        unint64_t v16 = (void *)v66[3];
      }
      else {
        unint64_t v16 = 0;
      }
      id v17 = v16;
      uint64_t v18 = [v17 tcpProxyFqdn];
      if (v14) {
        unsigned int v19 = (void *)v14[3];
      }
      else {
        unsigned int v19 = 0;
      }
      id v20 = v19;
      uint64_t v21 = [v20 tcpProxyFqdn];
      if (v66) {
        int v22 = (void *)v66[3];
      }
      else {
        int v22 = 0;
      }
      id v23 = v22;
      uint64_t v24 = [v23 proxyKeyInfos];
      if (v14) {
        uint64_t v25 = (void *)v14[3];
      }
      else {
        uint64_t v25 = 0;
      }
      id v26 = v25;
      v65 = [v26 proxyKeyInfos];
      if (v66) {
        uint64_t v27 = (void *)v66[3];
      }
      else {
        uint64_t v27 = 0;
      }
      id v56 = v27;
      uint64_t v64 = [v56 proxyVersion];
      if (v14) {
        uint64_t v28 = (void *)v14[3];
      }
      else {
        uint64_t v28 = 0;
      }
      id v55 = v28;
      v63 = [v55 proxyVersion];
      if (v66) {
        id v29 = (void *)v66[3];
      }
      else {
        id v29 = 0;
      }
      id v54 = v29;
      int v51 = [v54 supportsResumption];
      if (v14) {
        nw_connection_t v30 = (void *)v14[3];
      }
      else {
        nw_connection_t v30 = 0;
      }
      id v53 = v30;
      char v50 = [v53 supportsResumption];
      BOOL v52 = sub_10000EDFC((uint64_t)v66);
      if (v52)
      {
        if (v66) {
          id v31 = (void *)v66[6];
        }
        else {
          id v31 = 0;
        }
        id v62 = v31;
      }
      else
      {
        id v62 = 0;
      }
      BOOL v49 = sub_10000EDFC((uint64_t)v14);
      if (v49)
      {
        if (v14) {
          v32 = (void *)v14[6];
        }
        else {
          v32 = 0;
        }
        id v33 = v32;
      }
      else
      {
        id v33 = 0;
      }
      v59 = v23;
      long long v48 = v33;
      if (v66) {
        v34 = (void *)v66[3];
      }
      else {
        v34 = 0;
      }
      id v47 = v34;
      uint64_t v35 = [v47 tokenChallenge];
      v36 = (void *)v35;
      v61 = v17;
      unint64_t v60 = (void *)v21;
      v57 = v26;
      unsigned __int8 v58 = (void *)v24;
      id v37 = (void *)v18;
      v38 = (void *)v15;
      if (v14) {
        v39 = (void *)v14[3];
      }
      else {
        v39 = 0;
      }
      BOOL v40 = v35 != 0;
      id v41 = v39;
      v42 = [v41 tokenChallenge];
      id v43 = [(NSPProxiedContentPath *)self associatedMaps];
      id v44 = [v43 firstObject];
      HIBYTE(v46) = v42 != 0;
      LOBYTE(v46) = v40;
      sub_10004E088((uint64_t)v38, v37, v60, v58, v65, v64, v63, v51, v50, v62, v48, v46, (char)[v44 isPrivacyProxy]);

      if (v49) {
      if (v52)
      }
    }
    else
    {
      uint64_t v45 = nplog_obj();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v68 = "-[NSPProxiedContentPath resetFallbackProxyAgent]";
        _os_log_fault_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "%s called with null self.fallbackRegistration", buf, 0xCu);
      }
    }
  }
}

- (void)resetResolverAgentForceUpdateDelegate:(BOOL)a3
{
  nw_protocol_definition_t v6 = [(NSPProxiedContentPath *)self resolver];

  if (v6)
  {
    uint64_t v7 = [(NSPProxiedContentPath *)self resolverAgentUUID];

    if (!v7)
    {
      int v8 = +[NSUUID UUID];
      [(NSPProxiedContentPath *)self setResolverAgentUUID:v8];
    }
    id v9 = [(NSPProxiedContentPath *)self resolverRegistration];

    if (!v9)
    {
      id v10 = [objc_alloc((Class)NWNetworkAgentRegistration) initWithNetworkAgentClass:objc_opt_class()];
      [(NSPProxiedContentPath *)self setResolverRegistration:v10];

      id v11 = [(NSPProxiedContentPath *)self resolverRegistration];

      if (!v11)
      {
        nplog_obj();
        char v12 = (NSPPrivacyProxyDNSAgent *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[NSPProxiedContentPath resetResolverAgentForceUpdateDelegate:]";
          _os_log_fault_impl((void *)&_mh_execute_header, &v12->super, OS_LOG_TYPE_FAULT, "%s called with null self.resolverRegistration", buf, 0xCu);
        }
        goto LABEL_59;
      }
    }
    char v12 = [[NSPPrivacyProxyDNSAgent alloc] initWithDelegate:self];
    uint64_t v13 = [(NSPProxiedContentPath *)self resolver];
    [(NSPPrivacyProxyDNSAgent *)v12 setResolver:v13];

    int v14 = [(NSPProxiedContentPath *)self resolverAgentUUID];
    [(NSPPrivacyProxyDNSAgent *)v12 setAgentUUID:v14];

    uint64_t v15 = [(NSPProxiedContentPath *)self resolver];
    unint64_t v16 = [v15 dohURL];
    id v17 = +[NSURL URLWithString:v16];

    uint64_t v18 = [v17 host];
    if (v18)
    {
      unsigned int v19 = [v17 host];
      [(NSPPrivacyProxyDNSAgent *)v12 setAgentDescription:v19];
    }
    else
    {
      unsigned int v19 = [(NSPProxiedContentPath *)self resolver];
      uint64_t v3 = [v19 dohURL];
      [(NSPPrivacyProxyDNSAgent *)v12 setAgentDescription:v3];
    }
    id v20 = [(NSPProxiedContentPath *)self quicAgentUUID];
    [(NSPPrivacyProxyDNSAgent *)v12 setProxyAgentUUID:v20];

    uint64_t v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [(NSPPrivacyProxyDNSAgent *)v12 resolver];
      uint64_t v3 = [v22 dohURL];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@ setting up resolver agent to %{public}@", buf, 0x16u);
    }
    id v23 = [(NSPProxiedContentPath *)self resolverRegistration];
    unsigned int v24 = [v23 isRegistered];

    if (v24)
    {
      uint64_t v25 = nplog_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [(NSPProxiedContentPath *)self resolverAgentUUID];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%@ updating resolver agent with UUID %@", buf, 0x16u);
      }
      uint64_t v27 = [(NSPProxiedContentPath *)self resolverRegistration];
      unsigned __int8 v28 = [v27 updateNetworkAgent:v12];

      if ((v28 & 1) == 0)
      {
        id v29 = nplog_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint64_t v69 = [(NSPProxiedContentPath *)self resolverAgentUUID];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@: failed to update the registered resolver agent [%@]", buf, 0x16u);
        }
      }
      goto LABEL_58;
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v80 = sub_100005D5C;
    v81 = sub_10000F6B0;
    id v82 = 0;
    nw_connection_t v30 = nplog_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      id v31 = [(NSPProxiedContentPath *)self resolverAgentUUID];
      *(_DWORD *)char v73 = 138412546;
      int v74 = self;
      __int16 v75 = 2112;
      id v76 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@ looking for resolver agent registration file handle with agent UUID %@", v73, 0x16u);
    }
    v32 = +[NEFileHandleMaintainer sharedMaintainer];
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_10001B82C;
    v72[3] = &unk_100105330;
    v72[4] = self;
    v72[5] = buf;
    [v32 iterateFileHandlesWithBlock:v72];

    id v33 = *(void **)(*(void *)&buf[8] + 40);
    if (v33)
    {
      v34 = [v33 handle];
      uint64_t v35 = dup((int)[v34 fileDescriptor]);

      if ((v35 & 0x80000000) != 0)
      {
        uint64_t v45 = nplog_obj();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v63 = [*(id *)(*(void *)&buf[8] + 40) agentUUID];
          uint64_t v64 = __error();
          v65 = strerror(*v64);
          *(_DWORD *)char v73 = 138412802;
          int v74 = self;
          __int16 v75 = 2112;
          id v76 = v63;
          __int16 v77 = 2080;
          id v78 = v65;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@: failed to dup the resolver agent registration file handle [%@], error: %s", v73, 0x20u);
        }
        goto LABEL_56;
      }
      v36 = nplog_obj();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = [*(id *)(*(void *)&buf[8] + 40) agentUUID];
        *(_DWORD *)char v73 = 138412546;
        int v74 = self;
        __int16 v75 = 2112;
        id v76 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%@: re-using existing resolver agent registration file handle [%@]", v73, 0x16u);
      }
      v38 = [(NSPProxiedContentPath *)self resolverRegistration];
      uint64_t v3 = (uint64_t)[v38 setRegisteredNetworkAgent:v12 fileDescriptor:v35];

      if ((v3 & 1) == 0)
      {
        v66 = nplog_obj();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          char v70 = [(NSPProxiedContentPath *)self resolverAgentUUID];
          *(_DWORD *)char v73 = 138412546;
          int v74 = self;
          __int16 v75 = 2112;
          id v76 = v70;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@: failed to set the registered resolver agent [%@]", v73, 0x16u);
        }
        close(v35);
        goto LABEL_57;
      }
      v39 = [(NSPProxiedContentPath *)self resolverRegistration];
      unsigned int v40 = [v39 isRegistered];

      if (v40)
      {
        id v41 = nplog_obj();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = [(NSPProxiedContentPath *)self resolverAgentUUID];
          *(_DWORD *)char v73 = 138412546;
          int v74 = self;
          __int16 v75 = 2112;
          id v76 = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%@ updating registered DNS network agent [%@]", v73, 0x16u);
        }
        id v43 = [(NSPProxiedContentPath *)self resolverRegistration];
        unsigned __int8 v44 = [v43 updateNetworkAgent:v12];

        if ((v44 & 1) == 0)
        {
          uint64_t v45 = nplog_obj();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            __int16 v46 = [(NSPProxiedContentPath *)self resolverAgentUUID];
            *(_DWORD *)char v73 = 138412546;
            int v74 = self;
            __int16 v75 = 2112;
            id v76 = v46;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@: failed to update the registered DNS network agent [%@]", v73, 0x16u);
          }
          goto LABEL_56;
        }
      }
    }
    else
    {
      id v47 = nplog_obj();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        long long v48 = [(NSPProxiedContentPath *)self resolverAgentUUID];
        *(_DWORD *)char v73 = 138412546;
        int v74 = self;
        __int16 v75 = 2112;
        id v76 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@ registering DNS network agent [%@]", v73, 0x16u);
      }
      BOOL v49 = [(NSPProxiedContentPath *)self resolverRegistration];
      unsigned __int8 v50 = [v49 registerNetworkAgent:v12];

      if ((v50 & 1) == 0)
      {
        uint64_t v45 = nplog_obj();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v67 = [(NSPProxiedContentPath *)self resolverAgentUUID];
          *(_DWORD *)char v73 = 138412546;
          int v74 = self;
          __int16 v75 = 2112;
          id v76 = v67;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%@: failed to register DNS network agent [%@]", v73, 0x16u);
        }
        goto LABEL_56;
      }
      int v51 = [(NSPProxiedContentPath *)self resolverRegistration];
      unsigned int v52 = [v51 isRegistered];

      if (v52)
      {
        uint64_t v3 = (uint64_t)objc_alloc((Class)NENetworkAgentRegistrationFileHandle);
        id v53 = [(NSPProxiedContentPath *)self resolverRegistration];
        id v54 = [(NSPProxiedContentPath *)self resolverAgentUUID];
        id v55 = [(NSPProxiedContentPath *)self resolverAgentUUID];
        id v56 = [(id)v3 initWithNetworkAgentRegistration:v53 sessionType:&off_10010F610 configurationIdentifier:v54 agentUUID:v55];
        v57 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v56;

        unsigned __int8 v58 = +[NEFileHandleMaintainer sharedMaintainer];
        uint64_t v59 = *(void *)(*(void *)&buf[8] + 40);
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_10001B920;
        v71[3] = &unk_1001053A8;
        v71[4] = self;
        [v58 setFileHandle:v59 matchingPredicate:v71];

        unint64_t v60 = +[NEFileHandleMaintainer sharedMaintainer];
        [v60 commit];
      }
    }
    uint64_t v45 = [(NSPProxiedContentPath *)self resolverRegistration];
    if ([v45 isRegistered])
    {
      v61 = [(NSPProxiedContentPath *)self quicRegistration];
      if (!v61)
      {
        if (a3) {
          goto LABEL_50;
        }
        goto LABEL_51;
      }
      uint64_t v62 = [(NSPProxiedContentPath *)self quicRegistration];
      uint64_t v3 = v62;
      if (v62 && ([*(id *)(v62 + 24) isRegistered] & 1) != 0)
      {
        if (a3)
        {

LABEL_50:
LABEL_55:
          [(NSPProxiedContentPath *)self setProxiedContentAgentRegistered:1];
          uint64_t v45 = [(NSPProxiedContentPath *)self delegate];
          [v45 proxiedContentAgentRegistered:self];
          goto LABEL_56;
        }
LABEL_51:
        unsigned __int8 v68 = [(NSPProxiedContentPath *)self proxiedContentAgentRegistered];
        if (v61)
        {
        }
        if (v68) {
          goto LABEL_57;
        }
        goto LABEL_55;
      }
    }
LABEL_56:

LABEL_57:
    _Block_object_dispose(buf, 8);

LABEL_58:
LABEL_59:
  }
}

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPProxiedContentPath *)self pathReady])
  {
    [(NSPProxiedContentPath *)self resetFallbackProxyAgent];
    [(NSPProxiedContentPath *)self resetQUICProxyAgentForceUpdateDelegate:v3];
    [(NSPProxiedContentPath *)self resetResolverAgentForceUpdateDelegate:v3];
  }
}

- (BOOL)unregisterResolverAgent
{
  uint64_t v3 = [(NSPProxiedContentPath *)self resolverAgentUUID];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  id v5 = [(NSPProxiedContentPath *)self resolverRegistration];

  if (!v5) {
    return 1;
  }
  nw_protocol_definition_t v6 = [(NSPProxiedContentPath *)self resolverRegistration];
  unsigned int v7 = [v6 isRegistered];

  if (!v7) {
    return 1;
  }
  int v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [(NSPProxiedContentPath *)self resolverAgentUUID];
    *(_DWORD *)long long buf = 138412546;
    id v17 = self;
    __int16 v18 = 2112;
    unsigned int v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ un-registering resolver agent with UUID %@", buf, 0x16u);
  }
  id v10 = [(NSPProxiedContentPath *)self resolverRegistration];
  unsigned __int8 v11 = [v10 unregisterNetworkAgent];

  char v12 = +[NEFileHandleMaintainer sharedMaintainer];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001BC14;
  v15[3] = &unk_1001053A8;
  v15[4] = self;
  [v12 removeFileHandleMatchingPredicate:v15];

  uint64_t v13 = +[NEFileHandleMaintainer sharedMaintainer];
  [v13 commit];

  return v11;
}

- (void)removeProxyAgents
{
  uint64_t v3 = [(NSPProxiedContentPath *)self quicRegistration];
  sub_100049E70((uint64_t)v3);

  id v4 = [(NSPProxiedContentPath *)self fallbackRegistration];
  sub_100049E70((uint64_t)v4);

  [(NSPProxiedContentPath *)self unregisterResolverAgent];
  if ([(NSPProxiedContentPath *)self proxiedContentAgentRegistered])
  {
    [(NSPProxiedContentPath *)self setProxiedContentAgentRegistered:0];
    id v5 = [(NSPProxiedContentPath *)self delegate];
    [v5 proxiedContentAgentUnregistered:self];
  }
  [(NSPProxiedContentPath *)self setQuicAgentUUID:0];
  [(NSPProxiedContentPath *)self setFallbackAgentUUID:0];
  [(NSPProxiedContentPath *)self setResolverAgentUUID:0];
  [(NSPProxiedContentPath *)self setQuicRegistration:0];
  [(NSPProxiedContentPath *)self setFallbackRegistration:0];

  [(NSPProxiedContentPath *)self setResolverRegistration:0];
}

- (void)dealloc
{
  [(NSPProxiedContentPath *)self removeProxyAgents];
  v3.receiver = self;
  v3.super_class = (Class)NSPProxiedContentPath;
  [(NSPProxiedContentPath *)&v3 dealloc];
}

- (NSPProxiedContentPathDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSPProxiedContentPathDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)associatedMaps
{
  return self->_associatedMaps;
}

- (void)setAssociatedMaps:(id)a3
{
}

- (NSPProxyTokenInfo)ingressProxy
{
  return self->_ingressProxy;
}

- (void)setIngressProxy:(id)a3
{
}

- (NSPProxyTokenInfo)egressProxy
{
  return self->_egressProxy;
}

- (void)setEgressProxy:(id)a3
{
}

- (NSPPrivacyProxyResolverInfo)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (NSUUID)quicAgentUUID
{
  return self->_quicAgentUUID;
}

- (void)setQuicAgentUUID:(id)a3
{
}

- (NSUUID)fallbackAgentUUID
{
  return self->_fallbackAgentUUID;
}

- (void)setFallbackAgentUUID:(id)a3
{
}

- (NSUUID)resolverAgentUUID
{
  return self->_resolverAgentUUID;
}

- (void)setResolverAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)quicRegistration
{
  return self->_quicRegistration;
}

- (void)setQuicRegistration:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration
{
  return self->_fallbackRegistration;
}

- (void)setFallbackRegistration:(id)a3
{
}

- (NWNetworkAgentRegistration)resolverRegistration
{
  return self->_resolverRegistration;
}

- (void)setResolverRegistration:(id)a3
{
}

- (BOOL)fetchingSessionTickets
{
  return self->_fetchingSessionTickets;
}

- (void)setFetchingSessionTickets:(BOOL)a3
{
  self->_fetchingSessionTickets = a3;
}

- (BOOL)proxiedContentAgentRegistered
{
  return self->_proxiedContentAgentRegistered;
}

- (void)setProxiedContentAgentRegistered:(BOOL)a3
{
  self->_proxiedContentAgentRegistered = a3;
}

- (NSArray)resolvedAddresses
{
  return self->_resolvedAddresses;
}

- (void)setResolvedAddresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedAddresses, 0);
  objc_storeStrong((id *)&self->_resolverRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackRegistration, 0);
  objc_storeStrong((id *)&self->_quicRegistration, 0);
  objc_storeStrong((id *)&self->_resolverAgentUUID, 0);
  objc_storeStrong((id *)&self->_fallbackAgentUUID, 0);
  objc_storeStrong((id *)&self->_quicAgentUUID, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);
  objc_storeStrong((id *)&self->_ingressProxy, 0);
  objc_storeStrong((id *)&self->_associatedMaps, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end