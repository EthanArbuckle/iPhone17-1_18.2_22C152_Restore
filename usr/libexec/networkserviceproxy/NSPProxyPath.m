@interface NSPProxyPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFailOpen;
- (BOOL)allowFallback;
- (BOOL)fallbackToQUIC;
- (BOOL)forceFallback;
- (BOOL)geohashSharingEnabled;
- (BOOL)isMultiHopRegistered;
- (BOOL)isSingleHopRegistered;
- (BOOL)matchEgress:(id)a3;
- (BOOL)matchIngress:(id)a3;
- (BOOL)multiHopRegistered;
- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4;
- (BOOL)singleHopRegistered;
- (NSNumber)configEpoch;
- (NSPPrivacyProxyNetworkRegistration)multiHopRegistration;
- (NSPPrivacyProxyNetworkRegistration)singleHopRegistration;
- (NSPProxyAgentNetworkStatistics)networkMultiHopAgentStatistics;
- (NSPProxyAgentNetworkStatistics)networkSingleHopAgentStatistics;
- (NSPProxyPath)initWithCoder:(id)a3;
- (NSPProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13;
- (NSPProxyPathDelegate)delegate;
- (NSPProxyTokenInfo)egressProxy;
- (NSPProxyTokenInfo)ingressProxy;
- (NSString)description;
- (NSUUID)nonDefaultAgentUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)multiHopConfigurationHash;
- (id)singleHopConfigurationHash;
- (unint64_t)proxyPathWeight;
- (void)dealloc;
- (void)enableFailOpen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleNetworkCharacteristicsChange:(id)a3;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetError;
- (void)resetMultiHopProxyAgent;
- (void)resetSingleHopProxyAgent;
- (void)resetStats;
- (void)setAllowFailOpen:(BOOL)a3;
- (void)setAllowFallback:(BOOL)a3;
- (void)setConfigEpoch:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEgressProxy:(id)a3;
- (void)setFallbackToQUIC:(BOOL)a3;
- (void)setForceFallback:(BOOL)a3;
- (void)setGeohashSharingEnabled:(BOOL)a3;
- (void)setIngressProxy:(id)a3;
- (void)setMultiHopRegistered:(BOOL)a3;
- (void)setMultiHopRegistration:(id)a3;
- (void)setNetworkMultiHopAgentStatistics:(id)a3;
- (void)setNetworkSingleHopAgentStatistics:(id)a3;
- (void)setNonDefaultAgentUUID:(id)a3;
- (void)setProxyPathWeight:(unint64_t)a3;
- (void)setSingleHopRegistered:(BOOL)a3;
- (void)setSingleHopRegistration:(id)a3;
- (void)setupMultiHopProxyRegistrations;
- (void)setupSingleHopProxyRegistrations;
- (void)updateConfigEpoch:(id)a3;
- (void)updateGeohashSharing:(BOOL)a3;
- (void)updateIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5;
@end

@implementation NSPProxyPath

- (NSPProxyPath)initWithDelegate:(id)a3 ingressProxy:(id)a4 egressProxy:(id)a5 proxyPathWeight:(unint64_t)a6 allowFallback:(BOOL)a7 fallbackToQUIC:(BOOL)a8 forceFallback:(BOOL)a9 allowFailOpen:(BOOL)a10 geohashSharingEnabled:(BOOL)a11 configEpoch:(id)a12 networkCharacteristics:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v33 = a12;
  id v21 = a13;
  if (!v19)
  {
    v30 = nplog_obj();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v28 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v31 = "%s called with null ingressProxy";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v31, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v20)
  {
    v30 = nplog_obj();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v36 = "-[NSPProxyPath initWithDelegate:ingressProxy:egressProxy:proxyPathWeight:allowFallback:fallbackToQUIC:forceFal"
          "lback:allowFailOpen:geohashSharingEnabled:configEpoch:networkCharacteristics:]";
    v31 = "%s called with null egressProxy";
    goto LABEL_12;
  }
  v34.receiver = self;
  v34.super_class = (Class)NSPProxyPath;
  v22 = [(NSPProxyPath *)&v34 init];
  v23 = v22;
  if (v22)
  {
    objc_storeWeak((id *)&v22->_delegate, v18);
    objc_storeStrong((id *)&v23->_ingressProxy, a4);
    objc_storeStrong((id *)&v23->_egressProxy, a5);
    v23->_proxyPathWeight = a6;
    v23->_allowFallback = a7;
    v23->_fallbackToQUIC = a8;
    v23->_forceFallback = a9;
    v23->_allowFailOpen = a10;
    v23->_geohashSharingEnabled = a11;
    objc_storeStrong((id *)&v23->_configEpoch, a12);
    v24 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    networkSingleHopAgentStatistics = v23->_networkSingleHopAgentStatistics;
    v23->_networkSingleHopAgentStatistics = v24;

    v26 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    networkMultiHopAgentStatistics = v23->_networkMultiHopAgentStatistics;
    v23->_networkMultiHopAgentStatistics = v26;

    sub_10001424C((uint64_t)v23->_networkMultiHopAgentStatistics, v21);
    sub_10001424C((uint64_t)v23->_networkSingleHopAgentStatistics, v21);
  }
  self = v23;
  v28 = self;
