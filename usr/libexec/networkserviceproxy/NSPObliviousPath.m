@interface NSPObliviousPath
+ (BOOL)supportsSecureCoding;
- (BOOL)allowFailOpen;
- (BOOL)allowFallback;
- (BOOL)deferAgentCommit;
- (BOOL)deferCommit;
- (BOOL)matchIngress:(id)a3;
- (BOOL)obliviousAgentRegistered;
- (BOOL)pathReady;
- (BOOL)resetFallbackProxyAgent;
- (BOOL)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3;
- (BOOL)shouldBePenalized;
- (BOOL)validateTransparencyIfNecessaryWithCompletion:(id)a3;
- (NSData)obliviousConfig;
- (NSData)transparencyKeyBundle;
- (NSData)transparencyProof;
- (NSPObliviousPath)initWithCoder:(id)a3;
- (NSPObliviousPath)initWithDelegate:(id)a3 obliviousConfig:(id)a4 obliviousHTTPType:(int)a5 transparencyKeyBundle:(id)a6 transparencyProof:(id)a7 obliviousTarget:(id)a8 proxyInfo:(id)a9 allowFailOpen:(BOOL)a10 networkCharacteristics:(id)a11;
- (NSPObliviousPathDelegate)delegate;
- (NSPPrivacyProxyNetworkRegistration)fallbackRegistration;
- (NSPPrivacyProxyNetworkRegistration)quicRegistration;
- (NSPPrivacyProxyObliviousTargetInfo)obliviousTarget;
- (NSPProxyAgentNetworkStatistics)statistics;
- (NSPProxyTokenInfo)proxyInfo;
- (NSString)description;
- (NSUUID)fallbackAgentUUID;
- (NSUUID)quicAgentUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)shortName;
- (int)obliviousHTTPType;
- (unsigned)transparencyState;
- (void)dealloc;
- (void)enableFailOpen:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)handleNetworkCharacteristicsChange:(id)a3;
- (void)removeProxyAgents;
- (void)reportErrorForNetworkRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)resetError;
- (void)resetStats;
- (void)setAllowFailOpen:(BOOL)a3;
- (void)setDeferAgentCommit:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFallbackAgentUUID:(id)a3;
- (void)setFallbackRegistration:(id)a3;
- (void)setObliviousAgentRegistered:(BOOL)a3;
- (void)setObliviousConfig:(id)a3;
- (void)setObliviousHTTPType:(int)a3;
- (void)setObliviousTarget:(id)a3;
- (void)setProxyInfo:(id)a3;
- (void)setQuicAgentUUID:(id)a3;
- (void)setQuicRegistration:(id)a3;
- (void)setStatistics:(id)a3;
- (void)setTransparencyKeyBundle:(id)a3;
- (void)setTransparencyProof:(id)a3;
- (void)setTransparencyState:(unsigned __int8)a3;
- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3;
@end

@implementation NSPObliviousPath

- (NSPObliviousPath)initWithDelegate:(id)a3 obliviousConfig:(id)a4 obliviousHTTPType:(int)a5 transparencyKeyBundle:(id)a6 transparencyProof:(id)a7 obliviousTarget:(id)a8 proxyInfo:(id)a9 allowFailOpen:(BOOL)a10 networkCharacteristics:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v31 = a9;
  id v19 = a11;
  v36.receiver = self;
  v36.super_class = (Class)NSPObliviousPath;
  v20 = [(NSPObliviousPath *)&v36 init];
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v21->_obliviousConfig, a4);
    v21->_obliviousHTTPType = a5;
    objc_storeStrong((id *)&v21->_obliviousTarget, a8);
    objc_storeStrong((id *)&v21->_transparencyKeyBundle, a6);
    objc_storeStrong((id *)&v21->_transparencyProof, a7);
    objc_storeStrong((id *)&v21->_proxyInfo, a9);
    v21->_allowFailOpen = a10;
    v22 = objc_alloc_init(NSPProxyAgentNetworkStatistics);
    statistics = v21->_statistics;
    v21->_statistics = v22;

    sub_10001424C((uint64_t)v21->_statistics, v19);
    v21->_transparencyState = 0;
    uint64_t v24 = +[NSUUID UUID];
    quicAgentUUID = v21->_quicAgentUUID;
    v21->_quicAgentUUID = (NSUUID *)v24;

    if ([(NSPObliviousPath *)v21 allowFallback])
    {
      uint64_t v26 = +[NSUUID UUID];
      fallbackAgentUUID = v21->_fallbackAgentUUID;
      v21->_fallbackAgentUUID = (NSUUID *)v26;
    }
    v28 = v21;
  }
  else
  {
    v30 = nplog_obj();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  return v21;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  id v7 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
  v8 = [(NSPObliviousPath *)self obliviousTarget];
  sub_1000482D4(v7, v8, @"Oblivious target", a3, a4);

  v9 = [(NSPObliviousPath *)self proxyInfo];
  sub_1000482D4(v7, v9, @"Proxy", a3, a4);

  v10 = [(NSPObliviousPath *)self quicAgentUUID];
  sub_1000482D4(v7, v10, @"QUIC Agent UUID", a3, a4);

  v11 = [(NSPObliviousPath *)self fallbackAgentUUID];
  sub_1000482D4(v7, v11, @"Fallback Agent UUID", a3, a4);

  sub_100048B1C(v7, [(NSPObliviousPath *)self allowFailOpen], @"Allow fail open", a3, a4);
  sub_100048B88(v7, [(NSPObliviousPath *)self transparencyState], @"Transparency state", a3, a4);
  uint64_t v12 = [(NSPObliviousPath *)self obliviousHTTPType];
  if (v12 >= 3)
  {
    v13 = +[NSString stringWithFormat:@"(unknown: %i)", v12];
  }
  else
  {
    v13 = *(&off_100105C10 + (int)v12);
  }
  sub_1000482D4(v7, v13, @"Oblivious HTTP type", a3, a4);

  return v7;
}

