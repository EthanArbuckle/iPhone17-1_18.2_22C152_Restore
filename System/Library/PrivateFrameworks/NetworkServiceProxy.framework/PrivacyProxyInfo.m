@interface PrivacyProxyInfo
+ (BOOL)supportsSecureCoding;
- (NSArray)enabledProxiedContentMaps;
- (NSDictionary)resumableSessionCounts;
- (NSDictionary)tokenCounts;
- (NSString)egressFallbackProxyURL;
- (NSString)egressProxyURL;
- (NSString)ingressFallbackProxyURL;
- (NSString)ingressProxyURL;
- (PrivacyProxyInfo)initWithCoder:(id)a3;
- (PrivacyProxyInfo)initWithData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagnostics;
- (id)serialize;
- (unint64_t)activatedTokenCount;
- (unint64_t)anisetteValidationCount;
- (unint64_t)badTokenCount;
- (unint64_t)configFetchedFailedCount;
- (unint64_t)configFetchedSuccessCount;
- (unint64_t)deviceIdentityValidationCount;
- (unint64_t)missingTokenCount;
- (unint64_t)networkFallbackProxiesRotated;
- (unint64_t)networkProxiesRotated;
- (unint64_t)proxiesRotated;
- (unint64_t)proxyAgentLowWaterMarkHitCount;
- (unint64_t)proxyCacheLowWaterMarkHitCount;
- (unint64_t)proxyTokenConsumedCount;
- (unint64_t)proxyTokenExpiredCount;
- (unint64_t)proxyTokenFetchFailedCount;
- (unint64_t)proxyTokenFetchSuccessCount;
- (unint64_t)requestedTokenCount;
- (unint64_t)unactivatedTokenCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActivatedTokenCount:(unint64_t)a3;
- (void)setAnisetteValidationCount:(unint64_t)a3;
- (void)setBadTokenCount:(unint64_t)a3;
- (void)setConfigFetchedFailedCount:(unint64_t)a3;
- (void)setConfigFetchedSuccessCount:(unint64_t)a3;
- (void)setDeviceIdentityValidationCount:(unint64_t)a3;
- (void)setEgressFallbackProxyURL:(id)a3;
- (void)setEgressProxyURL:(id)a3;
- (void)setEnabledProxiedContentMaps:(id)a3;
- (void)setIngressFallbackProxyURL:(id)a3;
- (void)setIngressProxyURL:(id)a3;
- (void)setMissingTokenCount:(unint64_t)a3;
- (void)setNetworkFallbackProxiesRotated:(unint64_t)a3;
- (void)setNetworkProxiesRotated:(unint64_t)a3;
- (void)setProxiesRotated:(unint64_t)a3;
- (void)setProxyAgentLowWaterMarkHitCount:(unint64_t)a3;
- (void)setProxyCacheLowWaterMarkHitCount:(unint64_t)a3;
- (void)setProxyTokenConsumedCount:(unint64_t)a3;
- (void)setProxyTokenExpiredCount:(unint64_t)a3;
- (void)setProxyTokenFetchFailedCount:(unint64_t)a3;
- (void)setProxyTokenFetchSuccessCount:(unint64_t)a3;
- (void)setRequestedTokenCount:(unint64_t)a3;
- (void)setResumableSessionCounts:(id)a3;
- (void)setTokenCounts:(id)a3;
- (void)setUnactivatedTokenCount:(unint64_t)a3;
@end

@implementation PrivacyProxyInfo

