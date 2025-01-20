@interface NSPPrivacyProxyAgentManager
+ (BOOL)proxiesMatch:(id)a3 proxyPathList:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 pathWeight:(unint64_t)a7 supportsFallback:(BOOL)a8;
+ (BOOL)supportsSecureCoding;
+ (id)multiHopFallbackProxyAgentUUID;
+ (id)multiHopProxyAgentUUID;
+ (id)singleHopFallbackProxyAgentUUID;
+ (id)singleHopProxyAgentUUID;
+ (void)removeProxyInfoFromKeychain;
- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4;
- (BOOL)deferCommit;
- (BOOL)disableDoHBootstrapResults;
- (BOOL)dnsFilteringHintEnabled;
- (BOOL)forceFallback;
- (BOOL)isMultiHopFallbackProxyAgentRegistered;
- (BOOL)isMultiHopProxyAgentRegistered;
- (BOOL)isSingleHopFallbackProxyAgentRegistered;
- (BOOL)isSingleHopProxyAgentRegistered;
- (BOOL)networkDiscoveredProxyPresentInAgentManager;
- (BOOL)proxiedContentMapIsOverrideEnabled:(id)a3;
- (BOOL)proxyInfo:(id)a3 matchesProxyIndex:(unint64_t)a4;
- (NSData)overrideIngressProxyKey;
- (NSDate)tokenIssuanceRestrictedUntilDate;
- (NSPPrivacyProxyAgentManager)initWithCoder:(id)a3;
- (NSPPrivacyProxyAgentManager)initWithDelegate:(id)a3 toggleStats:(id)a4;
- (NSString)description;
- (NSString)geohashOverride;
- (NSString)overrideFallbackIngressProxy;
- (NSString)overrideIngressProxy;
- (NSString)overridePreferredObliviousProxy;
- (NSString)overridePreferredProxy;
- (id)alternatePreferredPathAgentUUIDs:(id)a3;
- (id)copyDomainFiltersDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ingressFallbackProxyURL;
- (id)ingressProxyURL;
- (id)lastProxyOutageReason;
- (id)lastTokenOutageReason;
- (id)multiHopFallbackProxyConfigHash:(id)a3;
- (id)multiHopQUICProxyConfigHash:(id)a3;
- (id)singleHopFallbackProxyConfigHash:(id)a3;
- (id)singleHopQUICProxyConfigHash:(id)a3;
- (id)tierString;
- (void)copyProxyInfo:(id)a3;
- (void)dealloc;
- (void)didReceiveUpdatedPvDOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)forceFallback:(BOOL)a3;
- (void)handleConfigChange;
- (void)handleLinkQualityChange:(int)a3;
- (void)handlePathChange:(id)a3;
- (void)handleTierChange:(BOOL)a3;
- (void)handleUnlimitedChange:(BOOL)a3;
- (void)mergeTokenStats:(id)a3;
- (void)multiHopAgentRegistered:(id)a3;
- (void)multiHopAgentUnregistered:(id)a3;
- (void)obliviousHopAgentRegistered:(id)a3 hostname:(id)a4 processes:(id)a5 agentUUID:(id)a6;
- (void)obliviousHopAgentUnregistered:(id)a3 hostname:(id)a4 agentUUID:(id)a5;
- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5;
- (void)overridePreferredObliviousProxy:(id)a3;
- (void)overridePreferredProxy:(id)a3;
- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4;
- (void)probeFailed:(id)a3;
- (void)probeRedirected:(id)a3;
- (void)probeServerError:(id)a3 httpStatusCode:(int64_t)a4;
- (void)probeSuccess:(id)a3;
- (void)proxiedContentAgentRegistered:(id)a3;
- (void)proxiedContentAgentUnregistered:(id)a3;
- (void)removeExpiredTokens;
- (void)reportActivityForApp:(id)a3 path:(id)a4;
- (void)reportEpoch:(unsigned __int16)a3;
- (void)reportObliviousPathError:(int)a3 interface:(id)a4 obliviousPath:(id)a5;
- (void)reportProxiedContentPathError:(int)a3 interface:(id)a4 proxiedContentPath:(id)a5 registration:(id)a6;
- (void)reportProxyError:(int)a3 interface:(id)a4 proxyPath:(id)a5;
- (void)reportProxySuccessOnInterface:(id)a3 proxyPath:(id)a4;
- (void)reportTokenFetchFailure:(id)a3 statusCode:(int64_t)a4;
- (void)requestAccessTokenWithCompletionHandler:(id)a3;
- (void)resetProxyErrors;
- (void)sendRTCReportForPrivacyProxyToggleState:(BOOL)a3;
- (void)sendRTCReportForServiceOutage:(id)a3;
- (void)sendRTCReportWithFailureType:(int64_t)a3 errorCode:(int)a4 url:(id)a5 ingressProxy:(id)a6 egressProxy:(id)a7 tokenServer:(id)a8;
- (void)setDnsFilteringHintEnabled:(BOOL)a3;
- (void)setGeohashOverride:(id)a3;
- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3;
- (void)setUserEventAgentProberParameters;
- (void)setUserEventAgentTokenFetchParameters;
- (void)setupMasqueProxyWith:(id)a3;
- (void)setupWithPath:(id)a3 subscriber:(BOOL)a4 unlimited:(BOOL)a5 geohashSharingEnabled:(BOOL)a6 geohashOverride:(id)a7 configEpoch:(id)a8 linkQuality:(int)a9;
- (void)singleHopAgentRegistered:(id)a3;
- (void)singleHopAgentUnregistered:(id)a3;
- (void)switchProxy:(id)a3;
- (void)tearDownNetworkDiscoveredProxy;
- (void)tokenAdded;
- (void)tokenFetched;
- (void)tokenInfoInvalid:(id)a3;
- (void)tokenLowWaterMarkReached:(id)a3;
- (void)tokenRateLimited:(id)a3 untilDate:(double)a4;
- (void)tokensEmpty;
- (void)updateConfigEpoch:(id)a3;
- (void)updateDNSFilteringHint:(BOOL)a3;
- (void)updateGeohashSharingPreference:(BOOL)a3 geohashOverride:(id)a4;
- (void)updateProxyInfo:(id)a3 resolverInfo:(id)a4 proxyPathList:(id)a5 fallbackProxyPathList:(id)a6 obliviousConfigs:(id)a7 proxiedContentMaps:(id)a8;
- (void)updateUserEventAgentData;
- (void)useDefaultNetworkInterface:(BOOL)a3;
@end

@implementation NSPPrivacyProxyAgentManager

+ (id)multiHopProxyAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_1000CEBE4];

  return v2;
}

+ (id)singleHopProxyAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_1000CEBF4];

  return v2;
}

+ (id)multiHopFallbackProxyAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_1000CEC04];

  return v2;
}

+ (id)singleHopFallbackProxyAgentUUID
{
  id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&unk_1000CEC14];

  return v2;
}

+ (BOOL)proxiesMatch:(id)a3 proxyPathList:(id)a4 ingressProxy:(id)a5 egressProxy:(id)a6 pathWeight:(unint64_t)a7 supportsFallback:(BOOL)a8
{
  BOOL v28 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v29 = a6;
  if (!v13)
  {
    obj = nplog_obj();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v26 = "%s called with null proxyInfoArray";
LABEL_34:
    _os_log_fault_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_26;
  }
  if (!v15)
  {
    obj = nplog_obj();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v26 = "%s called with null matchIngressProxy";
    goto LABEL_34;
  }
  if (!v29)
  {
    obj = nplog_obj();
    if (!os_log_type_enabled(obj, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136315138;
    v37 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
    v26 = "%s called with null matchEgressProxy";
    goto LABEL_34;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = v14;
  id v16 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    id v27 = v14;
    uint64_t v18 = *(void *)v32;
LABEL_6:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v32 != v18) {
        objc_enumerationMutation(obj);
      }
      v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
      if (!a7 || [*(id *)(*((void *)&v31 + 1) + 8 * v19) weight] == a7)
      {
        if (objc_msgSend(v20, "proxiesCount", v27) != (id)2)
        {
          v24 = nplog_obj();
          id v14 = v27;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315138;
            v37 = "+[NSPPrivacyProxyAgentManager proxiesMatch:proxyPathList:ingressProxy:egressProxy:pathWeight:supportsFallback:]";
            _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "%s called with null (proxyPath.proxiesCount == MAX_PROXIES_ON_PATH)", buf, 0xCu);
          }

          break;
        }
        v21 = [v13 objectAtIndex:[v20 proxies]];
        v22 = [v13 objectAtIndex:*((unsigned int *)[v20 proxies] + 1)];
        if (sub_1000249F0((uint64_t)NSPPrivacyProxyAgentManager, v21, v15)
          && sub_1000249F0((uint64_t)a1, v22, v29)
          && (!v28
           || [v21 supportsFallback] && objc_msgSend(v22, "supportsFallback")))
        {

          BOOL v23 = 1;
LABEL_22:
          id v14 = v27;
          goto LABEL_27;
        }
      }
      if (v17 == (id)++v19)
      {
        id v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v17) {
          goto LABEL_6;
        }
        BOOL v23 = 0;
        goto LABEL_22;
      }
    }
  }
LABEL_26:
  BOOL v23 = 0;
LABEL_27:

  return v23;
}

- (NSString)description
{
  if (self)
  {
    id v3 = [objc_alloc((Class)NSMutableString) initWithCapacity:0];
    sub_1000482D4(v3, self->_quicProxyPath, @"Quic proxy path", 0, 14);
    sub_1000482D4(v3, self->_fallbackProxyPath, @"Fallback proxy path", 0, 14);
    sub_1000482D4(v3, self->_preferredQUICProxyPaths, @"Preferred proxy paths", 0, 14);
    sub_1000482D4(v3, self->_candidateQuicProxyPath, @"Candidate quic proxy path", 0, 14);
    sub_1000482D4(v3, self->_candidateFallbackProxyPath, @"Candidate fallback proxy path", 0, 14);
    sub_1000482D4(v3, self->_candidatePreferredQUICProxyPaths, @"Candidate preferred proxy paths", 0, 14);
    sub_1000482D4(v3, self->_proxiedContentPaths, @"Proxied content paths", 0, 14);
    sub_1000482D4(v3, self->_networkSpecificQUICProxyPaths, @"Network specific proxied paths", 0, 14);
    sub_1000482D4(v3, self->_networkDiscoveredProxyInfos, @"Network discovered proxy ingree", 0, 14);
    sub_1000482D4(v3, self->_obliviousPaths, @"Oblivious paths", 0, 14);
    sub_1000482D4(v3, self->_proxyPathCustomEnumerator, @"Proxy path enumerator", 0, 14);
    sub_1000482D4(v3, self->_fallbackProxyPathCustomEnumerator, @"Fallback proxy path enumerator", 0, 14);
    sub_1000482D4(v3, self->_obliviousConfigs, @"Oblivious configs", 0, 14);
    sub_1000482D4(v3, self->_penalizedObliviousProxyIndices, @"Penalized oblivious proxy indicies", 0, 14);
    sub_1000482D4(v3, self->_proxiedContentMaps, @"Proxied content maps", 0, 14);
    v4 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
    v5 = +[NSDateFormatter localizedStringFromDate:v4 dateStyle:1 timeStyle:2];
    sub_1000482D4(v3, v5, @"Token issuance restricted", 0, 14);

    v6 = [(NSPPrivacyProxyAgentManager *)self overridePreferredProxy];
    sub_1000482D4(v3, v6, @"Override preferred proxy", 0, 14);

    v7 = [(NSPPrivacyProxyAgentManager *)self overridePreferredObliviousProxy];
    sub_1000482D4(v3, v7, @"Override preferred oblivious proxy", 0, 14);

    v8 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxy];
    sub_1000482D4(v3, v8, @"Override ingress proxy", 0, 14);

    v9 = [(NSPPrivacyProxyAgentManager *)self overrideFallbackIngressProxy];
    sub_1000482D4(v3, v9, @"Override fallback ingress proxy", 0, 14);

    v10 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxyKey];
    sub_1000482D4(v3, v10, @"Override ingress proxy key", 0, 14);

    sub_1000482D4(v3, self->_overrideEnabledMaps, @"Override enabled maps", 0, 14);
    sub_100048B1C(v3, self->_disableProxiedContentDoHBootstrap, @"Disable proxied content maps DoH bootstrap", 0, 14);
    sub_100048B1C(v3, [(NSPPrivacyProxyAgentManager *)self forceFallback], @"Force fallback", 0, 14);
    sub_100048B88(v3, self->_networkProxiesRotated, @"Network proxies rotated", 0, 14);
    sub_100048B88(v3, self->_networkFallbackProxiesRotated, @"Network fallback proxies rotated", 0, 14);
    sub_100048B88(v3, self->_proxiesRotated, @"Proxies rotated", 0, 14);
    sub_1000482D4(v3, self->_proxyPathProber, @"Proxy path prober", 0, 14);
    sub_1000482D4(v3, self->_directPathProber, @"Direct path prober", 0, 14);
    sub_1000482D4(v3, self->_pvdConfigurationFetcher, @"Fetch PvD Options Configuration", 0, 14);
    sub_100048B88(v3, self->_probingReason, @"Probing reason", 0, 14);
    sub_100048B1C(v3, self->_reportedTokenOutage, @"Reported token outage", 0, 14);
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

- (NSPPrivacyProxyAgentManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v111.receiver = self;
  v111.super_class = (Class)NSPPrivacyProxyAgentManager;
  v5 = [(NSPPrivacyProxyAgentManager *)&v111 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyAgentProxyArray"];
    proxyArray = v5->_proxyArray;
    v5->_proxyArray = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyAgentResolverArray"];
    resolverArray = v5->_resolverArray;
    v5->_resolverArray = (NSArray *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyAgentProxyPathList"];
    proxyPathList = v5->_proxyPathList;
    v5->_proxyPathList = (NSArray *)v10;

    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyAgentFallbackProxyPathList"];
    fallbackProxyPathList = v5->_fallbackProxyPathList;
    v5->_fallbackProxyPathList = (NSArray *)v12;

    uint64_t v14 = objc_opt_class();
    id v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"proxyAgentObliviousConfigs"];
    obliviousConfigs = v5->_obliviousConfigs;
    v5->_obliviousConfigs = (NSArray *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"proxyAgentProxiedContentMaps"];
    proxiedContentMaps = v5->_proxiedContentMaps;
    v5->_proxiedContentMaps = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentOverridePreferredProxy"];
    overridePreferredProxy = v5->_overridePreferredProxy;
    v5->_overridePreferredProxy = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentOverridePreferredObliviousProxy"];
    overridePreferredObliviousProxy = v5->_overridePreferredObliviousProxy;
    v5->_overridePreferredObliviousProxy = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentOverrideIngressProxy"];
    overrideIngressProxy = v5->_overrideIngressProxy;
    v5->_overrideIngressProxy = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentOverrideFallbackIngressProxy"];
    overrideFallbackIngressProxy = v5->_overrideFallbackIngressProxy;
    v5->_overrideFallbackIngressProxy = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentOverrideIngressProxyKey"];
    overrideIngressProxyKey = v5->_overrideIngressProxyKey;
    v5->_overrideIngressProxyKey = (NSData *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    long long v34 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v35 = [v4 decodeObjectOfClasses:v34 forKey:@"proxyAgentOverrideEnabledMaps"];
    v36 = (NSMutableArray *)[v35 mutableCopy];
    overrideEnabledMaps = v5->_overrideEnabledMaps;
    v5->_overrideEnabledMaps = v36;

    v5->_disableProxiedContentDoHBootstrap = [v4 decodeBoolForKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    v5->_forceFallback = [v4 decodeBoolForKey:@"proxyAgentForceFallbackKey"];
    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentQuicProxyPath"];
    quicProxyPath = v5->_quicProxyPath;
    v5->_quicProxyPath = (NSPQuicProxyPath *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentFallbackProxyPath"];
    fallbackProxyPath = v5->_fallbackProxyPath;
    v5->_fallbackProxyPath = (NSPFallbackProxyPath *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v43 = objc_opt_class();
    v44 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v42, v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"proxyAgentPreferredQuicProxyPaths"];
    preferredQUICProxyPaths = v5->_preferredQUICProxyPaths;
    v5->_preferredQUICProxyPaths = (NSMutableDictionary *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentCandidateQuicProxyPath"];
    candidateQuicProxyPath = v5->_candidateQuicProxyPath;
    v5->_candidateQuicProxyPath = (NSPCandidateQuicProxyPath *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentCandidateFallbackProxyPath"];
    candidateFallbackProxyPath = v5->_candidateFallbackProxyPath;
    v5->_candidateFallbackProxyPath = (NSPCandidateFallbackProxyPath *)v49;

    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    v53 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v51, v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"];
    candidatePreferredQUICProxyPaths = v5->_candidatePreferredQUICProxyPaths;
    v5->_candidatePreferredQUICProxyPaths = (NSMutableDictionary *)v54;

    uint64_t v56 = objc_opt_class();
    v57 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v56, objc_opt_class(), 0);
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"proxyAgentProxiedContentPaths"];
    proxiedContentPaths = v5->_proxiedContentPaths;
    v5->_proxiedContentPaths = (NSMutableArray *)v58;

    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    v62 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v60, v61, objc_opt_class(), 0);
    uint64_t v63 = [v4 decodeObjectOfClasses:v62 forKey:@"proxyAgentNetworkQuicProxyPaths"];
    networkSpecificQUICProxyPaths = v5->_networkSpecificQUICProxyPaths;
    v5->_networkSpecificQUICProxyPaths = (NSMutableDictionary *)v63;

    uint64_t v65 = objc_opt_class();
    uint64_t v66 = objc_opt_class();
    v67 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v65, v66, objc_opt_class(), 0);
    uint64_t v68 = [v4 decodeObjectOfClasses:v67 forKey:@"proxyAgentNetworkDiscoveredProxyInfos"];
    networkDiscoveredProxyInfos = v5->_networkDiscoveredProxyInfos;
    v5->_networkDiscoveredProxyInfos = (NSMutableDictionary *)v68;

    uint64_t v70 = objc_opt_class();
    v71 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v70, objc_opt_class(), 0);
    uint64_t v72 = [v4 decodeObjectOfClasses:v71 forKey:@"proxyAgentObliviousPaths"];
    obliviousPaths = v5->_obliviousPaths;
    v5->_obliviousPaths = (NSMutableArray *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    lastQuicProxySwitchedDate = v5->_lastQuicProxySwitchedDate;
    v5->_lastQuicProxySwitchedDate = (NSDate *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    lastFallbackProxySwitchedDate = v5->_lastFallbackProxySwitchedDate;
    v5->_lastFallbackProxySwitchedDate = (NSDate *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentProbeStartTime"];
    probeStartTime = v5->_probeStartTime;
    v5->_probeStartTime = (NSDate *)v78;

    uint64_t v80 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentProbeEndTime"];
    probeEndTime = v5->_probeEndTime;
    v5->_probeEndTime = (NSDate *)v80;

    v82 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"proxyAgentProxyTokenInfoArray"];
    if (v82)
    {
      uint64_t v83 = +[NSMutableArray arrayWithArray:v82];
      proxyTokenInfoArray = v5->_proxyTokenInfoArray;
      v5->_proxyTokenInfoArray = (NSMutableArray *)v83;
    }
    uint64_t v85 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentTokenIssuanceRestrictedUntilDate"];
    tokenIssuanceRestrictedUntilDate = v5->_tokenIssuanceRestrictedUntilDate;
    v5->_tokenIssuanceRestrictedUntilDate = (NSDate *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    lastPathUnsatisfiedDate = v5->_lastPathUnsatisfiedDate;
    v5->_lastPathUnsatisfiedDate = (NSDate *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    lastPrimaryInterfaceChangedDate = v5->_lastPrimaryInterfaceChangedDate;
    v5->_lastPrimaryInterfaceChangedDate = (NSDate *)v89;

    uint64_t v91 = objc_opt_class();
    uint64_t v92 = objc_opt_class();
    uint64_t v93 = objc_opt_class();
    v94 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v91, v92, v93, objc_opt_class(), 0);
    uint64_t v95 = [v4 decodeObjectOfClasses:v94 forKey:@"proxyAgentNetworkCharacteristics"];
    networkCharacteristics = v5->_networkCharacteristics;
    v5->_networkCharacteristics = (NSDictionary *)v95;

    v5->_useDefaultInterface = [v4 decodeBoolForKey:@"proxyAgentUseDefaultInterface"];
    v5->_subscriber = [v4 decodeBoolForKey:@"proxyAgentSubscriber"];
    v5->_unlimited = [v4 decodeBoolForKey:@"proxyAgentUnlimited"];
    v5->_geohashSharingEnabled = [v4 decodeBoolForKey:@"proxyAgentGeohashSharingEnabled"];
    v97 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentGeohashOverride"];
    [(NSPPrivacyProxyAgentManager *)v5 setGeohashOverride:v97];

    -[NSPPrivacyProxyAgentManager setDnsFilteringHintEnabled:](v5, "setDnsFilteringHintEnabled:", [v4 decodeBoolForKey:@"proxyAgentDNSFilteringHintEnabled"]);
    v5->_networkProxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentNetworkProxiesRotated"];
    v5->_networkFallbackProxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    v5->_proxiesRotated = (unint64_t)[v4 decodeIntegerForKey:@"proxyAgentProxiesRotated"];
    uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentProxyPathProber"];
    proxyPathProber = v5->_proxyPathProber;
    v5->_proxyPathProber = (NSPProber *)v98;

    uint64_t v100 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentDirectPathProber"];
    directPathProber = v5->_directPathProber;
    v5->_directPathProber = (NSPProber *)v100;

    uint64_t v102 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastProxyOutageReasonStats"];
    lastProxyOutageReasonStats = v5->_lastProxyOutageReasonStats;
    v5->_lastProxyOutageReasonStats = (NSPOutageReasonStats *)v102;

    uint64_t v104 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentLastTokenOutageReasonStats"];
    lastTokenOutageReasonStats = v5->_lastTokenOutageReasonStats;
    v5->_lastTokenOutageReasonStats = (NSPOutageReasonStats *)v104;

    v5->_probingReason = (int64_t)[v4 decodeIntegerForKey:@"proxyAgentProbingReason"];
    v5->_reportedTokenOutage = [v4 decodeBoolForKey:@"proxyAgentReportedTokenOutage"];
    uint64_t v106 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentConfigEpoch"];
    configEpoch = v5->_configEpoch;
    v5->_configEpoch = (NSNumber *)v106;

    uint64_t v108 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proxyAgentReportedEpoch"];
    reportedEpoch = v5->_reportedEpoch;
    v5->_reportedEpoch = (NSNumber *)v108;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  if (self)
  {
    [v15 encodeObject:self->_proxyArray forKey:@"proxyAgentProxyArray"];
    [v15 encodeObject:self->_resolverArray forKey:@"proxyAgentResolverArray"];
    [v15 encodeObject:self->_proxyPathList forKey:@"proxyAgentProxyPathList"];
    [v15 encodeObject:self->_fallbackProxyPathList forKey:@"proxyAgentFallbackProxyPathList"];
    [v15 encodeObject:self->_obliviousConfigs forKey:@"proxyAgentObliviousConfigs"];
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentProxyArray"];
    [v15 encodeObject:0 forKey:@"proxyAgentResolverArray"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxyPathList"];
    [v15 encodeObject:0 forKey:@"proxyAgentFallbackProxyPathList"];
    [v15 encodeObject:0 forKey:@"proxyAgentObliviousConfigs"];
    proxiedContentMaps = 0;
  }
  [v15 encodeObject:proxiedContentMaps forKey:@"proxyAgentProxiedContentMaps"];
  v5 = [(NSPPrivacyProxyAgentManager *)self overridePreferredProxy];
  [v15 encodeObject:v5 forKey:@"proxyAgentOverridePreferredProxy"];

  uint64_t v6 = [(NSPPrivacyProxyAgentManager *)self overridePreferredObliviousProxy];
  [v15 encodeObject:v6 forKey:@"proxyAgentOverridePreferredObliviousProxy"];

  v7 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxy];
  [v15 encodeObject:v7 forKey:@"proxyAgentOverrideIngressProxy"];

  uint64_t v8 = [(NSPPrivacyProxyAgentManager *)self overrideFallbackIngressProxy];
  [v15 encodeObject:v8 forKey:@"proxyAgentOverrideFallbackIngressProxy"];

  v9 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxyKey];
  [v15 encodeObject:v9 forKey:@"proxyAgentOverrideIngressProxyKey"];

  if (self)
  {
    [v15 encodeObject:self->_overrideEnabledMaps forKey:@"proxyAgentOverrideEnabledMaps"];
    [v15 encodeBool:self->_disableProxiedContentDoHBootstrap forKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    [v15 encodeObject:self->_quicProxyPath forKey:@"proxyAgentQuicProxyPath"];
    [v15 encodeObject:self->_fallbackProxyPath forKey:@"proxyAgentFallbackProxyPath"];
    [v15 encodeObject:self->_preferredQUICProxyPaths forKey:@"proxyAgentPreferredQuicProxyPaths"];
    [v15 encodeObject:self->_candidateQuicProxyPath forKey:@"proxyAgentCandidateQuicProxyPath"];
    [v15 encodeObject:self->_candidateFallbackProxyPath forKey:@"proxyAgentCandidateFallbackProxyPath"];
    [v15 encodeObject:self->_candidatePreferredQUICProxyPaths forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"];
    [v15 encodeObject:self->_proxiedContentPaths forKey:@"proxyAgentProxiedContentPaths"];
    [v15 encodeObject:self->_networkSpecificQUICProxyPaths forKey:@"proxyAgentNetworkQuicProxyPaths"];
    [v15 encodeObject:self->_networkDiscoveredProxyInfos forKey:@"proxyAgentNetworkDiscoveredProxyInfos"];
    [v15 encodeObject:self->_obliviousPaths forKey:@"proxyAgentObliviousPaths"];
    [v15 encodeObject:self->_lastQuicProxySwitchedDate forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    [v15 encodeObject:self->_lastFallbackProxySwitchedDate forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    [v15 encodeObject:self->_probeStartTime forKey:@"proxyAgentProbeStartTime"];
    [v15 encodeObject:self->_probeEndTime forKey:@"proxyAgentProbeEndTime"];
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentOverrideEnabledMaps"];
    [v15 encodeBool:0 forKey:@"proxyAgentDisableProxiedContentDoHBootstrap"];
    [v15 encodeObject:0 forKey:@"proxyAgentQuicProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentFallbackProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentPreferredQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidateQuicProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidateFallbackProxyPath"];
    [v15 encodeObject:0 forKey:@"proxyAgentCandidatePreferredQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxiedContentPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkQuicProxyPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkDiscoveredProxyInfos"];
    [v15 encodeObject:0 forKey:@"proxyAgentObliviousPaths"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastQuicProxySwitchedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastFallbackProxySwitchedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentProbeStartTime"];
    [v15 encodeObject:0 forKey:@"proxyAgentProbeEndTime"];
    proxyTokenInfoArray = 0;
  }
  [v15 encodeObject:proxyTokenInfoArray forKey:@"proxyAgentProxyTokenInfoArray"];
  v11 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
  [v15 encodeObject:v11 forKey:@"proxyAgentTokenIssuanceRestrictedUntilDate"];

  if (self)
  {
    [v15 encodeObject:self->_lastPathUnsatisfiedDate forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    [v15 encodeObject:self->_lastPrimaryInterfaceChangedDate forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    [v15 encodeObject:self->_networkCharacteristics forKey:@"proxyAgentNetworkCharacteristics"];
    [v15 encodeBool:self->_useDefaultInterface forKey:@"proxyAgentUseDefaultInterface"];
    [v15 encodeBool:self->_subscriber forKey:@"proxyAgentSubscriber"];
    [v15 encodeBool:self->_unlimited forKey:@"proxyAgentUnlimited"];
    BOOL geohashSharingEnabled = self->_geohashSharingEnabled;
  }
  else
  {
    [v15 encodeObject:0 forKey:@"proxyAgentLastPathUnsatisfiedDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastPrimaryInterfaceChangeDate"];
    [v15 encodeObject:0 forKey:@"proxyAgentNetworkCharacteristics"];
    [v15 encodeBool:0 forKey:@"proxyAgentUseDefaultInterface"];
    [v15 encodeBool:0 forKey:@"proxyAgentSubscriber"];
    [v15 encodeBool:0 forKey:@"proxyAgentUnlimited"];
    BOOL geohashSharingEnabled = 0;
  }
  [v15 encodeBool:geohashSharingEnabled forKey:@"proxyAgentGeohashSharingEnabled"];
  id v13 = [(NSPPrivacyProxyAgentManager *)self geohashOverride];
  [v15 encodeObject:v13 forKey:@"proxyAgentGeohashOverride"];

  [v15 encodeBool:-[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled") forKey:@"proxyAgentDNSFilteringHintEnabled"];
  if (self)
  {
    [v15 encodeInteger:self->_networkProxiesRotated forKey:@"proxyAgentNetworkProxiesRotated"];
    [v15 encodeInteger:self->_networkFallbackProxiesRotated forKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    [v15 encodeInteger:self->_proxiesRotated forKey:@"proxyAgentProxiesRotated"];
    [v15 encodeObject:self->_proxyPathProber forKey:@"proxyAgentProxyPathProber"];
    [v15 encodeObject:self->_directPathProber forKey:@"proxyAgentDirectPathProber"];
    [v15 encodeObject:self->_lastProxyOutageReasonStats forKey:@"proxyAgentLastProxyOutageReasonStats"];
    [v15 encodeObject:self->_lastTokenOutageReasonStats forKey:@"proxyAgentLastTokenOutageReasonStats"];
    [v15 encodeInteger:self->_probingReason forKey:@"proxyAgentProbingReason"];
    [v15 encodeBool:self->_reportedTokenOutage forKey:@"proxyAgentReportedTokenOutage"];
    [v15 encodeObject:self->_configEpoch forKey:@"proxyAgentConfigEpoch"];
    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    [v15 encodeInteger:0 forKey:@"proxyAgentNetworkProxiesRotated"];
    [v15 encodeInteger:0 forKey:@"proxyAgentNetworkFallbackProxiesRotated"];
    [v15 encodeInteger:0 forKey:@"proxyAgentProxiesRotated"];
    [v15 encodeObject:0 forKey:@"proxyAgentProxyPathProber"];
    [v15 encodeObject:0 forKey:@"proxyAgentDirectPathProber"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastProxyOutageReasonStats"];
    [v15 encodeObject:0 forKey:@"proxyAgentLastTokenOutageReasonStats"];
    [v15 encodeInteger:0 forKey:@"proxyAgentProbingReason"];
    [v15 encodeBool:0 forKey:@"proxyAgentReportedTokenOutage"];
    [v15 encodeObject:0 forKey:@"proxyAgentConfigEpoch"];
    reportedEpoch = 0;
  }
  [v15 encodeObject:reportedEpoch forKey:@"proxyAgentReportedEpoch"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NSPPrivacyProxyAgentManager allocWithZone:a3] init];
  uint64_t v5 = (uint64_t)v4;
  if (self)
  {
    uint64_t v6 = self->_proxyArray;
    sub_1000273A4(v5, v6);

    resolverArray = self->_resolverArray;
  }
  else
  {
    sub_1000273A4((uint64_t)v4, 0);
    resolverArray = 0;
  }
  uint64_t v8 = resolverArray;
  sub_1000273B4(v5, v8);

  if (self)
  {
    v9 = self->_proxyPathList;
    sub_1000273C4(v5, v9);

    proxyPathCustomEnumerator = self->_proxyPathCustomEnumerator;
  }
  else
  {
    sub_1000273C4(v5, 0);
    proxyPathCustomEnumerator = 0;
  }
  v11 = proxyPathCustomEnumerator;
  sub_1000273D4(v5, v11);

  if (self)
  {
    uint64_t v12 = self->_fallbackProxyPathList;
    sub_1000273E4(v5, v12);

    fallbackProxyPathCustomEnumerator = self->_fallbackProxyPathCustomEnumerator;
  }
  else
  {
    sub_1000273E4(v5, 0);
    fallbackProxyPathCustomEnumerator = 0;
  }
  uint64_t v14 = fallbackProxyPathCustomEnumerator;
  sub_1000273F4(v5, v14);

  if (self)
  {
    id v15 = self->_obliviousConfigs;
    sub_100027404(v5, v15);

    penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
  }
  else
  {
    sub_100027404(v5, 0);
    penalizedObliviousProxyIndices = 0;
  }
  id v17 = penalizedObliviousProxyIndices;
  sub_100027414(v5, v17);

  if (self)
  {
    uint64_t v18 = self->_proxiedContentMaps;
    sub_100027424(v5, v18);

    networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
  }
  else
  {
    sub_100027424(v5, 0);
    networkSpecificQUICProxyPaths = 0;
  }
  uint64_t v20 = networkSpecificQUICProxyPaths;
  if (v5) {
    objc_storeStrong((id *)(v5 + 328), networkSpecificQUICProxyPaths);
  }

  if (self) {
    networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
  }
  else {
    networkDiscoveredProxyInfos = 0;
  }
  uint64_t v22 = networkDiscoveredProxyInfos;
  sub_100027434(v5, v22);

  BOOL v23 = [(NSPPrivacyProxyAgentManager *)self overridePreferredProxy];
  sub_10001089C(v5, v23);

  uint64_t v24 = [(NSPPrivacyProxyAgentManager *)self overridePreferredObliviousProxy];
  sub_1000090C8(v5, v24);

  v25 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxy];
  sub_1000108AC(v5, v25);

  uint64_t v26 = [(NSPPrivacyProxyAgentManager *)self overrideFallbackIngressProxy];
  sub_10000EF6C(v5, v26);

  id v27 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxyKey];
  sub_100027444(v5, v27);

  if (self)
  {
    uint64_t v28 = self->_overrideEnabledMaps;
    id v29 = [(NSMutableArray *)v28 copy];
    sub_100027454(v5, v29);

    BOOL disableProxiedContentDoHBootstrap = self->_disableProxiedContentDoHBootstrap;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v81 = [0 copy];
  sub_100027454(v5, v81);

  BOOL disableProxiedContentDoHBootstrap = 0;
  if (v5) {
LABEL_17:
  }
    *(unsigned char *)(v5 + 11) = disableProxiedContentDoHBootstrap;
LABEL_18:
  if (self)
  {
    long long v31 = self->_quicProxyPath;
    sub_100027464(v5, v31);

    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    sub_100027464(v5, 0);
    fallbackProxyPath = 0;
  }
  uint64_t v33 = fallbackProxyPath;
  sub_100027474(v5, v33);

  if (self)
  {
    long long v34 = self->_candidateQuicProxyPath;
    sub_100027484(v5, v34);

    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  }
  else
  {
    sub_100027484(v5, 0);
    candidateFallbackProxyPath = 0;
  }
  v36 = candidateFallbackProxyPath;
  sub_100027494(v5, v36);

  if (self)
  {
    v37 = self->_lastQuicProxySwitchedDate;
    sub_1000274A4(v5, v37);

    lastFallbackProxySwitchedDate = self->_lastFallbackProxySwitchedDate;
  }
  else
  {
    sub_1000274A4(v5, 0);
    lastFallbackProxySwitchedDate = 0;
  }
  v39 = lastFallbackProxySwitchedDate;
  if (v5) {
    objc_storeStrong((id *)(v5 + 296), lastFallbackProxySwitchedDate);
  }

  if (self)
  {
    uint64_t v40 = self->_proxyTokenInfoArray;
    sub_1000274B4(v5, v40);

    v41 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
    sub_100022CA0(v5, v41);

    path = self->_path;
  }
  else
  {
    sub_1000274B4(v5, 0);
    v82 = [0 tokenIssuanceRestrictedUntilDate];
    sub_100022CA0(v5, v82);

    path = 0;
  }
  uint64_t v43 = path;
  sub_1000274C4(v5, v43);

  if (self)
  {
    v44 = self->_lastPathUnsatisfiedDate;
    sub_1000274D4(v5, v44);

    lastPrimaryInterfaceChangedDate = self->_lastPrimaryInterfaceChangedDate;
  }
  else
  {
    sub_1000274D4(v5, 0);
    lastPrimaryInterfaceChangedDate = 0;
  }
  v46 = lastPrimaryInterfaceChangedDate;
  sub_1000274E4(v5, v46);

  if (self)
  {
    uint64_t v47 = self->_probeStartTime;
    sub_1000274F4(v5, v47);

    probeEndTime = self->_probeEndTime;
  }
  else
  {
    sub_1000274F4(v5, 0);
    probeEndTime = 0;
  }
  uint64_t v49 = probeEndTime;
  if (v5) {
    objc_storeStrong((id *)(v5 + 280), probeEndTime);
  }

  if (self)
  {
    v50 = self->_networkCharacteristics;
    sub_100027504(v5, v50);

    BOOL useDefaultInterface = self->_useDefaultInterface;
    if (!v5) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  sub_100027504(v5, 0);
  BOOL useDefaultInterface = 0;
  if (v5) {
LABEL_36:
  }
    *(unsigned char *)(v5 + 12) = useDefaultInterface;
LABEL_37:
  if (self)
  {
    BOOL subscriber = self->_subscriber;
    if (!v5) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  BOOL subscriber = 0;
  if (v5) {
LABEL_39:
  }
    *(unsigned char *)(v5 + 13) = subscriber;
LABEL_40:
  if (self)
  {
    BOOL unlimited = self->_unlimited;
    if (!v5) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  BOOL unlimited = 0;
  if (v5) {
LABEL_42:
  }
    *(unsigned char *)(v5 + 14) = unlimited;
LABEL_43:
  if (self)
  {
    BOOL geohashSharingEnabled = self->_geohashSharingEnabled;
    if (!v5) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  BOOL geohashSharingEnabled = 0;
  if (v5) {
LABEL_45:
  }
    *(unsigned char *)(v5 + 15) = geohashSharingEnabled;
LABEL_46:
  v55 = [(NSPPrivacyProxyAgentManager *)self geohashOverride];
  [(id)v5 setGeohashOverride:v55];

  [v5 setDnsFilteringHintEnabled:-[NSPPrivacyProxyAgentManager dnsFilteringHintEnabled](self, "dnsFilteringHintEnabled")];
  if (self)
  {
    BOOL proxyConnectivityCheckActive = self->_proxyConnectivityCheckActive;
    if (!v5) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  BOOL proxyConnectivityCheckActive = 0;
  if (v5) {
LABEL_48:
  }
    *(unsigned char *)(v5 + 16) = proxyConnectivityCheckActive;
LABEL_49:
  if (self)
  {
    unint64_t tokenFetchSuccessCount = self->_tokenFetchSuccessCount;
    if (!v5) {
      goto LABEL_52;
    }
    goto LABEL_51;
  }
  unint64_t tokenFetchSuccessCount = 0;
  if (v5) {
LABEL_51:
  }
    *(void *)(v5 + 416) = tokenFetchSuccessCount;
LABEL_52:
  if (self)
  {
    unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    if (!v5) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  unint64_t tokenFetchFailedCount = 0;
  if (v5) {
LABEL_54:
  }
    *(void *)(v5 + 424) = tokenFetchFailedCount;
LABEL_55:
  if (self)
  {
    unint64_t tokenConsumedCount = self->_tokenConsumedCount;
    if (!v5) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  unint64_t tokenConsumedCount = 0;
  if (v5) {
LABEL_57:
  }
    *(void *)(v5 + 432) = tokenConsumedCount;
LABEL_58:
  if (self)
  {
    unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    if (!v5) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
  unint64_t tokenExpiredCount = 0;
  if (v5) {
LABEL_60:
  }
    *(void *)(v5 + 440) = tokenExpiredCount;
LABEL_61:
  if (self)
  {
    unint64_t agentLowWaterMarkHitCount = self->_agentLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  unint64_t agentLowWaterMarkHitCount = 0;
  if (v5) {
LABEL_63:
  }
    *(void *)(v5 + 448) = agentLowWaterMarkHitCount;
LABEL_64:
  if (self)
  {
    unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    if (!v5) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  unint64_t cacheLowWaterMarkHitCount = 0;
  if (v5) {
LABEL_66:
  }
    *(void *)(v5 + 456) = cacheLowWaterMarkHitCount;
LABEL_67:
  if (self)
  {
    unint64_t networkProxiesRotated = self->_networkProxiesRotated;
    if (!v5) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
  unint64_t networkProxiesRotated = 0;
  if (v5) {
LABEL_69:
  }
    *(void *)(v5 + 480) = networkProxiesRotated;
LABEL_70:
  if (self)
  {
    unint64_t networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    if (!v5) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  unint64_t networkFallbackProxiesRotated = 0;
  if (v5) {
LABEL_72:
  }
    *(void *)(v5 + 488) = networkFallbackProxiesRotated;
LABEL_73:
  if (self)
  {
    unint64_t proxiesRotated = self->_proxiesRotated;
    if (!v5) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
  unint64_t proxiesRotated = 0;
  if (v5) {
LABEL_75:
  }
    *(void *)(v5 + 496) = proxiesRotated;
LABEL_76:
  if (self)
  {
    unint64_t generation = self->_generation;
    if (!v5) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  unint64_t generation = 0;
  if (v5) {
LABEL_78:
  }
    *(void *)(v5 + 544) = generation;
LABEL_79:
  if (self)
  {
    v67 = self->_proxyPathProber;
    sub_100027514(v5, v67);

    directPathProber = self->_directPathProber;
  }
  else
  {
    sub_100027514(v5, 0);
    directPathProber = 0;
  }
  v69 = directPathProber;
  if (v5) {
    objc_storeStrong((id *)(v5 + 248), directPathProber);
  }

  if (self)
  {
    uint64_t v70 = self->_pvdConfigurationFetcher;
    sub_100027524(v5, v70);

    lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
  }
  else
  {
    sub_100027524(v5, 0);
    lastProxyOutageReasonStats = 0;
  }
  uint64_t v72 = lastProxyOutageReasonStats;
  if (v5) {
    objc_storeStrong((id *)(v5 + 504), lastProxyOutageReasonStats);
  }

  if (self)
  {
    v73 = self->_lastTokenOutageReasonStats;
    sub_100027534(v5, v73);

    int64_t probingReason = self->_probingReason;
    if (!v5) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
  sub_100027534(v5, 0);
  int64_t probingReason = 0;
  if (v5) {
LABEL_89:
  }
    *(void *)(v5 + 520) = probingReason;
LABEL_90:
  if (self)
  {
    BOOL reportedTokenOutage = self->_reportedTokenOutage;
    if (!v5) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
  BOOL reportedTokenOutage = 0;
  if (v5) {
LABEL_92:
  }
    *(unsigned char *)(v5 + 17) = reportedTokenOutage;
LABEL_93:
  if (self)
  {
    uint64_t v76 = self->_configEpoch;
    sub_100027544(v5, v76);

    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    sub_100027544(v5, 0);
    reportedEpoch = 0;
  }
  uint64_t v78 = reportedEpoch;
  sub_100027554(v5, v78);

  id v79 = (id)v5;
  return v79;
}

- (void)dealloc
{
  id v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dealloc: \nProxy Agent Manager: %@", buf, 0xCu);
  }

  if (self)
  {
    tokenIssuanceRestrictedUntilTimer = self->_tokenIssuanceRestrictedUntilTimer;
    if (tokenIssuanceRestrictedUntilTimer)
    {
      dispatch_source_cancel(tokenIssuanceRestrictedUntilTimer);
      sub_1000278C4((uint64_t)self);
    }
    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel(proxyPathRestoreTimer);
      objc_storeStrong((id *)&self->_proxyPathRestoreTimer, 0);
    }
    replenishTokenTimer = self->_replenishTokenTimer;
    if (replenishTokenTimer)
    {
      dispatch_source_cancel(replenishTokenTimer);
      objc_storeStrong((id *)&self->_replenishTokenTimer, 0);
    }
  }
  +[NSPPrivacyProxyAgentManager removeProxyInfoFromKeychain];
  self;
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"NSPProxyAgentManagerPreferences", 0, kCFPreferencesCurrentApplication);
  int v7 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
  uint64_t v8 = nplog_obj();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removed proxy agent info from preference file", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to remove proxy agent data from preference file", buf, 2u);
  }

  self;
  uint64_t v10 = nplog_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "remove userevent agent data", buf, 2u);
  }

  v11 = +[NEFileHandleMaintainer sharedMaintainer];
  [v11 setAuxiliaryData:@"NIL" forKey:@"NSPProxyAgentManagerAuxilaryData"];

  uint64_t v12 = +[NEFileHandleMaintainer sharedMaintainer];
  [v12 commit];

  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained multiHopProxyAgentRegistered:0];

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    [0 multiHopProxyAgentRegistered:0];
    id v14 = 0;
  }
  [v14 singleHopProxyAgentRegistered:0];

  if (self)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 multiHopFallbackProxyAgentRegistered:0];

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    [0 multiHopFallbackProxyAgentRegistered:0];
    id v16 = 0;
  }
  [v16 singleHopFallbackProxyAgentRegistered:0];

  if (self) {
    ++self->_generation;
  }
  +[NPUtilities postNotification:value:](NPUtilities, "postNotification:value:", @"com.apple.networkserviceproxy.privacy-proxy-path-changed");
  v17.receiver = self;
  v17.super_class = (Class)NSPPrivacyProxyAgentManager;
  [(NSPPrivacyProxyAgentManager *)&v17 dealloc];
}

- (id)copyDomainFiltersDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (self) {
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  }
  else {
    candidatePreferredQUICProxyPaths = 0;
  }
  uint64_t v5 = candidatePreferredQUICProxyPaths;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        if (self) {
          v11 = self->_candidatePreferredQUICProxyPaths;
        }
        else {
          v11 = 0;
        }
        uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v9), (void)v17);
        id v13 = [v12 domainFilter];

        if (v13)
        {
          id v14 = [v12 domainFilter];
          [v3 setObject:v14 forKeyedSubscript:v10];
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v15 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v7 = v15;
    }
    while (v15);
  }

  return v3;
}

- (NSPPrivacyProxyAgentManager)initWithDelegate:(id)a3 toggleStats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v118.receiver = self;
  v118.super_class = (Class)NSPPrivacyProxyAgentManager;
  uint64_t v8 = [(NSPPrivacyProxyAgentManager *)&v118 init];
  if (!v8) {
    goto LABEL_114;
  }
  self;
  v9 = +[NEFileHandleMaintainer sharedMaintainer];
  id v10 = [v9 copyAuxiliaryDataForKey:@"NSPProxyAgentManagerAuxilaryData"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = 0;
  }
  else {
    id v11 = v10;
  }

  objc_storeStrong((id *)&v8->_toggleStats, a4);
  if (!v11)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v54 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    proxyTokenInfoArray = v8->_proxyTokenInfoArray;
    v8->_proxyTokenInfoArray = v54;

    v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_1000278D8();
    uint64_t v56 = sub_100028344();
    long long v31 = v56;
    if (v56)
    {
      v57 = [v56 objectForKeyedSubscript:@"ConfiguredProxies"];
      if (v57)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v58 = (NSMutableDictionary *)[v57 mutableCopy];
          savedConfiguredProxies = v8->_savedConfiguredProxies;
          v8->_savedConfiguredProxies = v58;
        }
      }
      id v101 = v6;
      uint64_t v60 = [v31 objectForKeyedSubscript:@"PreferredPaths"];
      if (v60)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v61 = (NSMutableArray *)[v60 mutableCopy];
          savedConfiguredPreferredPaths = v8->_savedConfiguredPreferredPaths;
          v8->_savedConfiguredPreferredPaths = v61;
        }
      }
      uint64_t v63 = sub_1000279F0();
      id v99 = v7;
      if (v63
        || ([v31 objectForKeyedSubscript:@"OverridePreferredProxy"],
            (uint64_t v63 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v8->_overridePreferredProxy, v63);
        }
      }
      v64 = sub_100027AE8();
      uint64_t v65 = v8;
      if (v64
        || ([v31 objectForKeyedSubscript:@"OverridePreferredObliviousProxy"], (v64 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v8->_overridePreferredObliviousProxy, v64);
        }
      }
      uint64_t v66 = sub_100027BE0();
      uint64_t v108 = v57;
      if (v66
        || ([v31 objectForKeyedSubscript:@"OverrideIngressProxy"],
            (uint64_t v66 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v65->_overrideIngressProxy, v66);
        }
      }
      v67 = sub_100027CD8();
      if (v67
        || ([v31 objectForKeyedSubscript:@"OverrideFallbackIngressProxy"],
            (v67 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v65->_overrideFallbackIngressProxy, v67);
        }
      }
      uint64_t v68 = sub_100027DD0();
      if (v68
        || ([v31 objectForKeyedSubscript:@"OverrideIngressProxyKey"],
            (uint64_t v68 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v65->_overrideIngressProxyKey, v68);
        }
      }
      v69 = sub_100027EC8();
      uint64_t v70 = v31;
      if ((v69
         || ([v31 objectForKeyedSubscript:@"OverrideEnabledMaps"],
             (v69 = objc_claimAutoreleasedReturnValue()) != 0))
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v71 = (NSMutableArray *)[v69 mutableCopy];
        uint64_t v72 = v65;
        overrideEnabledMaps = v65->_overrideEnabledMaps;
        v65->_overrideEnabledMaps = v71;
      }
      else
      {
        uint64_t v72 = v65;
      }
      unsigned __int8 v89 = sub_100027FC0();
      v72->_BOOL disableProxiedContentDoHBootstrap = v89;
      if ((v89 & 1) == 0)
      {
        v90 = [v70 objectForKeyedSubscript:@"DisableProxiedContentDoHBootstrap"];
        if (v90)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v65->_BOOL disableProxiedContentDoHBootstrap = [v90 BOOLValue];
          }
        }
      }
      unsigned __int8 v91 = sub_1000280C4();
      v65->_forceFallback = v91;
      long long v31 = v70;
      if ((v91 & 1) == 0)
      {
        uint64_t v92 = [v70 objectForKeyedSubscript:@"ForceFallback"];
        if (v92)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v65->_forceFallback = [v92 BOOLValue];
          }
        }

        long long v31 = v70;
      }

      id v7 = v99;
      id v6 = v101;
      uint64_t v8 = v65;
      id v11 = 0;
    }
    else
    {
      uint64_t v76 = (NSString *)sub_1000279F0();
      overridePreferredProxy = v8->_overridePreferredProxy;
      v8->_overridePreferredProxy = v76;

      uint64_t v78 = (NSString *)sub_100027AE8();
      overridePreferredObliviousProxy = v8->_overridePreferredObliviousProxy;
      v8->_overridePreferredObliviousProxy = v78;

      uint64_t v80 = (NSString *)sub_100027BE0();
      overrideIngressProxy = v8->_overrideIngressProxy;
      v8->_overrideIngressProxy = v80;

      v82 = (NSString *)sub_100027CD8();
      overrideFallbackIngressProxy = v8->_overrideFallbackIngressProxy;
      v8->_overrideFallbackIngressProxy = v82;

      v84 = (NSData *)sub_100027DD0();
      overrideIngressProxyKey = v8->_overrideIngressProxyKey;
      v8->_overrideIngressProxyKey = v84;

      id v86 = sub_100027EC8();
      uint64_t v87 = (NSMutableArray *)[v86 mutableCopy];
      v88 = v8->_overrideEnabledMaps;
      v8->_overrideEnabledMaps = v87;

      v8->_BOOL disableProxiedContentDoHBootstrap = sub_100027FC0();
      v8->_forceFallback = sub_1000280C4();
    }
    goto LABEL_113;
  }
  id v117 = 0;
  id v12 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v11 error:&v117];
  id v13 = v117;
  if (v12)
  {
    id v14 = [(NSPPrivacyProxyAgentManager *)v8 initWithCoder:v12];
    if (v14)
    {
      uint64_t v8 = v14;
      objc_storeWeak((id *)&v14->_delegate, v6);
      [(NSPProxyPath *)v8->_quicProxyPath setDelegate:v8];
      [(NSPProxyPath *)v8->_fallbackProxyPath setDelegate:v8];
      [(NSPQuicProxyPath *)v8->_quicProxyPath setQuicProxyPathDelegate:v8];
      proxyPathProber = v8->_proxyPathProber;
      if (proxyPathProber) {
        objc_storeWeak((id *)&proxyPathProber->_delegate, v8);
      }
      v96 = v12;
      v97 = v13;
      directPathProber = v8->_directPathProber;
      if (directPathProber) {
        objc_storeWeak((id *)&directPathProber->_delegate, v8);
      }
      id v102 = v11;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      long long v17 = v8->_preferredQUICProxyPaths;
      id v18 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v113 objects:v128 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v114;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v114 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [(NSMutableDictionary *)v8->_preferredQUICProxyPaths objectForKeyedSubscript:*(void *)(*((void *)&v113 + 1) + 8 * i)];
            [v22 setDelegate:v8];
            [v22 setQuicProxyPathDelegate:v8];
          }
          id v19 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v113 objects:v128 count:16];
        }
        while (v19);
      }

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      BOOL v23 = v8->_obliviousPaths;
      id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v109 objects:v127 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v110;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v110 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void **)(*((void *)&v109 + 1) + 8 * (void)j);
            [v28 setDelegate:v8];
            id v29 = [v28 fallbackAgentUUID];

            if (v29) {
              [v28 resetFallbackProxyAgent];
            }
            uint64_t v30 = [v28 quicAgentUUID];

            if (v30) {
              [v28 resetQUICProxyAgentForceUpdateDelegate:0];
            }
          }
          id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v109 objects:v127 count:16];
        }
        while (v25);
      }

      v8->_proxyPathRestoreIntervalSec = (unint64_t)sub_1000278D8();
      id v11 = v102;
      long long v31 = v97;
      if (v8->_candidatePreferredQUICProxyPaths)
      {
        uint64_t v32 = sub_100028344();
        uint64_t v33 = v32;
        if (v32)
        {
          long long v34 = [v32 objectForKeyedSubscript:@"PreferredPaths"];
          if (v34)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v94 = v34;
              uint64_t v95 = v33;
              id v98 = v7;
              id v100 = v6;
              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              id obj = v34;
              id v105 = [obj countByEnumeratingWithState:&v123 objects:v132 count:16];
              if (v105)
              {
                uint64_t v104 = *(void *)v124;
                do
                {
                  uint64_t v35 = 0;
                  do
                  {
                    if (*(void *)v124 != v104) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v106 = v35;
                    v36 = *(void **)(*((void *)&v123 + 1) + 8 * v35);
                    v37 = [v36 objectForKey:@"Vendor" v94, v95, v96];
                    uint64_t v38 = [v36 objectForKey:@"PreferredPathConfigURL"];
                    v107 = [v36 objectForKey:@"DomainFilter"];
                    long long v119 = 0u;
                    long long v120 = 0u;
                    long long v121 = 0u;
                    long long v122 = 0u;
                    v39 = v8;
                    uint64_t v40 = v8->_proxyArray;
                    id v41 = [(NSArray *)v40 countByEnumeratingWithState:&v119 objects:v131 count:16];
                    if (v41)
                    {
                      id v42 = v41;
                      uint64_t v43 = *(void *)v120;
                      do
                      {
                        for (k = 0; k != v42; k = (char *)k + 1)
                        {
                          if (*(void *)v120 != v43) {
                            objc_enumerationMutation(v40);
                          }
                          uint64_t v45 = *(void **)(*((void *)&v119 + 1) + 8 * (void)k);
                          if ([v45 hasPreferredPathConfigUri])
                          {
                            v46 = [v45 preferredPathConfigUri];
                            unsigned int v47 = [v46 isEqualToString:v38];

                            if (v47)
                            {
                              v48 = [v45 vendor];
                              uint64_t v49 = v48;
                              if (v48 && [v48 isEqualToString:v37])
                              {
                                v50 = [(NSMutableDictionary *)v39->_candidatePreferredQUICProxyPaths objectForKeyedSubscript:v49];
                                uint64_t v51 = v50;
                                if (v50)
                                {
                                  uint64_t v52 = [v50 domainFilter];

                                  if (!v52)
                                  {
                                    [v51 setDomainFilter:v107];
                                    v53 = nplog_obj();
                                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412290;
                                      v130 = v49;
                                      _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "Filled in domain filter for %@", buf, 0xCu);
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        id v42 = [(NSArray *)v40 countByEnumeratingWithState:&v119 objects:v131 count:16];
                      }
                      while (v42);
                    }

                    uint64_t v35 = v106 + 1;
                    uint64_t v8 = v39;
                  }
                  while ((id)(v106 + 1) != v105);
                  id v105 = [obj countByEnumeratingWithState:&v123 objects:v132 count:16];
                }
                while (v105);
              }

              id v7 = v98;
              id v6 = v100;
              id v11 = v102;
              long long v31 = v97;
              long long v34 = v94;
              uint64_t v33 = v95;
            }
          }
        }
      }

LABEL_113:
LABEL_114:
      uint64_t v8 = v8;
      v75 = v8;
      goto LABEL_115;
    }
    uint64_t v74 = nplog_obj();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v132 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to decode the NSP proxy token info from the keychain", v132, 2u);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v74 = nplog_obj();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v132 = 138412290;
      v133 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the NSP proxy agent manager: %@", v132, 0xCu);
    }
  }

  v75 = 0;
LABEL_115:

  return v75;
}

- (void)setupWithPath:(id)a3 subscriber:(BOOL)a4 unlimited:(BOOL)a5 geohashSharingEnabled:(BOOL)a6 geohashOverride:(id)a7 configEpoch:(id)a8 linkQuality:(int)a9
{
  BOOL v52 = a6;
  BOOL v53 = a4;
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  id v16 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];

  if (v16)
  {
    long long v17 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
    [v17 timeIntervalSinceNow];
    double v19 = v18;

    if (v19 <= 0.0)
    {
      handler = 0;
      uint64_t p_handler = (uint64_t)&handler;
      uint64_t v69 = 0x3032000000;
      uint64_t v70 = sub_100005D5C;
      v71 = sub_10000F6B0;
      id v72 = (id)os_transaction_create();
      sub_100022CA0((uint64_t)self, 0);
      uint64_t v20 = NPGetInternalQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100029898;
      block[3] = &unk_100105460;
      block[4] = self;
      block[5] = &handler;
      dispatch_async(v20, block);

      _Block_object_dispose(&handler, 8);
    }
    else
    {
      sub_1000296EC((uint64_t)self, (unint64_t)v19);
    }
  }
  [(NSPPrivacyProxyAgentManager *)self handleUnlimitedChange:v11];
  if (self)
  {
    proxyPathRestoreTimer = self->_proxyPathRestoreTimer;
    if (proxyPathRestoreTimer)
    {
      dispatch_source_cancel(proxyPathRestoreTimer);
      uint64_t v22 = self->_proxyPathRestoreTimer;
      self->_proxyPathRestoreTimer = 0;
    }
    unint64_t proxyPathRestoreIntervalSec = self->_proxyPathRestoreIntervalSec;
    id v24 = NPGetInternalQueue();
    id v25 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v24);
    uint64_t v26 = self->_proxyPathRestoreTimer;
    self->_proxyPathRestoreTimer = v25;

    id v27 = self->_proxyPathRestoreTimer;
    if (v27)
    {
      if (proxyPathRestoreIntervalSec) {
        uint64_t v28 = 1000000000 * proxyPathRestoreIntervalSec;
      }
      else {
        uint64_t v28 = 1800000000000;
      }
      id v29 = v27;
      dispatch_time_t v30 = dispatch_time(0x8000000000000000, v28);
      dispatch_source_set_timer(v29, v30, v28, 0);

      objc_initWeak(&location, self);
      long long v31 = self->_proxyPathRestoreTimer;
      handler = _NSConcreteStackBlock;
      uint64_t p_handler = 3221225472;
      uint64_t v69 = (uint64_t)sub_10002D0F8;
      uint64_t v70 = (uint64_t (*)(uint64_t, uint64_t))&unk_1001057F8;
      uint64_t v32 = v31;
      objc_copyWeak((id *)&v71, &location);
      dispatch_source_set_event_handler(v32, &handler);

      dispatch_resume((dispatch_object_t)self->_proxyPathRestoreTimer);
      objc_destroyWeak((id *)&v71);
      objc_destroyWeak(&location);
    }
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    proxyTokenInfoArray = 0;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v34 = [(NSMutableArray *)proxyTokenInfoArray copy];
  id v35 = [v34 countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v63;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v63 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        if (v38) {
          objc_storeWeak((id *)(v38 + 16), self);
        }
        sub_10000F248(v38);
      }
      id v35 = [v34 countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v35);
  }

  if (self)
  {
    sub_100022E78((uint64_t)self->_proxyPathProber);
    sub_100022E78((uint64_t)self->_directPathProber);
    [(NSPFallbackProxyPath *)self->_fallbackProxyPath resetSingleHopProxyAgent];
    [(NSPFallbackProxyPath *)self->_fallbackProxyPath resetMultiHopProxyAgent];
    [(NSPQuicProxyPath *)self->_quicProxyPath resetSingleHopProxyAgent];
    quicProxyPath = self->_quicProxyPath;
  }
  else
  {
    sub_100022E78(0);
    [0 resetSingleHopProxyAgent];
    [0 resetMultiHopProxyAgent];
    [0 resetSingleHopProxyAgent];
    quicProxyPath = 0;
  }
  [(NSPQuicProxyPath *)quicProxyPath resetMultiHopProxyAgent];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  if (self) {
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  }
  else {
    preferredQUICProxyPaths = 0;
  }
  id v41 = preferredQUICProxyPaths;
  id v42 = [(NSMutableDictionary *)v41 countByEnumeratingWithState:&v58 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v59;
    do
    {
      v44 = 0;
      do
      {
        if (*(void *)v59 != v43) {
          objc_enumerationMutation(v41);
        }
        if (self) {
          uint64_t v45 = self->_preferredQUICProxyPaths;
        }
        else {
          uint64_t v45 = 0;
        }
        v46 = [(NSMutableDictionary *)v45 objectForKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * (void)v44)];
        [v46 resetMultiHopProxyAgent];

        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      id v47 = [(NSMutableDictionary *)v41 countByEnumeratingWithState:&v58 objects:v75 count:16];
      id v42 = v47;
    }
    while (v47);
  }

  [(NSPPrivacyProxyAgentManager *)self handlePathChange:v13];
  [(NSPPrivacyProxyAgentManager *)self handleTierChange:v53];
  [(NSPPrivacyProxyAgentManager *)self updateGeohashSharingPreference:v52 geohashOverride:v14];
  [(NSPPrivacyProxyAgentManager *)self updateConfigEpoch:v15];
  [(NSPPrivacyProxyAgentManager *)self handleLinkQualityChange:a9];
  if (self)
  {
    if (self->_candidateQuicProxyPath) {
      sub_100029900((uint64_t)self, 0);
    }
    if (self->_candidateFallbackProxyPath) {
      sub_10002A4A8((id *)&self->super.isa, 0);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v48 = v34;
  id v49 = [v48 countByEnumeratingWithState:&v54 objects:v74 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v55;
    do
    {
      for (j = 0; j != v49; j = (char *)j + 1)
      {
        if (*(void *)v55 != v50) {
          objc_enumerationMutation(v48);
        }
        sub_100011F6C(*(void *)(*((void *)&v54 + 1) + 8 * (void)j));
      }
      id v49 = [v48 countByEnumeratingWithState:&v54 objects:v74 count:16];
    }
    while (v49);
  }
}

- (void)handlePathChange:(id)a3
{
  id v4 = a3;
  if (self) {
    path = self->_path;
  }
  else {
    path = 0;
  }
  id v6 = [(NWPath *)path interface];
  id v7 = [v6 interfaceName];
  uint64_t v8 = [v4 interface];
  v9 = [v8 interfaceName];
  unsigned __int8 v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    BOOL v11 = +[NSDate now];
    sub_1000274E4((uint64_t)self, v11);
  }
  if ([v4 status] == (id)2)
  {
    id v12 = +[NSDate now];
    sub_1000274D4((uint64_t)self, v12);
  }
  sub_1000274C4((uint64_t)self, v4);
  if (self) {
    id v13 = self->_path;
  }
  else {
    id v13 = 0;
  }
  id v14 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:v13];
  id v15 = [v14 objectForKeyedSubscript:@"Signature"];
  if (self) {
    networkCharacteristics = self->_networkCharacteristics;
  }
  else {
    networkCharacteristics = 0;
  }
  long long v17 = [(NSDictionary *)networkCharacteristics objectForKeyedSubscript:@"Signature"];
  unint64_t v18 = v15;
  unint64_t v19 = v17;
  uint64_t v20 = (void *)v19;
  if (!(v18 | v19) || v18 && v19 && [(id)v18 isEqual:v19])
  {
  }
  else
  {

    v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "proxy agent: network signature changed", buf, 2u);
    }

    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained networkSignatureChanged];

      [(NSPProxyPath *)self->_quicProxyPath handleNetworkCharacteristicsChange:v14];
      [(NSPProxyPath *)self->_fallbackProxyPath handleNetworkCharacteristicsChange:v14];
      [(NSPPrivacyProxyAgentManager *)self resetProxyErrors];
      self->_unint64_t networkProxiesRotated = 0;
      self->_unint64_t networkFallbackProxiesRotated = 0;
      objc_storeStrong((id *)&self->_networkCharacteristics, v14);
      if (self->_probingReason == 2) {
        sub_10002B3BC((uint64_t)self);
      }
    }
    else
    {
      [0 networkSignatureChanged];
      [0 handleNetworkCharacteristicsChange:v14];
      [0 handleNetworkCharacteristicsChange:v14];
      [0 resetProxyErrors];
    }
    sub_10002B5E0((uint64_t)self, 0);
    sub_10002B5F0((uint64_t)self, v14);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v36 = v14;
  v37 = (uint64_t *)self;
  id v35 = (void *)v18;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0;
  }
  id obj = proxyTokenInfoArray;
  id v41 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v43;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        id v26 = v4;
        if (v25)
        {
          objc_storeStrong((id *)(v25 + 56), a3);
          id v27 = +[NPUtilities copyCurrentNetworkCharacteristicsForPath:*(void *)(v25 + 56)];
          uint64_t v28 = [v27 objectForKeyedSubscript:@"Signature"];
          id v29 = *(id *)(v25 + 152);
          unint64_t v30 = v28;
          unint64_t v31 = (unint64_t)v29;
          uint64_t v32 = (void *)v31;
          if (v30 | v31
            && (v30 ? (BOOL v33 = v31 == 0) : (BOOL v33 = 1), v33 || ![(id)v30 isEqual:v31]))
          {

            objc_storeStrong((id *)(v25 + 152), v28);
            if ([*(id *)(v25 + 56) status] == (id)1) {
              sub_100012270(v25);
            }
          }
          else
          {
          }
        }
      }
      id v41 = [(NSMutableArray *)obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v41);
  }

  if (v37)
  {
    sub_1000246A8(v37[30], v4);
    uint64_t v34 = v37[31];
  }
  else
  {
    sub_1000246A8(0, v4);
    uint64_t v34 = 0;
  }
  sub_1000246A8(v34, v4);
  [v37 updateUserEventAgentData];
}

- (void)handleTierChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    if (((self->_subscriber ^ a3) & 1) == 0) {
      return;
    }
    self->_BOOL subscriber = a3;
    [(NSPProxyPath *)self->_fallbackProxyPath enableFailOpen:!a3];
    uint64_t v5 = self->_quicProxyPath;
    BOOL v6 = !self->_subscriber;
  }
  else
  {
    if (!a3) {
      return;
    }
    BOOL v6 = 1;
    [0 enableFailOpen:1];
    uint64_t v5 = 0;
  }
  [(NSPProxyPath *)v5 enableFailOpen:v6];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0;
  }
  uint64_t v8 = proxyTokenInfoArray;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v13)
        {
          if ((*(unsigned char *)(v13 + 11) != 0) != v3) {
            *(unsigned char *)(v13 + 11) = v3;
          }
        }
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)handleUnlimitedChange:(BOOL)a3
{
  if (self)
  {
    if (self->_unlimited != a3) {
      self->_BOOL unlimited = a3;
    }
  }
}