- (NSString)description
{
  return (NSString *)[(NSPObliviousPath *)self descriptionWithIndent:0 options:14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)deferCommit
{
  if ([(NSPObliviousPath *)self deferAgentCommit]) {
    return 1;
  }
  v4 = [(NSPObliviousPath *)self delegate];
  unsigned __int8 v5 = [v4 deferCommit];

  return v5;
}

- (NSPObliviousPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NSPObliviousPath;
  unsigned __int8 v5 = [(NSPObliviousPath *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathProxy"];
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPProxyTokenInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathQUICAgentUUID"];
    quicAgentUUID = v5->_quicAgentUUID;
    v5->_quicAgentUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathFallbackAgentUUID"];
    fallbackAgentUUID = v5->_fallbackAgentUUID;
    v5->_fallbackAgentUUID = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathConfig"];
    obliviousConfig = v5->_obliviousConfig;
    v5->_obliviousConfig = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathTarget"];
    obliviousTarget = v5->_obliviousTarget;
    v5->_obliviousTarget = (NSPPrivacyProxyObliviousTargetInfo *)v14;

    v5->_allowFailOpen = [v4 decodeBoolForKey:@"obliviousPathAllowFailOpen"];
    v5->_obliviousHTTPType = [v4 decodeIntegerForKey:@"obliviousPathType"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathTransparencyKeyBundle"];
    transparencyKeyBundle = v5->_transparencyKeyBundle;
    v5->_transparencyKeyBundle = (NSData *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"obliviousPathTransparencyProof"];
    transparencyProof = v5->_transparencyProof;
    v5->_transparencyProof = (NSData *)v18;

    unsigned __int8 v20 = [v4 decodeIntegerForKey:@"obliviousPathTransparencyState"];
    if (v20 == 1) {
      unsigned __int8 v21 = 0;
    }
    else {
      unsigned __int8 v21 = v20;
    }
    v5->_transparencyState = v21;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(NSPObliviousPath *)self proxyInfo];
  [v11 encodeObject:v4 forKey:@"obliviousPathProxy"];

  unsigned __int8 v5 = [(NSPObliviousPath *)self quicAgentUUID];
  [v11 encodeObject:v5 forKey:@"obliviousPathQUICAgentUUID"];

  uint64_t v6 = [(NSPObliviousPath *)self fallbackAgentUUID];
  [v11 encodeObject:v6 forKey:@"obliviousPathFallbackAgentUUID"];

  id v7 = [(NSPObliviousPath *)self obliviousConfig];
  [v11 encodeObject:v7 forKey:@"obliviousPathConfig"];

  uint64_t v8 = [(NSPObliviousPath *)self obliviousTarget];
  [v11 encodeObject:v8 forKey:@"obliviousPathTarget"];

  [v11 encodeBool:-[NSPObliviousPath allowFailOpen](self, "allowFailOpen") forKey:@"obliviousPathAllowFailOpen"];
  [v11 encodeInteger:-[NSPObliviousPath obliviousHTTPType](self, "obliviousHTTPType") forKey:@"obliviousPathType"];
  v9 = [(NSPObliviousPath *)self transparencyKeyBundle];
  [v11 encodeObject:v9 forKey:@"obliviousPathTransparencyKeyBundle"];

  uint64_t v10 = [(NSPObliviousPath *)self transparencyProof];
  [v11 encodeObject:v10 forKey:@"obliviousPathTransparencyProof"];

  if ([(NSPObliviousPath *)self transparencyState] != 1) {
    [v11 encodeInteger:-[NSPObliviousPath transparencyState](self, "transparencyState") forKey:@"obliviousPathTransparencyState"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPObliviousPath allocWithZone:a3] init];
  unsigned __int8 v5 = [(NSPObliviousPath *)self obliviousConfig];
  [(NSPObliviousPath *)v4 setObliviousConfig:v5];

  uint64_t v6 = [(NSPObliviousPath *)self obliviousTarget];
  [(NSPObliviousPath *)v4 setObliviousTarget:v6];

  id v7 = [(NSPObliviousPath *)self proxyInfo];
  [(NSPObliviousPath *)v4 setProxyInfo:v7];

  uint64_t v8 = [(NSPObliviousPath *)self quicAgentUUID];
  [(NSPObliviousPath *)v4 setQuicAgentUUID:v8];

  v9 = [(NSPObliviousPath *)self fallbackAgentUUID];
  [(NSPObliviousPath *)v4 setFallbackAgentUUID:v9];

  uint64_t v10 = [(NSPObliviousPath *)self quicRegistration];
  [(NSPObliviousPath *)v4 setQuicRegistration:v10];

  id v11 = [(NSPObliviousPath *)self fallbackRegistration];
  [(NSPObliviousPath *)v4 setFallbackRegistration:v11];

  [(NSPObliviousPath *)v4 setObliviousAgentRegistered:[(NSPObliviousPath *)self obliviousAgentRegistered]];
  [(NSPObliviousPath *)v4 setAllowFailOpen:[(NSPObliviousPath *)self allowFailOpen]];
  [(NSPObliviousPath *)v4 setObliviousHTTPType:[(NSPObliviousPath *)self obliviousHTTPType]];
  uint64_t v12 = [(NSPObliviousPath *)self statistics];
  [(NSPObliviousPath *)v4 setStatistics:v12];

  v13 = [(NSPObliviousPath *)self transparencyKeyBundle];
  [(NSPObliviousPath *)v4 setTransparencyKeyBundle:v13];

  uint64_t v14 = [(NSPObliviousPath *)self transparencyProof];
  [(NSPObliviousPath *)v4 setTransparencyProof:v14];

  [(NSPObliviousPath *)v4 setTransparencyState:[(NSPObliviousPath *)self transparencyState]];
  return v4;
}

- (void)enableFailOpen:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPObliviousPath *)self allowFailOpen] != a3)
  {
    [(NSPObliviousPath *)self setAllowFailOpen:v3];
    [(NSPObliviousPath *)self resetFallbackProxyAgent];
    [(NSPObliviousPath *)self resetQUICProxyAgentForceUpdateDelegate:0];
  }
}