LABEL_6:

  return v28;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
  v8 = [(NSPProxyPath *)self ingressProxy];
  sub_1000482D4(v7, v8, @"Ingress proxy", a3, a4);

  v9 = [(NSPProxyPath *)self egressProxy];
  sub_1000482D4(v7, v9, @"Egress proxy", a3, a4);

  sub_100048B1C(v7, [(NSPProxyPath *)self allowFallback], @"Allow fallback", a3, a4);
  sub_100048B1C(v7, [(NSPProxyPath *)self fallbackToQUIC], @"Fallback to QUIC", a3, a4);
  sub_100048B1C(v7, [(NSPProxyPath *)self allowFailOpen], @"Allow fail open", a3, a4);
  sub_100048B1C(v7, [(NSPProxyPath *)self geohashSharingEnabled], @"Geohash Sharing Enabled", a3, a4);
  v10 = [(NSPProxyPath *)self configEpoch];
  sub_1000482D4(v7, v10, @"Config Epoch", a3, a4);

  v11 = [(NSPProxyPath *)self nonDefaultAgentUUID];
  sub_1000482D4(v7, v11, @"Agent UUID", a3, a4);

  v12 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  sub_1000482D4(v7, v12, @"Single hop statistics", a3, a4);

  v13 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  sub_1000482D4(v7, v13, @"Multi hop statistics", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)[(NSPProxyPath *)self descriptionWithIndent:0 options:14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPProxyPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NSPProxyPath;
  v5 = [(NSPProxyPath *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathIngressProxy"];
    ingressProxy = v5->_ingressProxy;
    v5->_ingressProxy = (NSPProxyTokenInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathEgressProxy"];
    egressProxy = v5->_egressProxy;
    v5->_egressProxy = (NSPProxyTokenInfo *)v8;

    v5->_proxyPathWeight = (unint64_t)[v4 decodeIntegerForKey:@"proxyPathWeight"];
    v5->_allowFallback = [v4 decodeBoolForKey:@"proxyPathAllowFallback"];
    v5->_fallbackToQUIC = [v4 decodeBoolForKey:@"proxyPathFallbackToQUIC"];
    v5->_forceFallback = [v4 decodeBoolForKey:@"proxyPathForceFallback"];
    v5->_allowFailOpen = [v4 decodeBoolForKey:@"proxyPathAllowFailOpen"];
    v5->_geohashSharingEnabled = [v4 decodeBoolForKey:@"proxyPathGeohashSharingEnabled"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathConfigEpoch"];
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathAgentUUID"];
    nonDefaultAgentUUID = v5->_nonDefaultAgentUUID;
    v5->_nonDefaultAgentUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathSingleHopAgentStatistics"];
    networkSingleHopAgentStatistics = v5->_networkSingleHopAgentStatistics;
    v5->_networkSingleHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyPathMultipleHopAgentStatistics"];
    networkMultiHopAgentStatistics = v5->_networkMultiHopAgentStatistics;
    v5->_networkMultiHopAgentStatistics = (NSPProxyAgentNetworkStatistics *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSPProxyPath *)self ingressProxy];
  [v4 encodeObject:v5 forKey:@"proxyPathIngressProxy"];

  uint64_t v6 = [(NSPProxyPath *)self egressProxy];
  [v4 encodeObject:v6 forKey:@"proxyPathEgressProxy"];

  [v4 encodeInteger:-[NSPProxyPath proxyPathWeight](self, "proxyPathWeight") forKey:@"proxyPathWeight"];
  [v4 encodeBool:-[NSPProxyPath allowFallback](self, "allowFallback") forKey:@"proxyPathAllowFallback"];
  [v4 encodeBool:-[NSPProxyPath fallbackToQUIC](self, "fallbackToQUIC") forKey:@"proxyPathFallbackToQUIC"];
  [v4 encodeBool:-[NSPProxyPath forceFallback](self, "forceFallback") forKey:@"proxyPathForceFallback"];
  [v4 encodeBool:-[NSPProxyPath allowFailOpen](self, "allowFailOpen") forKey:@"proxyPathAllowFailOpen"];
  [v4 encodeBool:-[NSPProxyPath geohashSharingEnabled](self, "geohashSharingEnabled") forKey:@"proxyPathGeohashSharingEnabled"];
  id v7 = [(NSPProxyPath *)self configEpoch];
  [v4 encodeObject:v7 forKey:@"proxyPathConfigEpoch"];

  uint64_t v8 = [(NSPProxyPath *)self nonDefaultAgentUUID];
  [v4 encodeObject:v8 forKey:@"proxyPathAgentUUID"];

  v9 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  [v4 encodeObject:v9 forKey:@"proxyPathSingleHopAgentStatistics"];

  id v10 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  [v4 encodeObject:v10 forKey:@"proxyPathMultipleHopAgentStatistics"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPProxyPath allocWithZone:a3] init];
  v5 = [(NSPProxyPath *)self delegate];
  [(NSPProxyPath *)v4 setDelegate:v5];

  uint64_t v6 = [(NSPProxyPath *)self ingressProxy];
  [(NSPProxyPath *)v4 setIngressProxy:v6];

  id v7 = [(NSPProxyPath *)self egressProxy];
  [(NSPProxyPath *)v4 setEgressProxy:v7];

  [(NSPProxyPath *)v4 setProxyPathWeight:[(NSPProxyPath *)self proxyPathWeight]];
  [(NSPProxyPath *)v4 setAllowFallback:[(NSPProxyPath *)self allowFallback]];
  [(NSPProxyPath *)v4 setFallbackToQUIC:[(NSPProxyPath *)self fallbackToQUIC]];
  [(NSPProxyPath *)v4 setForceFallback:[(NSPProxyPath *)self forceFallback]];
  [(NSPProxyPath *)v4 setAllowFailOpen:[(NSPProxyPath *)self allowFailOpen]];
  [(NSPProxyPath *)v4 setGeohashSharingEnabled:[(NSPProxyPath *)self geohashSharingEnabled]];
  uint64_t v8 = [(NSPProxyPath *)self configEpoch];
  [(NSPProxyPath *)v4 setConfigEpoch:v8];

  v9 = [(NSPProxyPath *)self nonDefaultAgentUUID];
  [(NSPProxyPath *)v4 setNonDefaultAgentUUID:v9];

  [(NSPProxyPath *)v4 setSingleHopRegistered:[(NSPProxyPath *)self singleHopRegistered]];
  [(NSPProxyPath *)v4 setMultiHopRegistered:[(NSPProxyPath *)self multiHopRegistered]];
  id v10 = [(NSPProxyPath *)self singleHopRegistration];
  [(NSPProxyPath *)v4 setSingleHopRegistration:v10];

  v11 = [(NSPProxyPath *)self multiHopRegistration];
  [(NSPProxyPath *)v4 setMultiHopRegistration:v11];

  uint64_t v12 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  [(NSPProxyPath *)v4 setNetworkSingleHopAgentStatistics:v12];

  v13 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  [(NSPProxyPath *)v4 setNetworkMultiHopAgentStatistics:v13];

  return v4;
}

- (void)setupSingleHopProxyRegistrations
{
}

- (void)setupMultiHopProxyRegistrations
{
}

- (void)resetSingleHopProxyAgent
{
}

- (void)resetMultiHopProxyAgent
{
}

- (BOOL)isMultiHopRegistered
{
  uint64_t v2 = [(NSPProxyPath *)self multiHopRegistration];
  v3 = (void *)v2;
  if (v2) {
    unsigned __int8 v4 = [*(id *)(v2 + 24) isRegistered];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isSingleHopRegistered
{
  uint64_t v2 = [(NSPProxyPath *)self singleHopRegistration];
  v3 = (void *)v2;
  if (v2) {
    unsigned __int8 v4 = [*(id *)(v2 + 24) isRegistered];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)updateIngressProxy:(id)a3 egressProxy:(id)a4 proxyPathWeight:(unint64_t)a5
{
  id v8 = a4;
  [(NSPProxyPath *)self setIngressProxy:a3];
  [(NSPProxyPath *)self setEgressProxy:v8];

  [(NSPProxyPath *)self setProxyPathWeight:a5];
  [(NSPProxyPath *)self resetSingleHopProxyAgent];

  [(NSPProxyPath *)self resetMultiHopProxyAgent];
}

- (void)enableFailOpen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPProxyPath *)self allowFailOpen] != a3)
  {
    [(NSPProxyPath *)self setAllowFailOpen:v3];
    [(NSPProxyPath *)self resetSingleHopProxyAgent];
    [(NSPProxyPath *)self resetMultiHopProxyAgent];
  }
}

- (void)updateGeohashSharing:(BOOL)a3
{
  [(NSPProxyPath *)self setGeohashSharingEnabled:a3];

  [(NSPProxyPath *)self resetMultiHopProxyAgent];
}

- (void)updateConfigEpoch:(id)a3
{
  [(NSPProxyPath *)self setConfigEpoch:a3];
  [(NSPProxyPath *)self resetSingleHopProxyAgent];

  [(NSPProxyPath *)self resetMultiHopProxyAgent];
}

- (BOOL)proxyPathIsValid:(id)a3 proxyPathList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[NSPProxyPath proxyPathIsValid:proxyPathList:]", "NSPPrivacyProxyAgentManager.m", 2902, "0");
}