- (id)description
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v2 = self;
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
    v4 = [(PrivacyProxyInfo *)v2 ingressProxyURL];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v4, @"Ingress proxy URL", 0, 14);

    v5 = [(PrivacyProxyInfo *)v2 egressProxyURL];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v5, @"Egress proxy URL", 0, 14);

    v6 = [(PrivacyProxyInfo *)v2 ingressFallbackProxyURL];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v6, @"Ingress fallback proxy URL", 0, 14);

    v7 = [(PrivacyProxyInfo *)v2 egressFallbackProxyURL];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v7, @"Egress fallback proxy URL", 0, 14);

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = [(PrivacyProxyInfo *)v2 tokenCounts];
    uint64_t v8 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    v36 = v2;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v13 = [(PrivacyProxyInfo *)v2 tokenCounts];
          v14 = [v13 objectForKeyedSubscript:v12];

          uint64_t v15 = [v14 cachedTokens];
          v16 = [NSString stringWithFormat:@"%@ cached token count", v12];
          -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v15, (uint64_t)v16, 0, 14);

          uint64_t v17 = [v14 agentTokens];
          v18 = [NSString stringWithFormat:@"%@ agent token count", v12];
          -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v17, (uint64_t)v18, 0, 14);

          uint64_t v19 = [v14 cacheLowWaterMark];
          v20 = [NSString stringWithFormat:@"%@ cache low water mark", v12];
          -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v19, (uint64_t)v20, 0, 14);

          uint64_t v21 = [v14 agentLowWaterMark];
          v22 = [NSString stringWithFormat:@"%@ agent low water mark", v12];
          -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v21, (uint64_t)v22, 0, 14);

          v2 = v36;
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v9);
    }

    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 requestedTokenCount], @"Requested token count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 unactivatedTokenCount], @"Unactivated token count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 activatedTokenCount], @"Activated token count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 deviceIdentityValidationCount], @"Device identity validated count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 anisetteValidationCount], @"Anisette validated count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyTokenFetchSuccessCount], @"Proxy token fetch success count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyTokenFetchFailedCount], @"Proxy token fetch failed count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyTokenConsumedCount], @"Proxy token consumed count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyTokenExpiredCount], @"Proxy token expired count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyAgentLowWaterMarkHitCount], @"Proxy agent low water mark hit count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxyCacheLowWaterMarkHitCount], @"Proxy cache low water mark hit count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 badTokenCount], @"Bad tokens count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 missingTokenCount], @"Missing tokens count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 networkProxiesRotated], @"Network proxies rotated", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 networkFallbackProxiesRotated], @"Network fallback proxies rotated", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 proxiesRotated], @"Proxies rotated", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 configFetchedSuccessCount], @"Configuration fetch success count", 0, 14);
    -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, [(PrivacyProxyInfo *)v2 configFetchedFailedCount], @"Configuration fetch failed count", 0, 14);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v23 = [(PrivacyProxyInfo *)v2 resumableSessionCounts];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * j);
          v29 = [(PrivacyProxyInfo *)v36 resumableSessionCounts];
          v30 = [v29 objectForKeyedSubscript:v28];

          uint64_t v31 = [v30 unsignedIntValue];
          v32 = [NSString stringWithFormat:@"%@ resumable session count", v28];
          -[NSMutableString appendPrettyInt:withName:andIndent:options:](v3, v31, (uint64_t)v32, 0, 14);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v25);
    }

    v33 = [(PrivacyProxyInfo *)v36 enabledProxiedContentMaps];
    -[NSMutableString appendPrettyObject:withName:andIndent:options:](v3, v33, @"Enabled proxied content maps", 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PrivacyProxyInfo allocWithZone:](PrivacyProxyInfo, "allocWithZone:") init];
  v6 = [(PrivacyProxyInfo *)self ingressProxyURL];
  [(PrivacyProxyInfo *)v5 setIngressProxyURL:v6];

  v7 = [(PrivacyProxyInfo *)self egressProxyURL];
  [(PrivacyProxyInfo *)v5 setEgressProxyURL:v7];

  uint64_t v8 = [(PrivacyProxyInfo *)self ingressFallbackProxyURL];
  [(PrivacyProxyInfo *)v5 setIngressFallbackProxyURL:v8];

  uint64_t v9 = [(PrivacyProxyInfo *)self egressFallbackProxyURL];
  [(PrivacyProxyInfo *)v5 setEgressFallbackProxyURL:v9];

  uint64_t v10 = [(PrivacyProxyInfo *)self tokenCounts];
  v11 = (void *)[v10 copyWithZone:a3];
  [(PrivacyProxyInfo *)v5 setTokenCounts:v11];

  uint64_t v12 = [(PrivacyProxyInfo *)self resumableSessionCounts];
  v13 = (void *)[v12 copyWithZone:a3];
  [(PrivacyProxyInfo *)v5 setResumableSessionCounts:v13];

  v14 = [(PrivacyProxyInfo *)self enabledProxiedContentMaps];
  uint64_t v15 = (void *)[v14 copyWithZone:a3];
  [(PrivacyProxyInfo *)v5 setEnabledProxiedContentMaps:v15];

  [(PrivacyProxyInfo *)v5 setDeviceIdentityValidationCount:[(PrivacyProxyInfo *)self deviceIdentityValidationCount]];
  [(PrivacyProxyInfo *)v5 setAnisetteValidationCount:[(PrivacyProxyInfo *)self anisetteValidationCount]];
  [(PrivacyProxyInfo *)v5 setRequestedTokenCount:[(PrivacyProxyInfo *)self requestedTokenCount]];
  [(PrivacyProxyInfo *)v5 setUnactivatedTokenCount:[(PrivacyProxyInfo *)self unactivatedTokenCount]];
  [(PrivacyProxyInfo *)v5 setActivatedTokenCount:[(PrivacyProxyInfo *)self activatedTokenCount]];
  [(PrivacyProxyInfo *)v5 setProxyTokenFetchSuccessCount:[(PrivacyProxyInfo *)self proxyTokenFetchSuccessCount]];
  [(PrivacyProxyInfo *)v5 setProxyTokenFetchFailedCount:[(PrivacyProxyInfo *)self proxyTokenFetchFailedCount]];
  [(PrivacyProxyInfo *)v5 setProxyTokenConsumedCount:[(PrivacyProxyInfo *)self proxyTokenConsumedCount]];
  [(PrivacyProxyInfo *)v5 setProxyTokenExpiredCount:[(PrivacyProxyInfo *)self proxyTokenExpiredCount]];
  [(PrivacyProxyInfo *)v5 setProxyAgentLowWaterMarkHitCount:[(PrivacyProxyInfo *)self proxyAgentLowWaterMarkHitCount]];
  [(PrivacyProxyInfo *)v5 setProxyCacheLowWaterMarkHitCount:[(PrivacyProxyInfo *)self proxyCacheLowWaterMarkHitCount]];
  [(PrivacyProxyInfo *)v5 setBadTokenCount:[(PrivacyProxyInfo *)self badTokenCount]];
  [(PrivacyProxyInfo *)v5 setMissingTokenCount:[(PrivacyProxyInfo *)self missingTokenCount]];
  [(PrivacyProxyInfo *)v5 setNetworkProxiesRotated:[(PrivacyProxyInfo *)self networkProxiesRotated]];
  [(PrivacyProxyInfo *)v5 setNetworkFallbackProxiesRotated:[(PrivacyProxyInfo *)self networkFallbackProxiesRotated]];
  [(PrivacyProxyInfo *)v5 setProxiesRotated:[(PrivacyProxyInfo *)self proxiesRotated]];
  [(PrivacyProxyInfo *)v5 setConfigFetchedSuccessCount:[(PrivacyProxyInfo *)self configFetchedSuccessCount]];
  [(PrivacyProxyInfo *)v5 setConfigFetchedFailedCount:[(PrivacyProxyInfo *)self configFetchedFailedCount]];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PrivacyProxyInfo;
  v5 = [(PrivacyProxyInfo *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyInfoIngressProxyURL"];
    ingressProxyURL = v5->_ingressProxyURL;
    v5->_ingressProxyURL = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyInfoEgressProxyURL"];
    egressProxyURL = v5->_egressProxyURL;
    v5->_egressProxyURL = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyInfoIngressFallbackProxyURL"];
    ingressFallbackProxyURL = v5->_ingressFallbackProxyURL;
    v5->_ingressFallbackProxyURL = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PrivacyProxyInfoEgressFallbackProxyURL"];
    egressFallbackProxyURL = v5->_egressFallbackProxyURL;
    v5->_egressFallbackProxyURL = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"PrivacyProxyInfoTokenCounts"];
    tokenCounts = v5->_tokenCounts;
    v5->_tokenCounts = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"PrivacyProxyInfoResumableSessionCounts"];
    resumableSessionCounts = v5->_resumableSessionCounts;
    v5->_resumableSessionCounts = (NSDictionary *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"PrivacyProxyInfoEnabledProxiedContentMaps"];
    enabledProxiedContentMaps = v5->_enabledProxiedContentMaps;
    v5->_enabledProxiedContentMaps = (NSArray *)v29;

    v5->_deviceIdentityValidationCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoDeviceValidationCount"];
    v5->_anisetteValidationCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoAnisetteValidationCount"];
    v5->_requestedTokenCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoRequestedTokenCount"];
    v5->_unactivatedTokenCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoUnactivatedTokenCount"];
    v5->_activatedTokenCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoActivatedTokenCount"];
    v5->_proxyTokenFetchSuccessCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyTokenFetchSuccessCount"];
    v5->_proxyTokenFetchFailedCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyTokenFetchFailedCount"];
    v5->_proxyTokenConsumedCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyTokenConsumedCount"];
    v5->_proxyTokenExpiredCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyTokenExpiredCount"];
    v5->_proxyAgentLowWaterMarkHitCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyAgentLowWaterMarkHitCount"];
    v5->_proxyCacheLowWaterMarkHitCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxyCacheLowWaterMarkHitCount"];
    v5->_badTokenCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoBadTokensCount"];
    v5->_missingTokenCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoMissingTokensCount"];
    v5->_networkProxiesRotated = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoNetworkProxiesRotated"];
    v5->_networkFallbackProxiesRotated = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoNetworkFallbackProxiesRotated"];
    v5->_proxiesRotated = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoProxiesRotated"];
    v5->_configFetchedSuccessCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoConfigFetchSuccessCount"];
    v5->_configFetchedFailedCount = (int)[v4 decodeIntForKey:@"PrivacyProxyInfoConfigFetchFailedCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  id v4 = [(PrivacyProxyInfo *)self ingressProxyURL];
  [v11 encodeObject:v4 forKey:@"PrivacyProxyInfoIngressProxyURL"];

  v5 = [(PrivacyProxyInfo *)self egressProxyURL];
  [v11 encodeObject:v5 forKey:@"PrivacyProxyInfoEgressProxyURL"];

  uint64_t v6 = [(PrivacyProxyInfo *)self ingressFallbackProxyURL];
  [v11 encodeObject:v6 forKey:@"PrivacyProxyInfoIngressFallbackProxyURL"];

  v7 = [(PrivacyProxyInfo *)self egressFallbackProxyURL];
  [v11 encodeObject:v7 forKey:@"PrivacyProxyInfoEgressFallbackProxyURL"];

  uint64_t v8 = [(PrivacyProxyInfo *)self tokenCounts];
  [v11 encodeObject:v8 forKey:@"PrivacyProxyInfoTokenCounts"];

  uint64_t v9 = [(PrivacyProxyInfo *)self resumableSessionCounts];
  [v11 encodeObject:v9 forKey:@"PrivacyProxyInfoResumableSessionCounts"];

  uint64_t v10 = [(PrivacyProxyInfo *)self enabledProxiedContentMaps];
  [v11 encodeObject:v10 forKey:@"PrivacyProxyInfoEnabledProxiedContentMaps"];

  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo deviceIdentityValidationCount](self, "deviceIdentityValidationCount"), @"PrivacyProxyInfoDeviceValidationCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo anisetteValidationCount](self, "anisetteValidationCount"), @"PrivacyProxyInfoAnisetteValidationCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo requestedTokenCount](self, "requestedTokenCount"), @"PrivacyProxyInfoRequestedTokenCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo unactivatedTokenCount](self, "unactivatedTokenCount"), @"PrivacyProxyInfoUnactivatedTokenCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo activatedTokenCount](self, "activatedTokenCount"), @"PrivacyProxyInfoActivatedTokenCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenFetchSuccessCount](self, "proxyTokenFetchSuccessCount"), @"PrivacyProxyInfoProxyTokenFetchSuccessCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenFetchFailedCount](self, "proxyTokenFetchFailedCount"), @"PrivacyProxyInfoProxyTokenFetchFailedCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenConsumedCount](self, "proxyTokenConsumedCount"), @"PrivacyProxyInfoProxyTokenConsumedCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyTokenExpiredCount](self, "proxyTokenExpiredCount"), @"PrivacyProxyInfoProxyTokenExpiredCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](self, "proxyAgentLowWaterMarkHitCount"), @"PrivacyProxyInfoProxyAgentLowWaterMarkHitCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](self, "proxyCacheLowWaterMarkHitCount"), @"PrivacyProxyInfoProxyCacheLowWaterMarkHitCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo badTokenCount](self, "badTokenCount"), @"PrivacyProxyInfoBadTokensCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo missingTokenCount](self, "missingTokenCount"), @"PrivacyProxyInfoMissingTokensCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo networkProxiesRotated](self, "networkProxiesRotated"), @"PrivacyProxyInfoNetworkProxiesRotated");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo networkFallbackProxiesRotated](self, "networkFallbackProxiesRotated"), @"PrivacyProxyInfoNetworkFallbackProxiesRotated");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo proxiesRotated](self, "proxiesRotated"), @"PrivacyProxyInfoProxiesRotated");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo configFetchedSuccessCount](self, "configFetchedSuccessCount"), @"PrivacyProxyInfoConfigFetchSuccessCount");
  objc_msgSend(v11, "encodeInt:forKey:", -[PrivacyProxyInfo configFetchedFailedCount](self, "configFetchedFailedCount"), @"PrivacyProxyInfoConfigFetchFailedCount");
}