- (id)shortName
{
  v2 = [(NSPObliviousPath *)self obliviousTarget];
  BOOL v3 = [v2 targetHost];

  return v3;
}

- (BOOL)matchIngress:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    unsigned __int8 v5 = [(NSPObliviousPath *)self proxyInfo];

    if (v5)
    {
      uint64_t v6 = [(NSPObliviousPath *)self proxyInfo];
      id v7 = (void *)v6;
      if (v6) {
        uint64_t v8 = *(void **)(v6 + 24);
      }
      else {
        uint64_t v8 = 0;
      }
      id v9 = v8;
      uint64_t v10 = [v9 proxyURL];
      id v11 = [v4[3] proxyURL];
      LOBYTE(v5) = [v10 isEqualToString:v11];
    }
  }
  else
  {
    v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v14 = 136315138;
      v15 = "-[NSPObliviousPath matchIngress:]";
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
  memset(v32, 0, sizeof(v32));
  id v9 = [a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_7;
  }
  uint64_t v10 = +[NWPath pathForClientID:v9];
  id v11 = v10;
  if (!v10)
  {
LABEL_7:
    uint64_t v16 = 0;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = [v10 interface];
  v13 = [v11 parameters];
  int v14 = [v13 pid];
  if (!v14)
  {
LABEL_11:
    uint64_t v16 = 0;
    goto LABEL_12;
  }
  int v15 = v14;
  if (proc_pidinfo(v14, 13, 1uLL, &buffer, 64) != 64)
  {
    id v17 = nplog_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v23 = 67109120;
      int v24 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v23, 8u);
    }

    goto LABEL_11;
  }
  uint64_t v16 = (const char *)v32;
LABEL_12:

LABEL_13:
  uint64_t v18 = nplog_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v16) {
      id v19 = v16;
    }
    else {
      id v19 = "none";
    }
    unsigned __int8 v20 = sub_100049210(v8);
    unsigned __int8 v21 = [v12 interfaceName];
    int v23 = 67109890;
    int v24 = v6;
    __int16 v25 = 2080;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    v28 = v20;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received error (%d) from %s for oblivious %@ agent on interface %@", (uint8_t *)&v23, 0x26u);
  }
  if (v6)
  {
    v22 = [(NSPObliviousPath *)self delegate];
    [v22 reportObliviousPathError:v6 interface:v12 obliviousPath:self];
  }
}

- (void)handleNetworkCharacteristicsChange:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSPObliviousPath *)self statistics];
  sub_10001424C((uint64_t)v5, v4);

  uint64_t v6 = [(NSPObliviousPath *)self statistics];
  if (v6)
  {
    v6[6] = 0u;
    v6[7] = 0u;
    v6[4] = 0u;
    v6[5] = 0u;
    v6[2] = 0u;
    v6[3] = 0u;
    v6[1] = 0u;
  }
}

- (void)resetStats
{
  v2 = [(NSPObliviousPath *)self statistics];
  if (v2)
  {
    v2[6] = 0u;
    v2[7] = 0u;
    v2[4] = 0u;
    v2[5] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
    v2[1] = 0u;
  }
}

