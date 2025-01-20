@interface NSPProxyTokenInfo
+ (BOOL)supportsSecureCoding;
- (NSPProxyTokenInfo)init;
- (NSPProxyTokenInfo)initWithCoder:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reportErrorForTokenRegistration:(id)a3 error:(int)a4 withOptions:(id)a5;
- (void)tokenLowWaterMarkReached;
@end

@implementation NSPProxyTokenInfo

- (NSString)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    v4 = [(NSPPrivacyProxyProxyInfo *)self->_proxyInfo proxyURL];
    sub_1000482D4(v3, v4, @"Proxy URL", 0, 14);

    sub_100048B88(v3, self->_tokenCount, @"Proxy tokens count", 0, 14);
    sub_1000482D4(v3, self->_tokenAgentUUID, @"Proxy token Agent UUID", 0, 14);
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    if (self) {
      proxyInfo = self->_proxyInfo;
    }
    else {
      proxyInfo = 0;
    }
    v5 = proxyInfo;
    v6 = [(NSPPrivacyProxyProxyInfo *)v5 vendor];
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc: Proxy Token Info : \"%@\"", buf, 0xCu);
  }
  sub_10000EE48((uint64_t)self);
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mergeTokenStats:self];

    tokenRegistration = self->_tokenRegistration;
  }
  else
  {
    [0 mergeTokenStats:0];
    tokenRegistration = 0;
  }
  sub_100008C00((uint64_t)tokenRegistration);
  sub_10000F0C8((uint64_t)self);
  v9.receiver = self;
  v9.super_class = (Class)NSPProxyTokenInfo;
  [(NSPProxyTokenInfo *)&v9 dealloc];
}

- (NSPProxyTokenInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSPProxyTokenInfo;
  v2 = [(NSPProxyTokenInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSUUID UUID];
    tokenAgentUUID = v2->_tokenAgentUUID;
    v2->_tokenAgentUUID = (NSUUID *)v3;
  }
  return v2;
}