- (void)handleConfigChange
{
  if (self)
  {
    [(NSPProxyPath *)self->_quicProxyPath resetStats];
    [(NSPProxyPath *)self->_quicProxyPath resetError];
    [(NSPProxyPath *)self->_fallbackProxyPath resetStats];
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    [0 resetStats];
    [0 resetError];
    [0 resetStats];
    fallbackProxyPath = 0;
  }
  [(NSPProxyPath *)fallbackProxyPath resetError];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (self) {
    obliviousPaths = self->_obliviousPaths;
  }
  else {
    obliviousPaths = 0;
  }
  uint64_t v5 = obliviousPaths;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 resetStats:v11];
        [v10 resetError];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)handleLinkQualityChange:(int)a3
{
  if (self)
  {
    if (self->_linkQuality == a3) {
      return;
    }
    self->_linkQuality = a3;
    uint64_t v5 = self->_proxyPathProber;
    id v6 = v5;
    if (v5 && v5->_linkQuality != a3)
    {
      v5->_linkQuality = a3;
      sub_100022CB0((uint64_t)v5);
    }

    id v7 = self->_directPathProber;
    uint64_t v8 = v7;
    if (v7 && v7->_linkQuality != a3)
    {
      v7->_linkQuality = a3;
      sub_100022CB0((uint64_t)v7);
    }
  }
  else
  {
    if (!a3) {
      return;
    }
    uint64_t v8 = 0;
  }

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)resetProxyErrors
{
  if (self)
  {
    [(NSPProxyPath *)self->_quicProxyPath resetStats];
    [(NSPProxyPath *)self->_quicProxyPath resetError];
    [(NSPProxyPath *)self->_fallbackProxyPath resetStats];
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else
  {
    [0 resetStats];
    [0 resetError];
    [0 resetStats];
    fallbackProxyPath = 0;
  }
  [(NSPProxyPath *)fallbackProxyPath resetError];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  if (self) {
    obliviousPaths = self->_obliviousPaths;
  }
  else {
    obliviousPaths = 0;
  }
  uint64_t v5 = obliviousPaths;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 resetStats:v11];
        [v10 resetError];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)useDefaultNetworkInterface:(BOOL)a3
{
  if (self)
  {
    if (self->_useDefaultInterface == a3) {
      return;
    }
    self->_BOOL useDefaultInterface = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else
  {
    if (!a3) {
      return;
    }
    proxyTokenInfoArray = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
  }
  uint64_t v5 = proxyTokenInfoArray;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (v10) {
          *(unsigned char *)(v10 + 10) = a3;
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

+ (void)removeProxyInfoFromKeychain
{
  id v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Removing proxy info keychain", v3, 2u);
  }

  +[NPUtilities removeDataFromKeychainWithIdentifier:@"com.apple.NetworkServiceProxy.ProxyToken"];
}

- (void)tearDownNetworkDiscoveredProxy
{
  id v2 = self;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  }
  if ([(NSPPrivacyProxyAgentManager *)self count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    if (v2) {
      networkSpecificQUICProxyPaths = v2->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0;
    }
    id v4 = networkSpecificQUICProxyPaths;
    id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v22;
      *(void *)&long long v6 = 138412290;
      long long v20 = v6;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v4);
          }
          if (v2) {
            uint64_t v10 = v2->_networkSpecificQUICProxyPaths;
          }
          else {
            uint64_t v10 = 0;
          }
          long long v11 = -[NSMutableDictionary objectForKey:](v10, "objectForKey:", *(void *)(*((void *)&v21 + 1) + 8 * (void)v9), v20, (void)v21);
          long long v12 = nplog_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = [v11 ingressProxy];
            long long v14 = (void *)v13;
            if (v13) {
              long long v15 = *(void **)(v13 + 24);
            }
            else {
              long long v15 = 0;
            }
            id v16 = v15;
            long long v17 = [v16 vendor];
            *(_DWORD *)buf = v20;
            id v26 = v17;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Tearing down existing network discovered proxy: %@", buf, 0xCu);
          }
          [v11 tearDownMultiHopRegistration];
          [(NSPPrivacyProxyAgentManager *)v2 multiHopAgentUnregistered:v11];

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v18 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
        id v7 = v18;
      }
      while (v18);
    }

    if (v2) {
      unint64_t v19 = v2->_networkSpecificQUICProxyPaths;
    }
    else {
      unint64_t v19 = 0;
    }
    [(NSMutableDictionary *)v19 removeAllObjects];
  }
}

- (BOOL)deferCommit
{
  if (self) {
    LOBYTE(self) = self->_deferAgentCommit;
  }
  return (char)self;
}

- (void)updateProxyInfo:(id)a3 resolverInfo:(id)a4 proxyPathList:(id)a5 fallbackProxyPathList:(id)a6 obliviousConfigs:(id)a7 proxiedContentMaps:(id)a8
{
  id v14 = a3;
  id v274 = a4;
  id v278 = a5;
  id v275 = a6;
  id v276 = a7;
  id v277 = a8;
  v279 = v14;
  if (!v14)
  {
    long long v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v347 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null proxyInfoArray", buf, 0xCu);
    }
    goto LABEL_286;
  }
  if (![v14 count])
  {
    long long v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v347 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null (proxyInfoArray.count > 0)", buf, 0xCu);
    }
    goto LABEL_286;
  }
  if (!v278)
  {
    long long v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v347 = "-[NSPPrivacyProxyAgentManager updateProxyInfo:resolverInfo:proxyPathList:fallbackProxyPathList:obliviousCon"
             "figs:proxiedContentMaps:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s called with null proxyPathList", buf, 0xCu);
    }
    goto LABEL_286;
  }
  sub_1000273A4((uint64_t)self, v14);
  sub_1000273B4((uint64_t)self, v274);
  sub_1000273C4((uint64_t)self, v278);
  id v15 = [v278 mutableCopy];
  sub_1000273D4((uint64_t)self, v15);

  sub_1000273E4((uint64_t)self, v275);
  id v16 = [v275 mutableCopy];
  sub_1000273F4((uint64_t)self, v16);

  sub_100027404((uint64_t)self, v276);
  sub_100027414((uint64_t)self, 0);
  val = self;
  sub_100027424((uint64_t)self, v277);
  long long v17 = nplog_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    obliviousConfigs = (const char *)self;
    if (self) {
      obliviousConfigs = (const char *)self->_obliviousConfigs;
    }
    *(_DWORD *)buf = 138412290;
    v347 = obliviousConfigs;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "updateProxyInfo self.obliviousConfigs %@", buf, 0xCu);
  }

  if (self) {
    self->_deferAgentCommit = 1;
  }
  unint64_t v19 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
  BOOL v20 = v19 == 0;

  if (!v20)
  {
    long long v21 = nplog_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = [(NSPPrivacyProxyAgentManager *)self tokenIssuanceRestrictedUntilDate];
      long long v23 = +[NSDateFormatter localizedStringFromDate:v22 dateStyle:1 timeStyle:2];
      *(_DWORD *)buf = 138412290;
      v347 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "deferring setting up of proxy agent until %@", buf, 0xCu);
    }
LABEL_286:

    goto LABEL_275;
  }
  id v296 = v14;
  if (self)
  {
    id v289 = objc_alloc_init((Class)NSMutableArray);
    long long v343 = 0u;
    long long v344 = 0u;
    long long v341 = 0u;
    long long v342 = 0u;
    id obj = self->_proxyTokenInfoArray;
    id v299 = [(NSMutableArray *)obj countByEnumeratingWithState:&v341 objects:buf count:16];
    if (!v299) {
      goto LABEL_57;
    }
    uint64_t v293 = *(void *)v342;
    while (1)
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v342 != v293) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v341 + 1) + 8 * (void)v24);
        memset(v338, 0, sizeof(v338));
        long long v339 = 0u;
        long long v340 = 0u;
        id v26 = v296;
        id v27 = [v26 countByEnumeratingWithState:v338 objects:v345 count:16];
        if (!v27) {
          goto LABEL_32;
        }
        uint64_t v28 = **(void **)&v338[16];
        do
        {
          id v29 = 0;
          do
          {
            if (**(void **)&v338[16] != v28) {
              objc_enumerationMutation(v26);
            }
            if (v25) {
              unint64_t v30 = *(void **)(v25 + 24);
            }
            else {
              unint64_t v30 = 0;
            }
            unint64_t v31 = *(void **)(*(void *)&v338[8] + 8 * (void)v29);
            id v32 = v30;
            BOOL v33 = [v32 vendor];
            uint64_t v34 = [v31 vendor];

            LODWORD(v32) = [v33 isEqualToString:v34];
            if (v32)
            {
              if (v25) {
                uint64_t v36 = *(void **)(v25 + 24);
              }
              else {
                uint64_t v36 = 0;
              }
              id v37 = v36;
              uint64_t v38 = [v37 tokenKeyInfo];
              uint64_t v39 = [v31 tokenKeyInfo];

              unint64_t v40 = v38;
              unint64_t v41 = v39;
              long long v42 = (void *)v41;
              if (!(v40 | v41) || (char v43 = 1, v40) && v41 && [(id)v40 isEqual:v41]) {
                char v43 = 0;
              }

              if (v25) {
                long long v44 = *(void **)(v25 + 24);
              }
              else {
                long long v44 = 0;
              }
              id v45 = v44;
              v46 = [v45 tokenChallenge];
              id v47 = [v31 tokenChallenge];

              unint64_t v48 = v46;
              unint64_t v49 = v47;
              uint64_t v50 = (void *)v49;
              if (!(v48 | v49) || v48 && v49 && [(id)v48 isEqual:v49])
              {

                sub_10001088C(v25, v31);
                if (v43)
                {
                  uint64_t v51 = NPGetInternalQueue();
                  *(void *)&long long v323 = _NSConcreteStackBlock;
                  *((void *)&v323 + 1) = 3221225472;
                  *(void *)&long long v324 = sub_100025310;
                  *((void *)&v324 + 1) = &unk_100105AB8;
                  *(void *)&long long v325 = v31;
                  *((void *)&v325 + 1) = v25;
                  p_long long block = &v323;
                  goto LABEL_50;
                }
              }
              else
              {

                sub_10001088C(v25, v31);
                uint64_t v51 = NPGetInternalQueue();
                *(void *)&long long block = _NSConcreteStackBlock;
                *((void *)&block + 1) = 3221225472;
                *(void *)&long long v328 = sub_100025230;
                *((void *)&v328 + 1) = &unk_100105AB8;
                *(void *)&long long v329 = v31;
                *((void *)&v329 + 1) = v25;
                p_long long block = &block;
LABEL_50:
                dispatch_async(v51, p_block);
              }
              goto LABEL_52;
            }
            id v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          id v35 = [v26 countByEnumeratingWithState:v338 objects:v345 count:16];
          id v27 = v35;
        }
        while (v35);
LABEL_32:

        [v289 addObject:v25];
LABEL_52:
        long long v24 = (char *)v24 + 1;
      }
      while (v24 != v299);
      id v53 = [(NSMutableArray *)obj countByEnumeratingWithState:&v341 objects:buf count:16];
      id v299 = v53;
      if (!v53)
      {
LABEL_57:

        [(NSMutableArray *)val->_proxyTokenInfoArray removeObjectsInArray:v289];
        long long v54 = val->_fallbackProxyPath;
        long long v55 = val->_proxyArray;
        fallbackProxyPathList = val->_fallbackProxyPathList;
        goto LABEL_58;
      }
    }
  }

  long long v55 = 0;
  long long v54 = 0;
  fallbackProxyPathList = 0;
LABEL_58:
  long long v57 = fallbackProxyPathList;
  unsigned __int8 v58 = [(NSPFallbackProxyPath *)v54 proxyPathIsValid:v55 proxyPathList:v57];

  if (v58)
  {
    if (val)
    {
      [(NSPFallbackProxyPath *)val->_fallbackProxyPath resetSingleHopProxyAgent];
      fallbackProxyPath = val->_fallbackProxyPath;
    }
    else
    {
      [0 resetSingleHopProxyAgent];
      fallbackProxyPath = 0;
    }
    [(NSPFallbackProxyPath *)fallbackProxyPath resetMultiHopProxyAgent];
  }
  else
  {
    long long v60 = nplog_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      long long v61 = val;
      if (val) {
        long long v61 = val->_fallbackProxyPath;
      }
      id v62 = v61;
      uint64_t v63 = [v62 ingressProxy];
      long long v64 = (void *)v63;
      if (v63) {
        long long v65 = *(void **)(v63 + 24);
      }
      else {
        long long v65 = 0;
      }
      id v66 = v65;
      v67 = [v66 tcpProxyFqdn];
      if (val) {
        uint64_t v68 = val->_fallbackProxyPath;
      }
      else {
        uint64_t v68 = 0;
      }
      uint64_t v69 = v68;
      uint64_t v70 = [(NSPProxyPath *)v69 egressProxy];
      v71 = (void *)v70;
      if (v70) {
        id v72 = *(void **)(v70 + 24);
      }
      else {
        id v72 = 0;
      }
      id v73 = v72;
      uint64_t v74 = [v73 tcpProxyFqdn];
      *(_DWORD *)buf = 138412546;
      v347 = v67;
      __int16 v348 = 2112;
      v349 = v74;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Fallback proxy path (%@-%@) is not valid", buf, 0x16u);
    }
    v75 = sub_10002C90C((id *)&val->super.isa);
    BOOL v76 = v75 == 0;

    if (v76)
    {
      v77 = val;
      sub_100027474((uint64_t)val, 0);
      if (val) {
        goto LABEL_75;
      }
      goto LABEL_277;
    }
    sub_10002A4A8((id *)&val->super.isa, 0);
  }
  v77 = val;
  if (val)
  {
LABEL_75:
    uint64_t v78 = v77->_quicProxyPath;
    id v79 = v77->_proxyArray;
    proxyPathList = v77->_proxyPathList;
    goto LABEL_76;
  }
LABEL_277:
  id v79 = 0;
  uint64_t v78 = 0;
  proxyPathList = 0;
LABEL_76:
  id v81 = proxyPathList;
  unsigned __int8 v82 = [(NSPQuicProxyPath *)v78 proxyPathIsValid:v79 proxyPathList:v81];

  if (v82)
  {
    if (val)
    {
      [(NSPQuicProxyPath *)val->_quicProxyPath resetSingleHopProxyAgent];
      quicProxyPath = val->_quicProxyPath;
    }
    else
    {
      [0 resetSingleHopProxyAgent];
      quicProxyPath = 0;
    }
    [(NSPQuicProxyPath *)quicProxyPath resetMultiHopProxyAgent];
  }
  else
  {
    v84 = nplog_obj();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v85 = val;
      if (val) {
        uint64_t v85 = val->_quicProxyPath;
      }
      id v86 = v85;
      uint64_t v87 = [v86 ingressProxy];
      v88 = (void *)v87;
      if (v87) {
        unsigned __int8 v89 = *(void **)(v87 + 24);
      }
      else {
        unsigned __int8 v89 = 0;
      }
      id v90 = v89;
      unsigned __int8 v91 = [v90 vendor];
      if (val) {
        uint64_t v92 = val->_quicProxyPath;
      }
      else {
        uint64_t v92 = 0;
      }
      uint64_t v93 = v92;
      uint64_t v94 = [(NSPProxyPath *)v93 egressProxy];
      uint64_t v95 = (void *)v94;
      if (v94) {
        v96 = *(void **)(v94 + 24);
      }
      else {
        v96 = 0;
      }
      id v97 = v96;
      id v98 = [v97 vendor];
      *(_DWORD *)buf = 138412546;
      v347 = v91;
      __int16 v348 = 2112;
      v349 = v98;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "Quic proxy path (%@-%@) is not valid", buf, 0x16u);
    }
    sub_100029900((uint64_t)val, 0);
  }
  candidateQuicProxyPath = val;
  if (val) {
    candidateQuicProxyPath = val->_candidateQuicProxyPath;
  }
  id v100 = candidateQuicProxyPath;
  BOOL v101 = v100 == 0;

  if (!v101)
  {
    if (val)
    {
      id v102 = val->_candidateQuicProxyPath;
      v103 = val->_proxyArray;
      uint64_t v104 = val->_proxyPathList;
    }
    else
    {
      v103 = 0;
      id v102 = 0;
      uint64_t v104 = 0;
    }
    id v105 = v104;
    unsigned __int8 v106 = [(NSPCandidateQuicProxyPath *)v102 proxyPathIsValid:v103 proxyPathList:v105];

    if ((v106 & 1) == 0)
    {
      v107 = nplog_obj();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v108 = val;
        if (val) {
          uint64_t v108 = val->_candidateQuicProxyPath;
        }
        id v109 = v108;
        uint64_t v110 = [v109 ingressProxy];
        long long v111 = (void *)v110;
        if (v110) {
          long long v112 = *(void **)(v110 + 24);
        }
        else {
          long long v112 = 0;
        }
        id v113 = v112;
        long long v114 = [v113 vendor];
        if (val) {
          long long v115 = val->_candidateQuicProxyPath;
        }
        else {
          long long v115 = 0;
        }
        long long v116 = v115;
        uint64_t v117 = [(NSPCandidateProxyPath *)v116 egressProxy];
        objc_super v118 = (void *)v117;
        if (v117) {
          long long v119 = *(void **)(v117 + 24);
        }
        else {
          long long v119 = 0;
        }
        id v120 = v119;
        long long v121 = [v120 vendor];
        *(_DWORD *)buf = 138412546;
        v347 = v114;
        __int16 v348 = 2112;
        v349 = v121;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "Candidate Quic proxy path (%@-%@) is not valid", buf, 0x16u);
      }
      sub_100027484((uint64_t)val, 0);
      sub_100029900((uint64_t)val, 0);
    }
  }
  candidateFallbackProxyPath = val;
  if (val) {
    candidateFallbackProxyPath = val->_candidateFallbackProxyPath;
  }
  id v123 = candidateFallbackProxyPath;
  BOOL v124 = v123 == 0;

  if (!v124)
  {
    if (val)
    {
      long long v125 = val->_candidateFallbackProxyPath;
      long long v126 = val->_proxyArray;
      v127 = val->_fallbackProxyPathList;
    }
    else
    {
      long long v126 = 0;
      long long v125 = 0;
      v127 = 0;
    }
    v128 = v127;
    unsigned __int8 v129 = [(NSPCandidateFallbackProxyPath *)v125 proxyPathIsValid:v126 proxyPathList:v128];

    if ((v129 & 1) == 0)
    {
      v130 = nplog_obj();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v131 = val;
        if (val) {
          v131 = val->_candidateFallbackProxyPath;
        }
        id v132 = v131;
        uint64_t v133 = [v132 ingressProxy];
        v134 = (void *)v133;
        if (v133) {
          v135 = *(void **)(v133 + 24);
        }
        else {
          v135 = 0;
        }
        id v136 = v135;
        v137 = [v136 tcpProxyFqdn];
        if (val) {
          v138 = val->_candidateFallbackProxyPath;
        }
        else {
          v138 = 0;
        }
        v139 = v138;
        uint64_t v140 = [(NSPCandidateProxyPath *)v139 egressProxy];
        v141 = (void *)v140;
        if (v140) {
          v142 = *(void **)(v140 + 24);
        }
        else {
          v142 = 0;
        }
        id v143 = v142;
        v144 = [v143 tcpProxyFqdn];
        *(_DWORD *)buf = 138412546;
        v347 = v137;
        __int16 v348 = 2112;
        v349 = v144;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "Candidate Fallback proxy path (%@-%@) is not valid", buf, 0x16u);
      }
      sub_100027494((uint64_t)val, 0);
      sub_10002A4A8((id *)&val->super.isa, 0);
    }
  }
  long long v305 = 0u;
  long long v306 = 0u;
  long long v303 = 0u;
  long long v304 = 0u;
  preferredQUICProxyPaths = val;
  if (val) {
    preferredQUICProxyPaths = val->_preferredQUICProxyPaths;
  }
  id v146 = preferredQUICProxyPaths;
  id v147 = [v146 countByEnumeratingWithState:&v303 objects:v331 count:16];
  if (v147)
  {
    uint64_t v148 = *(void *)v304;
    do
    {
      v149 = 0;
      do
      {
        if (*(void *)v304 != v148) {
          objc_enumerationMutation(v146);
        }
        if (val) {
          v150 = val->_preferredQUICProxyPaths;
        }
        else {
          v150 = 0;
        }
        uint64_t v151 = *(void *)(*((void *)&v303 + 1) + 8 * (void)v149);
        v152 = v150;
        v153 = [(NSMutableDictionary *)v152 objectForKeyedSubscript:v151];

        if (val)
        {
          v154 = val->_proxyArray;
          v155 = val->_proxyPathList;
        }
        else
        {
          v154 = 0;
          v155 = 0;
        }
        v156 = v155;
        unsigned int v157 = [v153 proxyPathIsValid:v154 proxyPathList:v156];

        if (v157) {
          [v153 resetMultiHopProxyAgent];
        }

        v149 = (char *)v149 + 1;
      }
      while (v147 != v149);
      id v158 = [v146 countByEnumeratingWithState:&v303 objects:v331 count:16];
      id v147 = v158;
    }
    while (v158);
  }

  if (val && ![(NSPPrivacyProxyAgentManager *)val forceFallback])
  {
    obja = (id *)&val->_candidatePreferredQUICProxyPaths;
    if (!val->_candidatePreferredQUICProxyPaths)
    {
      id v159 = objc_alloc_init((Class)NSMutableDictionary);
      objc_storeStrong(obja, v159);
    }
    v290 = +[NSMutableArray array];
    long long v329 = 0u;
    long long v330 = 0u;
    long long block = 0u;
    long long v328 = 0u;
    v283 = val->_proxyArray;
    id v287 = [(NSArray *)v283 countByEnumeratingWithState:&block objects:buf count:16];
    if (v287)
    {
      v286 = *(id **)v328;
      do
      {
        v297 = 0;
        do
        {
          if (*(id **)v328 != v286) {
            objc_enumerationMutation(v283);
          }
          v160 = *(void **)(*((void *)&block + 1) + 8 * (void)v297);
          if (([v160 hasPreferredPathConfigUri] & 1) == 0
            && ![v160 preferredPathPatternsCount])
          {
            goto LABEL_226;
          }
          uint64_t v300 = [v160 vendor];
          v161 = (void *)v300;
          if (!v300) {
            goto LABEL_225;
          }
          v294 = [*obja objectForKeyedSubscript:];
          if (v294)
          {
            v162 = val->_proxyPathList;
            v163 = val->_proxyArray;
            unsigned __int8 v164 = [v294 proxyPathIsValid:v163 proxyPathList:v162];

            if (v164)
            {
              v165 = [v294 preferredPathConfigURI];
              v166 = [v160 preferredPathConfigUri];
              unint64_t WeakRetained = v165;
              unint64_t v168 = v166;
              v169 = (void *)v168;
              if (!(WeakRetained | v168)
                || (v174 = (void *)v168, (unint64_t v172 = WeakRetained) != 0)
                && (v174 = (void *)v168, unint64_t v172 = WeakRetained, v168)
                && (v174 = (void *)v168,
                    unint64_t v172 = WeakRetained,
                    [(id)WeakRetained isEqual:v168]))
              {

                v170 = [v294 preferredPathPatterns];
                v171 = [v160 preferredPathPatterns];
                unint64_t v172 = v170;
                unint64_t v173 = v171;
                v174 = (void *)v173;
                if (v172 | v173 && (!v172 || !v173 || ![(id)v172 isEqual:v173]))
                {

                  goto LABEL_190;
                }
              }
              else
              {
LABEL_190:

                v197 = nplog_obj();
                if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v198 = [v294 ingressProxy];
                  v199 = (void *)v198;
                  if (v198) {
                    v200 = *(void **)(v198 + 24);
                  }
                  else {
                    v200 = 0;
                  }
                  id v201 = v200;
                  v202 = [v201 vendor];
                  uint64_t v203 = [v294 egressProxy];
                  v204 = (void *)v203;
                  if (v203) {
                    v205 = *(void **)(v203 + 24);
                  }
                  else {
                    v205 = 0;
                  }
                  id v206 = v205;
                  v207 = [v206 vendor];
                  *(_DWORD *)v338 = 138412802;
                  *(void *)&v338[4] = v300;
                  *(_WORD *)&v338[12] = 2112;
                  *(void *)&v338[14] = v202;
                  *(_WORD *)&v338[22] = 2112;
                  *(void *)&v338[24] = v207;
                  _os_log_impl((void *)&_mh_execute_header, v197, OS_LOG_TYPE_DEFAULT, "Candidate preferred proxy path for vendor %@ (%@-%@) has new matching rules, updating", v338, 0x20u);
                }
                v208 = [v160 preferredPathConfigUri];
                [v294 setPreferredPathConfigURI:v208];

                [v294 setDomainFilter:0];
                v209 = [v160 preferredPathPatterns];
                [v294 setPreferredPathPatterns:v209];

                [(NSMutableDictionary *)val->_preferredQUICProxyPaths setObject:0 forKeyedSubscript:v300];
                unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&val->_delegate);
                [(id)WeakRetained preferredProxyAgentUnregistered:v300];
              }

              [v290 addObject:v300];
              goto LABEL_224;
            }
            v175 = nplog_obj();
            if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v176 = [v294 ingressProxy];
              v177 = (void *)v176;
              if (v176) {
                v178 = *(void **)(v176 + 24);
              }
              else {
                v178 = 0;
              }
              id v179 = v178;
              v180 = [v179 vendor];
              uint64_t v181 = [v294 egressProxy];
              v182 = (void *)v181;
              if (v181) {
                v183 = *(void **)(v181 + 24);
              }
              else {
                v183 = 0;
              }
              id v184 = v183;
              v185 = [v184 vendor];
              *(_DWORD *)v338 = 138412802;
              *(void *)&v338[4] = v300;
              *(_WORD *)&v338[12] = 2112;
              *(void *)&v338[14] = v180;
              *(_WORD *)&v338[22] = 2112;
              *(void *)&v338[24] = v185;
              _os_log_impl((void *)&_mh_execute_header, v175, OS_LOG_TYPE_DEFAULT, "Candidate preferred proxy path for vendor %@ (%@-%@) is not valid", v338, 0x20u);
            }
            [*obja setObject:0 forKeyedSubscript:v300];
          }
          long long v325 = 0u;
          long long v326 = 0u;
          long long v323 = 0u;
          long long v324 = 0u;
          v186 = val->_proxyPathList;
          id v187 = [(NSArray *)v186 countByEnumeratingWithState:&v323 objects:v345 count:16];
          if (!v187) {
            goto LABEL_175;
          }
          uint64_t v188 = *(void *)v324;
          do
          {
            for (i = 0; i != v187; i = (char *)i + 1)
            {
              if (*(void *)v324 != v188) {
                objc_enumerationMutation(v186);
              }
              v190 = *(void **)(*((void *)&v323 + 1) + 8 * i);
              v191 = val->_proxyArray;
              v192 = -[NSArray objectAtIndex:](v191, "objectAtIndex:", *((unsigned int *)[v190 proxies] + 1));

              if ([v192 isEqual:v160])
              {
                v284 = v190;

                if (!v284) {
                  goto LABEL_180;
                }
                v193 = val->_proxyArray;
                v194 = [(NSArray *)v193 objectAtIndex:*(unsigned int *)[v284 proxies]];

                if (v194)
                {
                  v195 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxy];
                  if (v195)
                  {

                    goto LABEL_199;
                  }
                  v210 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxyKey];
                  BOOL v211 = v210 == 0;

                  if (v211)
                  {
                    id v282 = v194;
                  }
                  else
                  {
LABEL_199:
                    id v282 = [v194 copy];

                    v212 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxy];
                    BOOL v213 = v212 == 0;

                    if (!v213)
                    {
                      v214 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxy];
                      [v282 setProxyURL:v214];
                    }
                    v215 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxyKey];
                    BOOL v216 = v215 == 0;

                    if (!v216)
                    {
                      [v282 clearProxyKeyInfos];
                      v217 = [(NSPPrivacyProxyAgentManager *)val overrideIngressProxyKey];
                      [v282 addProxyKeyInfo:v217];
                    }
                  }
                  v281 = sub_10002D1C4((uint64_t)val, v282);
                  v280 = sub_10002D1C4((uint64_t)val, v160);
                  if (v281 && v280)
                  {
                    v218 = [NSPCandidateQuicProxyPath alloc];
                    unsigned int v219 = [v284 weight];
                    v220 = [v160 preferredPathConfigUri];
                    v221 = [v160 preferredPathPatterns];
                    to = [(NSPCandidateProxyPath *)v218 initWithIngressProxy:v281 egressProxy:v280 proxyPathWeight:v219 preferredPathConfigURI:v220 preferredPathPatterns:v221];

                    long long v321 = 0u;
                    long long v322 = 0u;
                    long long v319 = 0u;
                    long long v320 = 0u;
                    v222 = val->_savedConfiguredPreferredPaths;
                    id v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v319 objects:&v341 count:16];
                    if (v223)
                    {
                      uint64_t v224 = *(void *)v320;
                      do
                      {
                        for (j = 0; j != v223; j = (char *)j + 1)
                        {
                          if (*(void *)v320 != v224) {
                            objc_enumerationMutation(v222);
                          }
                          v226 = *(void **)(*((void *)&v319 + 1) + 8 * (void)j);
                          v227 = [v226 objectForKey:@"Vendor"];
                          v228 = [v226 objectForKey:@"PreferredPathConfigURL"];
                          v229 = [v226 objectForKey:@"DomainFilter"];
                          if (v227)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & (v228 != 0)) == 1)
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & (v229 != 0)) == 1)
                              {
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  if ([v227 isEqualToString:v300])
                                  {
                                    v230 = [v160 preferredPathConfigUri];
                                    unsigned int v231 = [v230 isEqualToString:v228];

                                    if (v231) {
                                      [to setDomainFilter:v229];
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                        id v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v319 objects:&v341 count:16];
                      }
                      while (v223);
                    }

                    [*obja setObject:to forKeyedSubscript:v300];
                    [v290 addObject:v300];
                  }
                }
                v196 = v284;
                goto LABEL_223;
              }
            }
            id v187 = [(NSArray *)v186 countByEnumeratingWithState:&v323 objects:v345 count:16];
          }
          while (v187);
LABEL_175:

LABEL_180:
          v196 = nplog_obj();
          if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v338 = 138412290;
            *(void *)&v338[4] = v300;
            _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_INFO, "No preferred path found for vendor \"%@\"", v338, 0xCu);
          }
LABEL_223:

LABEL_224:
          v161 = (void *)v300;
LABEL_225:

LABEL_226:
          v297 = (char *)v297 + 1;
        }
        while (v297 != v287);
        id v232 = [(NSArray *)v283 countByEnumeratingWithState:&block objects:buf count:16];
        id v287 = v232;
      }
      while (v232);
    }

    objc_storeStrong((id *)&val->_savedConfiguredPreferredPaths, 0);
    v233 = [(NSMutableDictionary *)val->_candidatePreferredQUICProxyPaths allKeys];
    long long v317 = 0u;
    long long v318 = 0u;
    long long v315 = 0u;
    long long v316 = 0u;
    id v288 = v233;
    id v298 = [v288 countByEnumeratingWithState:&v315 objects:v338 count:16];
    if (!v298) {
      goto LABEL_271;
    }
    uint64_t v295 = *(void *)v316;
LABEL_235:
    uint64_t v234 = 0;
    while (1)
    {
      if (*(void *)v316 != v295) {
        objc_enumerationMutation(v288);
      }
      v235 = *(void **)(*((void *)&v315 + 1) + 8 * v234);
      v301 = [*obja objectForKeyedSubscript:v235];
      if (([v290 containsObject:v235] & 1) == 0)
      {
        v250 = nplog_obj();
        if (os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v251 = [v301 ingressProxy];
          v252 = (void *)v251;
          if (v251) {
            v253 = *(void **)(v251 + 24);
          }
          else {
            v253 = 0;
          }
          id v254 = v253;
          v255 = [v254 vendor];
          uint64_t v256 = [v301 egressProxy];
          v257 = (void *)v256;
          if (v256) {
            v258 = *(void **)(v256 + 24);
          }
          else {
            v258 = 0;
          }
          id v259 = v258;
          v260 = [v259 vendor];
          *(_DWORD *)v332 = 138412802;
          v333 = v235;
          __int16 v334 = 2112;
          v335 = v255;
          __int16 v336 = 2112;
          v337 = v260;
          _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_DEFAULT, "Preferred proxy path for vendor %@ (%@-%@) has been removed", v332, 0x20u);
        }
        [(NSMutableDictionary *)val->_candidatePreferredQUICProxyPaths setObject:0 forKeyedSubscript:v235];
        [(NSMutableDictionary *)val->_preferredQUICProxyPaths setObject:0 forKeyedSubscript:v235];
        id v236 = objc_loadWeakRetained((id *)&val->_delegate);
        [v236 preferredProxyAgentUnregistered:v235];
        goto LABEL_262;
      }
      if (![v301 proxyPathReady])
      {
        uint64_t v261 = [v301 ingressProxy];
        v262 = (void *)v261;
        if (v261) {
          v263 = *(void **)(v261 + 24);
        }
        else {
          v263 = 0;
        }
        id v264 = v263;

        uint64_t v265 = [v301 egressProxy];
        v266 = (void *)v265;
        if (v265) {
          v267 = *(void **)(v265 + 24);
        }
        else {
          v267 = 0;
        }
        id v268 = v267;

        v269 = [v301 ingressProxy];
        v313[0] = _NSConcreteStackBlock;
        v313[1] = 3221225472;
        v313[2] = sub_10002EFA4;
        v313[3] = &unk_100105758;
        id v236 = v264;
        id v314 = v236;
        sub_10000F740((uint64_t)v269, v313);

        v270 = [v301 egressProxy];
        v311[0] = _NSConcreteStackBlock;
        v311[1] = 3221225472;
        v311[2] = sub_10002F08C;
        v311[3] = &unk_100105758;
        id v271 = v268;
        id v312 = v271;
        sub_10000F740((uint64_t)v270, v311);

        objc_initWeak((id *)v332, val);
        v307[0] = _NSConcreteStackBlock;
        v307[1] = 3221225472;
        v307[2] = sub_10002F174;
        v307[3] = &unk_100105B08;
        id v272 = v271;
        id v308 = v272;
        objc_copyWeak(&v310, (id *)v332);
        v309 = v235;
        [v301 fetchDomainFilter:v307];
        objc_destroyWeak(&v310);

        objc_destroyWeak((id *)v332);
        goto LABEL_262;
      }
      id v236 = [(NSMutableDictionary *)val->_preferredQUICProxyPaths objectForKeyedSubscript:v235];
      if (!v236) {
        goto LABEL_249;
      }
      v237 = val->_proxyPathList;
      v238 = val->_proxyArray;
      LOBYTE(v237) = [v236 proxyPathIsValid:v238 proxyPathList:v237];

      if ((v237 & 1) == 0) {
        break;
      }