- (void)resetError
{
  uint64_t v3 = [(NSPObliviousPath *)self quicRegistration];
  id v4 = (void *)v3;
  if (v3) {
    [*(id *)(v3 + 24) resetError];
  }

  unsigned __int8 v5 = [(NSPObliviousPath *)self fallbackRegistration];
  if (v5)
  {
    uint64_t v6 = v5;
    [v5[3] resetError];
    unsigned __int8 v5 = v6;
  }
}

- (BOOL)shouldBePenalized
{
  uint64_t v3 = [(NSPObliviousPath *)self statistics];
  id v4 = (void *)v3;
  if (v3 && *(void *)(v3 + 80) > 2uLL)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = [(NSPObliviousPath *)self statistics];
    uint64_t v6 = (void *)v5;
    if (v5 && *(void *)(v5 + 72) > 2uLL)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v8 = [(NSPObliviousPath *)self statistics];
      id v9 = (void *)v8;
      if (v8 && *(void *)(v8 + 24) > 9uLL)
      {
        BOOL v7 = 1;
      }
      else
      {
        uint64_t v10 = [(NSPObliviousPath *)self statistics];
        id v11 = (void *)v10;
        if (v10 && *(void *)(v10 + 64) > 2uLL)
        {
          BOOL v7 = 1;
        }
        else
        {
          uint64_t v12 = [(NSPObliviousPath *)self statistics];
          v13 = (void *)v12;
          if (v12 && *(void *)(v12 + 56) > 9uLL)
          {
            BOOL v7 = 1;
          }
          else
          {
            int v14 = [(NSPObliviousPath *)self statistics];
            if (v14) {
              BOOL v7 = v14[4] > 2uLL;
            }
            else {
              BOOL v7 = 0;
            }
          }
        }
      }
    }
  }
  return v7;
}

- (BOOL)validateTransparencyIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSPObliviousPath *)self transparencyKeyBundle];

  if (v5)
  {
    id v6 = objc_alloc((Class)NSPPrivacyProxyTransparencyOHTTPEntry);
    BOOL v7 = [(NSPObliviousPath *)self transparencyKeyBundle];
    id v8 = [v6 initWithData:v7];

    if (v8)
    {
      id v9 = [v8 keyConfiguration];
      uint64_t v10 = [(NSPObliviousPath *)self obliviousConfig];
      unsigned __int8 v11 = [v9 isEqualToData:v10];

      if (v11)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v12 = [v8 targetInformations];
        id v13 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v13)
        {
          id v14 = v13;
          id v34 = v8;
          v35 = (void (**)(void, void))v4;
          char v15 = 0;
          uint64_t v16 = *(void *)v39;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(v12);
              }
              uint64_t v18 = [*(id *)(*((void *)&v38 + 1) + 8 * i) targetHost];
              id v19 = [(NSPObliviousPath *)self obliviousTarget];
              unsigned __int8 v20 = [v19 targetHost];
              unsigned __int8 v21 = [v18 isEqualToString:v20];

              v15 |= v21;
            }
            id v14 = [v12 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v14);

          id v8 = v34;
          id v4 = v35;
          if (v15)
          {
            v22 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v34 configurationDeliveryStart]);
            int v23 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v34 configurationDeliveryEnd]);
            int v24 = [(NSPObliviousPath *)self delegate];
            unsigned __int8 v25 = [v24 configurationFetchDateIsWithinStart:v22 end:v23];

            if (v25)
            {
              id v26 = [objc_alloc((Class)SoftwareTransparency) initWithApplication:0];
              BOOL v27 = v26 == 0;
              if (v26)
              {
                v28 = [(NSPObliviousPath *)self transparencyProof];
                __int16 v29 = [(NSPObliviousPath *)self transparencyKeyBundle];
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472;
                v36[2] = sub_1000157AC;
                v36[3] = &unk_1001058C0;
                v37 = v35;
                [v26 verifyExpiringProofs:v28 for:v29 completion:v36];
              }
              else
              {
                v35[2](v35, 0);
              }
            }
            else
            {
              id v33 = nplog_obj();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v43 = v22;
                __int16 v44 = 2112;
                v45 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Configuration start time (%@) and end time (%@) are not valid, blocking installing oblivious config", buf, 0x16u);
              }

              v35[2](v35, 0);
              BOOL v27 = 1;
            }

            goto LABEL_25;
          }
        }
        else
        {
        }
        v30 = nplog_obj();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          id v31 = "Failed to find target info in transparency blob for oblivious config, blocking";
          goto LABEL_23;
        }
LABEL_24:

        (*((void (**)(id, void))v4 + 2))(v4, 0);
        BOOL v27 = 1;
LABEL_25:

        goto LABEL_26;
      }
      v30 = nplog_obj();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      id v31 = "Failed to match key configuration in transparency blob for oblivious config, blocking";
    }
    else
    {
      v30 = nplog_obj();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      *(_WORD *)buf = 0;
      id v31 = "Failed to parse transparency blob for oblivious config, blocking";
    }