- (NSPProxyTokenInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NSPProxyTokenInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyInfo"];
    proxyInfo = v5->_proxyInfo;
    v5->_proxyInfo = (NSPPrivacyProxyProxyInfo *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyTokenAgentUUID"];
    tokenAgentUUID = v5->_tokenAgentUUID;
    v5->_tokenAgentUUID = (NSUUID *)v8;

    v5->_tokenFetchRetryAttempt = (unint64_t)[v4 decodeIntegerForKey:@"proxyTokenFetchRetryAttempt"];
    v5->_tokenFetchRetryOnKeyOrNetworkChange = [v4 decodeBoolForKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyTokenFetchRetryDate"];
    tokenFetchRetryDate = v5->_tokenFetchRetryDate;
    v5->_tokenFetchRetryDate = (NSDate *)v10;

    v5->_useDefaultInterface = [v4 decodeBoolForKey:@"proxyTokenUseDefaultInterface"];
    v5->_subscriber = [v4 decodeBoolForKey:@"proxyTokenSubscriber"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyTokenNetworkSignature"];
    networkSignature = v5->_networkSignature;
    v5->_networkSignature = (NSData *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (self)
  {
    [v5 encodeObject:self->_proxyInfo forKey:@"proxyInfo"];
    [v5 encodeObject:self->_tokenAgentUUID forKey:@"proxyTokenAgentUUID"];
    [v5 encodeInteger:self->_tokenFetchRetryAttempt forKey:@"proxyTokenFetchRetryAttempt"];
    [v5 encodeBool:self->_tokenFetchRetryOnKeyOrNetworkChange forKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    [v5 encodeObject:self->_tokenFetchRetryDate forKey:@"proxyTokenFetchRetryDate"];
    [v5 encodeBool:self->_useDefaultInterface forKey:@"proxyTokenUseDefaultInterface"];
    [v5 encodeBool:self->_subscriber forKey:@"proxyTokenSubscriber"];
    networkSignature = self->_networkSignature;
  }
  else
  {
    [v5 encodeObject:0 forKey:@"proxyInfo"];
    [v5 encodeObject:0 forKey:@"proxyTokenAgentUUID"];
    [v5 encodeInteger:0 forKey:@"proxyTokenFetchRetryAttempt"];
    [v5 encodeBool:0 forKey:@"proxyTokenFetchRetryOnNetworkOrKeyChange"];
    [v5 encodeObject:0 forKey:@"proxyTokenFetchRetryDate"];
    [v5 encodeBool:0 forKey:@"proxyTokenUseDefaultInterface"];
    [v5 encodeBool:0 forKey:@"proxyTokenSubscriber"];
    networkSignature = 0;
  }
  [v5 encodeObject:networkSignature forKey:@"proxyTokenNetworkSignature"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPProxyTokenInfo allocWithZone:a3] init];
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id WeakRetained = 0;
  if (v4) {
LABEL_3:
  }
    objc_storeWeak((id *)(v5 + 16), WeakRetained);
LABEL_4:

  if (self)
  {
    sub_10001088C(v5, self->_proxyInfo);
    unint64_t tokenCount = self->_tokenCount;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  sub_10001088C(v5, 0);
  unint64_t tokenCount = 0;
  if (v5) {
LABEL_6:
  }
    *(void *)(v5 + 32) = tokenCount;
LABEL_7:
  if (self)
  {
    sub_10001089C(v5, self->_tokenRegistration);
    tokenAgentUUID = self->_tokenAgentUUID;
  }
  else
  {
    sub_10001089C(v5, 0);
    tokenAgentUUID = 0;
  }
  objc_super v9 = tokenAgentUUID;
  if (v5) {
    objc_storeStrong((id *)(v5 + 48), tokenAgentUUID);
  }

  if (self)
  {
    sub_1000108AC(v5, self->_tokenPath);
    BOOL tokenRequestPending = self->_tokenRequestPending;
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  sub_1000108AC(v5, 0);
  BOOL tokenRequestPending = 0;
  if (v5) {
LABEL_13:
  }
    *(unsigned char *)(v5 + 8) = tokenRequestPending;
LABEL_14:
  if (self)
  {
    sub_10000EF6C(v5, self->_tokenFetchRetryTimer);
    unint64_t tokenFetchRetryAttempt = self->_tokenFetchRetryAttempt;
    if (!v5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  sub_10000EF6C(v5, 0);
  unint64_t tokenFetchRetryAttempt = 0;
  if (v5) {
LABEL_16:
  }
    *(void *)(v5 + 72) = tokenFetchRetryAttempt;
LABEL_17:
  if (self)
  {
    BOOL tokenFetchRetryOnKeyOrNetworkChange = self->_tokenFetchRetryOnKeyOrNetworkChange;
    if (!v5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  BOOL tokenFetchRetryOnKeyOrNetworkChange = 0;
  if (v5) {
LABEL_19:
  }
    *(unsigned char *)(v5 + 9) = tokenFetchRetryOnKeyOrNetworkChange;
LABEL_20:
  if (self)
  {
    sub_10000EF7C(v5, self->_tokenFetchRetryDate);
    BOOL useDefaultInterface = self->_useDefaultInterface;
    if (!v5) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  sub_10000EF7C(v5, 0);
  BOOL useDefaultInterface = 0;
  if (v5) {
LABEL_22:
  }
    *(unsigned char *)(v5 + 10) = useDefaultInterface;
LABEL_23:
  if (self)
  {
    BOOL subscriber = self->_subscriber;
    if (!v5) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  BOOL subscriber = 0;
  if (v5) {
LABEL_25:
  }
    *(unsigned char *)(v5 + 11) = subscriber;
LABEL_26:
  if (self)
  {
    unint64_t tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  unint64_t tokenFetchSuccessCount = 0;
  if (v5) {
LABEL_28:
  }
    *(void *)(v5 + 88) = tokenFetchSuccessCount;
LABEL_29:
  if (self)
  {
    unint64_t tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  unint64_t tokenConsumedCount = 0;
  if (v5) {
LABEL_31:
  }
    *(void *)(v5 + 96) = tokenConsumedCount;
LABEL_32:
  if (self)
  {
    unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  unint64_t tokenExpiredCount = 0;
  if (v5) {
LABEL_34:
  }
    *(void *)(v5 + 104) = tokenExpiredCount;
LABEL_35:
  if (self)
  {
    unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  unint64_t tokenFetchFailedCount = 0;
  if (v5) {
LABEL_37:
  }
    *(void *)(v5 + 112) = tokenFetchFailedCount;
LABEL_38:
  if (self)
  {
    unint64_t agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  unint64_t agentLowWaterMarkHitCount = 0;
  if (v5) {
LABEL_40:
  }
    *(void *)(v5 + 120) = agentLowWaterMarkHitCount;
LABEL_41:
  if (self)
  {
    unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
  unint64_t cacheLowWaterMarkHitCount = 0;
  if (v5) {
LABEL_43:
  }
    *(void *)(v5 + 128) = cacheLowWaterMarkHitCount;
LABEL_44:
  if (self)
  {
    unint64_t badTokenCount = self->_badTokenCount;
    if (!v5) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  unint64_t badTokenCount = 0;
  if (v5) {
LABEL_46:
  }
    *(void *)(v5 + 136) = badTokenCount;
LABEL_47:
  if (self)
  {
    unint64_t missingTokenCount = self->_missingTokenCount;
    if (!v5) {
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  unint64_t missingTokenCount = 0;
  if (v5) {
LABEL_49:
  }
    *(void *)(v5 + 144) = missingTokenCount;
LABEL_50:
  if (self) {
    self = (NSPProxyTokenInfo *)self->_networkSignature;
  }
  v23 = self;
  if (v5) {
    objc_storeStrong((id *)(v5 + 152), self);
  }

  id v24 = (id)v5;
  return v24;
}

- (void)tokenLowWaterMarkReached
{
  if (self) {
    ++self->_agentLowWaterMarkHitCount;
  }
  uint64_t v3 = +[NSDate date];
  if (self) {
    proxyInfo = self->_proxyInfo;
  }
  else {
    proxyInfo = 0;
  }
  uint64_t v5 = proxyInfo;
  uint64_t v6 = [(NSPPrivacyProxyProxyInfo *)v5 vendor];
  uint64_t v7 = sub_100010F2C((uint64_t)self);

  +[NSPCoreData saveTokenEvent:v3 eventType:0 vendor:v6 tokenCount:v7];
  sub_10000FDFC((uint64_t)self);

  sub_100011F6C((uint64_t)self);
}

- (void)reportErrorForTokenRegistration:(id)a3 error:(int)a4 withOptions:(id)a5
{
  uint64_t v8 = (id *)a3;
  long long buffer = 0u;
  memset(v30, 0, sizeof(v30));
  objc_super v9 = [a5 objectForKeyedSubscript:NWNetworkAgentStartOptionClientUUID];
  if (!v9)
  {
    v16 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = +[NWPath pathForClientID:v9];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 interface];
    v13 = [v11 parameters];
    int v14 = [v13 pid];
    if (v14)
    {
      int v15 = v14;
      if (proc_pidinfo(v14, 13, 1uLL, &buffer, 64) == 64)
      {
        v16 = (const char *)v30;
LABEL_12:

        goto LABEL_13;
      }
      v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v23 = 67109120;
        int v24 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to convert from PID (%d) to process name", (uint8_t *)&v23, 8u);
      }
    }
    v16 = 0;
    goto LABEL_12;
  }
  v16 = 0;
LABEL_13:

LABEL_14:
  v18 = nplog_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    if (!v16) {
      v16 = "none";
    }
    if (self) {
      proxyInfo = self->_proxyInfo;
    }
    else {
      proxyInfo = 0;
    }
    v20 = proxyInfo;
    v21 = [(NSPPrivacyProxyProxyInfo *)v20 vendor];
    int v23 = 67109634;
    int v24 = a4;
    __int16 v25 = 2080;
    v26 = v16;
    __int16 v27 = 2112;
    v28 = v21;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Received error (%d) from %s for \"%@\" agent", (uint8_t *)&v23, 0x1Cu);
  }
  if (a4 == 81)
  {
    if (self) {
      ++self->_missingTokenCount;
    }
    sub_10000FDFC((uint64_t)self);
    sub_100011F6C((uint64_t)self);
    sub_1000111A4((uint64_t)self);
  }
  else if (a4 == 80)
  {
    if (self)
    {
      ++self->_badTokenCount;
      if (v8) {
        [v8[3] flushTokens];
      }
      sub_100010FD8((uint64_t)self);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      if (v8) {
        [v8[3] flushTokens];
      }
      id WeakRetained = 0;
    }
    [WeakRetained tokenInfoInvalid:self];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSignature, 0);
  objc_storeStrong((id *)&self->_tokenFetchRetryDate, 0);
  objc_storeStrong((id *)&self->_tokenFetchRetryTimer, 0);
  objc_storeStrong((id *)&self->_tokenPath, 0);
  objc_storeStrong((id *)&self->_tokenAgentUUID, 0);
  objc_storeStrong((id *)&self->_tokenRegistration, 0);
  objc_storeStrong((id *)&self->_proxyInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end