- (id)diagnostics
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo configFetchedFailedCount](self, "configFetchedFailedCount"));
  [v3 setObject:v4 forKeyedSubscript:@"PrivacyProxyInfoConfigFetchFailedCount"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo configFetchedSuccessCount](self, "configFetchedSuccessCount"));
  [v3 setObject:v5 forKeyedSubscript:@"PrivacyProxyInfoConfigFetchSuccessCount"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxiesRotated](self, "proxiesRotated"));
  [v3 setObject:v6 forKeyedSubscript:@"PrivacyProxyInfoProxiesRotated"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo networkFallbackProxiesRotated](self, "networkFallbackProxiesRotated"));
  [v3 setObject:v7 forKeyedSubscript:@"PrivacyProxyInfoNetworkFallbackProxiesRotated"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo networkProxiesRotated](self, "networkProxiesRotated"));
  [v3 setObject:v8 forKeyedSubscript:@"PrivacyProxyInfoNetworkProxiesRotated"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo missingTokenCount](self, "missingTokenCount"));
  [v3 setObject:v9 forKeyedSubscript:@"PrivacyProxyInfoMissingTokensCount"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo badTokenCount](self, "badTokenCount"));
  [v3 setObject:v10 forKeyedSubscript:@"PrivacyProxyInfoBadTokensCount"];

  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyCacheLowWaterMarkHitCount](self, "proxyCacheLowWaterMarkHitCount"));
  [v3 setObject:v11 forKeyedSubscript:@"PrivacyProxyInfoProxyCacheLowWaterMarkHitCount"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyAgentLowWaterMarkHitCount](self, "proxyAgentLowWaterMarkHitCount"));
  [v3 setObject:v12 forKeyedSubscript:@"PrivacyProxyInfoProxyAgentLowWaterMarkHitCount"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenExpiredCount](self, "proxyTokenExpiredCount"));
  [v3 setObject:v13 forKeyedSubscript:@"PrivacyProxyInfoProxyTokenExpiredCount"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenConsumedCount](self, "proxyTokenConsumedCount"));
  [v3 setObject:v14 forKeyedSubscript:@"PrivacyProxyInfoProxyTokenConsumedCount"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenFetchFailedCount](self, "proxyTokenFetchFailedCount"));
  [v3 setObject:v15 forKeyedSubscript:@"PrivacyProxyInfoProxyTokenFetchFailedCount"];

  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo proxyTokenFetchSuccessCount](self, "proxyTokenFetchSuccessCount"));
  [v3 setObject:v16 forKeyedSubscript:@"PrivacyProxyInfoProxyTokenFetchSuccessCount"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo activatedTokenCount](self, "activatedTokenCount"));
  [v3 setObject:v17 forKeyedSubscript:@"PrivacyProxyInfoActivatedTokenCount"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo unactivatedTokenCount](self, "unactivatedTokenCount"));
  [v3 setObject:v18 forKeyedSubscript:@"PrivacyProxyInfoUnactivatedTokenCount"];

  uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo requestedTokenCount](self, "requestedTokenCount"));
  [v3 setObject:v19 forKeyedSubscript:@"PrivacyProxyInfoRequestedTokenCount"];

  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo anisetteValidationCount](self, "anisetteValidationCount"));
  [v3 setObject:v20 forKeyedSubscript:@"PrivacyProxyInfoAnisetteValidationCount"];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PrivacyProxyInfo deviceIdentityValidationCount](self, "deviceIdentityValidationCount"));
  [v3 setObject:v21 forKeyedSubscript:@"PrivacyProxyInfoDeviceValidationCount"];

  uint64_t v22 = [(PrivacyProxyInfo *)self egressProxyURL];
  [v3 setObject:v22 forKeyedSubscript:@"PrivacyProxyInfoEgressProxyURL"];

  v23 = [(PrivacyProxyInfo *)self ingressProxyURL];
  [v3 setObject:v23 forKeyedSubscript:@"PrivacyProxyInfoIngressProxyURL"];

  uint64_t v24 = [(PrivacyProxyInfo *)self egressFallbackProxyURL];
  [v3 setObject:v24 forKeyedSubscript:@"PrivacyProxyInfoEgressFallbackProxyURL"];

  uint64_t v25 = [(PrivacyProxyInfo *)self ingressFallbackProxyURL];
  [v3 setObject:v25 forKeyedSubscript:@"PrivacyProxyInfoIngressFallbackProxyURL"];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = [(PrivacyProxyInfo *)self tokenCounts];
  uint64_t v26 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v42 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        v30 = [(PrivacyProxyInfo *)self tokenCounts];
        uint64_t v31 = [v30 objectForKeyedSubscript:v29];

        objc_super v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "cachedTokens"));
        v33 = [NSString stringWithFormat:@"%@-%@", @"PrivacyProxyInfoCachedTokenCount", v29];
        [v3 setObject:v32 forKeyedSubscript:v33];

        v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "agentTokens"));
        v35 = [NSString stringWithFormat:@"%@-%@", @"PrivacyProxyInfoAgentTokenCount", v29];
        [v3 setObject:v34 forKeyedSubscript:v35];

        v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "cacheLowWaterMark"));
        long long v37 = [NSString stringWithFormat:@"%@-%@", @"PrivacyProxyInfoCacheLowWaterMark", v29];
        [v3 setObject:v36 forKeyedSubscript:v37];

        long long v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "agentLowWaterMark"));
        long long v39 = [NSString stringWithFormat:@"%@-%@", @"PrivacyProxyInfoAgentLowWaterMark", v29];
        [v3 setObject:v38 forKeyedSubscript:v39];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v27);
  }

  return v3;
}