- (BOOL)matchIngress:(id)a3
{
  unsigned __int8 v4 = (id *)a3;
  if (!v4)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v12 = 0;
      goto LABEL_6;
    }
    int v16 = 136315138;
    v17 = "-[NSPProxyPath matchIngress:]";
    v15 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  id v5 = [(NSPProxyPath *)self ingressProxy];

  if (!v5)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v16 = 136315138;
    v17 = "-[NSPProxyPath matchIngress:]";
    v15 = "%s called with null self.ingressProxy";
    goto LABEL_12;
  }
  uint64_t v6 = [(NSPProxyPath *)self ingressProxy];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = *(void **)(v6 + 24);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 proxyURL];
  v11 = [v4[3] proxyURL];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

LABEL_6:
  return v12;
}

- (BOOL)matchEgress:(id)a3
{
  unsigned __int8 v4 = (id *)a3;
  if (!v4)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      unsigned __int8 v12 = 0;
      goto LABEL_6;
    }
    int v16 = 136315138;
    v17 = "-[NSPProxyPath matchEgress:]";
    v15 = "%s called with null proxyTokenInfo";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v16, 0xCu);
    goto LABEL_10;
  }
  id v5 = [(NSPProxyPath *)self egressProxy];

  if (!v5)
  {
    uint64_t v14 = nplog_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v16 = 136315138;
    v17 = "-[NSPProxyPath matchEgress:]";
    v15 = "%s called with null self.egressProxy";
    goto LABEL_12;
  }
  uint64_t v6 = [(NSPProxyPath *)self egressProxy];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = *(void **)(v6 + 24);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 proxyURL];
  v11 = [v4[3] proxyURL];
  unsigned __int8 v12 = [v10 isEqualToString:v11];