LABEL_262:

      if (v298 == (id)++v234)
      {
        id v273 = [v288 countByEnumeratingWithState:&v315 objects:v338 count:16];
        id v298 = v273;
        if (!v273)
        {
LABEL_271:

          sub_10002D694((id *)&val->super.isa);
          [(NSPPrivacyProxyAgentManager *)val updateUserEventAgentData];
          sub_10002E408((uint64_t)val);

          goto LABEL_272;
        }
        goto LABEL_235;
      }
    }
    v239 = nplog_obj();
    if (os_log_type_enabled(v239, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v240 = [v236 ingressProxy];
      v241 = (void *)v240;
      if (v240) {
        v242 = *(void **)(v240 + 24);
      }
      else {
        v242 = 0;
      }
      id v243 = v242;
      v244 = [v243 vendor];
      uint64_t v245 = [v236 egressProxy];
      v246 = (void *)v245;
      if (v245) {
        v247 = *(void **)(v245 + 24);
      }
      else {
        v247 = 0;
      }
      id v248 = v247;
      v249 = [v248 vendor];
      *(_DWORD *)v332 = 138412802;
      v333 = v235;
      __int16 v334 = 2112;
      v335 = v244;
      __int16 v336 = 2112;
      v337 = v249;
      _os_log_impl((void *)&_mh_execute_header, v239, OS_LOG_TYPE_DEFAULT, "Preferred proxy path for vendor %@ (%@-%@) is not valid", v332, 0x20u);
    }
LABEL_249:
    sub_10002ECA0((uint64_t)val, v235);
    id v236 = 0;
    goto LABEL_262;
  }
LABEL_272:
  sub_10002FABC((id *)&val->super.isa);
  sub_100030ABC((uint64_t)val);
  if (val) {
    val->_deferAgentCommit = 0;
  }
  [(NSPPrivacyProxyAgentManager *)val updateUserEventAgentData];
LABEL_275:
}

- (void)overrideProxiedContentMap:(id)a3 enabled:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  if (self) {
    overrideEnabledMaps = self->_overrideEnabledMaps;
  }
  else {
    overrideEnabledMaps = 0;
  }
  id v13 = v6;
  if ([(NSMutableArray *)overrideEnabledMaps containsObject:v6] != v4)
  {
    id v8 = v13;
    if (v4)
    {
      if (self)
      {
        id v9 = self->_overrideEnabledMaps;
        if (!v9)
        {
          id v10 = objc_alloc_init((Class)NSMutableArray);
          sub_100027454((uint64_t)self, v10);

          id v9 = self->_overrideEnabledMaps;
          id v8 = v13;
        }
      }
      else
      {
        id v12 = objc_alloc_init((Class)NSMutableArray);
        sub_100027454(0, v12);

        id v8 = v13;
        id v9 = 0;
      }
      [(NSMutableArray *)v9 addObject:v8];
    }
    else
    {
      if (self) {
        long long v11 = self->_overrideEnabledMaps;
      }
      else {
        long long v11 = 0;
      }
      [(NSMutableArray *)v11 removeObject:v13];
    }
    sub_10002FABC((id *)&self->super.isa);
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    sub_10002E408((uint64_t)self);
  }
}

- (BOOL)proxiedContentMapIsOverrideEnabled:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_overrideEnabledMaps;
  }
  return [(NSPPrivacyProxyAgentManager *)self containsObject:a3];
}

- (BOOL)disableDoHBootstrapResults
{
  if (self) {
    LOBYTE(self) = self->_disableProxiedContentDoHBootstrap;
  }
  return (char)self;
}

- (void)setProxiedContentMapDoHBootstrapEnabled:(BOOL)a3
{
  if (self)
  {
    if ((self->_disableProxiedContentDoHBootstrap ^ a3)) {
      return;
    }
    self->_BOOL disableProxiedContentDoHBootstrap = !a3;
  }
  else if (a3)
  {
    return;
  }
  sub_10002FABC((id *)&self->super.isa);
  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];

  sub_10002E408((uint64_t)self);
}

- (void)overridePreferredProxy:(id)a3
{
  id v12 = a3;
  int v4 = [(NSPPrivacyProxyAgentManager *)self overridePreferredProxy];
  unsigned __int8 v5 = [v12 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    sub_10001089C((uint64_t)self, v12);
    sub_100027484((uint64_t)self, 0);
    sub_100027494((uint64_t)self, 0);
    sub_100027464((uint64_t)self, 0);
    sub_100027474((uint64_t)self, 0);
    if (self)
    {
      id v6 = self->_proxyArray;
      id v7 = self->_resolverArray;
      id v8 = self->_proxyPathList;
      id v9 = self->_fallbackProxyPathList;
      id v10 = self->_obliviousConfigs;
      proxiedContentMaps = self->_proxiedContentMaps;
    }
    else
    {
      id v10 = 0;
      id v8 = 0;
      id v6 = 0;
      id v7 = 0;
      id v9 = 0;
      proxiedContentMaps = 0;
    }
    [(NSPPrivacyProxyAgentManager *)self updateProxyInfo:v6 resolverInfo:v7 proxyPathList:v8 fallbackProxyPathList:v9 obliviousConfigs:v10 proxiedContentMaps:proxiedContentMaps];

    sub_10002E408((uint64_t)self);
  }

  _objc_release_x1();
}

- (void)overridePreferredObliviousProxy:(id)a3
{
  id v6 = a3;
  int v4 = [(NSPPrivacyProxyAgentManager *)self overridePreferredObliviousProxy];
  unsigned __int8 v5 = [v6 isEqualToString:v4];

  if ((v5 & 1) == 0)
  {
    sub_1000090C8((uint64_t)self, v6);
    sub_100030ABC((uint64_t)self);
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    sub_10002E408((uint64_t)self);
  }
}

- (void)overrideIngressProxy:(id)a3 fallbackProxy:(id)a4 key:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxy];
  if (![v20 isEqualToString:v10]) {
    goto LABEL_6;
  }
  long long v11 = [(NSPPrivacyProxyAgentManager *)self overrideFallbackIngressProxy];
  if (([v8 isEqualToString:v11] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  id v12 = [(NSPPrivacyProxyAgentManager *)self overrideIngressProxyKey];
  unsigned __int8 v13 = [v9 isEqualToData:v12];

  if ((v13 & 1) == 0)
  {
LABEL_7:
    sub_1000108AC((uint64_t)self, v20);
    sub_10000EF6C((uint64_t)self, v8);
    sub_100027444((uint64_t)self, v9);
    sub_100027484((uint64_t)self, 0);
    sub_100027494((uint64_t)self, 0);
    sub_100027464((uint64_t)self, 0);
    sub_100027474((uint64_t)self, 0);
    if (self)
    {
      id v14 = self->_proxyArray;
      id v15 = self->_resolverArray;
      id v16 = self->_proxyPathList;
      long long v17 = self->_fallbackProxyPathList;
      id v18 = self->_obliviousConfigs;
      proxiedContentMaps = self->_proxiedContentMaps;
    }
    else
    {
      id v18 = 0;
      id v16 = 0;
      id v14 = 0;
      id v15 = 0;
      long long v17 = 0;
      proxiedContentMaps = 0;
    }
    [(NSPPrivacyProxyAgentManager *)self updateProxyInfo:v14 resolverInfo:v15 proxyPathList:v16 fallbackProxyPathList:v17 obliviousConfigs:v18 proxiedContentMaps:proxiedContentMaps];

    sub_10002E408((uint64_t)self);
  }
}

- (void)forceFallback:(BOOL)a3
{
  if (self)
  {
    self->_forceFallback = a3;
    objc_storeStrong((id *)&self->_candidateQuicProxyPath, 0);
    objc_storeStrong((id *)&self->_candidateFallbackProxyPath, 0);
    objc_storeStrong((id *)&self->_quicProxyPath, 0);
    objc_storeStrong((id *)&self->_fallbackProxyPath, 0);
    int v4 = self->_proxyArray;
    unsigned __int8 v5 = self->_resolverArray;
    id v6 = self->_proxyPathList;
    id v7 = self->_fallbackProxyPathList;
    id v8 = self->_obliviousConfigs;
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  else
  {
    id v8 = 0;
    id v6 = 0;
    int v4 = 0;
    unsigned __int8 v5 = 0;
    id v7 = 0;
    proxiedContentMaps = 0;
  }
  [(NSPPrivacyProxyAgentManager *)self updateProxyInfo:v4 resolverInfo:v5 proxyPathList:v6 fallbackProxyPathList:v7 obliviousConfigs:v8 proxiedContentMaps:proxiedContentMaps];

  sub_10002E408((uint64_t)self);
}

- (void)removeExpiredTokens
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0;
  }
  BOOL v3 = proxyTokenInfoArray;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_1000108BC(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateGeohashSharingPreference:(BOOL)a3 geohashOverride:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (!self)
  {
    if (v4) {
      goto LABEL_20;
    }
    goto LABEL_3;
  }
  if (self->_geohashSharingEnabled == v4)
  {
LABEL_3:
    id v7 = [(NSPPrivacyProxyAgentManager *)self geohashOverride];
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if (v8) {
      goto LABEL_18;
    }
    if (self) {
      goto LABEL_5;
    }
LABEL_20:
    [(NSPPrivacyProxyAgentManager *)self setGeohashOverride:v6];
    [0 updateGeohashSharing:v4];
    [0 updateGeohashSharing:v4];
    preferredQUICProxyPaths = 0;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    goto LABEL_6;
  }
LABEL_5:
  self->_BOOL geohashSharingEnabled = v4;
  [(NSPPrivacyProxyAgentManager *)self setGeohashOverride:v6];
  [(NSPProxyPath *)self->_fallbackProxyPath updateGeohashSharing:v4];
  [(NSPProxyPath *)self->_quicProxyPath updateGeohashSharing:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_6:
  long long v10 = preferredQUICProxyPaths;
  id v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        if (self) {
          id v15 = self->_preferredQUICProxyPaths;
        }
        else {
          id v15 = 0;
        }
        id v16 = -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v14), (void)v18);
        [v16 updateGeohashSharing:v4];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v17 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      id v12 = v17;
    }
    while (v17);
  }

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
LABEL_18:
}

- (void)updateConfigEpoch:(id)a3
{
  id v4 = a3;
  if (self) {
    configEpoch = self->_configEpoch;
  }
  else {
    configEpoch = 0;
  }
  if (([(NSNumber *)configEpoch isEqual:v4] & 1) == 0)
  {
    sub_100027544((uint64_t)self, v4);
    sub_100027554((uint64_t)self, 0);
    if (self)
    {
      [(NSPProxyPath *)self->_fallbackProxyPath updateConfigEpoch:v4];
      quicProxyPath = self->_quicProxyPath;
    }
    else
    {
      [0 updateConfigEpoch:v4];
      quicProxyPath = 0;
    }
    [(NSPProxyPath *)quicProxyPath updateConfigEpoch:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    if (self) {
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    }
    else {
      preferredQUICProxyPaths = 0;
    }
    unsigned __int8 v8 = preferredQUICProxyPaths;
    id v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          if (self) {
            uint64_t v13 = self->_preferredQUICProxyPaths;
          }
          else {
            uint64_t v13 = 0;
          }
          id v14 = -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *(void *)(*((void *)&v16 + 1) + 8 * (void)v12), (void)v16);
          [v14 updateConfigEpoch:v4];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v15 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        id v10 = v15;
      }
      while (v15);
    }

    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
  }
}

- (void)updateDNSFilteringHint:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSPPrivacyProxyAgentManager *)self dnsFilteringHintEnabled] != a3)
  {
    [(NSPPrivacyProxyAgentManager *)self setDnsFilteringHintEnabled:v3];
    if (self)
    {
      [(NSPFallbackProxyPath *)self->_fallbackProxyPath resetMultiHopProxyAgent];
      quicProxyPath = self->_quicProxyPath;
    }
    else
    {
      [0 resetMultiHopProxyAgent];
      quicProxyPath = 0;
    }
    [(NSPQuicProxyPath *)quicProxyPath resetMultiHopProxyAgent];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    if (self) {
      preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
    }
    else {
      preferredQUICProxyPaths = 0;
    }
    id v7 = preferredQUICProxyPaths;
    id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (self) {
            id v12 = self->_preferredQUICProxyPaths;
          }
          else {
            id v12 = 0;
          }
          uint64_t v13 = -[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
          [v13 resetMultiHopProxyAgent];

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v14 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        id v9 = v14;
      }
      while (v14);
    }

    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
  }
}

- (id)tierString
{
  if (!self || !self->_subscriber) {
    return @"FREE";
  }
  if (self->_unlimited) {
    return @"SUBSCRIBER_UNLIMITED";
  }
  return @"SUBSCRIBER";
}

- (void)tokenLowWaterMarkReached:(id)a3
{
  id v4 = (id *)a3;
  id v5 = nplog_obj();
  id v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v50 = "-[NSPPrivacyProxyAgentManager tokenLowWaterMarkReached:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v4[3];
    id v8 = [v7 vendor];
    *(_DWORD *)buf = 138412290;
    uint64_t v50 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: token cache low water mark hit", buf, 0xCu);
  }
  id v9 = v4[3];
  if ([v9 proxyHop] == 1)
  {

LABEL_7:
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100035408;
    v45[3] = &unk_100105758;
    v46 = v4;
    sub_10000F740((uint64_t)v46, v45);
    id v6 = v46;
    goto LABEL_8;
  }
  unsigned int v10 = [v4[3] proxyHop];

  if (v10 == 3) {
    goto LABEL_7;
  }
  if ([v4[3] proxyHop] != 2) {
    goto LABEL_9;
  }
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0;
  }
  if ([(NSPProxyPath *)quicProxyPath matchEgress:v4]) {
    sub_100029900((uint64_t)self, 0);
  }
  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0;
  }
  if ([(NSPProxyPath *)fallbackProxyPath matchEgress:v4]) {
    sub_10002A4A8((id *)&self->super.isa, 0);
  }
  if (self) {
    candidateQuicProxyPath = self->_candidateQuicProxyPath;
  }
  else {
    candidateQuicProxyPath = 0;
  }
  if ([(NSPCandidateProxyPath *)candidateQuicProxyPath matchEgress:v4])
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100035504;
    v43[3] = &unk_100105758;
    long long v44 = v4;
    sub_10000F740((uint64_t)v44, v43);
  }
  if (self) {
    candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
  }
  else {
    candidateFallbackProxyPath = 0;
  }
  if ([(NSPCandidateProxyPath *)candidateFallbackProxyPath matchEgress:v4])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100035600;
    v41[3] = &unk_100105758;
    long long v42 = v4;
    sub_10000F740((uint64_t)v42, v41);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  if (self) {
    candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
  }
  else {
    candidatePreferredQUICProxyPaths = 0;
  }
  long long v16 = candidatePreferredQUICProxyPaths;
  id v17 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        if (self) {
          long long v21 = self->_candidatePreferredQUICProxyPaths;
        }
        else {
          long long v21 = 0;
        }
        long long v22 = [(NSMutableDictionary *)v21 objectForKeyedSubscript:*(void *)(*((void *)&v37 + 1) + 8 * (void)v20)];
        if ([v22 matchEgress:v4])
        {
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_1000356FC;
          v35[3] = &unk_100105758;
          uint64_t v36 = v4;
          sub_10000F740((uint64_t)v36, v35);
        }
        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v23 = [(NSMutableDictionary *)v16 countByEnumeratingWithState:&v37 objects:v48 count:16];
      id v18 = v23;
    }
    while (v23);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  if (self) {
    proxiedContentPaths = self->_proxiedContentPaths;
  }
  else {
    proxiedContentPaths = 0;
  }
  id v6 = proxiedContentPaths;
  id v25 = [v6 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v31 + 1) + 8 * i) matchEgress:v4])
        {
          v29[0] = _NSConcreteStackBlock;
          v29[1] = 3221225472;
          v29[2] = sub_1000357F8;
          v29[3] = &unk_100105758;
          unint64_t v30 = v4;
          sub_10000F740((uint64_t)v30, v29);
        }
      }
      id v26 = [v6 countByEnumeratingWithState:&v31 objects:v47 count:16];
    }
    while (v26);
  }
LABEL_8:

LABEL_9:
}

- (void)tokenFetched
{
  sub_1000358F4((uint64_t)self);
  if (self)
  {
    [(NSPPrivacyProxyAgentManager *)self tokensEmpty];
  }
}

- (void)tokenAdded
{
  sub_1000358F4((uint64_t)self);
  if (self)
  {
    [(NSPPrivacyProxyAgentManager *)self tokensEmpty];
  }
}

- (void)tokensEmpty
{
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0;
  }
  id v4 = quicProxyPath;
  id v5 = [(NSPProxyPath *)v4 ingressProxy];
  if (!sub_100010F2C((uint64_t)v5))
  {

LABEL_18:
    sub_100036870((uint64_t)self);
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    return;
  }
  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0;
  }
  id v7 = [(NSPProxyPath *)fallbackProxyPath ingressProxy];
  uint64_t v8 = sub_100010F2C((uint64_t)v7);

  if (!v8) {
    goto LABEL_18;
  }
  if (self) {
    id v9 = self->_quicProxyPath;
  }
  else {
    id v9 = 0;
  }
  unsigned int v10 = [(NSPProxyPath *)v9 egressProxy];
  uint64_t v11 = sub_100010F2C((uint64_t)v10);

  if (v11)
  {
    if (self)
    {
LABEL_11:
      id v12 = self->_fallbackProxyPath;
      goto LABEL_12;
    }
LABEL_30:
    id v12 = 0;
LABEL_12:
    uint64_t v13 = [(NSPProxyPath *)v12 egressProxy];
    uint64_t v14 = sub_100010F2C((uint64_t)v13);

    if (v14)
    {
      if (self)
      {
LABEL_14:
        replenishTokenTimer = self->_replenishTokenTimer;
        if (replenishTokenTimer)
        {
          dispatch_source_cancel(replenishTokenTimer);
          long long v16 = self->_replenishTokenTimer;
          self->_replenishTokenTimer = 0;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tokenFetchActive];

        self->_BOOL reportedTokenOutage = 0;
        goto LABEL_47;
      }
      goto LABEL_40;
    }
    uint64_t v30 = sub_10002D4E4((uint64_t)self, 1);
    if (v30)
    {
      long long v31 = (id *)v30;
      if (self) {
        long long v32 = self->_fallbackProxyPath;
      }
      else {
        long long v32 = 0;
      }
      long long v33 = v32;
      uint64_t v34 = [(NSPProxyPath *)v33 ingressProxy];
      id v35 = (void *)v34;
      if (v34) {
        uint64_t v36 = *(void **)(v34 + 24);
      }
      else {
        uint64_t v36 = 0;
      }
      id v37 = v36;
      long long v38 = [v37 proxyURL];
      long long v39 = [v31[3] proxyURL];
      long long v40 = sub_10002CE28((id *)&self->super.isa, v38, v39);

      if (!v40)
      {
        sub_100036870((uint64_t)self);
        [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];

        return;
      }
      unint64_t v41 = nplog_obj();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        id v42 = v31[3];
        char v43 = [v42 vendor];
        *(_DWORD *)buf = 138412290;
        unint64_t v48 = v43;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Selected %@ egress proxy to switch Fallback proxy path", buf, 0xCu);
      }
      sub_10002A4A8((id *)&self->super.isa, v40);

      if (self) {
        goto LABEL_14;
      }
LABEL_40:
      [0 tokenFetchActive];
LABEL_47:
      [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
      return;
    }
    long long v44 = nplog_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v45 = "No egress proxy with available tokens for fallback proxy path";
      goto LABEL_45;
    }
    goto LABEL_46;
  }
  sub_10002D4E4((uint64_t)self, 0);
  v46 = (id *)objc_claimAutoreleasedReturnValue();
  if (!v46)
  {
    long long v44 = nplog_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v45 = "No egress proxy with availabe tokens for quic proxy path";
LABEL_45:
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, v45, buf, 2u);
    }
LABEL_46:

    sub_100036870((uint64_t)self);
    goto LABEL_47;
  }
  if (self) {
    id v18 = self->_quicProxyPath;
  }
  else {
    id v18 = 0;
  }
  uint64_t v19 = v18;
  uint64_t v20 = [(NSPProxyPath *)v19 ingressProxy];
  long long v21 = (void *)v20;
  if (v20) {
    long long v22 = *(void **)(v20 + 24);
  }
  else {
    long long v22 = 0;
  }
  id v23 = v22;
  long long v24 = [v23 proxyURL];
  id v25 = [v46[3] proxyURL];
  id v26 = sub_10002CB58((id *)&self->super.isa, v24, v25);

  if (v26)
  {
    uint64_t v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = v46[3];
      id v29 = [v28 vendor];
      *(_DWORD *)buf = 138412290;
      unint64_t v48 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Selected %@ egress proxy to switch QUIC proxy path", buf, 0xCu);
    }
    sub_100029900((uint64_t)self, v26);

    if (self) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
  sub_100036870((uint64_t)self);
  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (id)lastTokenOutageReason
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_lastTokenOutageReasonStats;
  }
  return self;
}

- (void)switchProxy:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4[3] proxyHop];
    id v7 = nplog_obj();
    uint64_t v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v5[3];
        unsigned int v10 = [v9 vendor];
        int v16 = 138412290;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "\"%@\": switch proxy", (uint8_t *)&v16, 0xCu);
      }
      if (self) {
        candidateQuicProxyPath = self->_candidateQuicProxyPath;
      }
      else {
        candidateQuicProxyPath = 0;
      }
      if ([(NSPCandidateProxyPath *)candidateQuicProxyPath matchEgress:v5])
      {
        sub_100027484((uint64_t)self, 0);
        sub_10002C304((id *)&self->super.isa, v5);
        sub_100029900((uint64_t)self, 0);
      }
      if (self) {
        candidateFallbackProxyPath = self->_candidateFallbackProxyPath;
      }
      else {
        candidateFallbackProxyPath = 0;
      }
      if ([(NSPCandidateProxyPath *)candidateFallbackProxyPath matchEgress:v5])
      {
        sub_100027494((uint64_t)self, 0);
        sub_10002C518((id *)&self->super.isa, v5);
        sub_10002A4A8((id *)&self->super.isa, 0);
      }
      if (self) {
        quicProxyPath = self->_quicProxyPath;
      }
      else {
        quicProxyPath = 0;
      }
      if ([(NSPProxyPath *)quicProxyPath matchEgress:v5])
      {
        sub_10002C304((id *)&self->super.isa, v5);
        sub_100029900((uint64_t)self, 0);
        sub_100037480(self, v5, 0);
      }
      if (self) {
        fallbackProxyPath = self->_fallbackProxyPath;
      }
      else {
        fallbackProxyPath = 0;
      }
      if ([(NSPProxyPath *)fallbackProxyPath matchEgress:v5])
      {
        sub_10002C518((id *)&self->super.isa, v5);
        sub_10002A4A8((id *)&self->super.isa, 0);
        sub_100037480(self, v5, 1);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        int v16 = 136315138;
        id v17 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null (proxyTokenInfo.proxyInfo.proxyHop == NSPPrivacyProxyProxyInfo_ProxyHop_EGRESS_ONLY)", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    long long v15 = nplog_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136315138;
      id v17 = "-[NSPPrivacyProxyAgentManager switchProxy:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)tokenInfoInvalid:(id)a3
{
  id v4 = (id *)a3;
  id v5 = nplog_obj();
  unsigned int v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v4[3];
      uint64_t v8 = [v7 vendor];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "\"%@\": token info invalid", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_100005D5C;
    id v18 = sub_10000F6B0;
    id v19 = (id)os_transaction_create();
    objc_initWeak(&location, self);
    id v9 = NPGetInternalQueue();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100037A70;
    v10[3] = &unk_100105B30;
    objc_copyWeak(&v13, &location);
    uint64_t v11 = v4;
    p_long long buf = &buf;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[NSPPrivacyProxyAgentManager tokenInfoInvalid:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)tokenRateLimited:(id)a3 untilDate:(double)a4
{
  unsigned int v6 = (id *)a3;
  id v7 = nplog_obj();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v6[3];
      unsigned int v10 = [v9 vendor];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: token rate limited for %f", buf, 0x16u);
    }
    sub_100027464((uint64_t)self, 0);
    sub_100027474((uint64_t)self, 0);
    sub_100027484((uint64_t)self, 0);
    sub_100027494((uint64_t)self, 0);
    sub_10002D694((id *)&self->super.isa);
    sub_1000296EC((uint64_t)self, (unint64_t)a4);
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v16 = sub_100005D5C;
    id v17 = sub_10000F6B0;
    id v18 = (id)os_transaction_create();
    objc_initWeak(&location, self);
    uint64_t v11 = NPGetInternalQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100037DC0;
    block[3] = &unk_100105B58;
    objc_copyWeak(&v13, &location);
    block[4] = buf;
    dispatch_async(v11, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NSPPrivacyProxyAgentManager tokenRateLimited:untilDate:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", buf, 0xCu);
    }
  }
}

- (void)requestAccessTokenWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v4 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  [v4 refreshCountryPlusTimezone:&stru_100105B78];

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NSPPrivacyProxyAgentManager *)self requestAccessTokenWithCompletionHandler:v5];
}

- (void)mergeTokenStats:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (self)
    {
      unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
      self->_tokenFetchSuccessCount += v4[11];
      self->_unint64_t tokenFetchFailedCount = tokenFetchFailedCount + v4[14];
      unint64_t tokenExpiredCount = self->_tokenExpiredCount;
      self->_tokenConsumedCount += v4[12];
      self->_unint64_t tokenExpiredCount = tokenExpiredCount + v4[13];
      unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
      self->_agentLowWaterMarkHitCount += v4[15];
      self->_unint64_t cacheLowWaterMarkHitCount = cacheLowWaterMarkHitCount + v4[16];
      unint64_t missingTokenCount = self->_missingTokenCount;
      self->_badTokenCount += v4[17];
      self->_unint64_t missingTokenCount = missingTokenCount + v4[18];
    }
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
  }
  else
  {
    unsigned int v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315138;
      id v12 = "-[NSPPrivacyProxyAgentManager mergeTokenStats:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "%s called with null proxyTokenInfo", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)isMultiHopProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self isMultiHopRegistered];
}

- (void)sendRTCReportWithFailureType:(int64_t)a3 errorCode:(int)a4 url:(id)a5 ingressProxy:(id)a6 egressProxy:(id)a7 tokenServer:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = nplog_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    int64_t v73 = a3;
    __int16 v74 = 1024;
    LODWORD(v75) = v11;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received RTC report request for type: %ld, errorcode: %d", buf, 0x12u);
  }

  id v19 = v17;
  uint64_t v20 = (id *)v16;
  long long v21 = (id *)v15;
  uint64_t v69 = self;
  id v70 = v14;
  uint64_t v68 = v11;
  if (self)
  {
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    [v22 setObject:@"Mosaic" forKeyedSubscript:@"eventType"];
    [v22 setObject:@"counter" forKeyedSubscript:@"type"];
    [v22 setObject:&off_10010F628 forKeyedSubscript:@"value"];
    CFStringRef v23 = @"privacy_proxy_quic_proxy_failure";
    switch(a3)
    {
      case 1000:
        goto LABEL_11;
      case 1001:
        CFStringRef v23 = @"privacy_proxy_fallback_proxy_failure";
        goto LABEL_11;
      case 1002:
        CFStringRef v23 = @"privacy_proxy_odoh_failure";
        goto LABEL_11;
      case 1003:
        [v22 setObject:@"privacy_proxy_token_fetch_failure" forKeyedSubscript:@"name"];
        long long v24 = +[NSNumber numberWithInt:v11];
        [v22 setObject:v24 forKeyedSubscript:@"label_privacy-proxy-report-reason-code"];
        int v25 = 1;
        goto LABEL_42;
      case 1004:
        CFStringRef v23 = @"privacy_proxy_configuration_fetch_failure";
        goto LABEL_11;
      case 1007:
        CFStringRef v23 = @"privacy_proxy_ohttp_failure";
        goto LABEL_11;
      default:
        CFStringRef v23 = @"privacy_proxy_unknown_failure";
LABEL_11:
        [v22 setObject:v23 forKeyedSubscript:@"name"];
        if ((int)v11 > 1199)
        {
          switch((int)v11)
          {
            case 1200:
              uint64_t v27 = 3009;
              break;
            case 1201:
              uint64_t v27 = 3013;
              break;
            case 1202:
            case 1203:
              goto LABEL_34;
            case 1204:
              uint64_t v27 = 3010;
              break;
            case 1205:
              uint64_t v27 = 3014;
              break;
            case 1206:
              uint64_t v27 = 3016;
              break;
            case 1207:
              uint64_t v27 = 3018;
              break;
            default:
              if (v11 == 1301)
              {
                uint64_t v27 = 3019;
              }
              else if (v11 == 1302)
              {
                uint64_t v27 = 3020;
              }
              else
              {
LABEL_34:
                uint64_t v27 = (int)v68;
              }
              break;
          }
        }
        else if ((int)v11 > 1099)
        {
          switch((int)v11)
          {
            case 1100:
              uint64_t v27 = 3006;
              break;
            case 1101:
              uint64_t v27 = 3005;
              break;
            case 1104:
              uint64_t v27 = 3007;
              break;
            case 1105:
              uint64_t v27 = 3008;
              break;
            case 1106:
              uint64_t v27 = 3015;
              break;
            case 1107:
              uint64_t v27 = 3017;
              break;
            default:
              goto LABEL_34;
          }
        }
        else
        {
          int v26 = v11 - 60;
          uint64_t v27 = 3001;
          switch(v26)
          {
            case 0:
              break;
            case 1:
              uint64_t v27 = 3004;
              break;
            case 4:
              uint64_t v27 = 3003;
              break;
            case 5:
              uint64_t v27 = 3002;
              break;
            default:
              goto LABEL_34;
          }
        }
        id v28 = +[NSNumber numberWithInteger:v27];
        [v22 setObject:v28 forKeyedSubscript:@"label_privacy-proxy-report-reason-code"];

        if ((unint64_t)(v27 - 3001) >= 0x14)
        {
          id v29 = strerror(v27);
          if (v29)
          {
            long long v24 = +[NSString stringWithCString:v29 encoding:4];
          }
          else
          {
            long long v24 = @"unknown";
          }
        }
        else
        {
          long long v24 = *(&off_100105C28 + v27 - 3001);
        }
        [v22 setObject:v24 forKeyedSubscript:@"label_privacy-proxy-report-reason-description"];
        int v25 = 0;
LABEL_42:

        uint64_t v30 = +[NSDate date];
        [v30 timeIntervalSince1970];
        double v32 = v31 * 1000.0;

        long long v33 = +[NSNumber numberWithDouble:v32];
        [v22 setObject:v33 forKeyedSubscript:@"label_privacy-proxy-report-time"];

        if (a3 == 1000 && v20)
        {
          uint64_t v34 = [v20[3] proxyURL];
          id v35 = +[NSURL URLWithString:v34];
          uint64_t v36 = sub_100038010(v35);

          [v22 setObject:v36 forKeyedSubscript:@"label_privacy-proxy-ingress-proxy"];
        }
        if (a3 == 1000 && v21)
        {
          id v37 = [v21[3] proxyURL];
          long long v38 = +[NSURL URLWithString:v37];
          long long v39 = sub_100038010(v38);

          [v22 setObject:v39 forKeyedSubscript:@"label_privacy-proxy-egress-proxy"];
          BOOL v40 = v19 != 0;
          goto LABEL_61;
        }
        BOOL v41 = a3 == 1001;
        if (a3 == 1001 && v20)
        {
          id v42 = [v20[3] tcpProxyFqdn];
          char v43 = +[NSURL URLWithString:v42];
          long long v44 = sub_100038010(v43);

          [v22 setObject:v44 forKeyedSubscript:@"label_privacy-proxy-ingress-proxy"];
          BOOL v41 = 1;
        }
        if (v21 && v41)
        {
          id v45 = [v21[3] tcpProxyFqdn];
          v46 = +[NSURL URLWithString:v45];
          id v47 = sub_100038010(v46);

          [v22 setObject:v47 forKeyedSubscript:@"label_privacy-proxy-egress-proxy"];
        }
        BOOL v40 = v19 != 0;
        if (a3 == 1002 && v19)
        {
          unint64_t v48 = +[NSURL URLWithString:v19];
          unint64_t v49 = sub_100038010(v48);

          [v22 setObject:v49 forKeyedSubscript:@"label_privacy-proxy-odoh-resolver"];
LABEL_60:
          BOOL v40 = 1;
          goto LABEL_61;
        }
        if (a3 == 1007 && v19)
        {
          [v22 setObject:v19 forKeyedSubscript:@"label_privacy-proxy-ohttp-relay"];
          goto LABEL_60;
        }
LABEL_61:
        uint64_t v50 = v70;
        if ((v25 & v40) == 1)
        {
          uint64_t v51 = +[NSURL URLWithString:v19];
          BOOL v52 = sub_100038010(v51);

          [v22 setObject:v52 forKeyedSubscript:@"label_privacy-proxy-token-fetch-failure-proxy"];
          if (v70)
          {
            id v53 = +[NSURL URLWithString:v70];
            long long v54 = [v53 host];

            uint64_t v50 = v70;
            if (v54)
            {
              uint64_t v50 = sub_100038010(v53);
            }
            [v22 setObject:v50 forKeyedSubscript:@"label_privacy-proxy-token-fetch-server"
          }
          else
          {
            uint64_t v50 = 0;
          }
        }
        long long v55 = [(NSPPrivacyProxyAgentManager *)v69 tierString];
        if (v55) {
          [v22 setObject:v55 forKeyedSubscript:@"label_privacy-proxy-tier-type"];
        }
        long long v56 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
        long long v57 = [v56 currentCountryPlusTimezone];

        if (v57) {
          [v22 setObject:v57 forKeyedSubscript:@"label_privacy-proxy-report-region"];
        }

        unsigned __int8 v58 = v70;
        break;
    }
  }
  else
  {
    id v22 = 0;
    unsigned __int8 v58 = v70;
    uint64_t v50 = v70;
  }

  if (v22)
  {
    v78[0] = kRTCReportingSessionInfoClientType;
    v78[1] = kRTCReportingSessionInfoClientVersion;
    v79[0] = &off_10010F640;
    v79[1] = &off_10010F628;
    v78[2] = kRTCReportingSessionInfoSessionID;
    v78[3] = kRTCReportingSessionInfoBatchEvent;
    v79[2] = &off_10010F610;
    v79[3] = &__kCFBooleanFalse;
    v78[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v79[4] = &__kCFBooleanTrue;
    long long v59 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:5];
    long long v60 = @"network-service-proxy-free";
    if (v69)
    {
      if ((unint64_t)(a3 - 1000) > 7) {
        CFStringRef v61 = @"privacy-proxy-unknown-failure";
      }
      else {
        CFStringRef v61 = *(&off_100105CC8 + a3 - 1000);
      }
      if (v69->_subscriber) {
        long long v60 = @"network-service-proxy-subscriber";
      }
    }
    else
    {
      CFStringRef v61 = 0;
    }
    id v62 = v60;
    v76[0] = kRTCReportingUserInfoClientName;
    v76[1] = kRTCReportingUserInfoServiceName;
    v77[0] = v62;
    v77[1] = v61;
    uint64_t v63 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
    id v71 = 0;
    unsigned __int8 v64 = +[RTCReporting sendOneMessageWithSessionInfo:v59 userInfo:v63 category:(unsigned __int16)a3 type:0 payload:v22 error:&v71];
    id v65 = v71;
    id v66 = nplog_obj();
    v67 = v66;
    if (v64)
    {
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        int64_t v73 = (int64_t)v22;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "sent RTC report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218242;
      int64_t v73 = a3;
      __int16 v74 = 2112;
      id v75 = v65;
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }
  }
  else
  {
    long long v59 = nplog_obj();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      int64_t v73 = a3;
      __int16 v74 = 1024;
      LODWORD(v75) = v68;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for type [%ld], error code [%d]", buf, 0x12u);
    }
  }
}