- (id)serialize
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(PrivacyProxyInfo *)self encodeWithCoder:v3];
  id v4 = [v3 encodedData];

  return v4;
}

- (PrivacyProxyInfo)initWithData:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  id v15 = 0;
  uint64_t v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:&v15];

  id v7 = v15;
  uint64_t v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PrivacyProxyInfo;
    uint64_t v12 = [(PrivacyProxyInfo *)&v14 init];
    if (v12) {
      uint64_t v12 = [(PrivacyProxyInfo *)v12 initWithCoder:v6];
    }
    self = v12;
    id v11 = self;
  }
  else
  {
    uint64_t v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v8;
      _os_log_error_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the proxy info %@", buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (NSString)egressProxyURL
{
  return self->_egressProxyURL;
}

- (void)setEgressProxyURL:(id)a3
{
}

- (NSString)ingressProxyURL
{
  return self->_ingressProxyURL;
}

- (void)setIngressProxyURL:(id)a3
{
}

- (NSString)egressFallbackProxyURL
{
  return self->_egressFallbackProxyURL;
}

- (void)setEgressFallbackProxyURL:(id)a3
{
}

- (NSString)ingressFallbackProxyURL
{
  return self->_ingressFallbackProxyURL;
}

- (void)setIngressFallbackProxyURL:(id)a3
{
}

- (NSDictionary)tokenCounts
{
  return self->_tokenCounts;
}

- (void)setTokenCounts:(id)a3
{
}

- (NSDictionary)resumableSessionCounts
{
  return self->_resumableSessionCounts;
}

- (void)setResumableSessionCounts:(id)a3
{
}

- (NSArray)enabledProxiedContentMaps
{
  return self->_enabledProxiedContentMaps;
}

- (void)setEnabledProxiedContentMaps:(id)a3
{
}

- (unint64_t)deviceIdentityValidationCount
{
  return self->_deviceIdentityValidationCount;
}

- (void)setDeviceIdentityValidationCount:(unint64_t)a3
{
  self->_deviceIdentityValidationCount = a3;
}

- (unint64_t)anisetteValidationCount
{
  return self->_anisetteValidationCount;
}

- (void)setAnisetteValidationCount:(unint64_t)a3
{
  self->_anisetteValidationCount = a3;
}

- (unint64_t)unactivatedTokenCount
{
  return self->_unactivatedTokenCount;
}

- (void)setUnactivatedTokenCount:(unint64_t)a3
{
  self->_unactivatedTokenCount = a3;
}

- (unint64_t)activatedTokenCount
{
  return self->_activatedTokenCount;
}

- (void)setActivatedTokenCount:(unint64_t)a3
{
  self->_activatedTokenCount = a3;
}

- (unint64_t)requestedTokenCount
{
  return self->_requestedTokenCount;
}

- (void)setRequestedTokenCount:(unint64_t)a3
{
  self->_requestedTokenCount = a3;
}

- (unint64_t)proxyTokenFetchSuccessCount
{
  return self->_proxyTokenFetchSuccessCount;
}

- (void)setProxyTokenFetchSuccessCount:(unint64_t)a3
{
  self->_proxyTokenFetchSuccessCount = a3;
}

- (unint64_t)proxyTokenFetchFailedCount
{
  return self->_proxyTokenFetchFailedCount;
}

- (void)setProxyTokenFetchFailedCount:(unint64_t)a3
{
  self->_proxyTokenFetchFailedCount = a3;
}

- (unint64_t)proxyTokenConsumedCount
{
  return self->_proxyTokenConsumedCount;
}

- (void)setProxyTokenConsumedCount:(unint64_t)a3
{
  self->_proxyTokenConsumedCount = a3;
}

- (unint64_t)proxyTokenExpiredCount
{
  return self->_proxyTokenExpiredCount;
}

- (void)setProxyTokenExpiredCount:(unint64_t)a3
{
  self->_proxyTokenExpiredCount = a3;
}

- (unint64_t)proxyAgentLowWaterMarkHitCount
{
  return self->_proxyAgentLowWaterMarkHitCount;
}

- (void)setProxyAgentLowWaterMarkHitCount:(unint64_t)a3
{
  self->_proxyAgentLowWaterMarkHitCount = a3;
}

- (unint64_t)proxyCacheLowWaterMarkHitCount
{
  return self->_proxyCacheLowWaterMarkHitCount;
}

- (void)setProxyCacheLowWaterMarkHitCount:(unint64_t)a3
{
  self->_proxyCacheLowWaterMarkHitCount = a3;
}

- (unint64_t)badTokenCount
{
  return self->_badTokenCount;
}

- (void)setBadTokenCount:(unint64_t)a3
{
  self->_badTokenCount = a3;
}

- (unint64_t)missingTokenCount
{
  return self->_missingTokenCount;
}

- (void)setMissingTokenCount:(unint64_t)a3
{
  self->_missingTokenCount = a3;
}

- (unint64_t)networkProxiesRotated
{
  return self->_networkProxiesRotated;
}

- (void)setNetworkProxiesRotated:(unint64_t)a3
{
  self->_networkProxiesRotated = a3;
}

- (unint64_t)networkFallbackProxiesRotated
{
  return self->_networkFallbackProxiesRotated;
}

- (void)setNetworkFallbackProxiesRotated:(unint64_t)a3
{
  self->_networkFallbackProxiesRotated = a3;
}

- (unint64_t)proxiesRotated
{
  return self->_proxiesRotated;
}

- (void)setProxiesRotated:(unint64_t)a3
{
  self->_proxiesRotated = a3;
}

- (unint64_t)configFetchedSuccessCount
{
  return self->_configFetchedSuccessCount;
}

- (void)setConfigFetchedSuccessCount:(unint64_t)a3
{
  self->_configFetchedSuccessCount = a3;
}

- (unint64_t)configFetchedFailedCount
{
  return self->_configFetchedFailedCount;
}

- (void)setConfigFetchedFailedCount:(unint64_t)a3
{
  self->_configFetchedFailedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledProxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_resumableSessionCounts, 0);
  objc_storeStrong((id *)&self->_tokenCounts, 0);
  objc_storeStrong((id *)&self->_ingressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_egressFallbackProxyURL, 0);
  objc_storeStrong((id *)&self->_ingressProxyURL, 0);
  objc_storeStrong((id *)&self->_egressProxyURL, 0);
}

@end