LABEL_6:
  return v12;
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "proxy path: network signature changed", v10, 2u);
  }

  uint64_t v6 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  sub_10001424C((uint64_t)v6, v4);

  id v7 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  sub_10001424C((uint64_t)v7, v4);

  id v8 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  if (v8)
  {
    v8[6] = 0u;
    v8[7] = 0u;
    v8[4] = 0u;
    v8[5] = 0u;
    v8[2] = 0u;
    v8[3] = 0u;
    v8[1] = 0u;
  }

  id v9 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  if (v9)
  {
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    v9[1] = 0u;
  }
}

- (void)resetStats
{
  BOOL v3 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
  if (v3)
  {
    v3[6] = 0u;
    v3[7] = 0u;
    v3[4] = 0u;
    v3[5] = 0u;
    v3[2] = 0u;
    v3[3] = 0u;
    v3[1] = 0u;
  }

  id v4 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
  if (v4)
  {
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[1] = 0u;
  }
}

- (void)resetError
{
  uint64_t v3 = [(NSPProxyPath *)self singleHopRegistration];
  id v4 = (void *)v3;
  if (v3) {
    [*(id *)(v3 + 24) resetError];
  }

  id v5 = [(NSPProxyPath *)self multiHopRegistration];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5[3] resetError];
    id v5 = v6;
  }
}

- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = (id *)a3;
  long long buffer = 0u;
  memset(v56, 0, sizeof(v56));
  id v9 = [a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v9)
  {
    v46 = 0;
    int v16 = 0;
    v11 = 0;
LABEL_8:
    v17 = 0;
    goto LABEL_22;
  }
  id v10 = +[NWPath pathForClientID:v9];
  v11 = v10;
  if (!v10)
  {
    v46 = 0;
    int v16 = 0;
    goto LABEL_8;
  }
  v46 = [v10 interface];
  unsigned __int8 v12 = [v11 parameters];
  int v13 = [v12 pid];
  uint64_t v14 = [v12 effectiveProcessUUID];
  v45 = v9;
  if (v13)
  {
    if (proc_pidinfo(v13, 13, 1uLL, &buffer, 64) == 64)
    {
      v15 = v8;
      int v16 = (const char *)v56;
    }
    else
    {
      objc_super v19 = nplog_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", buf, 8u);
      }
      v15 = v8;

      int v16 = 0;
    }
    id v18 = (void *)ne_copy_signing_identifier_for_pid();
    if (v18) {
      goto LABEL_16;
    }
  }
  else
  {
    v15 = v8;
    int v16 = 0;
    id v18 = 0;
  }
  if (v14)
  {
    *(void *)buf = 0;
    *(void *)v48 = 0;
    [v14 getUUIDBytes:buf];
    id v18 = (void *)NEHelperCacheCopySigningIdentifierMapping();
  }
LABEL_16:
  if (v18 && xpc_get_type(v18) == (xpc_type_t)&_xpc_type_string && (string_ptr = xpc_string_get_string_ptr(v18)) != 0)
  {
    v17 = +[NSString stringWithUTF8String:string_ptr];
  }
  else
  {
    v17 = 0;
  }

  if (v17)
  {
    id v20 = [(NSPProxyPath *)self delegate];
    [v20 reportActivityForApp:v17 path:0];
  }
  id v8 = v15;
  id v9 = v45;
LABEL_22:
  if ((v6 & 0xFFFF0000) != 0xFF0000)
  {
    v25 = nplog_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (!v16) {
        int v16 = "none";
      }
      v26 = sub_100049210(v8);
      v27 = [v46 interfaceName];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v6;
      *(_WORD *)v48 = 2080;
      *(void *)&v48[2] = v16;
      __int16 v49 = 2112;
      v50 = v17;
      __int16 v51 = 2112;
      v52 = v26;
      __int16 v53 = 2112;
      v54 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s (%@) for %@ agent on interface %@", buf, 0x30u);
    }
    v28 = [(NSPProxyPath *)self multiHopRegistration];

    if (v28 == v8)
    {
      uint64_t v30 = [(NSPProxyPath *)self networkMultiHopAgentStatistics];
    }
    else
    {
      v29 = [(NSPProxyPath *)self singleHopRegistration];

      if (v29 != v8)
      {
        uint64_t v23 = 0;
        goto LABEL_39;
      }
      uint64_t v30 = [(NSPProxyPath *)self networkSingleHopAgentStatistics];
    }
    uint64_t v23 = v30;