- (void)sendRTCReportForServiceOutage:(id)a3
{
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 outageReasonType];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v59 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received RTC report request with service outage stats: %@", buf, 0xCu);
  }
  id v7 = v4;
  uint64_t v8 = v7;
  if (!self || !v7)
  {

    goto LABEL_86;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  [v9 setObject:@"Mosaic" forKeyedSubscript:@"eventType"];
  [v9 setObject:@"counter" forKeyedSubscript:@"type"];
  [v9 setObject:&off_10010F628 forKeyedSubscript:@"value"];
  [v9 setObject:@"privacy_proxy_outage_notification" forKeyedSubscript:@"name"];
  unsigned int v10 = [v8 outageReasonType];

  if (v10)
  {
    id v11 = [v8 outageReasonType];
    if ([v11 isEqual:@"Token"])
    {
      uint64_t v12 = 4001;
    }
    else if ([v11 isEqual:@"Captive"])
    {
      uint64_t v12 = 4002;
    }
    else if ([v11 isEqual:@"Proxy"])
    {
      uint64_t v12 = 4003;
    }
    else if ([v11 isEqual:@"DNS"])
    {
      uint64_t v12 = 4004;
    }
    else
    {
      uint64_t v12 = 4000;
    }

    id v13 = +[NSNumber numberWithInteger:v12];
    [v9 setObject:v13 forKeyedSubscript:@"label_privacy-proxy-report-reason-code"];
  }
  else
  {
    uint64_t v12 = 4000;
  }
  id v14 = [v8 outageReasonSubType];

  if (v14)
  {
    id v15 = [v8 outageReasonSubType];
    if ([v15 isEqual:@"TokenFetchFailure"])
    {
      id v16 = @"private_relay_proxy_token_fetch_failure";
    }
    else if ([v15 isEqual:@"CaptiveProbeTimeout"])
    {
      id v16 = @"private_relay_proxy_captive_probe_time_out";
    }
    else if ([v15 isEqual:@"CaptiveProbeRedirected"])
    {
      id v16 = @"private_relay_proxy_captive_probe_redirect";
    }
    else if ([v15 isEqual:@"ProxyConnectionTimeout"])
    {
      id v16 = @"private_relay_proxy_connection_time_out";
    }
    else if ([v15 isEqual:@"ProxyConnectionRefused"])
    {
      id v16 = @"private_relay_proxy_connection_refused";
    }
    else if ([v15 isEqual:@"ProxyConnectionDNSTimeout"])
    {
      id v16 = @"private_relay_proxy_dns_time_out";
    }
    else if ([v15 isEqual:@"ProxyPrimaryEgressError"])
    {
      id v16 = @"private_relay_proxy_primary_egress_failure";
    }
    else if ([v15 isEqual:@"ProxyFallbackEgressError"])
    {
      id v16 = @"private_relay_proxy_fallback_egress_failure";
    }
    else if ([v15 isEqual:@"ProxyPrimaryOriginError"])
    {
      id v16 = @"private_relay_proxy_primary_origin_failure";
    }
    else if ([v15 isEqual:@"ProxyFallbackOriginError"])
    {
      id v16 = @"private_relay_proxy_fallback_origin_failure";
    }
    else if ([v15 isEqual:@"ProxyProbeRedirected"])
    {
      id v16 = @"private_relay_proxy_probe_redirect";
    }
    else if ([v15 isEqual:@"ProxyProbeTCPConnected"])
    {
      id v16 = @"private_relay_proxy_probe_tcp_connected";
    }
    else if ([v15 isEqual:@"ProxyProbeServerError"])
    {
      id v16 = @"private_relay_proxy_probe_server_failure";
    }
    else if ([v15 isEqual:@"ProxyProbeForbidden"])
    {
      id v16 = @"private_relay_proxy_probe_forbidden";
    }
    else if ([v15 isEqual:@"ProxyCertError"])
    {
      id v16 = @"private_relay_proxy_cert_error";
    }
    else if ([v15 isEqual:@"ProxyConnectionDNSError"])
    {
      id v16 = @"private_relay_proxy_dns_error";
    }
    else if ([v15 isEqual:@"ProxyError"])
    {
      id v16 = @"private_relay_proxy_failure";
    }
    else if ([v15 isEqual:@"ProxyPrimaryEgressUnavailableError"])
    {
      id v16 = @"private_relay_proxy_primary_egress_unavailable_failure";
    }
    else if ([v15 isEqual:@"ProxyFallbackEgressUnavailableError"])
    {
      id v16 = @"private_relay_proxy_fallback_egress_unavailable_failure";
    }
    else if ([v15 isEqual:@"ODoHAuthFailure"])
    {
      id v16 = @"private_relay_proxy_odoh_auth_failure";
    }
    else if ([v15 isEqual:@"ODoHBadMessage"])
    {
      id v16 = @"private_relay_proxy_odoh_bad_message";
    }
    else
    {
      id v16 = @"unknown";
    }

    id v17 = v16;
    [v9 setObject:v17 forKeyedSubscript:@"label_privacy-proxy-report-reason-description"];
  }
  id v18 = +[NSDate date];
  [v18 timeIntervalSince1970];
  double v20 = v19 * 1000.0;

  long long v21 = +[NSNumber numberWithDouble:v20];
  [v9 setObject:v21 forKeyedSubscript:@"label_privacy-proxy-report-time"];

  switch(v12)
  {
    case 4001:
      BOOL v40 = [v8 tokenProxy];

      if (!v40) {
        break;
      }
      BOOL v41 = [v8 tokenProxy];
      id v42 = +[NSURL URLWithString:v41];
      uint64_t v36 = sub_100038010(v42);

      CFStringRef v43 = @"label_privacy-proxy-token-fetch-server";
LABEL_76:
      [v9 setObject:v36 forKeyedSubscript:v43];
      goto LABEL_77;
    case 4004:
      long long v44 = [v8 odohProxy];

      if (!v44) {
        break;
      }
      id v45 = [v8 odohProxy];
      v46 = +[NSURL URLWithString:v45];
      uint64_t v36 = sub_100038010(v46);

      CFStringRef v43 = @"label_privacy-proxy-odoh-resolver";
      goto LABEL_76;
    case 4003:
      uint64_t v22 = [v8 primaryIngressProxy];
      if (v22)
      {
        CFStringRef v23 = (void *)v22;
        long long v24 = [v8 primaryEgressProxy];

        if (v24)
        {
          int v25 = [v8 primaryIngressProxy];
          int v26 = +[NSURL URLWithString:v25];
          uint64_t v27 = sub_100038010(v26);

          id v28 = [v8 primaryEgressProxy];
          id v29 = +[NSURL URLWithString:v28];
          uint64_t v30 = sub_100038010(v29);

          [v9 setObject:v27 forKeyedSubscript:@"label_privacy-proxy-ingress-proxy"];
          [v9 setObject:v30 forKeyedSubscript:@"label_privacy-proxy-egress-proxy"];
        }
      }
      uint64_t v31 = [v8 fallbackIngressProxy];
      if (v31)
      {
        double v32 = (void *)v31;
        long long v33 = [v8 fallbackEgressProxy];

        if (v33)
        {
          uint64_t v34 = [v8 fallbackIngressProxy];
          id v35 = +[NSURL URLWithString:v34];
          uint64_t v36 = sub_100038010(v35);

          id v37 = [v8 fallbackEgressProxy];
          long long v38 = +[NSURL URLWithString:v37];
          long long v39 = sub_100038010(v38);

          [v9 setObject:v36 forKeyedSubscript:@"label_privacy-proxy-fallback-ingress-proxy"];
          [v9 setObject:v39 forKeyedSubscript:@"label_privacy-proxy-fallback-egress-proxy"];

LABEL_77:
        }
      }
      break;
  }
  id v47 = [(NSPPrivacyProxyAgentManager *)self tierString];
  if (v47) {
    [v9 setObject:v47 forKeyedSubscript:@"label_privacy-proxy-tier-type"];
  }
  unint64_t v48 = +[NSPPrivacyProxyLocationMonitor sharedMonitor];
  unint64_t v49 = [v48 currentCountryPlusTimezone];

  if (v49) {
    [v9 setObject:v49 forKeyedSubscript:@"label_privacy-proxy-report-region"];
  }

  if (v9)
  {
    v64[0] = kRTCReportingSessionInfoClientType;
    v64[1] = kRTCReportingSessionInfoClientVersion;
    v65[0] = &off_10010F640;
    v65[1] = &off_10010F628;
    v64[2] = kRTCReportingSessionInfoSessionID;
    v64[3] = kRTCReportingSessionInfoBatchEvent;
    v65[2] = &off_10010F610;
    v65[3] = &__kCFBooleanFalse;
    v64[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v65[4] = &__kCFBooleanTrue;
    uint64_t v50 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:5];
    v62[0] = kRTCReportingUserInfoClientName;
    v62[1] = kRTCReportingUserInfoServiceName;
    v63[0] = @"network-service-proxy";
    v63[1] = @"privacy-proxy-outage-notification";
    uint64_t v51 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    id v57 = 0;
    unsigned __int8 v52 = +[RTCReporting sendOneMessageWithSessionInfo:v50 userInfo:v51 category:1005 type:0 payload:v9 error:&v57];
    id v53 = v57;
    long long v54 = nplog_obj();
    long long v55 = v54;
    if (v52)
    {
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v59 = (uint64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "sent service outage RTC report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v59 = 1005;
      __int16 v60 = 2112;
      id v61 = v53;
      _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }

    goto LABEL_92;
  }
LABEL_86:
  uint64_t v50 = nplog_obj();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    long long v56 = [v8 outageReasonType];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v59 = (uint64_t)v56;
    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for service outage type %@", buf, 0xCu);
  }
  id v9 = 0;
LABEL_92:
}

- (BOOL)proxyInfo:(id)a3 matchesProxyIndex:(unint64_t)a4
{
  id v6 = a3;
  if (self) {
    proxyArray = self->_proxyArray;
  }
  else {
    proxyArray = 0;
  }
  if ([(NSArray *)proxyArray count] <= a4)
  {
    unsigned __int8 v12 = 0;
  }
  else
  {
    if (self) {
      uint64_t v8 = self->_proxyArray;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = [(NSArray *)v8 objectAtIndex:a4];
    unsigned int v10 = [v9 proxyURL];
    id v11 = [v6 proxyURL];
    unsigned __int8 v12 = [v10 isEqualToString:v11];
  }
  return v12;
}

- (void)sendRTCReportForPrivacyProxyToggleState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v20) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received RTC report request for toggle state: %u", buf, 8u);
  }

  if (!self) {
    goto LABEL_8;
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObject:@"Mosaic" forKeyedSubscript:@"eventType"];
  [v6 setObject:@"counter" forKeyedSubscript:@"type"];
  [v6 setObject:&off_10010F628 forKeyedSubscript:@"value"];
  [v6 setObject:@"privacy_proxy_toggle_state" forKeyedSubscript:@"name"];
  id v7 = +[NSNumber numberWithBool:v3];
  [v6 setObject:v7 forKeyedSubscript:@"label_privacy-proxy-toggle-state"];

  uint64_t v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  double v10 = v9 * 1000.0;

  id v11 = +[NSNumber numberWithDouble:v10];
  [v6 setObject:v11 forKeyedSubscript:@"label_privacy-proxy-report-time"];

  if (v6)
  {
    v25[0] = kRTCReportingSessionInfoClientType;
    v25[1] = kRTCReportingSessionInfoClientVersion;
    v26[0] = &off_10010F640;
    v26[1] = &off_10010F628;
    v25[2] = kRTCReportingSessionInfoSessionID;
    v25[3] = kRTCReportingSessionInfoBatchEvent;
    v26[2] = &off_10010F610;
    v26[3] = &__kCFBooleanFalse;
    v25[4] = kRTCReportingSessionInfoContainsRealtimeEvents;
    v26[4] = &__kCFBooleanTrue;
    unsigned __int8 v12 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
    v23[0] = kRTCReportingUserInfoClientName;
    v23[1] = kRTCReportingUserInfoServiceName;
    v24[0] = @"network-service-proxy";
    v24[1] = @"privacy-proxy-toggle";
    id v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    id v18 = 0;
    unsigned __int8 v14 = +[RTCReporting sendOneMessageWithSessionInfo:v12 userInfo:v13 category:1006 type:0 payload:v6 error:&v18];
    id v15 = v18;
    id v16 = nplog_obj();
    id v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = (uint64_t)v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "sent privacy proxy toggle report %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v20 = 1006;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "failed to send RTC report type: %ld error: %@", buf, 0x16u);
    }
  }
  else
  {
LABEL_8:
    unsigned __int8 v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to create RTC report payload for toggle state", buf, 2u);
    }
    id v6 = 0;
  }
}

- (BOOL)isSingleHopProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self isSingleHopRegistered];
}

- (BOOL)isMultiHopFallbackProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self isMultiHopRegistered];
}

- (BOOL)isSingleHopFallbackProxyAgentRegistered
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self isSingleHopRegistered];
}

- (void)multiHopAgentRegistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v5 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      goto LABEL_5;
    }
    goto LABEL_64;
  }
  if (self->_quicProxyPath == v4)
  {
LABEL_64:
    id v42 = nplog_obj();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "quic proxy path, multi hop agent registered", buf, 2u);
    }

    if (self) {
      id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [(NSMutableDictionary *)WeakRetained multiHopProxyAgentRegistered:1];
    goto LABEL_69;
  }
  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    id v7 = preferredQUICProxyPaths;
    id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v50;
      *(void *)&long long v9 = 138412290;
      long long v43 = v9;
      p_isa = (id *)&v7->super.super.isa;
      do
      {
        unsigned __int8 v12 = 0;
        do
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v49 + 1) + 8 * (void)v12);
          if (self) {
            unsigned __int8 v14 = self->_preferredQUICProxyPaths;
          }
          else {
            unsigned __int8 v14 = 0;
          }
          -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *(void *)(*((void *)&v49 + 1) + 8 * (void)v12), v43);
          id v15 = (NSPQuicProxyPath *)objc_claimAutoreleasedReturnValue();

          if (v15 == v5)
          {
            if (self) {
              candidatePreferredQUICProxyPaths = self->_candidatePreferredQUICProxyPaths;
            }
            else {
              candidatePreferredQUICProxyPaths = 0;
            }
            id v17 = [(NSMutableDictionary *)candidatePreferredQUICProxyPaths objectForKeyedSubscript:v13];
            id v18 = [v17 preferredPathPatterns];
            id v19 = [v18 count];

            if (v19)
            {
              if (self) {
                quicProxyPath = self->_quicProxyPath;
              }
              else {
                quicProxyPath = 0;
              }
              [(NSPQuicProxyPath *)quicProxyPath resetMultiHopProxyAgent];
            }
            __int16 v21 = [v17 domainFilter];
            if (v21)
            {
              id v22 = nplog_obj();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = v43;
                uint64_t v55 = v13;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Preferred QUIC proxy path for \"%@\", multi hop agent registered", buf, 0xCu);
              }

              if (self) {
                id v23 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v23 = 0;
              }
              long long v24 = [(NSPProxyPath *)v5 nonDefaultAgentUUID];
              [v23 preferredProxyAgentRegistered:v13 agentUUID:v24 domainFilter:v21];

              id v7 = (NSMutableDictionary *)p_isa;
            }
          }
          unsigned __int8 v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v25 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v56 count:16];
        id v10 = v25;
      }
      while (v25);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    if (self) {
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0;
    }
    id WeakRetained = networkSpecificQUICProxyPaths;
    id v28 = [(NSMutableDictionary *)WeakRetained countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v46;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(WeakRetained);
          }
          uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v31);
          if (self) {
            long long v33 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            long long v33 = 0;
          }
          uint64_t v34 = [(NSMutableDictionary *)v33 objectForKey:*(void *)(*((void *)&v45 + 1) + 8 * (void)v31)];
          id v35 = (void *)v34;
          if (v34) {
            BOOL v36 = v34 == (void)v5;
          }
          else {
            BOOL v36 = 0;
          }
          if (v36)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v37 = nplog_obj();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)long long buf = 0;
                _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Network discovered QUIC proxy path registered", buf, 2u);
              }

              if (self) {
                id v38 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v38 = 0;
              }
              long long v39 = [(NSPProxyPath *)v5 nonDefaultAgentUUID];
              [v38 networkDiscoveredProxyPaths:v32 registeredForAgentUUID:v39];
            }
          }

          uint64_t v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v40 = [(NSMutableDictionary *)WeakRetained countByEnumeratingWithState:&v45 objects:v53 count:16];
        id v29 = v40;
      }
      while (v40);
    }
    goto LABEL_69;
  }
  BOOL v41 = nplog_obj();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "fallback proxy path, multi hop agent registered", buf, 2u);
  }

  id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  [(NSMutableDictionary *)WeakRetained multiHopFallbackProxyAgentRegistered:1];
LABEL_69:
}

- (void)singleHopAgentRegistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v5 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }
LABEL_12:
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "quic proxy path, single hop agent registered", buf, 2u);
    }

    if (self) {
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    [(NSPPrivacyProxyAgentManager *)self singleHopProxyAgentRegistered:1];
    goto LABEL_17;
  }
  if (!v4) {
    goto LABEL_12;
  }
  fallbackProxyPath = 0;
LABEL_4:
  if (fallbackProxyPath == (NSPFallbackProxyPath *)v4)
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fallback proxy path, single hop agent registered", v9, 2u);
    }

    if (self) {
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    [(NSPPrivacyProxyAgentManager *)self singleHopFallbackProxyAgentRegistered:1];
LABEL_17:
  }
}

- (void)obliviousHopAgentRegistered:(id)a3 hostname:(id)a4 processes:(id)a5 agentUUID:(id)a6
{
  id v11 = a4;
  id v9 = a5;
  id v10 = a6;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NSPPrivacyProxyAgentManager *)self obliviousHopAgentRegisteredForHostname:v11 processes:v9 agentUUID:v10];
}

- (BOOL)configurationFetchDateIsWithinStart:(id)a3 end:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  BOOL v8 = [(NSPPrivacyProxyAgentManager *)self configurationFetchDateIsWithinStart:v6 end:v7];

  return v8;
}

- (void)proxiedContentAgentRegistered:(id)a3
{
  id v7 = a3;
  id v4 = [v7 resolverAgentUUID];
  if (v4) {
    [v7 resolverAgentUUID];
  }
  else {
  id v5 = [v7 quicAgentUUID];
  }

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  id v6 = [v7 associatedMaps];
  [(NSPPrivacyProxyAgentManager *)self proxiedContentMaps:v6 registeredForAgentUUID:v5];
}

- (void)multiHopAgentUnregistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v5 = v4;
  if (!self)
  {
    if (v4)
    {
      preferredQUICProxyPaths = 0;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      goto LABEL_5;
    }
    goto LABEL_57;
  }
  if (self->_quicProxyPath == v4)
  {
LABEL_57:
    long long v39 = nplog_obj();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "quic proxy path, multihop agent unregistered", buf, 2u);
    }

    if (self) {
      id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    else {
      id WeakRetained = 0;
    }
    [(NSMutableDictionary *)WeakRetained multiHopProxyAgentRegistered:0];
    goto LABEL_62;
  }
  if ((NSPQuicProxyPath *)self->_fallbackProxyPath != v4)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
LABEL_5:
    id v7 = preferredQUICProxyPaths;
    id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v47;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v47 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v11);
          if (self) {
            uint64_t v13 = self->_preferredQUICProxyPaths;
          }
          else {
            uint64_t v13 = 0;
          }
          unsigned __int8 v14 = [(NSMutableDictionary *)v13 objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * (void)v11)];

          if (v14 == v5)
          {
            id v15 = nplog_obj();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              long long v52 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Preferred QUIC proxy path for \"%@\", multi hop agent unregistered", buf, 0xCu);
            }

            if (self) {
              id v16 = objc_loadWeakRetained((id *)&self->_delegate);
            }
            else {
              id v16 = 0;
            }
            [v16 preferredProxyAgentUnregistered:v12];
          }
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v17 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
        id v9 = v17;
      }
      while (v17);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    if (self) {
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
    }
    else {
      networkSpecificQUICProxyPaths = 0;
    }
    id WeakRetained = networkSpecificQUICProxyPaths;
    id v20 = [(NSMutableDictionary *)WeakRetained countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v43;
      uint64_t v40 = *(void *)v43;
      BOOL v41 = WeakRetained;
      do
      {
        id v23 = 0;
        do
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(WeakRetained);
          }
          uint64_t v24 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v23);
          if (self) {
            id v25 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            id v25 = 0;
          }
          uint64_t v26 = [(NSMutableDictionary *)v25 objectForKey:*(void *)(*((void *)&v42 + 1) + 8 * (void)v23)];
          uint64_t v27 = (void *)v26;
          if (v26) {
            BOOL v28 = v26 == (void)v5;
          }
          else {
            BOOL v28 = 0;
          }
          if (v28)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v29 = [(NSPProxyPath *)v5 ingressProxy];
              uint64_t v30 = (void *)v29;
              if (v29) {
                uint64_t v31 = *(void **)(v29 + 24);
              }
              else {
                uint64_t v31 = 0;
              }
              id v32 = v31;
              long long v33 = [v32 vendor];
              uint64_t v34 = +[NSString stringWithFormat:@"Agent_%@_%@", v24, v33];

              id v35 = nplog_obj();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                long long v52 = v34;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Network Discovered QUIC proxy path for \"%@\", multi hop agent unregistered", buf, 0xCu);
              }

              uint64_t v22 = v40;
              id WeakRetained = v41;
              if (self) {
                id v36 = objc_loadWeakRetained((id *)&self->_delegate);
              }
              else {
                id v36 = 0;
              }
              [v36 preferredProxyAgentUnregistered:v34];
            }
          }

          id v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v37 = [(NSMutableDictionary *)WeakRetained countByEnumeratingWithState:&v42 objects:v50 count:16];
        id v21 = v37;
      }
      while (v37);
    }
    goto LABEL_62;
  }
  id v38 = nplog_obj();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "fallback proxy path, multihop agent unregistered", buf, 2u);
  }

  id WeakRetained = (NSMutableDictionary *)objc_loadWeakRetained((id *)&self->_delegate);
  [(NSMutableDictionary *)WeakRetained multiHopFallbackProxyAgentRegistered:0];
LABEL_62:
}

- (void)singleHopAgentUnregistered:(id)a3
{
  id v4 = (NSPQuicProxyPath *)a3;
  id v5 = v4;
  if (self)
  {
    if (self->_quicProxyPath != v4)
    {
      fallbackProxyPath = self->_fallbackProxyPath;
      goto LABEL_4;
    }
LABEL_12:
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "quic proxy path, single hop agent unregistered", buf, 2u);
    }

    if (self) {
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    [(NSPPrivacyProxyAgentManager *)self singleHopProxyAgentRegistered:0];
    goto LABEL_17;
  }
  if (!v4) {
    goto LABEL_12;
  }
  fallbackProxyPath = 0;
LABEL_4:
  if (fallbackProxyPath == (NSPFallbackProxyPath *)v4)
  {
    id v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "fallback proxy path, single hop agent unregistered", v9, 2u);
    }

    if (self) {
      self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
    }
    [(NSPPrivacyProxyAgentManager *)self singleHopFallbackProxyAgentRegistered:0];
LABEL_17:
  }
}

- (void)obliviousHopAgentUnregistered:(id)a3 hostname:(id)a4 agentUUID:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NSPPrivacyProxyAgentManager *)self obliviousHopAgentUnregisteredForHostname:v8 agentUUID:v7];
}

- (void)proxiedContentAgentUnregistered:(id)a3
{
  id v4 = a3;
  id v5 = [v4 resolverAgentUUID];
  if (v5) {
    [v4 resolverAgentUUID];
  }
  else {
  id v6 = [v4 quicAgentUUID];
  }

  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NSPPrivacyProxyAgentManager *)self proxiedContentMapsUnregisteredForAgentUUID:v6];
}

- (void)reportProxySuccessOnInterface:(id)a3 proxyPath:(id)a4
{
  id v12 = a3;
  id v6 = (NSPFallbackProxyPath *)a4;
  id v7 = v6;
  if (self)
  {
    if (self->_probingReason == 2)
    {
      sub_10002B3BC((uint64_t)self);
      [(NSPProxyPath *)self->_quicProxyPath resetError];
      [(NSPProxyPath *)self->_fallbackProxyPath resetError];
    }
    if ((NSPFallbackProxyPath *)self->_quicProxyPath != v7)
    {
      if (self->_fallbackProxyPath != v7)
      {
LABEL_12:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        goto LABEL_13;
      }
      id v8 = self->_toggleStats;
      id v9 = [(NSPToggleStats *)v8 fallbackPathStatistics];
      if (!v9)
      {

        goto LABEL_12;
      }
      goto LABEL_10;
    }
    toggleStats = self->_toggleStats;
  }
  else
  {
    toggleStats = 0;
    id WeakRetained = 0;
    if (v6) {
      goto LABEL_13;
    }
  }
  id v8 = toggleStats;
  id v9 = [(NSPToggleStats *)v8 primaryPathStatistics];
  if (v9) {
LABEL_10:
  }
    ++v9[2];

  if (self) {
    goto LABEL_12;
  }
  id WeakRetained = 0;
LABEL_13:
  [WeakRetained reportPrivacyProxySuccessOnInterface:v12];

  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (id)lastProxyOutageReason
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_lastProxyOutageReasonStats;
  }
  return self;
}

- (void)reportObliviousPathError:(int)a3 interface:(id)a4 obliviousPath:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v48 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v6)
  {
    uint64_t v10 = [v8 proxyInfo];
    id v11 = v10;
    if (v10) {
      uint64_t v10 = (void *)v10[3];
    }
    id v12 = [v10 proxyURL];
    uint64_t v13 = +[NSURL URLWithString:v12];

    id v14 = objc_alloc_init((Class)NSURLComponents);
    id v15 = [v13 scheme];
    [v14 setScheme:v15];

    id v16 = [v13 host];
    [v14 setHost:v16];

    id v17 = [v13 port];
    [v14 setPort:v17];

    id v18 = [v9 obliviousTarget];
    id v19 = [v18 proxyURLPath];
    [v14 setPath:v19];

    id v20 = [v14 URL];
    id v21 = [v20 absoluteString];
    [(NSPPrivacyProxyAgentManager *)self sendRTCReportWithFailureType:1007 errorCode:v6 url:v21 ingressProxy:0 egressProxy:0 tokenServer:0];

    if ((int)v6 > 60)
    {
      if ((int)v6 > 1105)
      {
        switch(v6)
        {
          case 0x452:
            uint64_t v22 = [v9 statistics];
            if (v22) {
              ++v22[10];
            }
            goto LABEL_41;
          case 0x515:
            uint64_t v22 = [v9 statistics];
            if (v22) {
              ++v22[14];
            }
            goto LABEL_41;
          case 0x516:
            uint64_t v22 = [v9 statistics];
            if (v22) {
              ++v22[15];
            }
            goto LABEL_41;
        }
      }
      else
      {
        if (v6 == 61)
        {
          uint64_t v22 = [v9 statistics];
          if (v22) {
            ++v22[4];
          }
          goto LABEL_41;
        }
        if (v6 == 80 || v6 == 1104)
        {
          uint64_t v24 = [v9 statistics];
          if (v24) {
            ++v24[7];
          }

          id v25 = [v9 statistics];
          if (v25)
          {
            unint64_t v26 = v25[7];

            if (v26 >= 2)
            {
              if (self)
              {
                uint64_t v27 = [(NWPath *)self->_path interface];
                objc_storeStrong((id *)&self->_proberInterface, v27);

                proberInterface = self->_proberInterface;
              }
              else
              {
                [0 interface];

                proberInterface = 0;
              }
              sub_10003AB34((uint64_t)self, proberInterface, 6);
            }
          }
          goto LABEL_42;
        }
      }
    }
    else
    {
      if ((v6 + 65568) <= 0x1E)
      {
        if (((1 << (v6 + 32)) & 0x4004C000) != 0)
        {
          uint64_t v22 = [v9 statistics];
          if (v22) {
            ++v22[9];
          }
LABEL_41:

LABEL_42:
          goto LABEL_43;
        }
        if (v6 == -65568)
        {
          uint64_t v22 = [v9 statistics];
          if (v22) {
            ++v22[8];
          }
          goto LABEL_41;
        }
      }
      if (v6 == 60)
      {
        uint64_t v22 = [v9 statistics];
        if (v22) {
          ++v22[3];
        }
        goto LABEL_41;
      }
    }
    uint64_t v22 = [v9 statistics];
    if (v22) {
      ++v22[7];
    }
    goto LABEL_41;
  }
  uint64_t v23 = [v8 statistics];
  uint64_t v13 = (void *)v23;
  if (v23) {
    ++*(void *)(v23 + 16);
  }
LABEL_43:

  if ([v9 shouldBePenalized])
  {
    id v29 = v9;
    uint64_t v30 = v29;
    if (self)
    {
      if (v29)
      {
        NSUInteger v31 = [(NSArray *)self->_proxyArray count];
        if (v31)
        {
          NSUInteger v32 = v31;
          NSUInteger v33 = 0;
          NSUInteger v34 = 0;
          while (1)
          {
            id v35 = [(NSArray *)self->_proxyArray objectAtIndex:v33];
            id v36 = [v35 proxyURL];
            id v37 = [v30 proxyInfo];
            id v38 = v37;
            if (v37) {
              id v37 = (void *)v37[3];
            }
            long long v39 = [v37 proxyURL];
            unsigned __int8 v40 = [v36 isEqualToString:v39];

            if (v40) {
              break;
            }
            NSUInteger v33 = (v34 + 1);
            NSUInteger v34 = v33;
            if (v32 <= v33) {
              goto LABEL_58;
            }
          }
          BOOL v41 = nplog_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            long long v42 = [v30 shortName];
            *(_DWORD *)long long buf = 138412290;
            long long v50 = v42;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Penalizing oblivious path %@", buf, 0xCu);
          }
          penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          if (!penalizedObliviousProxyIndices)
          {
            long long v44 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
            long long v45 = self->_penalizedObliviousProxyIndices;
            self->_penalizedObliviousProxyIndices = v44;

            penalizedObliviousProxyIndices = self->_penalizedObliviousProxyIndices;
          }
          long long v46 = penalizedObliviousProxyIndices;
          long long v47 = +[NSNumber numberWithUnsignedInt:v34];
          [(NSMutableArray *)v46 addObject:v47];

          sub_100030ABC((uint64_t)self);
        }
      }
    }
LABEL_58:
  }
}

- (void)reportProxiedContentPathError:(int)a3 interface:(id)a4 proxiedContentPath:(id)a5 registration:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v18 = a4;
  id v10 = a5;
  id v11 = a6;
  if (v8)
  {
    id v12 = [v10 quicRegistration];

    if (v12 == v11)
    {
      id v14 = [v10 ingressProxy];
      id v15 = [v10 egressProxy];
      id v16 = self;
      uint64_t v17 = 1000;
    }
    else
    {
      id v13 = [v10 fallbackRegistration];

      if (v13 != v11) {
        goto LABEL_7;
      }
      id v14 = [v10 ingressProxy];
      id v15 = [v10 egressProxy];
      id v16 = self;
      uint64_t v17 = 1001;
    }
    [(NSPPrivacyProxyAgentManager *)v16 sendRTCReportWithFailureType:v17 errorCode:v8 url:0 ingressProxy:v14 egressProxy:v15 tokenServer:0];
  }
LABEL_7:
}

- (void)reportProxyError:(int)a3 interface:(id)a4 proxyPath:(id)a5
{
  uint64_t v8 = *(void *)&a3;
  id v10 = (NSDate *)a4;
  id v11 = (NSPFallbackProxyPath *)a5;
  id v12 = (NSDate *)v11;
  if (self)
  {
    if ((NSPFallbackProxyPath *)self->_quicProxyPath != v11)
    {
      if (self->_fallbackProxyPath == v11)
      {
        a5 = self->_toggleStats;
        id v21 = [a5 fallbackPathStatistics];

        uint64_t v23 = 1001;
        goto LABEL_26;
      }
      if (![(NSPPrivacyProxyAgentManager *)self networkDiscoveredProxyPresentInAgentManager])
      {
        id v21 = 0;
        uint64_t v23 = 0;
        goto LABEL_26;
      }
      uint64_t v13 = v8;
      long long v537 = 0u;
      long long v538 = 0u;
      long long v535 = 0u;
      long long v536 = 0u;
      networkSpecificQUICProxyPaths = self->_networkSpecificQUICProxyPaths;
      goto LABEL_6;
    }
    toggleStats = self->_toggleStats;
LABEL_20:
    a5 = toggleStats;
    id v21 = [a5 primaryPathStatistics];

    uint64_t v23 = 1000;
    goto LABEL_26;
  }
  uint64_t v13 = v8;
  a5 = v11;
  if (!v11)
  {
    toggleStats = 0;
    id v12 = 0;
    goto LABEL_20;
  }
  if ([0 networkDiscoveredProxyPresentInAgentManager])
  {
    networkSpecificQUICProxyPaths = 0;
    long long v537 = 0u;
    long long v538 = 0u;
    long long v535 = 0u;
    long long v536 = 0u;
LABEL_6:
    id v15 = networkSpecificQUICProxyPaths;
    id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v535 objects:v543 count:16];
    if (v16)
    {
      a5 = v16;
      id v5 = *(void **)v536;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void **)v536 != v5) {
            objc_enumerationMutation(v15);
          }
          if (self) {
            id v18 = self->_networkSpecificQUICProxyPaths;
          }
          else {
            id v18 = 0;
          }
          id v19 = [(NSMutableDictionary *)v18 objectForKey:*(void *)(*((void *)&v535 + 1) + 8 * (void)v17)];
          if (v19 == v12)
          {
            id v21 = [(NSDate *)v12 networkMultiHopAgentStatistics];

            goto LABEL_24;
          }

          uint64_t v17 = (char *)v17 + 1;
        }
        while (a5 != v17);
        id v20 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v535 objects:v543 count:16];
        a5 = v20;
      }
      while (v20);
    }
    id v21 = 0;