LABEL_23:
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v31, buf, 2u);
    goto LABEL_24;
  }
  BOOL v27 = 1;
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_26:

  return v27;
}

- (BOOL)pathReady
{
  uint64_t v3 = [(NSPObliviousPath *)self proxyInfo];
  if (sub_10000EDFC((uint64_t)v3))
  {
    id v4 = [(NSPObliviousPath *)self proxyInfo];
    unint64_t v5 = sub_100010F2C((uint64_t)v4);
    id v6 = [(NSPObliviousPath *)self proxyInfo];
    unint64_t v7 = sub_100011C74((uint64_t)v6);

    if (v5 <= v7)
    {
      id v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(NSPObliviousPath *)self shortName];
        uint64_t v10 = [(NSPObliviousPath *)self proxyInfo];
        uint64_t v11 = sub_100010F2C((uint64_t)v10);
        uint64_t v12 = [(NSPObliviousPath *)self proxyInfo];
        *(_DWORD *)buf = 134218754;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v28 = v11;
        __int16 v29 = 2048;
        uint64_t v30 = sub_100011C74((uint64_t)v12);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is not ready due to insufficient ingress proxy tokens (cache+agent: %lu), (ingress proxy low-water mark: %lu)", buf, 0x2Au);
      }
      return 0;
    }
  }
  else
  {
  }
  id v13 = [(NSPObliviousPath *)self transparencyKeyBundle];
  if (v13)
  {
    unsigned int v14 = [(NSPObliviousPath *)self transparencyState];

    if (v14 != 2)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      LOBYTE(v28) = 1;
      if ([(NSPObliviousPath *)self transparencyState]
        || ([(NSPObliviousPath *)self setTransparencyState:1],
            v22[0] = _NSConcreteStackBlock,
            v22[1] = 3221225472,
            v22[2] = sub_100015E40,
            v22[3] = &unk_100105870,
            v22[4] = self,
            v22[5] = buf,
            [(NSPObliviousPath *)self validateTransparencyIfNecessaryWithCompletion:v22]))
      {
        if ([(NSPObliviousPath *)self transparencyState] == 3)
        {
          uint64_t v18 = nplog_obj();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v20 = [(NSPObliviousPath *)self shortName];
            *(_DWORD *)int v23 = 134218242;
            int v24 = self;
            __int16 v25 = 2112;
            id v26 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%p oblivious path [%@] is not ready due to invalid transparency status", v23, 0x16u);
          }
        }
        else
        {
          if ([(NSPObliviousPath *)self transparencyState] != 1)
          {
            _Block_object_dispose(buf, 8);
            goto LABEL_9;
          }
          uint64_t v18 = nplog_obj();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            unsigned __int8 v21 = [(NSPObliviousPath *)self shortName];
            *(_DWORD *)int v23 = 134218242;
            int v24 = self;
            __int16 v25 = 2112;
            id v26 = v21;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%p oblivious path [%@] is not ready due to pending transparency status", v23, 0x16u);
          }
        }
      }
      else
      {
        *(unsigned char *)(*(void *)&buf[8] + 24) = 0;
        uint64_t v18 = nplog_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [(NSPObliviousPath *)self shortName];
          *(_DWORD *)int v23 = 134218242;
          int v24 = self;
          __int16 v25 = 2112;
          id v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is not ready due to unknown transparency status", v23, 0x16u);
        }
      }

      _Block_object_dispose(buf, 8);
      return 0;
    }
  }
LABEL_9:
  char v15 = nplog_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(NSPObliviousPath *)self shortName];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%p oblivious path [%@] is ready", buf, 0x16u);
  }
  return 1;
}

- (BOOL)allowFallback
{
  v2 = [(NSPObliviousPath *)self proxyInfo];
  uint64_t v3 = v2;
  if (v2) {
    v2 = (void *)v2[3];
  }
  unsigned __int8 v4 = [v2 supportsFallback];

  return v4;
}