LABEL_39:
    v31 = [v11 interface:v45];
    id v32 = [v31 type];

    if (v32 == (id)1)
    {
      id v33 = v8;
      id v34 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:v11];
      v35 = [v34 objectForKeyedSubscript:@"Signature"];
      if (v23) {
        v36 = *(void **)(v23 + 8);
      }
      else {
        v36 = 0;
      }
      uint64_t v37 = [v36 objectForKeyedSubscript:@"Signature"];
      v38 = (void *)v37;
      if (v35 && v37 && ([v35 isEqual:v37] & 1) == 0)
      {
        v44 = nplog_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "ignore error, network signature does not match", buf, 2u);
        }

        id v8 = v33;
        goto LABEL_28;
      }

      id v8 = v33;
    }
    if ((int)v6 <= 1099)
    {
      if ((int)v6 > 0)
      {
        switch((int)v6)
        {
          case '<':
            if (v23) {
              ++*(void *)(v23 + 24);
            }
            v40 = [(NSPProxyPath *)self delegate];
            v41 = v40;
            uint64_t v42 = 60;
            goto LABEL_63;
          case '=':
            if (v23) {
              ++*(void *)(v23 + 32);
            }
            v40 = [(NSPProxyPath *)self delegate];
            v41 = v40;
            uint64_t v42 = 61;
            goto LABEL_63;
          case '>':
          case '?':
            goto LABEL_94;
          case '@':
            if (v23) {
              ++*(void *)(v23 + 40);
            }
            goto LABEL_28;
          case 'A':
            if (v23) {
              ++*(void *)(v23 + 48);
            }
            goto LABEL_28;
          default:
            if (v6 != 1) {
              goto LABEL_94;
            }
            goto LABEL_28;
        }
      }
      if ((v6 + 65568) <= 0x1E)
      {
        if (((1 << (v6 + 32)) & 0x4004C000) != 0)
        {
          if (v23) {
            ++*(void *)(v23 + 72);
          }
          goto LABEL_62;
        }
        if (v6 == -65568)
        {
          if (v23) {
            ++*(void *)(v23 + 64);
          }
          v40 = [(NSPProxyPath *)self delegate];
          v41 = v40;
          uint64_t v42 = 4294901728;
          goto LABEL_63;
        }
      }
      if (!v6)
      {
        if (v23)
        {
          *(void *)(v23 + 120) = 0;
          *(_OWORD *)(v23 + 104) = 0u;
          *(_OWORD *)(v23 + 88) = 0u;
          *(_OWORD *)(v23 + 72) = 0u;
          *(_OWORD *)(v23 + 56) = 0u;
          *(_OWORD *)(v23 + 40) = 0u;
          *(_OWORD *)(v23 + 24) = 0u;
          *(void *)(v23 + 16) = 1;
        }
        v41 = [(NSPProxyPath *)self delegate];
        v24 = v46;
        [v41 reportProxySuccessOnInterface:v46 proxyPath:self];
        goto LABEL_64;
      }
      goto LABEL_94;
    }
    if ((int)v6 > 1199)
    {
      if ((v6 - 1200) > 7)
      {
LABEL_75:
        if (v6 == 1301)
        {
          if (v23) {
            ++*(void *)(v23 + 112);
          }
          v40 = [(NSPProxyPath *)self delegate];
          v41 = v40;
          uint64_t v42 = 1301;
          goto LABEL_63;
        }
        if (v6 == 1302)
        {
          if (v23) {
            ++*(void *)(v23 + 120);
          }
          v40 = [(NSPProxyPath *)self delegate];
          v41 = v40;
          uint64_t v42 = 1302;
          goto LABEL_63;
        }
        goto LABEL_94;
      }
      int v39 = 1 << (v6 + 80);
      if ((v39 & 0x51) == 0)
      {
        if ((v39 & 0xA2) != 0)
        {
          if (v23) {
            ++*(void *)(v23 + 96);
          }
LABEL_62:
          v40 = [(NSPProxyPath *)self delegate];
          v41 = v40;
          uint64_t v42 = v6;
LABEL_63:
          v24 = v46;
          [v40 reportProxyError:v42 interface:v46 proxyPath:self];
LABEL_64:

          goto LABEL_65;
        }
        goto LABEL_75;
      }
LABEL_60:
      if (v23) {
        ++*(void *)(v23 + 88);
      }
      goto LABEL_62;
    }
    if ((v6 - 1100) <= 7)
    {
      if (((1 << (v6 - 76)) & 0x33) != 0) {
        goto LABEL_60;
      }
      if (v6 == 1106)
      {
        if (v23) {
          ++*(void *)(v23 + 80);
        }
        v40 = [(NSPProxyPath *)self delegate];
        v41 = v40;
        uint64_t v42 = 1106;
        goto LABEL_63;
      }
      if (v6 == 1107)
      {
        if (v23) {
          ++*(void *)(v23 + 104);
        }
        v40 = [(NSPProxyPath *)self delegate];
        v41 = v40;
        uint64_t v42 = 1107;
        goto LABEL_63;
      }
    }