LABEL_24:

    uint64_t v23 = 0;
    goto LABEL_25;
  }
  id v21 = 0;
  uint64_t v23 = 0;
LABEL_25:
  uint64_t v8 = v13;
LABEL_26:
  if ((int)v8 > 1199)
  {
    if ((v8 - 1200) > 7) {
      goto LABEL_86;
    }
    int v38 = 1 << (v8 + 80);
    if ((v38 & 0x51) != 0) {
      goto LABEL_60;
    }
    if ((v38 & 0xA2) == 0)
    {
LABEL_86:
      if (v8 == 1301)
      {
        if (!v21) {
          goto LABEL_361;
        }
        uint64_t v85 = 14;
      }
      else
      {
        if (v8 != 1302) {
          goto LABEL_168;
        }
        if (!v21) {
          goto LABEL_361;
        }
        uint64_t v85 = 15;
      }
LABEL_360:
      ++v21[v85];
      goto LABEL_361;
    }
    long long v39 = v12;
    unsigned __int8 v40 = v10;
    if (self)
    {
      if (self->_quicProxyPath == v39)
      {
        long long v122 = self->_lastQuicProxySwitchedDate;
        if (!v122
          || (id v123 = v122,
              +[NSDate now],
              BOOL v124 = objc_claimAutoreleasedReturnValue(),
              [v124 timeIntervalSinceDate:self->_lastQuicProxySwitchedDate],
              double v126 = v125,
              v124,
              v123,
              v126 > 30.0))
        {
          v127 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
          if (!v127) {
            goto LABEL_226;
          }
          unint64_t v128 = v127[12];

          if (v128 < 6) {
            goto LABEL_226;
          }
          uint64_t v516 = v23;
          unsigned __int8 v129 = nplog_obj();
          if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_INFO, "Quic proxy multihop path is reporting origin proxy error", buf, 2u);
          }

          v130 = self->_quicProxyPath;
          v131 = [(NSPProxyPath *)v130 egressProxy];
          int v132 = sub_10002C084((id *)&self->super.isa, v131, self->_proxyPathCustomEnumerator);

          if (v132)
          {
            uint64_t v133 = [(NSPProxyPath *)self->_quicProxyPath egressProxy];
            [(NSPPrivacyProxyAgentManager *)self switchProxy:v133];

            v134 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
            if (v134) {
              v134[12] = 0;
            }

            quicProxyPath = self->_quicProxyPath;
LABEL_133:
            v135 = [quicProxyPath networkSingleHopAgentStatistics];
            uint64_t v23 = v516;
            if (!v135)
            {
LABEL_135:

              goto LABEL_226;
            }
LABEL_134:
            v135[12] = 0;
            goto LABEL_135;
          }
          int64_t probingReason = self->_probingReason;
          uint64_t v23 = v516;
          if (probingReason == 1) {
            goto LABEL_226;
          }
          if (!probingReason)
          {
            sub_10003AD14((id *)&self->super.isa, @"ProxyPrimaryOriginError");
            sub_10003AFA8((uint64_t)self, 1);
            BOOL v211 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
            if (v211) {
              v211[12] = 0;
            }

            fallbackProxyPath = self->_quicProxyPath;
LABEL_304:
            v135 = [fallbackProxyPath networkSingleHopAgentStatistics];
            if (!v135) {
              goto LABEL_135;
            }
            goto LABEL_134;
          }
          v286 = self->_quicProxyPath;
LABEL_407:
          [v286 resetError];
          goto LABEL_226;
        }
        v204 = nplog_obj();
        if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
        {
          uint64_t v521 = v23;
          v205 = self->_lastQuicProxySwitchedDate;
          id v206 = +[NSDateFormatter localizedStringFromDate:v205 dateStyle:1 timeStyle:2];
          *(_DWORD *)long long buf = 138412290;
          NWPathStatus v547 = (NWPathStatus)v206;
          v207 = "ignoring origin quic proxy error, last quic proxy switched date %@";
LABEL_224:
          _os_log_impl((void *)&_mh_execute_header, v204, OS_LOG_TYPE_INFO, v207, buf, 0xCu);

          uint64_t v23 = v521;
        }
LABEL_225:

        goto LABEL_226;
      }
      if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v39)
      {
        BOOL v41 = self->_lastFallbackProxySwitchedDate;
        if (!v41
          || (long long v42 = v41,
              +[NSDate now],
              long long v43 = objc_claimAutoreleasedReturnValue(),
              [v43 timeIntervalSinceDate:self->_lastFallbackProxySwitchedDate],
              double v45 = v44,
              v43,
              v42,
              v45 > 30.0))
        {
          long long v46 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
          if (!v46) {
            goto LABEL_226;
          }
          unint64_t v47 = v46[12];

          if (v47 < 6) {
            goto LABEL_226;
          }
          uint64_t v516 = v23;
          id v48 = nplog_obj();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Fallback proxy multihop path is reporting origin proxy error", buf, 2u);
          }

          long long v49 = self->_fallbackProxyPath;
          long long v50 = [(NSPProxyPath *)v49 egressProxy];
          int v51 = sub_10002C084((id *)&self->super.isa, v50, self->_fallbackProxyPathCustomEnumerator);

          if (v51)
          {
            long long v52 = [(NSPProxyPath *)self->_fallbackProxyPath egressProxy];
            [(NSPPrivacyProxyAgentManager *)self switchProxy:v52];

            id v53 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
            if (v53) {
              v53[12] = 0;
            }

            quicProxyPath = self->_fallbackProxyPath;
            goto LABEL_133;
          }
          int64_t v274 = self->_probingReason;
          uint64_t v23 = v516;
          if (v274 == 1) {
            goto LABEL_226;
          }
          if (!v274)
          {
            sub_10003AD14((id *)&self->super.isa, @"ProxyFallbackOriginError");
            sub_10003AFA8((uint64_t)self, 1);
            id v275 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
            if (v275) {
              v275[12] = 0;
            }

            fallbackProxyPath = self->_fallbackProxyPath;
            goto LABEL_304;
          }
          v286 = self->_fallbackProxyPath;
          goto LABEL_407;
        }
        v204 = nplog_obj();
        if (os_log_type_enabled(v204, OS_LOG_TYPE_INFO))
        {
          uint64_t v521 = v23;
          v205 = self->_lastFallbackProxySwitchedDate;
          id v206 = +[NSDateFormatter localizedStringFromDate:v205 dateStyle:1 timeStyle:2];
          *(_DWORD *)long long buf = 138412290;
          NWPathStatus v547 = (NWPathStatus)v206;
          v207 = "ignoring origin fallback proxy error, last fallback proxy switched date %@";
          goto LABEL_224;
        }
        goto LABEL_225;
      }
    }
LABEL_226:

    if (!v21) {
      goto LABEL_361;
    }
    uint64_t v85 = 12;
    goto LABEL_360;
  }
  if ((int)v8 > 1099)
  {
    if ((v8 - 1100) > 7) {
      goto LABEL_168;
    }
    if (((1 << (v8 - 76)) & 0x33) != 0)
    {
LABEL_60:
      uint64_t v55 = v12;
      long long v56 = v10;
      if (self)
      {
        if (self->_quicProxyPath == v55)
        {
          id v71 = self->_lastQuicProxySwitchedDate;
          if (!v71
            || (id v72 = v71,
                +[NSDate now],
                int64_t v73 = objc_claimAutoreleasedReturnValue(),
                [v73 timeIntervalSinceDate:self->_lastQuicProxySwitchedDate],
                double v75 = v74,
                v73,
                v72,
                v75 > 30.0))
          {
            BOOL v76 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
            if (!v76) {
              goto LABEL_188;
            }
            unint64_t v77 = v76[11];

            if (v77 < 3) {
              goto LABEL_188;
            }
            uint64_t v517 = v23;
            uint64_t v78 = nplog_obj();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "Quic proxy multihop path is reporting egress proxy error", buf, 2u);
            }

            id v79 = self->_quicProxyPath;
            uint64_t v80 = [(NSPProxyPath *)v79 egressProxy];
            int v81 = sub_10002C084((id *)&self->super.isa, v80, self->_proxyPathCustomEnumerator);

            if (v81)
            {
              unsigned __int8 v82 = [(NSPProxyPath *)self->_quicProxyPath egressProxy];
              [(NSPPrivacyProxyAgentManager *)self switchProxy:v82];

              uint64_t v83 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
              if (v83) {
                v83[11] = 0;
              }

              id v70 = self->_quicProxyPath;
LABEL_83:
              v84 = [v70 networkSingleHopAgentStatistics];
              uint64_t v23 = v517;
              if (!v84)
              {
LABEL_85:

                goto LABEL_188;
              }
LABEL_84:
              v84[11] = 0;
              goto LABEL_85;
            }
            int64_t v189 = self->_probingReason;
            uint64_t v23 = v517;
            if (v189 == 1) {
              goto LABEL_188;
            }
            if (!v189)
            {
              sub_10003AD14((id *)&self->super.isa, @"ProxyPrimaryEgressError");
              sub_10003AFA8((uint64_t)self, 1);
              v190 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
              if (v190) {
                v190[11] = 0;
              }

              v191 = self->_quicProxyPath;
LABEL_218:
              v84 = [v191 networkSingleHopAgentStatistics];
              if (!v84) {
                goto LABEL_85;
              }
              goto LABEL_84;
            }
            v244 = self->_quicProxyPath;
LABEL_314:
            [v244 resetError];
            goto LABEL_188;
          }
          v177 = nplog_obj();
          if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
          {
            uint64_t v519 = v23;
            v178 = self->_lastQuicProxySwitchedDate;
            id v179 = +[NSDateFormatter localizedStringFromDate:v178 dateStyle:1 timeStyle:2];
            *(_DWORD *)long long buf = 138412290;
            NWPathStatus v547 = (NWPathStatus)v179;
            v180 = "ignoring egress quic proxy error, last quic proxy switched date %@";
LABEL_186:
            _os_log_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_INFO, v180, buf, 0xCu);

            uint64_t v23 = v519;
          }
LABEL_187:

          goto LABEL_188;
        }
        if ((NSPQuicProxyPath *)self->_fallbackProxyPath == v55)
        {
          id v57 = self->_lastFallbackProxySwitchedDate;
          if (!v57
            || (unsigned __int8 v58 = v57,
                +[NSDate now],
                uint64_t v59 = objc_claimAutoreleasedReturnValue(),
                [v59 timeIntervalSinceDate:self->_lastFallbackProxySwitchedDate],
                double v61 = v60,
                v59,
                v58,
                v61 > 30.0))
          {
            id v62 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
            if (!v62) {
              goto LABEL_188;
            }
            unint64_t v63 = v62[11];

            if (v63 < 3) {
              goto LABEL_188;
            }
            uint64_t v517 = v23;
            unsigned __int8 v64 = nplog_obj();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Fallback proxy multihop path is reporting egress proxy error", buf, 2u);
            }

            id v65 = self->_fallbackProxyPath;
            id v66 = [(NSPProxyPath *)v65 egressProxy];
            int v67 = sub_10002C084((id *)&self->super.isa, v66, self->_fallbackProxyPathCustomEnumerator);

            if (v67)
            {
              uint64_t v68 = [(NSPProxyPath *)self->_fallbackProxyPath egressProxy];
              [(NSPPrivacyProxyAgentManager *)self switchProxy:v68];

              uint64_t v69 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
              if (v69) {
                v69[11] = 0;
              }

              id v70 = self->_fallbackProxyPath;
              goto LABEL_83;
            }
            int64_t v208 = self->_probingReason;
            uint64_t v23 = v517;
            if (v208 == 1) {
              goto LABEL_188;
            }
            if (!v208)
            {
              sub_10003AD14((id *)&self->super.isa, @"ProxyFallbackEgressError");
              sub_10003AFA8((uint64_t)self, 1);
              v209 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
              if (v209) {
                v209[11] = 0;
              }

              v191 = self->_fallbackProxyPath;
              goto LABEL_218;
            }
            v244 = self->_fallbackProxyPath;
            goto LABEL_314;
          }
          v177 = nplog_obj();
          if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
          {
            uint64_t v519 = v23;
            v178 = self->_lastFallbackProxySwitchedDate;
            id v179 = +[NSDateFormatter localizedStringFromDate:v178 dateStyle:1 timeStyle:2];
            *(_DWORD *)long long buf = 138412290;
            NWPathStatus v547 = (NWPathStatus)v179;
            v180 = "ignoring egress fallback proxy error, last fallback proxy switched date %@";
            goto LABEL_186;
          }
          goto LABEL_187;
        }
      }
LABEL_188:

      if (!v21) {
        goto LABEL_361;
      }
      uint64_t v85 = 11;
      goto LABEL_360;
    }
    if (v8 != 1106)
    {
      if (v8 != 1107) {
        goto LABEL_168;
      }
      id v86 = v12;
      uint64_t v87 = v10;
      if (!self)
      {
LABEL_329:

        if (v21)
        {
          uint64_t v85 = 13;
          goto LABEL_360;
        }
        goto LABEL_361;
      }
      if ((NSPFallbackProxyPath *)self->_quicProxyPath == v86)
      {
        v192 = self->_lastQuicProxySwitchedDate;
        if (!v192
          || (v193 = v192,
              +[NSDate now],
              v194 = objc_claimAutoreleasedReturnValue(),
              [v194 timeIntervalSinceDate:self->_lastQuicProxySwitchedDate],
              double v196 = v195,
              v194,
              v193,
              v196 > 30.0))
        {
          v485 = v87;
          uint64_t v93 = v23;
          v197 = self->_quicProxyPath;
          uint64_t v198 = [(NSPProxyPath *)v197 egressProxy];
          int v199 = sub_10002C084((id *)&self->super.isa, v198, self->_proxyPathCustomEnumerator);

          v200 = self->_quicProxyPath;
          if (v199)
          {
            id v201 = [(NSPProxyPath *)v200 egressProxy];
            [(NSPPrivacyProxyAgentManager *)self switchProxy:v201];

            v202 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
            if (v202) {
              v202[13] = 0;
            }

            id v100 = self->_quicProxyPath;
            goto LABEL_208;
          }
          v267 = [(NSPProxyPath *)v200 networkMultiHopAgentStatistics];
          uint64_t v23 = v93;
          uint64_t v87 = v485;
          if (!v267) {
            goto LABEL_329;
          }
          unint64_t v268 = v267[13];

          if (v268 < 3) {
            goto LABEL_329;
          }
          int64_t v269 = self->_probingReason;
          if (v269 == 1) {
            goto LABEL_329;
          }
          if (!v269)
          {
            sub_10003AD14((id *)&self->super.isa, @"ProxyPrimaryEgressUnavailableError");
            sub_10003AFA8((uint64_t)self, 1);
            v270 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
            if (v270) {
              v270[13] = 0;
            }

            id v271 = self->_quicProxyPath;
            goto LABEL_322;
          }
          v349 = self->_quicProxyPath;
LABEL_509:
          [v349 resetError];
          goto LABEL_329;
        }
        id v276 = nplog_obj();
        if (os_log_type_enabled(v276, OS_LOG_TYPE_INFO))
        {
          v489 = v87;
          uint64_t v277 = v23;
          id v278 = self->_lastQuicProxySwitchedDate;
          v279 = +[NSDateFormatter localizedStringFromDate:v278 dateStyle:1 timeStyle:2];
          *(_DWORD *)long long buf = 138412290;
          NWPathStatus v547 = (NWPathStatus)v279;
          v280 = "ignoring unavailable quic proxy error, last quic proxy switched date %@";
LABEL_327:
          _os_log_impl((void *)&_mh_execute_header, v276, OS_LOG_TYPE_INFO, v280, buf, 0xCu);

          uint64_t v23 = v277;
          uint64_t v87 = v489;
        }
      }
      else
      {
        if (self->_fallbackProxyPath != v86) {
          goto LABEL_329;
        }
        v88 = self->_lastFallbackProxySwitchedDate;
        if (!v88
          || (unsigned __int8 v89 = v88,
              +[NSDate now],
              id v90 = objc_claimAutoreleasedReturnValue(),
              [v90 timeIntervalSinceDate:self->_lastFallbackProxySwitchedDate],
              double v92 = v91,
              v90,
              v89,
              v92 > 30.0))
        {
          v485 = v87;
          uint64_t v93 = v23;
          uint64_t v94 = self->_fallbackProxyPath;
          uint64_t v95 = [(NSPProxyPath *)v94 egressProxy];
          int v96 = sub_10002C084((id *)&self->super.isa, v95, self->_fallbackProxyPathCustomEnumerator);

          id v97 = self->_fallbackProxyPath;
          if (v96)
          {
            id v98 = [(NSPProxyPath *)v97 egressProxy];
            [(NSPPrivacyProxyAgentManager *)self switchProxy:v98];

            id v99 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
            if (v99) {
              v99[13] = 0;
            }

            id v100 = self->_fallbackProxyPath;
LABEL_208:
            uint64_t v203 = [v100 networkSingleHopAgentStatistics];
            uint64_t v23 = v93;
            if (v203) {
              v203[13] = 0;
            }

            uint64_t v87 = v485;
            goto LABEL_329;
          }
          v281 = [(NSPProxyPath *)v97 networkMultiHopAgentStatistics];
          uint64_t v23 = v93;
          uint64_t v87 = v485;
          if (!v281) {
            goto LABEL_329;
          }
          unint64_t v282 = v281[13];

          if (v282 < 3) {
            goto LABEL_329;
          }
          int64_t v283 = self->_probingReason;
          if (v283 == 1) {
            goto LABEL_329;
          }
          if (!v283)
          {
            sub_10003AD14((id *)&self->super.isa, @"ProxyFallbackEgressUnavailableError");
            sub_10003AFA8((uint64_t)self, 1);
            v284 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
            if (v284) {
              v284[13] = 0;
            }

            id v271 = self->_fallbackProxyPath;
LABEL_322:
            v285 = [v271 networkSingleHopAgentStatistics];
            if (v285) {
              v285[13] = 0;
            }

            goto LABEL_329;
          }
          v349 = self->_fallbackProxyPath;
          goto LABEL_509;
        }
        id v276 = nplog_obj();
        if (os_log_type_enabled(v276, OS_LOG_TYPE_INFO))
        {
          v489 = v87;
          uint64_t v277 = v23;
          id v278 = self->_lastFallbackProxySwitchedDate;
          v279 = +[NSDateFormatter localizedStringFromDate:v278 dateStyle:1 timeStyle:2];
          *(_DWORD *)long long buf = 138412290;
          NWPathStatus v547 = (NWPathStatus)v279;
          v280 = "ignoring unavailable fallback proxy error, last fallback proxy switched date %@";
          goto LABEL_327;
        }
      }

      goto LABEL_329;
    }
    id v136 = v12;
    v137 = v10;
    if (self)
    {
      if ((id)[(NWPath *)self->_path status] == (id)1)
      {
        v487 = v136;
        unsigned int v501 = v8;
        v533 = v21;
        v138 = self->_quicProxyPath;
        uint64_t v139 = [(NSPProxyPath *)v138 networkMultiHopAgentStatistics];
        uint64_t v140 = (void *)v139;
        v530 = v12;
        if (v139) {
          uint64_t v141 = *(void *)(v139 + 80);
        }
        else {
          uint64_t v141 = 0;
        }
        v473 = v137;
        v142 = self->_quicProxyPath;
        uint64_t v143 = [(NSPProxyPath *)v142 networkSingleHopAgentStatistics];
        v144 = (void *)v143;
        uint64_t v145 = v23;
        id v146 = v10;
        if (v143) {
          uint64_t v147 = *(void *)(v143 + 80);
        }
        else {
          uint64_t v147 = 0;
        }
        uint64_t v148 = v147 + v141;
        v149 = self->_fallbackProxyPath;
        uint64_t v150 = [(NSPProxyPath *)v149 networkMultiHopAgentStatistics];
        uint64_t v151 = (void *)v150;
        if (v150) {
          uint64_t v152 = *(void *)(v150 + 80);
        }
        else {
          uint64_t v152 = 0;
        }
        uint64_t v153 = v148 + v152;
        v154 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
        if (v154) {
          uint64_t v155 = v154[10];
        }
        else {
          uint64_t v155 = 0;
        }
        unint64_t v156 = v153 + v155;

        BOOL v157 = v156 >= 3;
        id v10 = v146;
        id v12 = v530;
        id v21 = v533;
        uint64_t v8 = v501;
        uint64_t v23 = v145;
        v137 = v473;
        id v136 = v487;
        if (!v157) {
          goto LABEL_194;
        }
        int64_t v158 = self->_probingReason;
        if (v158 == 1) {
          goto LABEL_194;
        }
        if (!v158)
        {
          sub_10003AD14((id *)&self->super.isa, @"ProxyCertError");
          sub_10003AFA8((uint64_t)self, 1);
          id v159 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
          if (v159) {
            v159[10] = 0;
          }

          v160 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
          if (v160) {
            v160[10] = 0;
          }

          v161 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
          if (v161) {
            v161[10] = 0;
          }

          v162 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
          if (v162) {
            v162[10] = 0;
          }

          goto LABEL_194;
        }
      }
      else
      {
        id v187 = nplog_obj();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          NWPathStatus v188 = [(NWPath *)self->_path status];
          *(_DWORD *)long long buf = 134217984;
          NWPathStatus v547 = v188;
          _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "ignoring connection cert error, path status %ld", buf, 0xCu);
        }
      }
      [(NSPProxyPath *)self->_quicProxyPath resetError];
      [(NSPProxyPath *)self->_fallbackProxyPath resetError];
    }
LABEL_194:

    if (!v21) {
      goto LABEL_361;
    }
    uint64_t v85 = 10;
    goto LABEL_360;
  }
  v529 = v12;
  v532 = v21;
  if ((v8 + 65568) > 0x1E) {
    goto LABEL_116;
  }
  if (((1 << (v8 + 32)) & 0x4004C000) != 0)
  {
    uint64_t v24 = v12;
    id v25 = v10;
    if (!self) {
      goto LABEL_40;
    }
    unint64_t v26 = self->_path;
    if ((id)[(NWPath *)v26 status] != (id)1) {
      goto LABEL_35;
    }
    uint64_t v27 = self->_lastPathUnsatisfiedDate;
    if (v27)
    {
      id v21 = +[NSDate now];
      id v12 = self->_lastPathUnsatisfiedDate;
      [v21 timeIntervalSinceDate:v12];
      if (v28 <= 5.0)
      {

        id v12 = v529;
        id v21 = v532;
LABEL_35:

LABEL_36:
        id v29 = nplog_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v484 = self->_path;
          NWPathStatus v470 = [(NWPath *)v484 status];
          uint64_t v30 = [(NSDate *)v25 interfaceName];
          NSUInteger v31 = self->_path;
          NSUInteger v32 = [(NWPath *)v31 interface];
          [v32 interfaceName];
          v508 = v10;
          NSUInteger v33 = v515 = v25;
          v499 = v24;
          NSUInteger v34 = self->_lastPathUnsatisfiedDate;
          id v35 = +[NSDateFormatter localizedStringFromDate:v34 dateStyle:1 timeStyle:2];
          id v36 = self->_lastPrimaryInterfaceChangedDate;
          id v37 = +[NSDateFormatter localizedStringFromDate:v36 dateStyle:1 timeStyle:2];
          *(_DWORD *)long long buf = 134219010;
          NWPathStatus v547 = v470;
          __int16 v548 = 2112;
          v549 = v30;
          __int16 v550 = 2112;
          v551 = v33;
          __int16 v552 = 2112;
          v553 = v35;
          __int16 v554 = 2112;
          uint64_t v555 = (uint64_t)v37;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "ignoring dns blocked error, path status %ld reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x34u);

          uint64_t v24 = v499;
          id v25 = v515;

          id v12 = v529;
          id v21 = v532;

          id v10 = v508;
        }

LABEL_39:
        [(NSPProxyPath *)self->_quicProxyPath resetError];
        [(NSPProxyPath *)self->_fallbackProxyPath resetError];
        goto LABEL_40;
      }
    }
    v512 = v10;
    v520 = v25;
    uint64_t v181 = self->_lastPrimaryInterfaceChangedDate;
    if (v181)
    {
      id v10 = +[NSDate now];
      id v25 = self->_lastPrimaryInterfaceChangedDate;
      [(NSDate *)v10 timeIntervalSinceDate:v25];
      if (v182 <= 5.0)
      {
        BOOL v186 = 0;
        goto LABEL_241;
      }
      if (!v520)
      {
        BOOL v186 = 1;
        goto LABEL_241;
      }
      v183 = v520;
    }
    else
    {
      v183 = v25;
      if (!v25)
      {
        if (v27)
        {
        }
        id v25 = 0;
        goto LABEL_244;
      }
    }
    v502 = v24;
    id v184 = [(NSDate *)v183 interfaceIndex];
    v185 = [(NWPath *)self->_path interface];
    BOOL v186 = v184 == [v185 interfaceIndex];

    if (!v181)
    {
      uint64_t v24 = v502;
      if (!v27)
      {
LABEL_243:

        id v10 = v512;
        id v25 = v520;
        id v12 = v529;
        id v21 = v532;
        if (!v186) {
          goto LABEL_36;
        }
LABEL_244:
        BOOL v216 = self->_quicProxyPath;
        uint64_t v217 = [(NSPProxyPath *)v216 networkMultiHopAgentStatistics];
        v218 = (void *)v217;
        if (v217) {
          uint64_t v219 = *(void *)(v217 + 72);
        }
        else {
          uint64_t v219 = 0;
        }
        v220 = self->_quicProxyPath;
        v221 = [(NSPProxyPath *)v220 networkSingleHopAgentStatistics];
        v222 = v221;
        if (v221) {
          uint64_t v223 = v221[9];
        }
        else {
          uint64_t v223 = 0;
        }
        if ((unint64_t)(v223 + v219) < 3)
        {

          id v12 = v529;
          id v21 = v532;
        }
        else
        {
          uint64_t v224 = self->_fallbackProxyPath;
          if (v224)
          {
            v225 = v224;
            v226 = v24;
            v227 = self->_fallbackProxyPath;
            uint64_t v228 = [(NSPProxyPath *)v227 networkMultiHopAgentStatistics];
            v229 = (void *)v228;
            if (v228) {
              uint64_t v230 = *(void *)(v228 + 72);
            }
            else {
              uint64_t v230 = 0;
            }
            unsigned int v231 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
            if (v231) {
              uint64_t v232 = v231[9];
            }
            else {
              uint64_t v232 = 0;
            }
            unint64_t v233 = v232 + v230;

            BOOL v234 = v233 > 2;
            id v12 = v529;
            id v21 = v532;
            uint64_t v24 = v226;
            id v10 = v512;
            id v25 = v520;
            if (!v234) {
              goto LABEL_40;
            }
          }
          else
          {

            id v12 = v529;
            id v21 = v532;
          }
          int64_t v245 = self->_probingReason;
          if (v245 != 2)
          {
            if (!v245)
            {
              sub_10003AD14((id *)&self->super.isa, @"ProxyConnectionDNSError");
              v246 = self->_quicProxyPath;
              uint64_t v247 = [(NSPProxyPath *)v246 networkMultiHopAgentStatistics];
              id v248 = (void *)v247;
              if (v247) {
                uint64_t v249 = *(void *)(v247 + 16);
              }
              else {
                uint64_t v249 = 0;
              }
              v250 = self->_quicProxyPath;
              uint64_t v251 = [(NSPProxyPath *)v250 networkSingleHopAgentStatistics];
              v252 = (void *)v251;
              v503 = v24;
              if (v251) {
                uint64_t v253 = *(void *)(v251 + 16);
              }
              else {
                uint64_t v253 = 0;
              }
              uint64_t v254 = v253 + v249;
              v255 = self->_fallbackProxyPath;
              uint64_t v256 = [(NSPProxyPath *)v255 networkMultiHopAgentStatistics];
              v257 = (void *)v256;
              if (v256) {
                uint64_t v258 = *(void *)(v256 + 16);
              }
              else {
                uint64_t v258 = 0;
              }
              uint64_t v259 = v254 + v258;
              v260 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
              if (v260) {
                uint64_t v261 = v260[2];
              }
              else {
                uint64_t v261 = 0;
              }

              if (v259 + v261) {
                uint64_t v262 = 1;
              }
              else {
                uint64_t v262 = 2;
              }
              sub_10003AFA8((uint64_t)self, v262);
              v263 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
              if (v263) {
                v263[9] = 0;
              }

              id v264 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
              uint64_t v24 = v503;
              id v10 = v512;
              id v21 = v532;
              id v25 = v520;
              if (v264) {
                v264[9] = 0;
              }

              uint64_t v265 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
              if (v265) {
                v265[9] = 0;
              }

              v266 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
              if (v266) {
                v266[9] = 0;
              }

              goto LABEL_40;
            }
            goto LABEL_39;
          }
        }
LABEL_40:

        if (v21) {
          ++v21[9];
        }
        goto LABEL_362;
      }
LABEL_242:

      goto LABEL_243;
    }
    uint64_t v24 = v502;