- (BOOL)resetQUICProxyAgentForceUpdateDelegate:(BOOL)a3
{
  uint64_t v5 = [(NSPObliviousPath *)self proxyInfo];
  if (!v5) {
    return v5;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(NSPObliviousPath *)self obliviousConfig];
  if (!v7)
  {

    goto LABEL_14;
  }
  id v8 = (void *)v7;
  id v9 = [(NSPObliviousPath *)self obliviousTarget];

  if (!v9)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
  uint64_t v10 = [(NSPObliviousPath *)self quicAgentUUID];

  if (!v10)
  {
    uint64_t v11 = +[NSUUID UUID];
    [(NSPObliviousPath *)self setQuicAgentUUID:v11];
  }
  uint64_t v12 = [(NSPObliviousPath *)self quicRegistration];

  if (!v12)
  {
    id v13 = [NSPPrivacyProxyObliviousHopsNetworkRegistration alloc];
    unsigned int v14 = [(NSPObliviousPath *)self quicAgentUUID];
    char v15 = [(NSPObliviousPath *)self obliviousTarget];
    uint64_t v16 = [v15 targetHost];
    id v17 = sub_10004B540((id *)&v13->super.super.isa, v14, v16, self);
    [(NSPObliviousPath *)self setQuicRegistration:v17];

    uint64_t v18 = [(NSPObliviousPath *)self quicRegistration];

    if (!v18)
    {
      v62 = nplog_obj();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v87 = "-[NSPObliviousPath resetQUICProxyAgentForceUpdateDelegate:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_FAULT, "%s called with null self.quicRegistration", buf, 0xCu);
      }

      goto LABEL_14;
    }
  }
  uint64_t v19 = [(NSPObliviousPath *)self fallbackAgentUUID];
  if (!v19) {
    goto LABEL_15;
  }
  unsigned __int8 v20 = (void *)v19;
  uint64_t v21 = [(NSPObliviousPath *)self fallbackRegistration];
  if (!v21)
  {
    v80 = 0;
    v85 = 0;
    goto LABEL_12;
  }
  v22 = (void *)v21;
  unsigned int v23 = [*(id *)(v21 + 24) isRegistered];

  if (!v23)
  {
LABEL_15:
    v80 = 0;
    v85 = 0;
    goto LABEL_16;
  }
  v80 = [(NSPObliviousPath *)self fallbackAgentUUID];
  unsigned __int8 v20 = [(NSPObliviousPath *)self fallbackRegistration];
  v85 = sub_10004A110((uint64_t)v20);
LABEL_12:

LABEL_16:
  uint64_t v24 = [(NSPObliviousPath *)self quicRegistration];
  uint64_t v25 = [(NSPObliviousPath *)self proxyInfo];
  v78 = (void *)v25;
  if (v25) {
    id v26 = *(void **)(v25 + 24);
  }
  else {
    id v26 = 0;
  }
  id v27 = v26;
  v83 = [v27 proxyURL];
  uint64_t v28 = [(NSPObliviousPath *)self proxyInfo];
  v76 = (void *)v28;
  if (v28) {
    __int16 v29 = *(void **)(v28 + 24);
  }
  else {
    __int16 v29 = 0;
  }
  id v30 = v29;
  v82 = [v30 proxyKeyInfos];
  uint64_t v31 = [(NSPObliviousPath *)self proxyInfo];
  v74 = (void *)v31;
  if (v31) {
    id v32 = *(void **)(v31 + 24);
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;
  v81 = [v33 proxyVersion];
  uint64_t v34 = [(NSPObliviousPath *)self proxyInfo];
  v72 = (void *)v34;
  if (v34) {
    v35 = *(void **)(v34 + 24);
  }
  else {
    v35 = 0;
  }
  id v36 = v35;
  unsigned int v37 = [v36 supportsResumption];
  uint64_t v38 = [(NSPObliviousPath *)self proxyInfo];
  v70 = (void *)v38;
  int v68 = v37;
  if (v38) {
    long long v39 = *(void **)(v38 + 24);
  }
  else {
    long long v39 = 0;
  }
  id v40 = v39;
  unsigned int v41 = [v40 algorithm];
  uint64_t v42 = [(NSPObliviousPath *)self proxyInfo];
  BOOL v67 = sub_10000EDFC(v42);
  v69 = (void *)v42;
  if (v67)
  {
    uint64_t v43 = [(NSPObliviousPath *)self proxyInfo];
    v65 = (void *)v43;
    if (v43) {
      __int16 v44 = *(void **)(v43 + 48);
    }
    else {
      __int16 v44 = 0;
    }
    id v66 = v44;
  }
  else
  {
    id v66 = 0;
  }
  uint64_t v45 = [(NSPObliviousPath *)self proxyInfo];
  v46 = (void *)v45;
  BOOL v79 = a3;
  v84 = (id *)v24;
  v77 = v27;
  v75 = v30;
  v73 = v33;
  v71 = v36;
  if (v45) {
    v47 = *(void **)(v45 + 24);
  }
  else {
    v47 = 0;
  }
  BOOL v48 = v41 == 2;
  id v49 = v47;
  v50 = [v49 tokenChallenge];
  unsigned __int8 v51 = [(NSPObliviousPath *)self allowFailOpen];
  v52 = [(NSPObliviousPath *)self obliviousConfig];
  v53 = [(NSPObliviousPath *)self obliviousTarget];
  v54 = [v53 proxyURLPath];
  LOBYTE(v64) = v51;
  v55 = v80;
  sub_10004B5FC((uint64_t)v84, v83, v82, v81, v68, v48, v66, v50 != 0, v80, v64, v52, v54, [(NSPObliviousPath *)self obliviousHTTPType], v85);

  if (v67)
  {
  }
  if (v84
    && [v84[3] isRegistered]
    && (v79 || ![(NSPObliviousPath *)self obliviousAgentRegistered]))
  {
    [(NSPObliviousPath *)self setObliviousAgentRegistered:1];
    v56 = [(NSPObliviousPath *)self delegate];
    v57 = [(NSPObliviousPath *)self obliviousTarget];
    v58 = [v57 targetHost];
    v59 = [(NSPObliviousPath *)self obliviousTarget];
    v60 = [v59 processes];
    v61 = [(NSPObliviousPath *)self quicAgentUUID];
    [v56 obliviousHopAgentRegistered:self hostname:v58 processes:v60 agentUUID:v61];

    v55 = v80;
  }

  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)resetFallbackProxyAgent
{
  uint64_t v3 = [(NSPObliviousPath *)self proxyInfo];
  if (!v3) {
    return v3;
  }
  unsigned __int8 v4 = (void *)v3;
  uint64_t v5 = [(NSPObliviousPath *)self obliviousConfig];
  if (!v5)
  {

    goto LABEL_24;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [(NSPObliviousPath *)self obliviousTarget];

  if (!v7)
  {
LABEL_24:
    LOBYTE(v3) = 0;
    return v3;
  }
  LODWORD(v3) = [(NSPObliviousPath *)self allowFallback];
  if (!v3) {
    return v3;
  }
  id v8 = [(NSPObliviousPath *)self fallbackAgentUUID];

  if (!v8)
  {
    id v9 = +[NSUUID UUID];
    [(NSPObliviousPath *)self setFallbackAgentUUID:v9];
  }
  uint64_t v10 = [(NSPObliviousPath *)self fallbackRegistration];

  if (!v10)
  {
    uint64_t v11 = [NSPPrivacyProxyObliviousHopsFallbackNetworkRegistration alloc];
    uint64_t v12 = [(NSPObliviousPath *)self fallbackAgentUUID];
    id v13 = [(NSPObliviousPath *)self obliviousTarget];
    unsigned int v14 = [v13 targetHost];
    char v15 = sub_10004CD0C((id *)&v11->super.super.isa, v12, v14, self);
    [(NSPObliviousPath *)self setFallbackRegistration:v15];

    uint64_t v16 = [(NSPObliviousPath *)self fallbackRegistration];

    if (!v16)
    {
      id v49 = nplog_obj();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v71 = "-[NSPObliviousPath resetFallbackProxyAgent]";
        _os_log_fault_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, "%s called with null self.fallbackRegistration", buf, 0xCu);
      }

      goto LABEL_24;
    }
  }
  uint64_t v17 = [(NSPObliviousPath *)self fallbackRegistration];
  uint64_t v18 = [(NSPObliviousPath *)self proxyInfo];
  id v66 = (void *)v18;
  if (v18) {
    uint64_t v19 = *(void **)(v18 + 24);
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = v19;
  uint64_t v64 = [v20 tcpProxyFqdn];
  uint64_t v21 = [(NSPObliviousPath *)self proxyInfo];
  v63 = (void *)v21;
  if (v21) {
    v22 = *(void **)(v21 + 24);
  }
  else {
    v22 = 0;
  }
  id v23 = v22;
  v69 = [v23 proxyKeyInfos];
  uint64_t v24 = [(NSPObliviousPath *)self proxyInfo];
  v62 = (void *)v24;
  if (v24) {
    uint64_t v25 = *(void **)(v24 + 24);
  }
  else {
    uint64_t v25 = 0;
  }
  id v26 = v25;
  int v68 = [v26 proxyVersion];
  uint64_t v27 = [(NSPObliviousPath *)self proxyInfo];
  v60 = (void *)v27;
  if (v27) {
    uint64_t v28 = *(void **)(v27 + 24);
  }
  else {
    uint64_t v28 = 0;
  }
  id v29 = v28;
  unsigned int v30 = [v29 supportsResumption];
  uint64_t v31 = [(NSPObliviousPath *)self proxyInfo];
  v61 = v26;
  v58 = (void *)v31;
  int v55 = v30;
  if (v31) {
    id v32 = *(void **)(v31 + 24);
  }
  else {
    id v32 = 0;
  }
  id v33 = v32;
  unsigned int v34 = [v33 algorithm];
  uint64_t v35 = [(NSPObliviousPath *)self proxyInfo];
  BOOL v36 = sub_10000EDFC(v35);
  v59 = v29;
  if (v36)
  {
    uint64_t v37 = [(NSPObliviousPath *)self proxyInfo];
    v52 = (void *)v37;
    if (v37) {
      uint64_t v38 = *(void **)(v37 + 48);
    }
    else {
      uint64_t v38 = 0;
    }
    id v53 = v38;
  }
  else
  {
    id v53 = 0;
  }
  uint64_t v39 = [(NSPObliviousPath *)self proxyInfo];
  id v40 = (void *)v39;
  BOOL v67 = (void *)v17;
  v65 = v20;
  v56 = (void *)v35;
  v57 = v33;
  BOOL v54 = v36;
  if (v39) {
    unsigned int v41 = *(void **)(v39 + 24);
  }
  else {
    unsigned int v41 = 0;
  }
  BOOL v42 = v34 == 2;
  id v43 = v41;
  __int16 v44 = [v43 tokenChallenge];
  unsigned __int8 v45 = [(NSPObliviousPath *)self allowFailOpen];
  v46 = [(NSPObliviousPath *)self obliviousConfig];
  v47 = [(NSPObliviousPath *)self obliviousTarget];
  BOOL v48 = [v47 proxyURLPath];
  LOBYTE(v51) = v45;
  sub_10004CDC8((uint64_t)v67, v64, v69, v68, v55, v42, v53, v44 != 0, v51, v46, v48, [(NSPObliviousPath *)self obliviousHTTPType]);

  if (v54)
  {
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (void)setupProxyAgentsForceUpdateDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPObliviousPath *)self pathReady])
  {
    [(NSPObliviousPath *)self setDeferAgentCommit:1];
    unsigned int v5 = [(NSPObliviousPath *)self resetFallbackProxyAgent];
    unsigned __int8 v6 = [(NSPObliviousPath *)self resetQUICProxyAgentForceUpdateDelegate:v3];
    [(NSPObliviousPath *)self setDeferAgentCommit:0];
    if (((v6 & 1) != 0 || v5) && ![(NSPObliviousPath *)self deferCommit])
    {
      id v7 = +[NEFileHandleMaintainer sharedMaintainer];
      [v7 commit];
    }
  }
}