LABEL_94:
    if (v23) {
      ++*(void *)(v23 + 56);
    }
    goto LABEL_62;
  }
  id v21 = nplog_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (!v16) {
      int v16 = "none";
    }
    v22 = sub_100049210(v8);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = (unsigned __int16)v6;
    *(_WORD *)v48 = 2080;
    *(void *)&v48[2] = v16;
    __int16 v49 = 2112;
    v50 = v17;
    __int16 v51 = 2112;
    v52 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received epoch (%u) from %s (%@) for %@ agent", buf, 0x26u);
  }
  uint64_t v23 = [(NSPProxyPath *)self delegate];
  [(id)v23 reportEpoch:(unsigned __int16)v6];
LABEL_28:
  v24 = v46;
LABEL_65:
}

- (void)dealloc
{
  uint64_t v3 = [(NSPProxyPath *)self singleHopRegistration];
  sub_100049E70((uint64_t)v3);

  id v4 = [(NSPProxyPath *)self delegate];
  [v4 singleHopAgentUnregistered:self];

  id v5 = [(NSPProxyPath *)self multiHopRegistration];
  sub_100049E70((uint64_t)v5);

  uint64_t v6 = [(NSPProxyPath *)self delegate];
  [v6 multiHopAgentUnregistered:self];

  v7.receiver = self;
  v7.super_class = (Class)NSPProxyPath;
  [(NSPProxyPath *)&v7 dealloc];
}

- (id)singleHopConfigurationHash
{
  uint64_t v2 = [(NSPProxyPath *)self singleHopRegistration];
  uint64_t v3 = sub_10004A110((uint64_t)v2);

  return v3;
}

- (id)multiHopConfigurationHash
{
  uint64_t v2 = [(NSPProxyPath *)self multiHopRegistration];
  uint64_t v3 = sub_10004A110((uint64_t)v2);

  return v3;
}

- (NSPProxyPathDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSPProxyPathDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (unint64_t)proxyPathWeight
{
  return self->_proxyPathWeight;
}

- (void)setProxyPathWeight:(unint64_t)a3
{
  self->_proxyPathWeight = a3;
}

- (BOOL)allowFallback
{
  return self->_allowFallback;
}

- (void)setAllowFallback:(BOOL)a3
{
  self->_allowFallback = a3;
}

- (BOOL)fallbackToQUIC
{
  return self->_fallbackToQUIC;
}

- (void)setFallbackToQUIC:(BOOL)a3
{
  self->_fallbackToQUIC = a3;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void)setForceFallback:(BOOL)a3
{
  self->_forceFallback = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)singleHopRegistered
{
  return self->_singleHopRegistered;
}

- (void)setSingleHopRegistered:(BOOL)a3
{
  self->_singleHopRegistered = a3;
}

- (BOOL)multiHopRegistered
{
  return self->_multiHopRegistered;
}

- (void)setMultiHopRegistered:(BOOL)a3
{
  self->_multiHopRegistered = a3;
}

- (BOOL)geohashSharingEnabled
{
  return self->_geohashSharingEnabled;
}

- (void)setGeohashSharingEnabled:(BOOL)a3
{
  self->_geohashSharingEnabled = a3;
}

- (NSNumber)configEpoch
{
  return self->_configEpoch;
}

- (void)setConfigEpoch:(id)a3
{
}

- (NSUUID)nonDefaultAgentUUID
{
  return self->_nonDefaultAgentUUID;
}

- (void)setNonDefaultAgentUUID:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)singleHopRegistration
{
  return self->_singleHopRegistration;
}

- (void)setSingleHopRegistration:(id)a3
{
}

- (NSPPrivacyProxyNetworkRegistration)multiHopRegistration
{
  return self->_multiHopRegistration;
}

- (void)setMultiHopRegistration:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)networkSingleHopAgentStatistics
{
  return self->_networkSingleHopAgentStatistics;
}

- (void)setNetworkSingleHopAgentStatistics:(id)a3
{
}

- (NSPProxyAgentNetworkStatistics)networkMultiHopAgentStatistics
{
  return self->_networkMultiHopAgentStatistics;
}

- (void)setNetworkMultiHopAgentStatistics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMultiHopAgentStatistics, 0);
  objc_storeStrong((id *)&self->_networkSingleHopAgentStatistics, 0);
  objc_storeStrong((id *)&self->_multiHopRegistration, 0);
  objc_storeStrong((id *)&self->_singleHopRegistration, 0);
  objc_storeStrong((id *)&self->_nonDefaultAgentUUID, 0);
  objc_storeStrong((id *)&self->_configEpoch, 0);
  objc_storeStrong((id *)&self->_egressProxy, 0);
  objc_storeStrong((id *)&self->_ingressProxy, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end