LABEL_241:

    if (!v27) {
      goto LABEL_243;
    }
    goto LABEL_242;
  }
  if (v8 != -65568)
  {
LABEL_116:
    if (v8 != 60)
    {
      if (v8 == 61)
      {
        long long v116 = v12;
        uint64_t v117 = v10;
        if (!self) {
          goto LABEL_263;
        }
        objc_super v118 = self->_path;
        v472 = v116;
        if ((id)[(NWPath *)v118 status] == (id)1)
        {
          long long v119 = self->_lastPathUnsatisfiedDate;
          if (!v119) {
            goto LABEL_236;
          }
          a5 = +[NSDate now];
          id v120 = self->_lastPathUnsatisfiedDate;
          [a5 timeIntervalSinceDate:v120];
          if (v121 > 30.0)
          {
            id v460 = v120;
            id v483 = a5;
LABEL_236:
            BOOL v213 = self->_lastPrimaryInterfaceChangedDate;
            uint64_t v522 = v23;
            if (v213)
            {
              a5 = +[NSDate now];
              uint64_t v8 = self->_lastPrimaryInterfaceChangedDate;
              [a5 timeIntervalSinceDate:v8];
              if (v214 <= 30.0)
              {
                BOOL v215 = 0;
                goto LABEL_309;
              }
              if (!v117)
              {
                BOOL v215 = 1;
                goto LABEL_309;
              }
            }
            else if (!v117)
            {
              if (v119)
              {
              }
              id v12 = v529;
              uint64_t v8 = v8;
              goto LABEL_366;
            }
            id v272 = [(NSDate *)v117 interfaceIndex];
            id v273 = [(NWPath *)self->_path interface];
            BOOL v215 = v272 == [v273 interfaceIndex];

            if (!v213)
            {
              uint64_t v23 = v522;
              if (!v119)
              {
LABEL_311:

                id v12 = v529;
                uint64_t v8 = 61;
                if (v215)
                {
LABEL_366:
                  id v314 = self->_fallbackProxyPath;
                  uint64_t v315 = [(NSPProxyPath *)v314 networkMultiHopAgentStatistics];
                  long long v316 = (void *)v315;
                  id v21 = v532;
                  if (v315) {
                    uint64_t v317 = *(void *)(v315 + 32);
                  }
                  else {
                    uint64_t v317 = 0;
                  }
                  long long v318 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
                  if (v318) {
                    uint64_t v319 = v318[4];
                  }
                  else {
                    uint64_t v319 = 0;
                  }
                  unint64_t v320 = v319 + v317;

                  if (v320 < 3)
                  {
                    uint64_t v23 = v522;
                    long long v116 = v472;
                    if ([(NSPPrivacyProxyAgentManager *)self networkDiscoveredProxyPresentInAgentManager])
                    {
                      v466 = v117;
                      v514 = v10;
                      long long v541 = 0u;
                      long long v542 = 0u;
                      long long v539 = 0u;
                      long long v540 = 0u;
                      long long v324 = self->_networkSpecificQUICProxyPaths;
                      id v325 = [(NSMutableDictionary *)v324 countByEnumeratingWithState:&v539 objects:buf count:16];
                      if (v325)
                      {
                        id v326 = v325;
                        uint64_t v327 = *(void *)v540;
                        v469 = self;
                        do
                        {
                          long long v328 = 0;
                          do
                          {
                            if (*(void *)v540 != v327) {
                              objc_enumerationMutation(v324);
                            }
                            long long v329 = [(NSMutableDictionary *)self->_networkSpecificQUICProxyPaths objectForKey:*(void *)(*((void *)&v539 + 1) + 8 * (void)v328)];
                            if (v329 == v116)
                            {
                              long long v330 = [(NSDate *)v116 networkMultiHopAgentStatistics];
                              if (v330)
                              {
                                unint64_t v331 = v330[4];

                                if (v331 >= 3)
                                {
                                  v332 = nplog_obj();
                                  if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
                                  {
                                    v333 = v116;
                                    uint64_t v334 = [(NSDate *)v116 ingressProxy];
                                    v335 = (void *)v334;
                                    if (v334) {
                                      __int16 v336 = *(void **)(v334 + 24);
                                    }
                                    else {
                                      __int16 v336 = 0;
                                    }
                                    id v337 = v336;
                                    v338 = [v337 vendor];
                                    *(_DWORD *)v544 = 138412290;
                                    v545 = v338;
                                    _os_log_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the connection refused count, removing registration", v544, 0xCu);

                                    uint64_t v8 = 61;
                                    uint64_t v23 = v522;
                                    long long v116 = v333;
                                    self = v469;
                                  }

                                  [(NSPPrivacyProxyAgentManager *)self tearDownNetworkDiscoveredProxy];
                                }
                              }
                            }

                            long long v328 = (char *)v328 + 1;
                          }
                          while (v326 != v328);
                          id v339 = [(NSMutableDictionary *)v324 countByEnumeratingWithState:&v539 objects:buf count:16];
                          id v326 = v339;
                        }
                        while (v339);
                      }

                      id v10 = v514;
                      id v12 = v529;
                      id v21 = v532;
                      uint64_t v117 = v466;
                    }
                  }
                  else
                  {
                    int64_t v321 = self->_probingReason;
                    uint64_t v23 = v522;
                    long long v116 = v472;
                    if (v321 != 1)
                    {
                      if (v321)
                      {
                        [(NSPProxyPath *)self->_quicProxyPath resetError];
                        [(NSPProxyPath *)self->_fallbackProxyPath resetError];
                      }
                      else
                      {
                        sub_10003AD14((id *)&self->super.isa, @"ProxyConnectionRefused");
                        sub_10003AFA8((uint64_t)self, 1);
                        long long v322 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
                        if (v322) {
                          v322[4] = 0;
                        }

                        long long v323 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
                        if (v323) {
                          v323[4] = 0;
                        }
                      }
                    }
                  }
                  goto LABEL_263;
                }
LABEL_260:
                v235 = nplog_obj();
                if (os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT))
                {
                  v488 = self->_path;
                  NWPathStatus v453 = [(NWPath *)v488 status];
                  [(NSDate *)v117 interfaceName];
                  v237 = id v236 = v117;
                  v457 = self->_path;
                  v238 = [(NWPath *)v457 interface];
                  v239 = [v238 interfaceName];
                  v462 = v236;
                  uint64_t v523 = v23;
                  uint64_t v240 = self->_lastPathUnsatisfiedDate;
                  v241 = +[NSDateFormatter localizedStringFromDate:v240 dateStyle:1 timeStyle:2];
                  v242 = self->_lastPrimaryInterfaceChangedDate;
                  id v243 = +[NSDateFormatter localizedStringFromDate:v242 dateStyle:1 timeStyle:2];
                  *(_DWORD *)long long buf = 134219010;
                  NWPathStatus v547 = v453;
                  __int16 v548 = 2112;
                  v549 = v237;
                  __int16 v550 = 2112;
                  v551 = v239;
                  __int16 v552 = 2112;
                  v553 = v241;
                  __int16 v554 = 2112;
                  uint64_t v555 = (uint64_t)v243;
                  _os_log_impl((void *)&_mh_execute_header, v235, OS_LOG_TYPE_DEFAULT, "ignoring connection refused error, path status %ld reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x34u);

                  uint64_t v23 = v523;
                  id v12 = v529;

                  uint64_t v117 = v462;
                }

                [(NSPProxyPath *)self->_quicProxyPath resetError];
                [(NSPProxyPath *)self->_fallbackProxyPath resetError];
                id v21 = v532;
                uint64_t v8 = 61;
                long long v116 = v472;
LABEL_263:

                if (v21)
                {
                  uint64_t v85 = 4;
                  goto LABEL_360;
                }
LABEL_361:
                id v312 = [(NSDate *)v12 ingressProxy];
                v313 = [(NSDate *)v12 egressProxy];
                [(NSPPrivacyProxyAgentManager *)self sendRTCReportWithFailureType:v23 errorCode:v8 url:0 ingressProxy:v312 egressProxy:v313 tokenServer:0];

                goto LABEL_362;
              }
LABEL_310:

              goto LABEL_311;
            }
            uint64_t v23 = v522;
LABEL_309:

            if (!v119) {
              goto LABEL_311;
            }
            goto LABEL_310;
          }

          id v12 = v529;
        }

        goto LABEL_260;
      }
LABEL_168:
      v170 = v12;
      v171 = v10;
      if (!self) {
        goto LABEL_358;
      }
      v534 = v21;
      unint64_t v172 = self->_path;
      v511 = v10;
      if ((id)[(NWPath *)v172 status] == (id)1)
      {
        int linkQuality = self->_linkQuality;
        if (linkQuality != 10 && linkQuality != 20)
        {
          v531 = v12;
          v174 = self->_lastPathUnsatisfiedDate;
          if (!v174) {
            goto LABEL_340;
          }
          v175 = +[NSDate now];
          uint64_t v6 = self->_lastPathUnsatisfiedDate;
          [(NSDate *)v175 timeIntervalSinceDate:v6];
          if (v176 > 30.0)
          {
            v456 = v175;
LABEL_340:
            v463 = v6;
            unsigned int v505 = v8;
            uint64_t v293 = self->_lastPrimaryInterfaceChangedDate;
            if (v293)
            {
              uint64_t v6 = +[NSDate now];
              uint64_t v8 = self->_lastPrimaryInterfaceChangedDate;
              [(NSDate *)v6 timeIntervalSinceDate:v8];
              if (v294 <= 30.0)
              {
                BOOL v295 = 0;
                goto LABEL_419;
              }
              if (!v171)
              {
                BOOL v295 = 1;
                goto LABEL_419;
              }
            }
            else if (!v171)
            {
              if (v174)
              {
              }
              goto LABEL_489;
            }
            v478 = v171;
            v494 = v170;
            uint64_t v528 = v23;
            id v346 = [(NSDate *)v171 interfaceIndex];
            v347 = [(NWPath *)self->_path interface];
            id v348 = [v347 interfaceIndex];
            BOOL v295 = v346 == v348;

            if (!v293)
            {
              v170 = v494;
              if (v174)
              {
              }
              BOOL v350 = v346 == v348;
              uint64_t v23 = v528;
              id v12 = v531;
              uint64_t v8 = v505;
              v171 = v478;
              if (v350) {
                goto LABEL_489;
              }
              goto LABEL_355;
            }
            uint64_t v23 = v528;
            v171 = v478;
            v170 = v494;
LABEL_419:

            if (v174)
            {
            }
            id v12 = v531;
            uint64_t v8 = v505;
            if (v295)
            {
LABEL_489:
              v387 = self->_fallbackProxyPath;
              uint64_t v388 = [(NSPProxyPath *)v387 networkMultiHopAgentStatistics];
              v389 = (void *)v388;
              if (v388) {
                uint64_t v390 = *(void *)(v388 + 56);
              }
              else {
                uint64_t v390 = 0;
              }
              v391 = self->_fallbackProxyPath;
              v392 = [(NSPProxyPath *)v391 networkSingleHopAgentStatistics];
              v393 = v392;
              if (v392) {
                uint64_t v394 = v392[7];
              }
              else {
                uint64_t v394 = 0;
              }
              id v10 = v511;
              if ((unint64_t)(v394 + v390) > 9)
              {
              }
              else
              {
                v395 = self->_fallbackProxyPath;
                if (v395)
                {

                  goto LABEL_541;
                }
                v481 = v171;
                v497 = v170;
                uint64_t v425 = v23;
                v426 = self->_quicProxyPath;
                uint64_t v427 = [(NSPProxyPath *)v426 networkMultiHopAgentStatistics];
                v428 = (void *)v427;
                if (v427) {
                  uint64_t v429 = *(void *)(v427 + 56);
                }
                else {
                  uint64_t v429 = 0;
                }
                v430 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
                if (v430) {
                  uint64_t v431 = v430[7];
                }
                else {
                  uint64_t v431 = 0;
                }
                unint64_t v432 = v431 + v429;

                BOOL v234 = v432 > 9;
                uint64_t v23 = v425;
                v171 = v481;
                v170 = v497;
                if (!v234)
                {
LABEL_541:
                  id v12 = v531;
                  id v21 = v534;
                  uint64_t v8 = v505;
                  if ([(NSPPrivacyProxyAgentManager *)self networkDiscoveredProxyPresentInAgentManager])
                  {
                    v482 = v171;
                    long long v541 = 0u;
                    long long v542 = 0u;
                    long long v539 = 0u;
                    long long v540 = 0u;
                    v433 = self->_networkSpecificQUICProxyPaths;
                    id v434 = [(NSMutableDictionary *)v433 countByEnumeratingWithState:&v539 objects:buf count:16];
                    if (v434)
                    {
                      id v435 = v434;
                      uint64_t v436 = *(void *)v540;
                      v498 = v170;
                      v468 = v433;
                      do
                      {
                        v437 = 0;
                        do
                        {
                          if (*(void *)v540 != v436) {
                            objc_enumerationMutation(v433);
                          }
                          v438 = [(NSMutableDictionary *)self->_networkSpecificQUICProxyPaths objectForKey:*(void *)(*((void *)&v539 + 1) + 8 * (void)v437)];
                          if (v438 == v170)
                          {
                            v439 = [(NSDate *)v170 networkMultiHopAgentStatistics];
                            if (v439)
                            {
                              unint64_t v440 = v439[7];

                              if (v440 >= 0xA)
                              {
                                v441 = nplog_obj();
                                if (os_log_type_enabled(v441, OS_LOG_TYPE_INFO))
                                {
                                  uint64_t v442 = [(NSDate *)v170 ingressProxy];
                                  v443 = (void *)v442;
                                  uint64_t v444 = v23;
                                  if (v442) {
                                    v445 = *(void **)(v442 + 24);
                                  }
                                  else {
                                    v445 = 0;
                                  }
                                  id v446 = v445;
                                  v447 = [v446 vendor];
                                  *(_DWORD *)v544 = 138412290;
                                  v545 = v447;
                                  _os_log_impl((void *)&_mh_execute_header, v441, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the connection error count, removing registration", v544, 0xCu);

                                  uint64_t v8 = v505;
                                  uint64_t v23 = v444;
                                  v170 = v498;
                                  v433 = v468;
                                }

                                [(NSPPrivacyProxyAgentManager *)self tearDownNetworkDiscoveredProxy];
                              }
                            }
                          }

                          v437 = (char *)v437 + 1;
                        }
                        while (v435 != v437);
                        id v448 = [(NSMutableDictionary *)v433 countByEnumeratingWithState:&v539 objects:buf count:16];
                        id v435 = v448;
                      }
                      while (v448);
                    }

                    id v10 = v511;
                    id v12 = v531;
                    id v21 = v534;
                    v171 = v482;
                  }
                  goto LABEL_358;
                }
              }
              int64_t v396 = self->_probingReason;
              id v12 = v531;
              id v21 = v534;
              uint64_t v8 = v505;
              if (v396 != 1)
              {
                if (v396)
                {
                  [(NSPProxyPath *)self->_quicProxyPath resetError];
                  [(NSPProxyPath *)self->_fallbackProxyPath resetError];
                }
                else
                {
                  sub_10003AD14((id *)&self->super.isa, @"ProxyError");
                  sub_10003AFA8((uint64_t)self, 1);
                  v397 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
                  if (v397) {
                    v397[7] = 0;
                  }

                  v398 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
                  if (v398) {
                    v398[7] = 0;
                  }

                  v399 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
                  if (v399) {
                    v399[7] = 0;
                  }

                  v400 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
                  if (v400) {
                    v400[7] = 0;
                  }
                }
              }
LABEL_358:

              if (v21)
              {
                uint64_t v85 = 7;
                goto LABEL_360;
              }
              goto LABEL_361;
            }
LABEL_355:
            long long v304 = nplog_obj();
            if (os_log_type_enabled(v304, OS_LOG_TYPE_DEFAULT))
            {
              v465 = self->_path;
              NWPathStatus v455 = [(NWPath *)v465 status];
              v450 = +[NPUtilities stringFromLinkQualityValue:self->_linkQuality];
              v452 = [(NSDate *)v171 interfaceName];
              v459 = self->_path;
              [(NWPath *)v459 interface];
              long long v305 = v507 = v8;
              long long v306 = [v305 interfaceName];
              v475 = v171;
              v492 = v170;
              uint64_t v526 = v23;
              v307 = self->_lastPathUnsatisfiedDate;
              uint64_t v308 = +[NSDateFormatter localizedStringFromDate:v307 dateStyle:1 timeStyle:2];
              v309 = self->_lastPrimaryInterfaceChangedDate;
              id v310 = +[NSDateFormatter localizedStringFromDate:v309 dateStyle:1 timeStyle:2];
              *(_DWORD *)long long buf = 134219266;
              NWPathStatus v547 = v455;
              __int16 v548 = 2112;
              v549 = v450;
              __int16 v550 = 2112;
              v551 = v452;
              __int16 v552 = 2112;
              v553 = v306;
              __int16 v554 = 2112;
              uint64_t v555 = v308;
              v311 = (void *)v308;
              __int16 v556 = 2112;
              v557 = v310;
              _os_log_impl((void *)&_mh_execute_header, v304, OS_LOG_TYPE_DEFAULT, "ignoring connection error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

              uint64_t v23 = v526;
              v171 = v475;

              uint64_t v8 = v507;
              v170 = v492;
            }
            [(NSPProxyPath *)self->_quicProxyPath resetError];
            [(NSPProxyPath *)self->_fallbackProxyPath resetError];
            id v10 = v511;
            id v21 = v534;
            goto LABEL_358;
          }

          id v12 = v531;
        }
      }

      goto LABEL_355;
    }
    v163 = v12;
    unsigned __int8 v164 = v10;
    if (!self) {
      goto LABEL_351;
    }
    v165 = self->_path;
    v510 = v10;
    if ((id)[(NWPath *)v165 status] == (id)1)
    {
      int v166 = self->_linkQuality;
      if (v166 != 10 && v166 != 20)
      {
        v167 = self->_lastPathUnsatisfiedDate;
        if (!v167) {
          goto LABEL_336;
        }
        a5 = +[NSDate now];
        unint64_t v168 = self->_lastPathUnsatisfiedDate;
        [a5 timeIntervalSinceDate:v168];
        if (v169 > 30.0)
        {
          v456 = v168;
          id v460 = a5;
LABEL_336:
          v290 = self->_lastPrimaryInterfaceChangedDate;
          if (v290)
          {
            a5 = +[NSDate now];
            uint64_t v8 = self->_lastPrimaryInterfaceChangedDate;
            [a5 timeIntervalSinceDate:v8];
            if (v291 <= 30.0)
            {
              BOOL v292 = 0;
              goto LABEL_414;
            }
            if (!v164)
            {
              BOOL v292 = 1;
              goto LABEL_414;
            }
          }
          else if (!v164)
          {
            if (v167)
            {
            }
            goto LABEL_467;
          }
          v477 = v164;
          v493 = v163;
          uint64_t v527 = v23;
          id v343 = [(NSDate *)v164 interfaceIndex];
          long long v344 = [(NWPath *)self->_path interface];
          id v345 = [v344 interfaceIndex];
          BOOL v292 = v343 == v345;

          if (!v290)
          {
            v163 = v493;
            if (v167)
            {
            }
            BOOL v350 = v343 == v345;
            uint64_t v23 = v527;
            id v12 = v529;
            uint64_t v8 = 60;
            unsigned __int8 v164 = v477;
            if (v350) {
              goto LABEL_467;
            }
            goto LABEL_348;
          }
          uint64_t v23 = v527;
          unsigned __int8 v164 = v477;
          v163 = v493;
LABEL_414:

          if (v167)
          {
          }
          id v12 = v529;
          uint64_t v8 = 60;
          if (v292)
          {
LABEL_467:
            v373 = self->_fallbackProxyPath;
            uint64_t v374 = [(NSPProxyPath *)v373 networkMultiHopAgentStatistics];
            v375 = (void *)v374;
            if (v374) {
              uint64_t v376 = *(void *)(v374 + 24);
            }
            else {
              uint64_t v376 = 0;
            }
            v377 = self->_fallbackProxyPath;
            v378 = [(NSPProxyPath *)v377 networkSingleHopAgentStatistics];
            v379 = v378;
            if (v378) {
              uint64_t v380 = v378[3];
            }
            else {
              uint64_t v380 = 0;
            }
            id v10 = v510;
            if ((unint64_t)(v380 + v376) > 9)
            {
            }
            else
            {
              v381 = self->_fallbackProxyPath;
              if (v381)
              {

                goto LABEL_517;
              }
              v479 = v164;
              v495 = v163;
              uint64_t v401 = v23;
              v402 = self->_quicProxyPath;
              uint64_t v403 = [(NSPProxyPath *)v402 networkMultiHopAgentStatistics];
              v404 = (void *)v403;
              if (v403) {
                uint64_t v405 = *(void *)(v403 + 24);
              }
              else {
                uint64_t v405 = 0;
              }
              v406 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
              if (v406) {
                uint64_t v407 = v406[3];
              }
              else {
                uint64_t v407 = 0;
              }
              unint64_t v408 = v407 + v405;

              BOOL v234 = v408 > 9;
              uint64_t v23 = v401;
              unsigned __int8 v164 = v479;
              v163 = v495;
              if (!v234)
              {
LABEL_517:
                id v12 = v529;
                id v21 = v532;
                uint64_t v8 = 60;
                if ([(NSPPrivacyProxyAgentManager *)self networkDiscoveredProxyPresentInAgentManager])
                {
                  v480 = v164;
                  long long v541 = 0u;
                  long long v542 = 0u;
                  long long v539 = 0u;
                  long long v540 = 0u;
                  v409 = self->_networkSpecificQUICProxyPaths;
                  id v410 = [(NSMutableDictionary *)v409 countByEnumeratingWithState:&v539 objects:buf count:16];
                  if (v410)
                  {
                    id v411 = v410;
                    uint64_t v412 = *(void *)v540;
                    v496 = v163;
                    v467 = v409;
                    do
                    {
                      v413 = 0;
                      do
                      {
                        if (*(void *)v540 != v412) {
                          objc_enumerationMutation(v409);
                        }
                        v414 = [(NSMutableDictionary *)self->_networkSpecificQUICProxyPaths objectForKey:*(void *)(*((void *)&v539 + 1) + 8 * (void)v413)];
                        if (v414 == v163)
                        {
                          v415 = [(NSDate *)v163 networkMultiHopAgentStatistics];
                          if (v415)
                          {
                            unint64_t v416 = v415[3];

                            if (v416 >= 0xA)
                            {
                              v417 = nplog_obj();
                              if (os_log_type_enabled(v417, OS_LOG_TYPE_INFO))
                              {
                                uint64_t v418 = [(NSDate *)v163 ingressProxy];
                                v419 = (void *)v418;
                                uint64_t v420 = v23;
                                if (v418) {
                                  v421 = *(void **)(v418 + 24);
                                }
                                else {
                                  v421 = 0;
                                }
                                id v422 = v421;
                                v423 = [v422 vendor];
                                *(_DWORD *)v544 = 138412290;
                                v545 = v423;
                                _os_log_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_INFO, "Network discovered proxy: %@ exceeded the timeout count, removing registration", v544, 0xCu);

                                uint64_t v8 = 60;
                                uint64_t v23 = v420;
                                v163 = v496;
                                v409 = v467;
                              }

                              [(NSPPrivacyProxyAgentManager *)self tearDownNetworkDiscoveredProxy];
                            }
                          }
                        }

                        v413 = (char *)v413 + 1;
                      }
                      while (v411 != v413);
                      id v424 = [(NSMutableDictionary *)v409 countByEnumeratingWithState:&v539 objects:buf count:16];
                      id v411 = v424;
                    }
                    while (v424);
                  }

                  id v10 = v510;
                  id v12 = v529;
                  id v21 = v532;
                  unsigned __int8 v164 = v480;
                }
                goto LABEL_351;
              }
            }
            int64_t v382 = self->_probingReason;
            id v12 = v529;
            id v21 = v532;
            uint64_t v8 = 60;
            if (v382 != 1)
            {
              if (v382)
              {
                [(NSPProxyPath *)self->_quicProxyPath resetError];
                [(NSPProxyPath *)self->_fallbackProxyPath resetError];
              }
              else
              {
                sub_10003AD14((id *)&self->super.isa, @"ProxyConnectionTimeout");
                sub_10003AFA8((uint64_t)self, 1);
                v383 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
                if (v383) {
                  v383[3] = 0;
                }

                v384 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
                if (v384) {
                  v384[3] = 0;
                }

                v385 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
                if (v385) {
                  v385[3] = 0;
                }

                v386 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
                if (v386) {
                  v386[3] = 0;
                }
              }
            }
LABEL_351:

            if (v21)
            {
              uint64_t v85 = 3;
              goto LABEL_360;
            }
            goto LABEL_361;
          }
LABEL_348:
          id v296 = nplog_obj();
          if (os_log_type_enabled(v296, OS_LOG_TYPE_DEFAULT))
          {
            v464 = self->_path;
            NWPathStatus v454 = [(NWPath *)v464 status];
            v449 = +[NPUtilities stringFromLinkQualityValue:self->_linkQuality];
            v451 = [(NSDate *)v164 interfaceName];
            v458 = self->_path;
            [(NWPath *)v458 interface];
            v297 = unsigned int v506 = v8;
            id v298 = [v297 interfaceName];
            v474 = v164;
            v491 = v163;
            uint64_t v525 = v23;
            id v299 = self->_lastPathUnsatisfiedDate;
            uint64_t v300 = +[NSDateFormatter localizedStringFromDate:v299 dateStyle:1 timeStyle:2];
            v301 = self->_lastPrimaryInterfaceChangedDate;
            v302 = +[NSDateFormatter localizedStringFromDate:v301 dateStyle:1 timeStyle:2];
            *(_DWORD *)long long buf = 134219266;
            NWPathStatus v547 = v454;
            __int16 v548 = 2112;
            v549 = v449;
            __int16 v550 = 2112;
            v551 = v451;
            __int16 v552 = 2112;
            v553 = v298;
            __int16 v554 = 2112;
            uint64_t v555 = v300;
            long long v303 = (void *)v300;
            __int16 v556 = 2112;
            v557 = v302;
            _os_log_impl((void *)&_mh_execute_header, v296, OS_LOG_TYPE_DEFAULT, "ignoring connection timeout error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

            uint64_t v23 = v525;
            unsigned __int8 v164 = v474;

            uint64_t v8 = v506;
            v163 = v491;

            id v12 = v529;
          }

          [(NSPProxyPath *)self->_quicProxyPath resetError];
          [(NSPProxyPath *)self->_fallbackProxyPath resetError];
          id v10 = v510;
          id v21 = v532;
          goto LABEL_351;
        }

        id v12 = v529;
      }
    }

    goto LABEL_348;
  }
  BOOL v101 = v12;
  id v102 = v10;
  if (!self) {
    goto LABEL_114;
  }
  v103 = self->_path;
  if ((id)[(NWPath *)v103 status] != (id)1) {
    goto LABEL_109;
  }
  int v104 = self->_linkQuality;
  if (v104 == 10 || v104 == 20) {
    goto LABEL_109;
  }
  id v105 = self->_lastPathUnsatisfiedDate;
  if (v105)
  {
    id v5 = +[NSDate now];
    id v12 = self->_lastPathUnsatisfiedDate;
    [v5 timeIntervalSinceDate:v12];
    if (v106 <= 30.0)
    {

      id v12 = v529;
LABEL_109:

LABEL_110:
      v107 = nplog_obj();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
      {
        v486 = self->_path;
        NWPathStatus v461 = [(NWPath *)v486 status];
        uint64_t v108 = +[NPUtilities stringFromLinkQualityValue:self->_linkQuality];
        id v109 = [(NSDate *)v102 interfaceName];
        v471 = self->_path;
        [(NWPath *)v471 interface];
        uint64_t v110 = v509 = v10;
        long long v111 = [v110 interfaceName];
        v518 = v101;
        long long v112 = self->_lastPathUnsatisfiedDate;
        +[NSDateFormatter localizedStringFromDate:v112 dateStyle:1 timeStyle:2];
        id v113 = v500 = v102;
        long long v114 = self->_lastPrimaryInterfaceChangedDate;
        long long v115 = +[NSDateFormatter localizedStringFromDate:v114 dateStyle:1 timeStyle:2];
        *(_DWORD *)long long buf = 134219266;
        NWPathStatus v547 = v461;
        __int16 v548 = 2112;
        v549 = v108;
        __int16 v550 = 2112;
        v551 = v109;
        __int16 v552 = 2112;
        v553 = v111;
        __int16 v554 = 2112;
        uint64_t v555 = (uint64_t)v113;
        __int16 v556 = 2112;
        v557 = v115;
        _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEFAULT, "ignoring DNS timeout error, path status %ld link quality %@ reporting interface %@ primary interface %@ last path unsatisfied date %@, last interface change date %@", buf, 0x3Eu);

        BOOL v101 = v518;
        id v21 = v532;

        id v10 = v509;
        id v12 = v529;

        id v102 = v500;
      }

LABEL_113:
      [(NSPProxyPath *)self->_quicProxyPath resetError];
      [(NSPProxyPath *)self->_fallbackProxyPath resetError];
      goto LABEL_114;
    }
  }
  v513 = v10;
  id v287 = self->_lastPrimaryInterfaceChangedDate;
  v524 = v101;
  v504 = v102;
  if (v287)
  {
    a5 = +[NSDate now];
    id v10 = self->_lastPrimaryInterfaceChangedDate;
    [a5 timeIntervalSinceDate:v10];
    if (v288 <= 30.0)
    {
      v490 = v5;
      BOOL v289 = 0;
      goto LABEL_409;
    }
    if (!v102)
    {
      v490 = v5;
      BOOL v289 = 1;
      goto LABEL_409;
    }
  }
  else if (!v102)
  {
    if (v105)
    {
    }
    id v12 = v529;
    id v21 = v532;
    goto LABEL_443;
  }
  v476 = v12;
  v490 = v5;
  id v340 = [(NSDate *)v102 interfaceIndex];
  long long v341 = [(NWPath *)self->_path interface];
  id v342 = [v341 interfaceIndex];
  BOOL v289 = v340 == v342;

  if (!v287)
  {
    if (v105)
    {
    }
    BOOL v350 = v340 == v342;
    id v10 = v513;
    BOOL v101 = v524;
    id v12 = v529;
    id v21 = v532;
    id v102 = v504;
    if (!v350) {
      goto LABEL_110;
    }
    goto LABEL_443;
  }
  BOOL v101 = v524;
  id v102 = v504;
  id v12 = v476;
LABEL_409:

  if (v105)
  {
  }
  id v10 = v513;
  id v12 = v529;
  id v21 = v532;
  if (!v289) {
    goto LABEL_110;
  }
LABEL_443:
  v351 = self->_quicProxyPath;
  uint64_t v352 = [(NSPProxyPath *)v351 networkMultiHopAgentStatistics];
  v353 = (void *)v352;
  if (v352) {
    uint64_t v354 = *(void *)(v352 + 64);
  }
  else {
    uint64_t v354 = 0;
  }
  v355 = self->_quicProxyPath;
  uint64_t v356 = [(NSPProxyPath *)v355 networkSingleHopAgentStatistics];
  v357 = (void *)v356;
  if (v356) {
    uint64_t v358 = *(void *)(v356 + 64);
  }
  else {
    uint64_t v358 = 0;
  }
  uint64_t v359 = v358 + v354;
  v360 = self->_fallbackProxyPath;
  uint64_t v361 = [(NSPProxyPath *)v360 networkMultiHopAgentStatistics];
  v362 = (void *)v361;
  if (v361) {
    uint64_t v363 = *(void *)(v361 + 64);
  }
  else {
    uint64_t v363 = 0;
  }
  uint64_t v364 = v359 + v363;
  v365 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
  if (v365) {
    uint64_t v366 = v365[8];
  }
  else {
    uint64_t v366 = 0;
  }
  unint64_t v367 = v364 + v366;

  BOOL v157 = v367 >= 3;
  id v10 = v513;
  BOOL v101 = v524;
  id v102 = v504;
  if (v157)
  {
    int64_t v368 = self->_probingReason;
    if (v368 != 1)
    {
      if (!v368)
      {
        sub_10003AD14((id *)&self->super.isa, @"ProxyConnectionDNSTimeout");
        sub_10003AFA8((uint64_t)self, 1);
        v369 = [(NSPProxyPath *)self->_quicProxyPath networkMultiHopAgentStatistics];
        if (v369) {
          v369[8] = 0;
        }

        v370 = [(NSPProxyPath *)self->_quicProxyPath networkSingleHopAgentStatistics];
        if (v370) {
          v370[8] = 0;
        }

        v371 = [(NSPProxyPath *)self->_fallbackProxyPath networkMultiHopAgentStatistics];
        if (v371) {
          v371[8] = 0;
        }

        v372 = [(NSPProxyPath *)self->_fallbackProxyPath networkSingleHopAgentStatistics];
        if (v372) {
          v372[8] = 0;
        }

        goto LABEL_114;
      }
      goto LABEL_113;
    }
  }
LABEL_114:

  if (v21) {
    ++v21[8];
  }
LABEL_362:
  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)reportEpoch:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (self)
  {
    unsigned int v5 = [(NSNumber *)self->_configEpoch unsignedShortValue];
    reportedEpoch = self->_reportedEpoch;
  }
  else
  {
    unsigned int v5 = [0 unsignedShortValue];
    reportedEpoch = 0;
  }
  unsigned int v7 = [(NSNumber *)reportedEpoch unsignedShortValue];
  if (v5 < v3 && v7 < v3)
  {
    id v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        id v10 = self->_configEpoch;
        id v11 = self->_reportedEpoch;
      }
      else
      {
        id v10 = 0;
        id v11 = 0;
      }
      *(_DWORD *)long long buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v3;
      *(_WORD *)id v16 = 2112;
      *(void *)&v16[2] = v10;
      *(_WORD *)&v16[10] = 2112;
      *(void *)&v16[12] = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New epoch (%u) is larger than config epoch (%@) and previous reported epoch (%@), triggering config fetch", buf, 0x1Cu);
    }
    id v12 = +[NSNumber numberWithUnsignedShort:v3];
    sub_100027554((uint64_t)self, v12);

    *(void *)long long buf = 0;
    *(void *)id v16 = buf;
    *(void *)&v16[8] = 0x3032000000;
    *(void *)&v16[16] = sub_100005D5C;
    uint64_t v17 = sub_10000F6B0;
    id v18 = (id)os_transaction_create();
    uint64_t v13 = NPGetInternalQueue();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003EC40;
    v14[3] = &unk_100105460;
    v14[4] = self;
    v14[5] = buf;
    dispatch_async(v13, v14);

    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    _Block_object_dispose(buf, 8);
  }
}

- (void)reportActivityForApp:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)objc_loadWeakRetained((id *)&self->_delegate);
  }
  [(NSPPrivacyProxyAgentManager *)self reportActivityForApp:v7 path:v6];
}

- (void)probeSuccess:(id)a3
{
  id v4 = (NSPProber *)a3;
  unsigned int v5 = v4;
  if (!self) {
    goto LABEL_18;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_proxyPathProber == v4)
      {
        id v35 = nplog_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          int64_t v36 = self->_probingReason;
          CFStringRef v37 = @"Unknown";
          if (v36 == 2) {
            CFStringRef v37 = @"DNS";
          }
          if (v36 == 1) {
            int v38 = @"Proxy";
          }
          else {
            int v38 = (__CFString *)v37;
          }
          long long v39 = v38;
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Probing(%@): Proxy path probe successful", buf, 0xCu);
        }
        [(NSPProxyPath *)self->_quicProxyPath resetStats];
        [(NSPProxyPath *)self->_quicProxyPath resetError];
        [(NSPProxyPath *)self->_fallbackProxyPath resetStats];
        [(NSPProxyPath *)self->_fallbackProxyPath resetError];
        unsigned __int8 v40 = +[NSDate now];
        objc_storeStrong((id *)&self->_probeEndTime, v40);

        sub_10002B3BC((uint64_t)self);
        *(void *)long long buf = 0;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        int v51 = sub_100005D5C;
        long long v52 = sub_10000F6B0;
        id v53 = (id)os_transaction_create();
        BOOL v41 = NPGetInternalQueue();
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_10003F33C;
        v49[3] = &unk_100105460;
        v49[4] = self;
        v49[5] = buf;
        dispatch_async(v41, v49);

        _Block_object_dispose(buf, 8);
      }
      else if (self->_directPathProber == v4)
      {
        id v7 = v4;
        if (v7)
        {
          unint64_t probeSuccessCount = v7->_probeSuccessCount;

          if (probeSuccessCount >= 2)
          {
            id v9 = nplog_obj();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              int64_t v10 = self->_probingReason;
              CFStringRef v11 = @"Unknown";
              if (v10 == 2) {
                CFStringRef v11 = @"DNS";
              }
              if (v10 == 1) {
                id v12 = @"Proxy";
              }
              else {
                id v12 = (__CFString *)v11;
              }
              uint64_t v13 = v12;
              id v14 = v13;
              directPathProber = self->_directPathProber;
              if (directPathProber) {
                directPathProber = (NSPProber *)directPathProber->_probeSuccessCount;
              }
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v13;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = directPathProber;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe successful %lu times", buf, 0x16u);
            }
            objc_storeStrong((id *)&self->_directPathProber, 0);
          }
        }
      }
      goto LABEL_52;
    }
LABEL_18:
    id v16 = nplog_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      if (self)
      {
        int64_t v17 = self->_probingReason;
        CFStringRef v18 = @"Unknown";
        if (v17 == 2) {
          CFStringRef v18 = @"DNS";
        }
        if (v17 == 1) {
          id v19 = @"Proxy";
        }
        else {
          id v19 = (__CFString *)v18;
        }
      }
      else
      {
        id v19 = 0;
      }
      id v20 = v19;
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Invalid probing reason: %@", buf, 0xCu);
    }
    goto LABEL_52;
  }
  BOOL v21 = self->_directPathProber == v4;
  uint64_t v22 = nplog_obj();
  uint64_t v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int64_t v24 = self->_probingReason;
      CFStringRef v25 = @"Unknown";
      if (v24 == 2) {
        CFStringRef v25 = @"DNS";
      }
      if (v24 == 1) {
        unint64_t v26 = @"Proxy";
      }
      else {
        unint64_t v26 = (__CFString *)v25;
      }
      uint64_t v27 = v26;
      double v28 = v27;
      id v29 = self->_directPathProber;
      if (v29) {
        id v29 = (NSPProber *)v29->_probeSuccessCount;
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v29;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe successful %lu times", buf, 0x16u);
    }
    uint64_t v30 = self->_directPathProber;
    NSUInteger v31 = v30;
    if (!v30 || !v30->_probeFailedCount)
    {
      NSUInteger v32 = self->_directPathProber;
      NSUInteger v33 = v32;
      if (!v32 || !v32->_probeRedirectedCount)
      {
        long long v42 = self->_directPathProber;
        if (v42)
        {
          BOOL v43 = v42->_probeServerErrorCount == 0;

          if (!v43) {
            goto LABEL_43;
          }
        }
        else
        {
        }
        double v44 = self->_directPathProber;
        if (v44)
        {
          BOOL v45 = v44->_probeSuccessCount > 1;

          if (v45)
          {
            long long v46 = self->_path;
            unint64_t v47 = [(NWPath *)v46 interface];
            sub_10003AB34((uint64_t)self, v47, 1);

            id v48 = +[NSDate now];
            objc_storeStrong((id *)&self->_probeEndTime, v48);

            sub_10002B3BC((uint64_t)self);
          }
        }
        goto LABEL_52;
      }
    }
LABEL_43:
    [(NSPProxyPath *)self->_quicProxyPath resetStats];
    [(NSPProxyPath *)self->_quicProxyPath resetError];
    [(NSPProxyPath *)self->_fallbackProxyPath resetStats];
    [(NSPProxyPath *)self->_fallbackProxyPath resetError];
    NSUInteger v34 = +[NSDate now];
    objc_storeStrong((id *)&self->_probeEndTime, v34);

    sub_10002B3BC((uint64_t)self);
LABEL_52:
    [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
    goto LABEL_53;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[NSPPrivacyProxyAgentManager probeSuccess:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", buf, 0xCu);
  }

LABEL_53:
}