- (void)removeProxyAgents
{
  id v9 = [(NSPObliviousPath *)self quicAgentUUID];
  [(NSPObliviousPath *)self setDeferAgentCommit:1];
  BOOL v3 = [(NSPObliviousPath *)self quicRegistration];
  sub_100049E70((uint64_t)v3);

  unsigned __int8 v4 = [(NSPObliviousPath *)self fallbackRegistration];
  sub_100049E70((uint64_t)v4);

  [(NSPObliviousPath *)self setDeferAgentCommit:0];
  if (![(NSPObliviousPath *)self deferCommit])
  {
    unsigned int v5 = +[NEFileHandleMaintainer sharedMaintainer];
    [v5 commit];
  }
  if ([(NSPObliviousPath *)self obliviousAgentRegistered])
  {
    [(NSPObliviousPath *)self setObliviousAgentRegistered:0];
    unsigned __int8 v6 = [(NSPObliviousPath *)self delegate];
    id v7 = [(NSPObliviousPath *)self obliviousTarget];
    id v8 = [v7 targetHost];
    [v6 obliviousHopAgentUnregistered:self hostname:v8 agentUUID:v9];
  }
  [(NSPObliviousPath *)self setQuicAgentUUID:0];
  [(NSPObliviousPath *)self setFallbackAgentUUID:0];
  [(NSPObliviousPath *)self setQuicRegistration:0];
  [(NSPObliviousPath *)self setFallbackRegistration:0];
}

- (void)dealloc
{
  [(NSPObliviousPath *)self removeProxyAgents];
  v3.receiver = self;
  v3.super_class = (Class)NSPObliviousPath;
  [(NSPObliviousPath *)&v3 dealloc];
}

- (NSPObliviousPathDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSPObliviousPathDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSData)obliviousConfig
{
  return self->_obliviousConfig;
}

- (void)setObliviousConfig:(id)a3
{
}

- (NSData)transparencyKeyBundle
{
  return self->_transparencyKeyBundle;
}

- (void)setTransparencyKeyBundle:(id)a3
{
}

- (NSData)transparencyProof
{
  return self->_transparencyProof;
}

- (void)setTransparencyProof:(id)a3
{
}

- (NSPPrivacyProxyObliviousTargetInfo)obliviousTarget
{
  return self->_obliviousTarget;
}

- (void)setObliviousTarget:(id)a3
{
}

- (NSPProxyTokenInfo)proxyInfo
{
  return self->_proxyInfo;
}

- (void)setProxyInfo:(id)a3
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

- (BOOL)obliviousAgentRegistered
{
  return self->_obliviousAgentRegistered;
}

- (void)setObliviousAgentRegistered:(BOOL)a3
{
  self->_obliviousAgentRegistered = a3;
}

- (BOOL)allowFailOpen
{
  return self->_allowFailOpen;
}

- (void)setAllowFailOpen:(BOOL)a3
{
  self->_allowFailOpen = a3;
}

- (BOOL)deferAgentCommit
{
  return self->_deferAgentCommit;
}

- (void)setDeferAgentCommit:(BOOL)a3
{
  self->_deferAgentCommit = a3;
}

- (int)obliviousHTTPType
{
  return self->_obliviousHTTPType;
}

- (void)setObliviousHTTPType:(int)a3
{
  self->_obliviousHTTPType = a3;
}

- (NSPProxyAgentNetworkStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (unsigned)transparencyState
{
  return self->_transparencyState;
}

- (void)setTransparencyState:(unsigned __int8)a3
{
  self->_transparencyState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_fallbackRegistration, 0);
  objc_storeStrong((id *)&self->_quicRegistration, 0);
  objc_storeStrong((id *)&self->_fallbackAgentUUID, 0);
  objc_storeStrong((id *)&self->_quicAgentUUID, 0);
  objc_storeStrong((id *)&self->_proxyInfo, 0);
  objc_storeStrong((id *)&self->_obliviousTarget, 0);
  objc_storeStrong((id *)&self->_transparencyProof, 0);
  objc_storeStrong((id *)&self->_transparencyKeyBundle, 0);
  objc_storeStrong((id *)&self->_obliviousConfig, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end