- (void)probeFailed:(id)a3
{
  id v4 = (NSPProber *)a3;
  unsigned int v5 = v4;
  if (!self) {
    goto LABEL_9;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason == 2) {
    goto LABEL_11;
  }
  if (probingReason == 1)
  {
    if (self->_proxyPathProber == v4)
    {
      id v7 = v4;
      if (v7 && v7->_probeFailedCount > 1)
      {
        directPathProber = self->_directPathProber;

        if (!directPathProber)
        {
          id v9 = self->_path;
          int64_t v10 = [(NWPath *)v9 interface];
          objc_storeStrong((id *)&self->_proberInterface, v10);

          sub_10003AB34((uint64_t)self, self->_proberInterface, 2);
        }
      }
      else
      {
      }
    }
  }
  else
  {
LABEL_9:
    CFStringRef v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        int64_t v12 = self->_probingReason;
        CFStringRef v13 = @"Unknown";
        if (v12 == 2) {
          CFStringRef v13 = @"DNS";
        }
        if (v12 == 1) {
          id v14 = @"Proxy";
        }
        else {
          id v14 = (__CFString *)v13;
        }
      }
      else
      {
        id v14 = 0;
      }
      id v15 = v14;
      int v16 = 138412290;
      int64_t v17 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_11:
  [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
}

- (void)probeRedirected:(id)a3
{
  id v4 = (NSPProber *)a3;
  unsigned int v5 = v4;
  if (!self) {
    goto LABEL_13;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v4)
      {
LABEL_24:
        [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
        goto LABEL_25;
      }
      id v7 = nplog_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int64_t v8 = self->_probingReason;
        CFStringRef v9 = @"Unknown";
        if (v8 == 2) {
          CFStringRef v9 = @"DNS";
        }
        if (v8 == 1) {
          int64_t v10 = @"Proxy";
        }
        else {
          int64_t v10 = (__CFString *)v9;
        }
        CFStringRef v11 = v10;
        int v24 = 138412290;
        CFStringRef v25 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe redirected", (uint8_t *)&v24, 0xCu);
      }
      [(NSPOutageReasonStats *)self->_lastProxyOutageReasonStats setOutageReasonSubType:@"CaptiveProbeRedirected"];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained proxyConnectivityNetworkOutage];
LABEL_14:

      goto LABEL_24;
    }
LABEL_13:
    id WeakRetained = nplog_obj();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        int64_t v20 = self->_probingReason;
        CFStringRef v21 = @"Unknown";
        if (v20 == 2) {
          CFStringRef v21 = @"DNS";
        }
        if (v20 == 1) {
          uint64_t v22 = @"Proxy";
        }
        else {
          uint64_t v22 = (__CFString *)v21;
        }
      }
      else
      {
        uint64_t v22 = 0;
      }
      uint64_t v23 = v22;
      int v24 = 138412290;
      CFStringRef v25 = (const char *)v23;
      _os_log_error_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_14;
  }
  directPathProber = self->_directPathProber;
  id v14 = nplog_obj();
  id v15 = v14;
  if (directPathProber == v5)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int64_t v16 = self->_probingReason;
      CFStringRef v17 = @"Unknown";
      if (v16 == 2) {
        CFStringRef v17 = @"DNS";
      }
      if (v16 == 1) {
        CFStringRef v18 = @"Proxy";
      }
      else {
        CFStringRef v18 = (__CFString *)v17;
      }
      id v19 = v18;
      int v24 = 138412290;
      CFStringRef v25 = (const char *)v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe redirected", (uint8_t *)&v24, 0xCu);
    }
    sub_10002B3BC((uint64_t)self);
    goto LABEL_24;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    int v24 = 136315138;
    CFStringRef v25 = "-[NSPPrivacyProxyAgentManager probeRedirected:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", (uint8_t *)&v24, 0xCu);
  }

LABEL_25:
}

- (void)probeServerError:(id)a3 httpStatusCode:(int64_t)a4
{
  id v6 = (NSPProber *)a3;
  id v7 = v6;
  if (!self) {
    goto LABEL_14;
  }
  int64_t probingReason = self->_probingReason;
  if (probingReason != 2)
  {
    if (probingReason == 1)
    {
      if (self->_directPathProber != v6)
      {
LABEL_25:
        [(NSPPrivacyProxyAgentManager *)self updateUserEventAgentData];
        goto LABEL_26;
      }
      CFStringRef v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int64_t v10 = self->_probingReason;
        CFStringRef v11 = @"Unknown";
        if (v10 == 2) {
          CFStringRef v11 = @"DNS";
        }
        if (v10 == 1) {
          int64_t v12 = @"Proxy";
        }
        else {
          int64_t v12 = (__CFString *)v11;
        }
        CFStringRef v13 = v12;
        int v27 = 138412290;
        double v28 = (const char *)v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe received server error", (uint8_t *)&v27, 0xCu);
      }
      lastProxyOutageReasonStats = self->_lastProxyOutageReasonStats;
      if (a4 == 403)
      {
        [(NSPOutageReasonStats *)lastProxyOutageReasonStats setOutageReasonSubType:@"ProxyProbeForbidden"];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained proxyConnectivityNetworkOutage];
      }
      else
      {
        [(NSPOutageReasonStats *)lastProxyOutageReasonStats setOutageReasonSubType:@"ProxyProbeServerError"];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained proxyConnectivityOutage];
      }
LABEL_15:

      goto LABEL_25;
    }
LABEL_14:
    id WeakRetained = nplog_obj();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        int64_t v23 = self->_probingReason;
        CFStringRef v24 = @"Unknown";
        if (v23 == 2) {
          CFStringRef v24 = @"DNS";
        }
        if (v23 == 1) {
          CFStringRef v25 = @"Proxy";
        }
        else {
          CFStringRef v25 = (__CFString *)v24;
        }
      }
      else
      {
        CFStringRef v25 = 0;
      }
      unint64_t v26 = v25;
      int v27 = 138412290;
      double v28 = (const char *)v26;
      _os_log_error_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_ERROR, "Invalid probing reason: %@", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_15;
  }
  directPathProber = self->_directPathProber;
  CFStringRef v17 = nplog_obj();
  CFStringRef v18 = v17;
  if (directPathProber == v7)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int64_t v19 = self->_probingReason;
      CFStringRef v20 = @"Unknown";
      if (v19 == 2) {
        CFStringRef v20 = @"DNS";
      }
      if (v19 == 1) {
        CFStringRef v21 = @"Proxy";
      }
      else {
        CFStringRef v21 = (__CFString *)v20;
      }
      uint64_t v22 = v21;
      int v27 = 138412290;
      double v28 = (const char *)v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Probing(%@): Direct path probe received server error", (uint8_t *)&v27, 0xCu);
    }
    sub_10002B3BC((uint64_t)self);
    goto LABEL_25;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    int v27 = 136315138;
    double v28 = "-[NSPPrivacyProxyAgentManager probeServerError:httpStatusCode:]";
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "%s called with null (prober == self.directPathProber)", (uint8_t *)&v27, 0xCu);
  }

LABEL_26:
}

- (id)ingressProxyURL
{
  if (self) {
    quicProxyPath = self->_quicProxyPath;
  }
  else {
    quicProxyPath = 0;
  }
  uint64_t v3 = quicProxyPath;
  id v4 = [(NSPProxyPath *)v3 ingressProxy];
  unsigned int v5 = v4;
  if (v4) {
    id v4 = (void *)v4[3];
  }
  id v6 = [v4 proxyURL];

  return v6;
}

- (id)ingressFallbackProxyURL
{
  if (self) {
    fallbackProxyPath = self->_fallbackProxyPath;
  }
  else {
    fallbackProxyPath = 0;
  }
  uint64_t v3 = fallbackProxyPath;
  id v4 = [(NSPProxyPath *)v3 ingressProxy];
  unsigned int v5 = v4;
  if (v4) {
    id v4 = (void *)v4[3];
  }
  id v6 = [v4 tcpProxyFqdn];

  return v6;
}

- (void)copyProxyInfo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self) {
      quicProxyPath = self->_quicProxyPath;
    }
    else {
      quicProxyPath = 0;
    }
    id v6 = quicProxyPath;

    if (v6)
    {
      if (self) {
        id v7 = self->_quicProxyPath;
      }
      else {
        id v7 = 0;
      }
      int64_t v8 = v7;
      uint64_t v9 = [(NSPProxyPath *)v8 ingressProxy];
      int64_t v10 = (void *)v9;
      if (v9) {
        CFStringRef v11 = *(void **)(v9 + 24);
      }
      else {
        CFStringRef v11 = 0;
      }
      id v12 = v11;
      CFStringRef v13 = [v12 proxyURL];
      [v4 setIngressProxyURL:v13];

      if (self) {
        id v14 = self->_quicProxyPath;
      }
      else {
        id v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = [(NSPProxyPath *)v15 egressProxy];
      CFStringRef v17 = (void *)v16;
      if (v16) {
        CFStringRef v18 = *(void **)(v16 + 24);
      }
      else {
        CFStringRef v18 = 0;
      }
      id v19 = v18;
      CFStringRef v20 = [v19 proxyURL];
      [v4 setEgressProxyURL:v20];
    }
    if (self) {
      fallbackProxyPath = self->_fallbackProxyPath;
    }
    else {
      fallbackProxyPath = 0;
    }
    uint64_t v22 = fallbackProxyPath;

    if (v22)
    {
      if (self) {
        int64_t v23 = self->_fallbackProxyPath;
      }
      else {
        int64_t v23 = 0;
      }
      CFStringRef v24 = v23;
      uint64_t v25 = [(NSPProxyPath *)v24 ingressProxy];
      unint64_t v26 = (void *)v25;
      if (v25) {
        int v27 = *(void **)(v25 + 24);
      }
      else {
        int v27 = 0;
      }
      id v28 = v27;
      id v29 = [v28 tcpProxyFqdn];
      [v4 setIngressFallbackProxyURL:v29];

      if (self) {
        uint64_t v30 = self->_fallbackProxyPath;
      }
      else {
        uint64_t v30 = 0;
      }
      NSUInteger v31 = v30;
      uint64_t v32 = [(NSPProxyPath *)v31 egressProxy];
      NSUInteger v33 = (void *)v32;
      if (v32) {
        NSUInteger v34 = *(void **)(v32 + 24);
      }
      else {
        NSUInteger v34 = 0;
      }
      id v35 = v34;
      int64_t v36 = [v35 tcpProxyFqdn];
      [v4 setEgressFallbackProxyURL:v36];
    }
    if (self)
    {
      [v4 setProxyTokenFetchSuccessCount:((char *)[v4 proxyTokenFetchSuccessCount]) + self->_tokenFetchSuccessCount];
      unint64_t tokenFetchFailedCount = self->_tokenFetchFailedCount;
    }
    else
    {
      [v4 setProxyTokenFetchSuccessCount:[v4 proxyTokenFetchSuccessCount]];
      unint64_t tokenFetchFailedCount = 0;
    }
    [v4 setProxyTokenFetchFailedCount:[v4 proxyTokenFetchFailedCount] + tokenFetchFailedCount];
    if (self)
    {
      [v4 setProxyTokenConsumedCount:[v4 proxyTokenConsumedCount] + self->_tokenConsumedCount];
      unint64_t tokenExpiredCount = self->_tokenExpiredCount;
    }
    else
    {
      [v4 setProxyTokenConsumedCount:[v4 proxyTokenConsumedCount]];
      unint64_t tokenExpiredCount = 0;
    }
    [v4 setProxyTokenExpiredCount:((char *)[v4 proxyTokenExpiredCount]) + tokenExpiredCount];
    if (self)
    {
      [v4 setProxyAgentLowWaterMarkHitCount:((char *)[v4 proxyAgentLowWaterMarkHitCount]) + self->_agentLowWaterMarkHitCount];
      unint64_t cacheLowWaterMarkHitCount = self->_cacheLowWaterMarkHitCount;
    }
    else
    {
      [v4 setProxyAgentLowWaterMarkHitCount:[v4 proxyAgentLowWaterMarkHitCount]];
      unint64_t cacheLowWaterMarkHitCount = 0;
    }
    [v4 setProxyCacheLowWaterMarkHitCount:((char *)[v4 proxyCacheLowWaterMarkHitCount]) + cacheLowWaterMarkHitCount];
    if (self)
    {
      [v4 setBadTokenCount:((char *)[v4 badTokenCount]) + self->_badTokenCount];
      unint64_t missingTokenCount = self->_missingTokenCount;
    }
    else
    {
      [v4 setBadTokenCount:[v4 badTokenCount]];
      unint64_t missingTokenCount = 0;
    }
    [v4 setMissingTokenCount:((char *)[v4 missingTokenCount]) + missingTokenCount];
    if (self)
    {
      [v4 setNetworkProxiesRotated:((char *)[v4 networkProxiesRotated] + self->_networkProxiesRotated)];
      unint64_t networkFallbackProxiesRotated = self->_networkFallbackProxiesRotated;
    }
    else
    {
      [v4 setNetworkProxiesRotated:[v4 networkProxiesRotated]];
      unint64_t networkFallbackProxiesRotated = 0;
    }
    [v4 setNetworkFallbackProxiesRotated:((char *)[v4 networkFallbackProxiesRotated]) + networkFallbackProxiesRotated];
    if (self) {
      unint64_t proxiesRotated = self->_proxiesRotated;
    }
    else {
      unint64_t proxiesRotated = 0;
    }
    [v4 setProxiesRotated:((char *)[v4 proxiesRotated]) + proxiesRotated];
    os_log_t log = (os_log_t)objc_alloc_init((Class)NSMutableDictionary);
    id v86 = self;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    if (self) {
      proxyTokenInfoArray = self->_proxyTokenInfoArray;
    }
    else {
      proxyTokenInfoArray = 0;
    }
    double v44 = proxyTokenInfoArray;
    id v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v96 objects:v102 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v97;
      do
      {
        id v48 = 0;
        do
        {
          if (*(void *)v97 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v96 + 1) + 8 * (void)v48);
          if (v49) {
            long long v50 = *(void **)(v49 + 24);
          }
          else {
            long long v50 = 0;
          }
          id v51 = v50;
          long long v52 = [v51 vendor];

          if (v52)
          {
            id v53 = objc_alloc_init((Class)PrivacyProxyTokenInfo);
            long long v54 = v53;
            if (v49)
            {
              [v53 setCachedTokens:*(void *)(v49 + 32)];
              uint64_t v55 = *(void *)(v49 + 40);
              if (v55) {
                uint64_t v56 = [*(id *)(v55 + 24) tokenCount];
              }
              else {
                uint64_t v56 = 0;
              }
              [v54 setAgentTokens:v56];
              if (*(unsigned char *)(v49 + 11)) {
                uint64_t v57 = 30;
              }
              else {
                uint64_t v57 = 10;
              }
            }
            else
            {
              [v53 setCachedTokens:0];
              [v54 setAgentTokens:0];
              uint64_t v57 = 0;
            }
            [v54 setCacheLowWaterMark:v57];
            [v54 setAgentLowWaterMark:sub_100011C74(v49)];
            [log setObject:v54 forKeyedSubscript:v52];
          }
          if (v49)
          {
            [v4 setProxyTokenFetchSuccessCount:[v4 proxyTokenFetchSuccessCount] + *(void *)(v49 + 88)];
            uint64_t v58 = *(void *)(v49 + 112);
          }
          else
          {
            [v4 setProxyTokenFetchSuccessCount:[v4 proxyTokenFetchSuccessCount]];
            uint64_t v58 = 0;
          }
          [v4 setProxyTokenFetchFailedCount:[v4 proxyTokenFetchFailedCount] + v58];
          if (v49)
          {
            [v4 setProxyTokenConsumedCount:[v4 proxyTokenConsumedCount] + *(void *)(v49 + 96)];
            uint64_t v59 = *(void *)(v49 + 104);
          }
          else
          {
            [v4 setProxyTokenConsumedCount:[v4 proxyTokenConsumedCount]];
            uint64_t v59 = 0;
          }
          [v4 setProxyTokenExpiredCount:((char *)[v4 proxyTokenExpiredCount]) + v59];
          if (v49)
          {
            [v4 setProxyAgentLowWaterMarkHitCount:((char *)[v4 proxyAgentLowWaterMarkHitCount] + *(void *)(v49 + 120))];
            uint64_t v60 = *(void *)(v49 + 128);
          }
          else
          {
            [v4 setProxyAgentLowWaterMarkHitCount:[v4 proxyAgentLowWaterMarkHitCount]];
            uint64_t v60 = 0;
          }
          [v4 setProxyCacheLowWaterMarkHitCount:[v4 proxyCacheLowWaterMarkHitCount] + v60];
          if (v49)
          {
            [v4 setBadTokenCount:((char *)[v4 badTokenCount] + *(void *)(v49 + 136))];
            uint64_t v49 = *(void *)(v49 + 144);
          }
          else
          {
            [v4 setBadTokenCount:[v4 badTokenCount]];
          }
          [v4 setMissingTokenCount:[v4 missingTokenCount] + v49];

          id v48 = (char *)v48 + 1;
        }
        while (v46 != v48);
        id v61 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v96 objects:v102 count:16];
        id v46 = v61;
      }
      while (v61);
    }

    [v4 setTokenCounts:log];
    id v62 = objc_alloc_init((Class)NSMutableArray);
    id v84 = objc_alloc_init((Class)NSMutableDictionary);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    proxiedContentPaths = v86;
    if (v86) {
      proxiedContentPaths = v86->_proxiedContentPaths;
    }
    id obj = proxiedContentPaths;
    id v64 = [obj countByEnumeratingWithState:&v92 objects:v101 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v87 = *(void *)v93;
      do
      {
        id v66 = 0;
        do
        {
          if (*(void *)v93 != v87) {
            objc_enumerationMutation(obj);
          }
          int v67 = *(void **)(*((void *)&v92 + 1) + 8 * (void)v66);
          long long v88 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          uint64_t v68 = [v67 associatedMaps];
          id v69 = [v68 countByEnumeratingWithState:&v88 objects:v100 count:16];
          if (v69)
          {
            id v70 = v69;
            uint64_t v71 = *(void *)v89;
            do
            {
              for (i = 0; i != v70; i = (char *)i + 1)
              {
                if (*(void *)v89 != v71) {
                  objc_enumerationMutation(v68);
                }
                int64_t v73 = [*(id *)(*((void *)&v88 + 1) + 8 * i) identifier];
                [v62 addObject:v73];
              }
              id v70 = [v68 countByEnumeratingWithState:&v88 objects:v100 count:16];
            }
            while (v70);
          }

          double v74 = [v67 ingressProxy];
          if (v74) {
            [v67 ingressProxy];
          }
          else {
          double v75 = [v67 egressProxy];
          }
          BOOL v76 = v75;
          if (v75) {
            double v75 = (void *)v75[3];
          }
          unint64_t v77 = [v75 vendor];

          if (v77)
          {
            uint64_t v78 = [v67 quicRegistration];
            id v79 = (void *)v78;
            if (v78) {
              uint64_t v80 = [*(id *)(v78 + 24) tokenCount];
            }
            else {
              uint64_t v80 = 0;
            }

            int v81 = +[NSNumber numberWithUnsignedInteger:v80];
            [v84 setObject:v81 forKeyedSubscript:v77];
          }
          id v66 = (char *)v66 + 1;
        }
        while (v66 != v65);
        id v82 = [obj countByEnumeratingWithState:&v92 objects:v101 count:16];
        id v65 = v82;
      }
      while (v82);
    }

    [v4 setResumableSessionCounts:v84];
    [v4 setEnabledProxiedContentMaps:v62];
  }
  else
  {
    nplog_obj();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v104 = "-[NSPPrivacyProxyAgentManager copyProxyInfo:]";
      _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s called with null proxyInfo", buf, 0xCu);
    }
  }
}

- (void)updateUserEventAgentData
{
  if (![(NSPPrivacyProxyAgentManager *)self deferCommit])
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int64_t v8 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Updating userevent agent data", v8, 2u);
    }

    id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [(NSPPrivacyProxyAgentManager *)self encodeWithCoder:v4];
    unsigned int v5 = +[NEFileHandleMaintainer sharedMaintainer];
    id v6 = [v4 encodedData];
    [v5 setAuxiliaryData:v6 forKey:@"NSPProxyAgentManagerAuxilaryData"];

    id v7 = +[NEFileHandleMaintainer sharedMaintainer];
    [v7 commit];
  }
}

- (void)setUserEventAgentTokenFetchParameters
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  if (self) {
    proxyTokenInfoArray = self->_proxyTokenInfoArray;
  }
  else {
    proxyTokenInfoArray = 0;
  }
  uint64_t v3 = proxyTokenInfoArray;
  char v4 = 0;
  id v5 = 0;
  id v6 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v26;
    do
    {
      int64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v8);
        if (v5)
        {
          if (v9)
          {
            id v10 = *(id *)(v9 + 80);
            if (v10)
            {
              CFStringRef v11 = v10;
              [*(id *)(v9 + 80) timeIntervalSinceDate:v5];
              BOOL v13 = v12 < 0.0;

              if (v13)
              {
                id v14 = *(id *)(v9 + 80);

                id v5 = v14;
              }
            }
            goto LABEL_15;
          }
        }
        else
        {
          if (v9)
          {
            id v5 = *(id *)(v9 + 80);
LABEL_15:
            BOOL v15 = *(unsigned char *)(v9 + 9) != 0;
            goto LABEL_16;
          }
          id v5 = 0;
        }
        BOOL v15 = 0;
LABEL_16:
        v4 |= v15;
        int64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v16 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v6 = v16;
    }
    while (v16);
  }

  v23[0] = 0;
  v23[1] = v23;
  void v23[2] = 0x3032000000;
  v23[3] = sub_100005D5C;
  v23[4] = sub_10000F6B0;
  id v24 = (id)os_transaction_create();
  CFStringRef v17 = NPGetInternalQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040938;
  block[3] = &unk_100105BC8;
  char v22 = v4 & 1;
  id v20 = v5;
  CFStringRef v21 = v23;
  id v18 = v5;
  dispatch_async(v17, block);

  _Block_object_dispose(v23, 8);
}

- (void)setUserEventAgentProberParameters
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_100005D5C;
  v5[4] = sub_10000F6B0;
  id v6 = (id)os_transaction_create();
  uint64_t v3 = NPGetInternalQueue();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100040B04;
  v4[3] = &unk_100105460;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (void)reportTokenFetchFailure:(id)a3 statusCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[NSPPrivacyTokenManager sharedTokenManager];
  int64_t v8 = [v7 tokenFetchURL];
  [(NSPPrivacyProxyAgentManager *)self sendRTCReportWithFailureType:1003 errorCode:a4 url:v6 ingressProxy:0 egressProxy:0 tokenServer:v8];

  uint64_t v9 = objc_alloc_init(NSPTokenServerStats);
  id v10 = [(NSPPrivacyProxyAgentManager *)self tierString];
  [(NSPTokenServerStats *)v9 setTierType:v10];

  if (self && self->_tokenServerMaskedAddress)
  {
    -[NSPTokenServerStats setTokenServerAddress:](v9, "setTokenServerAddress:");
    [(NSPProxyAnalytics *)v9 sendAnalytics];
  }
  else
  {
    CFStringRef v11 = +[NSPPrivacyTokenManager sharedTokenManager];
    if (self) {
      path = self->_path;
    }
    else {
      path = 0;
    }
    BOOL v13 = path;
    id v14 = [(NWPath *)v13 interface];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100040E84;
    v16[3] = &unk_100105BF0;
    v16[4] = self;
    BOOL v15 = v9;

    CFStringRef v17 = v15;
    [v11 getTokenServerIPWithInterface:v14 completionHandler:v16];
  }
}

- (id)singleHopQUICProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self multiHopConfigurationHash];
}

- (id)multiHopQUICProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_quicProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self singleHopConfigurationHash];
}

- (id)multiHopFallbackProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self multiHopConfigurationHash];
}

- (id)singleHopFallbackProxyConfigHash:(id)a3
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_fallbackProxyPath;
  }
  return [(NSPPrivacyProxyAgentManager *)self singleHopConfigurationHash];
}

- (id)alternatePreferredPathAgentUUIDs:(id)a3
{
  id v29 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  if (self) {
    preferredQUICProxyPaths = self->_preferredQUICProxyPaths;
  }
  else {
    preferredQUICProxyPaths = 0;
  }
  id obj = preferredQUICProxyPaths;
  id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v5)
  {
    id v26 = 0;
    goto LABEL_31;
  }
  id v6 = v5;
  id v26 = 0;
  uint64_t v28 = *(void *)v31;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v31 != v28) {
        objc_enumerationMutation(obj);
      }
      if (self) {
        int64_t v8 = self->_preferredQUICProxyPaths;
      }
      else {
        int64_t v8 = 0;
      }
      uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * (void)v7), v26);
      uint64_t v10 = [v9 egressProxy];
      CFStringRef v11 = (void *)v10;
      if (v10) {
        double v12 = *(void **)(v10 + 24);
      }
      else {
        double v12 = 0;
      }
      id v13 = v12;
      id v14 = [v13 vendor];
      BOOL v15 = [v29 egressProxy];
      id v16 = v15;
      if (v15) {
        BOOL v15 = (void *)v15[3];
      }
      CFStringRef v17 = [v15 vendor];
      unsigned __int8 v18 = [v14 isEqualToString:v17];

      if ((v18 & 1) == 0)
      {
        id v19 = [v9 egressProxy];
        id v20 = v19;
        if (v19) {
          id v19 = (void *)v19[3];
        }
        CFStringRef v21 = [v19 preferredPathPatterns];
        if ([v21 count])
        {
          char v22 = [v9 nonDefaultAgentUUID];

          if (!v22) {
            goto LABEL_24;
          }
          id v23 = v26;
          if (!v26) {
            id v23 = objc_alloc_init((Class)NSMutableArray);
          }
          id v20 = [v9 nonDefaultAgentUUID];
          id v26 = v23;
          [v23 addObject:v20];
        }
        else
        {
        }
      }
LABEL_24:

      uint64_t v7 = (char *)v7 + 1;
    }
    while (v6 != v7);
    id v24 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    id v6 = v24;
  }
  while (v24);
LABEL_31:

  return v26;
}

- (void)didReceiveUpdatedPvDOptions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = kSCPropNetPvDHTTPSupported;
    uint64_t v7 = [v4 objectForKey:kSCPropNetPvDHTTPSupported];
    if (v7)
    {
      int64_t v8 = (void *)v7;
      uint64_t v9 = kSCPropNetPvDIdentifier;
      uint64_t v10 = [v5 objectForKey:kSCPropNetPvDIdentifier];
      if (!v10)
      {
LABEL_21:

        goto LABEL_22;
      }
      CFStringRef v11 = (void *)v10;
      uint64_t v12 = kSCPropNetPvDAdditionalInformation;
      id v13 = [v5 objectForKey:kSCPropNetPvDAdditionalInformation];

      if (v13)
      {
        int64_t v8 = [v5 objectForKey:v12];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFStringRef v17 = nplog_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "PvD additional info not in the correct format", buf, 2u);
          }
          goto LABEL_20;
        }
        id v14 = [v5 objectForKey:v6];
        unsigned int v15 = [v14 intValue];

        id v16 = [v5 objectForKey:v9];
        CFStringRef v17 = v16;
        if (v15 == 1)
        {
          if ([v16 length])
          {
            id v18 = objc_alloc_init((Class)NSURLComponents);
            [v18 setPath:@"/.well-known/pvd"];
            [v18 setScheme:@"https"];
            [v18 setHost:v17];
            id v19 = [v18 URL];
            if (self)
            {
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
              if (pvdConfigurationFetcher)
              {
LABEL_13:
                sub_10005041C(pvdConfigurationFetcher, v8, v19);

LABEL_20:
                goto LABEL_21;
              }
              CFStringRef v21 = [NSPPvDConfigurationFetcher alloc];
              id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            }
            else
            {
              CFStringRef v21 = [NSPPvDConfigurationFetcher alloc];
              id WeakRetained = 0;
            }
            id v23 = sub_10004F380((id *)&v21->super.isa, self, WeakRetained);
            sub_100027524((uint64_t)self, v23);

            if (self) {
              pvdConfigurationFetcher = self->_pvdConfigurationFetcher;
            }
            else {
              pvdConfigurationFetcher = 0;
            }
            goto LABEL_13;
          }
          id v24 = nplog_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
LABEL_19:

            goto LABEL_20;
          }
          __int16 v27 = 0;
          long long v25 = "Identifier was not found in PvD options";
          id v26 = (uint8_t *)&v27;
        }
        else
        {
          id v24 = nplog_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          __int16 v28 = 0;
          long long v25 = "HTTP over TLS is not supported";
          id v26 = (uint8_t *)&v28;
        }
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, v26, 2u);
        goto LABEL_19;
      }
    }
  }
LABEL_22:
}

- (BOOL)networkDiscoveredProxyPresentInAgentManager
{
  if (self) {
    self = (NSPPrivacyProxyAgentManager *)self->_networkSpecificQUICProxyPaths;
  }
  id v2 = [(NSPPrivacyProxyAgentManager *)self count];
  if (v2)
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Network discovered proxy was found to be present", v5, 2u);
    }
  }
  return v2 != 0;
}

- (void)setupMasqueProxyWith:(id)a3
{
  id v14 = a3;
  if (v14)
  {
    id v4 = self ? self->_path : 0;
    id v5 = [(NWPath *)v4 interface];

    if (v5)
    {
      if (self)
      {
        networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        if (!networkDiscoveredProxyInfos)
        {
          id v7 = objc_alloc_init((Class)NSMutableDictionary);
          sub_100027434((uint64_t)self, v7);

          networkDiscoveredProxyInfos = self->_networkDiscoveredProxyInfos;
        }
        int64_t v8 = networkDiscoveredProxyInfos;
        path = self->_path;
      }
      else
      {
        id v13 = objc_alloc_init((Class)NSMutableDictionary);
        sub_100027434(0, v13);

        int64_t v8 = 0;
        path = 0;
      }
      uint64_t v10 = path;
      CFStringRef v11 = [(NWPath *)v10 interface];
      uint64_t v12 = [v11 interfaceName];
      [(NSMutableDictionary *)v8 setObject:v14 forKey:v12];

      sub_1000358F4((uint64_t)self);
    }
  }
}

- (BOOL)dnsFilteringHintEnabled
{
  return self->dnsFilteringHintEnabled;
}

- (void)setDnsFilteringHintEnabled:(BOOL)a3
{
  self->dnsFilteringHintEnabled = a3;
}

- (NSString)geohashOverride
{
  return self->geohashOverride;
}

- (void)setGeohashOverride:(id)a3
{
}

- (NSDate)tokenIssuanceRestrictedUntilDate
{
  return self->_tokenIssuanceRestrictedUntilDate;
}

- (NSString)overridePreferredProxy
{
  return self->_overridePreferredProxy;
}

- (NSString)overridePreferredObliviousProxy
{
  return self->_overridePreferredObliviousProxy;
}

- (NSString)overrideIngressProxy
{
  return self->_overrideIngressProxy;
}

- (NSString)overrideFallbackIngressProxy
{
  return self->_overrideFallbackIngressProxy;
}

- (NSData)overrideIngressProxyKey
{
  return self->_overrideIngressProxyKey;
}

- (BOOL)forceFallback
{
  return self->_forceFallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenServerMaskedAddress, 0);
  objc_storeStrong((id *)&self->_toggleStats, 0);
  objc_storeStrong((id *)&self->_lastTokenOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_lastProxyOutageReasonStats, 0);
  objc_storeStrong((id *)&self->_reportedEpoch, 0);
  objc_storeStrong((id *)&self->_configEpoch, 0);
  objc_storeStrong((id *)&self->_networkCharacteristics, 0);
  objc_storeStrong((id *)&self->_lastPrimaryInterfaceChangedDate, 0);
  objc_storeStrong((id *)&self->_lastPathUnsatisfiedDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilTimer, 0);
  objc_storeStrong((id *)&self->_proxyTokenInfoArray, 0);
  objc_storeStrong((id *)&self->_obliviousPaths, 0);
  objc_storeStrong((id *)&self->_networkDiscoveredProxyInfos, 0);
  objc_storeStrong((id *)&self->_networkSpecificQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_proxiedContentPaths, 0);
  objc_storeStrong((id *)&self->_candidatePreferredQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_preferredQUICProxyPaths, 0);
  objc_storeStrong((id *)&self->_lastFallbackProxySwitchedDate, 0);
  objc_storeStrong((id *)&self->_lastQuicProxySwitchedDate, 0);
  objc_storeStrong((id *)&self->_probeEndTime, 0);
  objc_storeStrong((id *)&self->_probeStartTime, 0);
  objc_storeStrong((id *)&self->_proberInterface, 0);
  objc_storeStrong((id *)&self->_pvdConfigurationFetcher, 0);
  objc_storeStrong((id *)&self->_directPathProber, 0);
  objc_storeStrong((id *)&self->_proxyPathProber, 0);
  objc_storeStrong((id *)&self->_candidateFallbackProxyPath, 0);
  objc_storeStrong((id *)&self->_candidateQuicProxyPath, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPath, 0);
  objc_storeStrong((id *)&self->_quicProxyPath, 0);
  objc_storeStrong((id *)&self->_replenishTokenTimer, 0);
  objc_storeStrong((id *)&self->_proxyPathRestoreTimer, 0);
  objc_storeStrong((id *)&self->_savedConfiguredPreferredPaths, 0);
  objc_storeStrong((id *)&self->_savedConfiguredProxies, 0);
  objc_storeStrong((id *)&self->_overrideEnabledMaps, 0);
  objc_storeStrong((id *)&self->_proxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_penalizedObliviousProxyIndices, 0);
  objc_storeStrong((id *)&self->_obliviousConfigs, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPathCustomEnumerator, 0);
  objc_storeStrong((id *)&self->_fallbackProxyPathList, 0);
  objc_storeStrong((id *)&self->_proxyPathCustomEnumerator, 0);
  objc_storeStrong((id *)&self->_proxyPathList, 0);
  objc_storeStrong((id *)&self->_resolverArray, 0);
  objc_storeStrong((id *)&self->_proxyArray, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overrideIngressProxyKey, 0);
  objc_storeStrong((id *)&self->_overrideFallbackIngressProxy, 0);
  objc_storeStrong((id *)&self->_overrideIngressProxy, 0);
  objc_storeStrong((id *)&self->_overridePreferredObliviousProxy, 0);
  objc_storeStrong((id *)&self->_overridePreferredProxy, 0);
  objc_storeStrong((id *)&self->_tokenIssuanceRestrictedUntilDate, 0);

  objc_storeStrong((id *)&self->geohashOverride, 0);
}

@end