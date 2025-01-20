@interface NSPPrivacyProxyConfiguration
+ (Class)fallbackPathWeightsType;
+ (Class)obliviousConfigsType;
+ (Class)pathWeightsType;
+ (Class)policyTierMapType;
+ (Class)proxiedContentMapsType;
+ (Class)proxiesType;
+ (Class)resolversType;
+ (Class)trustedNetworkDiscoveredProxiesType;
- (BOOL)enabled;
- (BOOL)hasBootstrapResolver;
- (BOOL)hasDisableUntil;
- (BOOL)hasDnsProbe;
- (BOOL)hasEnabled;
- (BOOL)hasPreferredPathEnabledPercentage;
- (BOOL)hasRegionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)fallbackPathWeights;
- (NSMutableArray)obliviousConfigs;
- (NSMutableArray)pathWeights;
- (NSMutableArray)policyTierMaps;
- (NSMutableArray)proxiedContentMaps;
- (NSMutableArray)proxies;
- (NSMutableArray)resolvers;
- (NSMutableArray)trustedNetworkDiscoveredProxies;
- (NSPPrivacyProxyAuthenticationInfo)authInfo;
- (NSPPrivacyProxyResolverInfo)bootstrapResolver;
- (NSString)dnsProbe;
- (NSString)regionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fallbackPathWeightsAtIndex:(unint64_t)a3;
- (id)obliviousConfigsAtIndex:(unint64_t)a3;
- (id)pathWeightsAtIndex:(unint64_t)a3;
- (id)policyTierMapAtIndex:(unint64_t)a3;
- (id)proxiedContentMapsAtIndex:(unint64_t)a3;
- (id)proxiesAtIndex:(unint64_t)a3;
- (id)resolversAtIndex:(unint64_t)a3;
- (id)trustedNetworkDiscoveredProxiesAtIndex:(unint64_t)a3;
- (unint64_t)disableUntil;
- (unint64_t)fallbackPathWeightsCount;
- (unint64_t)hash;
- (unint64_t)obliviousConfigsCount;
- (unint64_t)pathWeightsCount;
- (unint64_t)policyTierMapsCount;
- (unint64_t)proxiedContentMapsCount;
- (unint64_t)proxiesCount;
- (unint64_t)resolversCount;
- (unint64_t)trustedNetworkDiscoveredProxiesCount;
- (unsigned)maxTokenNum;
- (unsigned)preferredPathEnabledPercentage;
- (unsigned)version;
- (void)addFallbackPathWeights:(id)a3;
- (void)addObliviousConfigs:(id)a3;
- (void)addPathWeights:(id)a3;
- (void)addPolicyTierMap:(id)a3;
- (void)addProxiedContentMaps:(id)a3;
- (void)addProxies:(id)a3;
- (void)addResolvers:(id)a3;
- (void)addTrustedNetworkDiscoveredProxies:(id)a3;
- (void)clearFallbackPathWeights;
- (void)clearObliviousConfigs;
- (void)clearPathWeights;
- (void)clearPolicyTierMaps;
- (void)clearProxiedContentMaps;
- (void)clearProxies;
- (void)clearResolvers;
- (void)clearTrustedNetworkDiscoveredProxies;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuthInfo:(id)a3;
- (void)setBootstrapResolver:(id)a3;
- (void)setDisableUntil:(unint64_t)a3;
- (void)setDnsProbe:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFallbackPathWeights:(id)a3;
- (void)setHasDisableUntil:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasPreferredPathEnabledPercentage:(BOOL)a3;
- (void)setMaxTokenNum:(unsigned int)a3;
- (void)setObliviousConfigs:(id)a3;
- (void)setPathWeights:(id)a3;
- (void)setPolicyTierMaps:(id)a3;
- (void)setPreferredPathEnabledPercentage:(unsigned int)a3;
- (void)setProxiedContentMaps:(id)a3;
- (void)setProxies:(id)a3;
- (void)setRegionId:(id)a3;
- (void)setResolvers:(id)a3;
- (void)setTrustedNetworkDiscoveredProxies:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyConfiguration

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDisableUntil:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_disableUntil = a3;
}

- (void)setHasDisableUntil:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisableUntil
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearPolicyTierMaps
{
}

- (void)addPolicyTierMap:(id)a3
{
  id v4 = a3;
  policyTierMaps = self->_policyTierMaps;
  id v8 = v4;
  if (!policyTierMaps)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_policyTierMaps;
    self->_policyTierMaps = v6;

    id v4 = v8;
    policyTierMaps = self->_policyTierMaps;
  }
  [(NSMutableArray *)policyTierMaps addObject:v4];
}

- (unint64_t)policyTierMapsCount
{
  return [(NSMutableArray *)self->_policyTierMaps count];
}

- (id)policyTierMapAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_policyTierMaps objectAtIndex:a3];
}

+ (Class)policyTierMapType
{
  return (Class)objc_opt_class();
}

- (void)clearProxies
{
}

- (void)addProxies:(id)a3
{
  id v4 = a3;
  proxies = self->_proxies;
  id v8 = v4;
  if (!proxies)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_proxies;
    self->_proxies = v6;

    id v4 = v8;
    proxies = self->_proxies;
  }
  [(NSMutableArray *)proxies addObject:v4];
}

- (unint64_t)proxiesCount
{
  return [(NSMutableArray *)self->_proxies count];
}

- (id)proxiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proxies objectAtIndex:a3];
}

+ (Class)proxiesType
{
  return (Class)objc_opt_class();
}

- (void)clearPathWeights
{
}

- (void)addPathWeights:(id)a3
{
  id v4 = a3;
  pathWeights = self->_pathWeights;
  id v8 = v4;
  if (!pathWeights)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_pathWeights;
    self->_pathWeights = v6;

    id v4 = v8;
    pathWeights = self->_pathWeights;
  }
  [(NSMutableArray *)pathWeights addObject:v4];
}

- (unint64_t)pathWeightsCount
{
  return [(NSMutableArray *)self->_pathWeights count];
}

- (id)pathWeightsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_pathWeights objectAtIndex:a3];
}

+ (Class)pathWeightsType
{
  return (Class)objc_opt_class();
}

- (void)clearResolvers
{
}

- (void)addResolvers:(id)a3
{
  id v4 = a3;
  resolvers = self->_resolvers;
  id v8 = v4;
  if (!resolvers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_resolvers;
    self->_resolvers = v6;

    id v4 = v8;
    resolvers = self->_resolvers;
  }
  [(NSMutableArray *)resolvers addObject:v4];
}

- (unint64_t)resolversCount
{
  return [(NSMutableArray *)self->_resolvers count];
}

- (id)resolversAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_resolvers objectAtIndex:a3];
}

+ (Class)resolversType
{
  return (Class)objc_opt_class();
}

- (void)clearFallbackPathWeights
{
}

- (void)addFallbackPathWeights:(id)a3
{
  id v4 = a3;
  fallbackPathWeights = self->_fallbackPathWeights;
  id v8 = v4;
  if (!fallbackPathWeights)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_fallbackPathWeights;
    self->_fallbackPathWeights = v6;

    id v4 = v8;
    fallbackPathWeights = self->_fallbackPathWeights;
  }
  [(NSMutableArray *)fallbackPathWeights addObject:v4];
}

- (unint64_t)fallbackPathWeightsCount
{
  return [(NSMutableArray *)self->_fallbackPathWeights count];
}

- (id)fallbackPathWeightsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fallbackPathWeights objectAtIndex:a3];
}

+ (Class)fallbackPathWeightsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRegionId
{
  return self->_regionId != 0;
}

- (BOOL)hasBootstrapResolver
{
  return self->_bootstrapResolver != 0;
}

- (BOOL)hasDnsProbe
{
  return self->_dnsProbe != 0;
}

- (void)clearObliviousConfigs
{
}

- (void)addObliviousConfigs:(id)a3
{
  id v4 = a3;
  obliviousConfigs = self->_obliviousConfigs;
  id v8 = v4;
  if (!obliviousConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_obliviousConfigs;
    self->_obliviousConfigs = v6;

    id v4 = v8;
    obliviousConfigs = self->_obliviousConfigs;
  }
  [(NSMutableArray *)obliviousConfigs addObject:v4];
}

- (unint64_t)obliviousConfigsCount
{
  return [(NSMutableArray *)self->_obliviousConfigs count];
}

- (id)obliviousConfigsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_obliviousConfigs objectAtIndex:a3];
}

+ (Class)obliviousConfigsType
{
  return (Class)objc_opt_class();
}

- (void)setPreferredPathEnabledPercentage:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_preferredPathEnabledPercentage = a3;
}

- (void)setHasPreferredPathEnabledPercentage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredPathEnabledPercentage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearProxiedContentMaps
{
}

- (void)addProxiedContentMaps:(id)a3
{
  id v4 = a3;
  proxiedContentMaps = self->_proxiedContentMaps;
  id v8 = v4;
  if (!proxiedContentMaps)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_proxiedContentMaps;
    self->_proxiedContentMaps = v6;

    id v4 = v8;
    proxiedContentMaps = self->_proxiedContentMaps;
  }
  [(NSMutableArray *)proxiedContentMaps addObject:v4];
}

- (unint64_t)proxiedContentMapsCount
{
  return [(NSMutableArray *)self->_proxiedContentMaps count];
}

- (id)proxiedContentMapsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proxiedContentMaps objectAtIndex:a3];
}

+ (Class)proxiedContentMapsType
{
  return (Class)objc_opt_class();
}

- (void)clearTrustedNetworkDiscoveredProxies
{
}

- (void)addTrustedNetworkDiscoveredProxies:(id)a3
{
  id v4 = a3;
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  id v8 = v4;
  if (!trustedNetworkDiscoveredProxies)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_trustedNetworkDiscoveredProxies;
    self->_trustedNetworkDiscoveredProxies = v6;

    id v4 = v8;
    trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  }
  [(NSMutableArray *)trustedNetworkDiscoveredProxies addObject:v4];
}

- (unint64_t)trustedNetworkDiscoveredProxiesCount
{
  return [(NSMutableArray *)self->_trustedNetworkDiscoveredProxies count];
}

- (id)trustedNetworkDiscoveredProxiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_trustedNetworkDiscoveredProxies objectAtIndex:a3];
}

+ (Class)trustedNetworkDiscoveredProxiesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyConfiguration;
  id v4 = [(NSPPrivacyProxyConfiguration *)&v8 description];
  v5 = [(NSPPrivacyProxyConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_enabled];
    [v3 setObject:v6 forKey:@"enabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_disableUntil];
    [v3 setObject:v7 forKey:@"disableUntil"];
  }
  authInfo = self->_authInfo;
  if (authInfo)
  {
    v9 = [(NSPPrivacyProxyAuthenticationInfo *)authInfo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"authInfo"];
  }
  if ([(NSMutableArray *)self->_policyTierMaps count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_policyTierMaps, "count"));
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v11 = self->_policyTierMaps;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v91 objects:v101 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v92;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v92 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v91 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v91 objects:v101 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"policyTierMap"];
  }
  if ([(NSMutableArray *)self->_proxies count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_proxies, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v18 = self->_proxies;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v87 objects:v100 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v88 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [*(id *)(*((void *)&v87 + 1) + 8 * j) dictionaryRepresentation];
          [v17 addObject:v23];
        }
        uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v87 objects:v100 count:16];
      }
      while (v20);
    }

    [v3 setObject:v17 forKey:@"proxies"];
  }
  if ([(NSMutableArray *)self->_pathWeights count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_pathWeights, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v25 = self->_pathWeights;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v83 objects:v99 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v84 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [*(id *)(*((void *)&v83 + 1) + 8 * k) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v83 objects:v99 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKey:@"pathWeights"];
  }
  if ([(NSMutableArray *)self->_resolvers count])
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_resolvers, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v32 = self->_resolvers;
    uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v80;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v80 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v79 + 1) + 8 * m) dictionaryRepresentation];
          [v31 addObject:v37];
        }
        uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKey:@"resolvers"];
  }
  v38 = [NSNumber numberWithUnsignedInt:self->_maxTokenNum];
  [v3 setObject:v38 forKey:@"maxTokenNum"];

  if ([(NSMutableArray *)self->_fallbackPathWeights count])
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_fallbackPathWeights, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v40 = self->_fallbackPathWeights;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v75 objects:v97 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v76;
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v76 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v75 + 1) + 8 * n) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v75 objects:v97 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"fallbackPathWeights"];
  }
  regionId = self->_regionId;
  if (regionId) {
    [v3 setObject:regionId forKey:@"regionId"];
  }
  bootstrapResolver = self->_bootstrapResolver;
  if (bootstrapResolver)
  {
    v48 = [(NSPPrivacyProxyResolverInfo *)bootstrapResolver dictionaryRepresentation];
    [v3 setObject:v48 forKey:@"bootstrapResolver"];
  }
  dnsProbe = self->_dnsProbe;
  if (dnsProbe) {
    [v3 setObject:dnsProbe forKey:@"dnsProbe"];
  }
  if ([(NSMutableArray *)self->_obliviousConfigs count])
  {
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_obliviousConfigs, "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v51 = self->_obliviousConfigs;
    uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v96 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v72;
      do
      {
        for (iuint64_t i = 0; ii != v53; ++ii)
        {
          if (*(void *)v72 != v54) {
            objc_enumerationMutation(v51);
          }
          v56 = [*(id *)(*((void *)&v71 + 1) + 8 * ii) dictionaryRepresentation];
          [v50 addObject:v56];
        }
        uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v71 objects:v96 count:16];
      }
      while (v53);
    }

    [v3 setObject:v50 forKey:@"obliviousConfigs"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v57 = [NSNumber numberWithUnsignedInt:self->_preferredPathEnabledPercentage];
    [v3 setObject:v57 forKey:@"preferredPathEnabledPercentage"];
  }
  if ([(NSMutableArray *)self->_proxiedContentMaps count])
  {
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_proxiedContentMaps, "count"));
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v59 = self->_proxiedContentMaps;
    uint64_t v60 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v67 objects:v95 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v68;
      do
      {
        for (juint64_t j = 0; jj != v61; ++jj)
        {
          if (*(void *)v68 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * jj), "dictionaryRepresentation", (void)v67);
          [v58 addObject:v64];
        }
        uint64_t v61 = [(NSMutableArray *)v59 countByEnumeratingWithState:&v67 objects:v95 count:16];
      }
      while (v61);
    }

    [v3 setObject:v58 forKey:@"proxiedContentMaps"];
  }
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  if (trustedNetworkDiscoveredProxies) {
    [v3 setObject:trustedNetworkDiscoveredProxies forKey:@"trustedNetworkDiscoveredProxies"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  if (!self->_authInfo) {
    __assert_rtn("-[NSPPrivacyProxyConfiguration writeTo:]", "NSPPrivacyProxyConfiguration.m", 678, "self->_authInfo != nil");
  }
  PBDataWriterWriteSubmessage();
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v6 = self->_policyTierMaps;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v74 objects:v85 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v75 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v74 objects:v85 count:16];
    }
    while (v8);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v11 = self->_proxies;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v71 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v70 objects:v84 count:16];
    }
    while (v13);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v16 = self->_pathWeights;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v66 objects:v83 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v67 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v66 objects:v83 count:16];
    }
    while (v18);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v21 = self->_resolvers;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v63 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v62 objects:v82 count:16];
    }
    while (v23);
  }

  PBDataWriterWriteUint32Field();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v26 = self->_fallbackPathWeights;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v59;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v59 != v29) {
          objc_enumerationMutation(v26);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v58 objects:v81 count:16];
    }
    while (v28);
  }

  if (self->_regionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_bootstrapResolver) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_dnsProbe) {
    PBDataWriterWriteStringField();
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v31 = self->_obliviousConfigs;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v55;
    do
    {
      for (iuint64_t i = 0; ii != v33; ++ii)
      {
        if (*(void *)v55 != v34) {
          objc_enumerationMutation(v31);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v54 objects:v80 count:16];
    }
    while (v33);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v36 = self->_proxiedContentMaps;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v51;
    do
    {
      for (juint64_t j = 0; jj != v38; ++jj)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(v36);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v50 objects:v79 count:16];
    }
    while (v38);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v41 = self->_trustedNetworkDiscoveredProxies;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v47;
    do
    {
      for (kuint64_t k = 0; kk != v43; ++kk)
      {
        if (*(void *)v47 != v44) {
          objc_enumerationMutation(v41);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v46 objects:v78 count:16];
    }
    while (v43);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[32] = self->_version;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 132) = self->_enabled;
    *((unsigned char *)v4 + 136) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_disableUntil;
    *((unsigned char *)v4 + 136) |= 1u;
  }
  id v38 = v4;
  [v4 setAuthInfo:self->_authInfo];
  if ([(NSPPrivacyProxyConfiguration *)self policyTierMapsCount])
  {
    [v38 clearPolicyTierMaps];
    unint64_t v6 = [(NSPPrivacyProxyConfiguration *)self policyTierMapsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(NSPPrivacyProxyConfiguration *)self policyTierMapAtIndex:i];
        [v38 addPolicyTierMap:v9];
      }
    }
  }
  if ([(NSPPrivacyProxyConfiguration *)self proxiesCount])
  {
    [v38 clearProxies];
    unint64_t v10 = [(NSPPrivacyProxyConfiguration *)self proxiesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(NSPPrivacyProxyConfiguration *)self proxiesAtIndex:j];
        [v38 addProxies:v13];
      }
    }
  }
  if ([(NSPPrivacyProxyConfiguration *)self pathWeightsCount])
  {
    [v38 clearPathWeights];
    unint64_t v14 = [(NSPPrivacyProxyConfiguration *)self pathWeightsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(NSPPrivacyProxyConfiguration *)self pathWeightsAtIndex:k];
        [v38 addPathWeights:v17];
      }
    }
  }
  if ([(NSPPrivacyProxyConfiguration *)self resolversCount])
  {
    [v38 clearResolvers];
    unint64_t v18 = [(NSPPrivacyProxyConfiguration *)self resolversCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t m = 0; m != v19; ++m)
      {
        uint64_t v21 = [(NSPPrivacyProxyConfiguration *)self resolversAtIndex:m];
        [v38 addResolvers:v21];
      }
    }
  }
  *((_DWORD *)v38 + 12) = self->_maxTokenNum;
  if ([(NSPPrivacyProxyConfiguration *)self fallbackPathWeightsCount])
  {
    [v38 clearFallbackPathWeights];
    unint64_t v22 = [(NSPPrivacyProxyConfiguration *)self fallbackPathWeightsCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (uint64_t n = 0; n != v23; ++n)
      {
        v25 = [(NSPPrivacyProxyConfiguration *)self fallbackPathWeightsAtIndex:n];
        [v38 addFallbackPathWeights:v25];
      }
    }
  }
  if (self->_regionId) {
    objc_msgSend(v38, "setRegionId:");
  }
  if (self->_bootstrapResolver) {
    objc_msgSend(v38, "setBootstrapResolver:");
  }
  if (self->_dnsProbe) {
    objc_msgSend(v38, "setDnsProbe:");
  }
  if ([(NSPPrivacyProxyConfiguration *)self obliviousConfigsCount])
  {
    [v38 clearObliviousConfigs];
    unint64_t v26 = [(NSPPrivacyProxyConfiguration *)self obliviousConfigsCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (iuint64_t i = 0; ii != v27; ++ii)
      {
        uint64_t v29 = [(NSPPrivacyProxyConfiguration *)self obliviousConfigsAtIndex:ii];
        [v38 addObliviousConfigs:v29];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v38 + 20) = self->_preferredPathEnabledPercentage;
    *((unsigned char *)v38 + 136) |= 2u;
  }
  if ([(NSPPrivacyProxyConfiguration *)self proxiedContentMapsCount])
  {
    [v38 clearProxiedContentMaps];
    unint64_t v30 = [(NSPPrivacyProxyConfiguration *)self proxiedContentMapsCount];
    if (v30)
    {
      unint64_t v31 = v30;
      for (juint64_t j = 0; jj != v31; ++jj)
      {
        uint64_t v33 = [(NSPPrivacyProxyConfiguration *)self proxiedContentMapsAtIndex:jj];
        [v38 addProxiedContentMaps:v33];
      }
    }
  }
  if ([(NSPPrivacyProxyConfiguration *)self trustedNetworkDiscoveredProxiesCount])
  {
    [v38 clearTrustedNetworkDiscoveredProxies];
    unint64_t v34 = [(NSPPrivacyProxyConfiguration *)self trustedNetworkDiscoveredProxiesCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (kuint64_t k = 0; kk != v35; ++kk)
      {
        uint64_t v37 = [(NSPPrivacyProxyConfiguration *)self trustedNetworkDiscoveredProxiesAtIndex:kk];
        [v38 addTrustedNetworkDiscoveredProxies:v37];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  *(_DWORD *)(v5 + 128) = self->_version;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 132) = self->_enabled;
    *(unsigned char *)(v5 + 136) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_disableUntil;
    *(unsigned char *)(v5 + 136) |= 1u;
  }
  id v8 = [(NSPPrivacyProxyAuthenticationInfo *)self->_authInfo copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  unint64_t v10 = self->_policyTierMaps;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v93 objects:v104 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v94 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = (void *)[*(id *)(*((void *)&v93 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addPolicyTierMap:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v93 objects:v104 count:16];
    }
    while (v12);
  }

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v16 = self->_proxies;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v89 objects:v103 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v90 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addProxies:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v89 objects:v103 count:16];
    }
    while (v18);
  }

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  unint64_t v22 = self->_pathWeights;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v85 objects:v102 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v86;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v86 != v25) {
          objc_enumerationMutation(v22);
        }
        unint64_t v27 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addPathWeights:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v85 objects:v102 count:16];
    }
    while (v24);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  uint64_t v28 = self->_resolvers;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v81 objects:v101 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v82;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v82 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addResolvers:v33];
      }
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v81 objects:v101 count:16];
    }
    while (v30);
  }

  *(_DWORD *)(v6 + 48) = self->_maxTokenNum;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  unint64_t v34 = self->_fallbackPathWeights;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v77 objects:v100 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v78;
    do
    {
      for (uint64_t n = 0; n != v36; ++n)
      {
        if (*(void *)v78 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addFallbackPathWeights:v39];
      }
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v77 objects:v100 count:16];
    }
    while (v36);
  }

  uint64_t v40 = [(NSString *)self->_regionId copyWithZone:a3];
  uint64_t v41 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v40;

  id v42 = [(NSPPrivacyProxyResolverInfo *)self->_bootstrapResolver copyWithZone:a3];
  uint64_t v43 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v42;

  uint64_t v44 = [(NSString *)self->_dnsProbe copyWithZone:a3];
  v45 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v44;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v46 = self->_obliviousConfigs;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v73 objects:v99 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v74;
    do
    {
      for (iuint64_t i = 0; ii != v48; ++ii)
      {
        if (*(void *)v74 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * ii) copyWithZone:a3];
        [(id)v6 addObliviousConfigs:v51];
      }
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v73 objects:v99 count:16];
    }
    while (v48);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_preferredPathEnabledPercentage;
    *(unsigned char *)(v6 + 136) |= 2u;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v52 = self->_proxiedContentMaps;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v69 objects:v98 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v70;
    do
    {
      for (juint64_t j = 0; jj != v54; ++jj)
      {
        if (*(void *)v70 != v55) {
          objc_enumerationMutation(v52);
        }
        long long v57 = (void *)[*(id *)(*((void *)&v69 + 1) + 8 * jj) copyWithZone:a3];
        [(id)v6 addProxiedContentMaps:v57];
      }
      uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v69 objects:v98 count:16];
    }
    while (v54);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v58 = self->_trustedNetworkDiscoveredProxies;
  uint64_t v59 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v65 objects:v97 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v66;
    do
    {
      for (kuint64_t k = 0; kk != v60; ++kk)
      {
        if (*(void *)v66 != v61) {
          objc_enumerationMutation(v58);
        }
        long long v63 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * kk), "copyWithZone:", a3, (void)v65);
        [(id)v6 addTrustedNetworkDiscoveredProxies:v63];
      }
      uint64_t v60 = [(NSMutableArray *)v58 countByEnumeratingWithState:&v65 objects:v97 count:16];
    }
    while (v60);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_version != *((_DWORD *)v4 + 32)) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 4) != 0)
    {
      if (self->_enabled)
      {
        if (!*((unsigned char *)v4 + 132)) {
          goto LABEL_46;
        }
        goto LABEL_11;
      }
      if (!*((unsigned char *)v4 + 132)) {
        goto LABEL_11;
      }
    }
LABEL_46:
    char v17 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 136) & 4) != 0) {
    goto LABEL_46;
  }
LABEL_11:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 136) & 1) == 0 || self->_disableUntil != *((void *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 136))
  {
    goto LABEL_46;
  }
  authInfo = self->_authInfo;
  if ((unint64_t)authInfo | *((void *)v4 + 2)
    && !-[NSPPrivacyProxyAuthenticationInfo isEqual:](authInfo, "isEqual:"))
  {
    goto LABEL_46;
  }
  policyTierMaps = self->_policyTierMaps;
  if ((unint64_t)policyTierMaps | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](policyTierMaps, "isEqual:")) {
      goto LABEL_46;
    }
  }
  proxies = self->_proxies;
  if ((unint64_t)proxies | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](proxies, "isEqual:")) {
      goto LABEL_46;
    }
  }
  pathWeights = self->_pathWeights;
  if ((unint64_t)pathWeights | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](pathWeights, "isEqual:")) {
      goto LABEL_46;
    }
  }
  resolvers = self->_resolvers;
  if ((unint64_t)resolvers | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](resolvers, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if (self->_maxTokenNum != *((_DWORD *)v4 + 12)) {
    goto LABEL_46;
  }
  fallbackPathWeights = self->_fallbackPathWeights;
  if ((unint64_t)fallbackPathWeights | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](fallbackPathWeights, "isEqual:")) {
      goto LABEL_46;
    }
  }
  regionId = self->_regionId;
  if ((unint64_t)regionId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](regionId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  bootstrapResolver = self->_bootstrapResolver;
  if ((unint64_t)bootstrapResolver | *((void *)v4 + 3))
  {
    if (!-[NSPPrivacyProxyResolverInfo isEqual:](bootstrapResolver, "isEqual:")) {
      goto LABEL_46;
    }
  }
  dnsProbe = self->_dnsProbe;
  if ((unint64_t)dnsProbe | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](dnsProbe, "isEqual:")) {
      goto LABEL_46;
    }
  }
  obliviousConfigs = self->_obliviousConfigs;
  if ((unint64_t)obliviousConfigs | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](obliviousConfigs, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 136) & 2) == 0 || self->_preferredPathEnabledPercentage != *((_DWORD *)v4 + 20)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 136) & 2) != 0)
  {
    goto LABEL_46;
  }
  proxiedContentMaps = self->_proxiedContentMaps;
  if ((unint64_t)proxiedContentMaps | *((void *)v4 + 11)
    && !-[NSMutableArray isEqual:](proxiedContentMaps, "isEqual:"))
  {
    goto LABEL_46;
  }
  trustedNetworkDiscoveredProxies = self->_trustedNetworkDiscoveredProxies;
  if ((unint64_t)trustedNetworkDiscoveredProxies | *((void *)v4 + 15)) {
    char v17 = -[NSMutableArray isEqual:](trustedNetworkDiscoveredProxies, "isEqual:");
  }
  else {
    char v17 = 1;
  }
LABEL_47:

  return v17;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v20 = 2654435761 * self->_enabled;
  }
  else {
    uint64_t v20 = 0;
  }
  versiouint64_t n = self->_version;
  if (*(unsigned char *)&self->_has) {
    unint64_t v18 = 2654435761u * self->_disableUntil;
  }
  else {
    unint64_t v18 = 0;
  }
  unint64_t v17 = [(NSPPrivacyProxyAuthenticationInfo *)self->_authInfo hash];
  uint64_t v16 = [(NSMutableArray *)self->_policyTierMaps hash];
  uint64_t v15 = [(NSMutableArray *)self->_proxies hash];
  uint64_t v3 = [(NSMutableArray *)self->_pathWeights hash];
  uint64_t v4 = [(NSMutableArray *)self->_resolvers hash];
  maxTokenNuuint64_t m = self->_maxTokenNum;
  uint64_t v6 = [(NSMutableArray *)self->_fallbackPathWeights hash];
  NSUInteger v7 = [(NSString *)self->_regionId hash];
  unint64_t v8 = [(NSPPrivacyProxyResolverInfo *)self->_bootstrapResolver hash];
  NSUInteger v9 = [(NSString *)self->_dnsProbe hash];
  uint64_t v10 = [(NSMutableArray *)self->_obliviousConfigs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_preferredPathEnabledPercentage;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ (2654435761 * version) ^ v3 ^ v4 ^ (2654435761 * maxTokenNum) ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v13 = [(NSMutableArray *)self->_proxiedContentMaps hash];
  return v12 ^ v13 ^ [(NSMutableArray *)self->_trustedNetworkDiscoveredProxies hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  self->_versiouint64_t n = *((_DWORD *)v4 + 32);
  char v6 = *((unsigned char *)v4 + 136);
  if ((v6 & 4) != 0)
  {
    self->_enabled = *((unsigned char *)v4 + 132);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 136);
  }
  if (v6)
  {
    self->_disableUntil = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  authInfo = self->_authInfo;
  uint64_t v8 = *((void *)v5 + 2);
  if (authInfo)
  {
    if (v8) {
      -[NSPPrivacyProxyAuthenticationInfo mergeFrom:](authInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NSPPrivacyProxyConfiguration setAuthInfo:](self, "setAuthInfo:");
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v9 = *((id *)v5 + 9);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v79 objects:v90 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v80 != v12) {
          objc_enumerationMutation(v9);
        }
        [(NSPPrivacyProxyConfiguration *)self addPolicyTierMap:*(void *)(*((void *)&v79 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v79 objects:v90 count:16];
    }
    while (v11);
  }

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v14 = *((id *)v5 + 12);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v76;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v76 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NSPPrivacyProxyConfiguration *)self addProxies:*(void *)(*((void *)&v75 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v75 objects:v89 count:16];
    }
    while (v16);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v19 = *((id *)v5 + 8);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v88 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v72;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        [(NSPPrivacyProxyConfiguration *)self addPathWeights:*(void *)(*((void *)&v71 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v71 objects:v88 count:16];
    }
    while (v21);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v24 = *((id *)v5 + 14);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v67 objects:v87 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v68;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v68 != v27) {
          objc_enumerationMutation(v24);
        }
        [(NSPPrivacyProxyConfiguration *)self addResolvers:*(void *)(*((void *)&v67 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v67 objects:v87 count:16];
    }
    while (v26);
  }

  self->_maxTokenNuuint64_t m = *((_DWORD *)v5 + 12);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v29 = *((id *)v5 + 5);
  uint64_t v30 = [v29 countByEnumeratingWithState:&v63 objects:v86 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v64;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v64 != v32) {
          objc_enumerationMutation(v29);
        }
        [(NSPPrivacyProxyConfiguration *)self addFallbackPathWeights:*(void *)(*((void *)&v63 + 1) + 8 * n)];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v63 objects:v86 count:16];
    }
    while (v31);
  }

  if (*((void *)v5 + 13)) {
    -[NSPPrivacyProxyConfiguration setRegionId:](self, "setRegionId:");
  }
  bootstrapResolver = self->_bootstrapResolver;
  uint64_t v35 = *((void *)v5 + 3);
  if (bootstrapResolver)
  {
    if (v35) {
      -[NSPPrivacyProxyResolverInfo mergeFrom:](bootstrapResolver, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[NSPPrivacyProxyConfiguration setBootstrapResolver:](self, "setBootstrapResolver:");
  }
  if (*((void *)v5 + 4)) {
    -[NSPPrivacyProxyConfiguration setDnsProbe:](self, "setDnsProbe:");
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v36 = *((id *)v5 + 7);
  uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v85 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v60;
    do
    {
      for (iuint64_t i = 0; ii != v38; ++ii)
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(v36);
        }
        [(NSPPrivacyProxyConfiguration *)self addObliviousConfigs:*(void *)(*((void *)&v59 + 1) + 8 * ii)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v85 count:16];
    }
    while (v38);
  }

  if ((*((unsigned char *)v5 + 136) & 2) != 0)
  {
    self->_preferredPathEnabledPercentage = *((_DWORD *)v5 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v41 = *((id *)v5 + 11);
  uint64_t v42 = [v41 countByEnumeratingWithState:&v55 objects:v84 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v56;
    do
    {
      for (juint64_t j = 0; jj != v43; ++jj)
      {
        if (*(void *)v56 != v44) {
          objc_enumerationMutation(v41);
        }
        [(NSPPrivacyProxyConfiguration *)self addProxiedContentMaps:*(void *)(*((void *)&v55 + 1) + 8 * jj)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v55 objects:v84 count:16];
    }
    while (v43);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v46 = *((id *)v5 + 15);
  uint64_t v47 = [v46 countByEnumeratingWithState:&v51 objects:v83 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v52;
    do
    {
      for (kuint64_t k = 0; kk != v48; ++kk)
      {
        if (*(void *)v52 != v49) {
          objc_enumerationMutation(v46);
        }
        -[NSPPrivacyProxyConfiguration addTrustedNetworkDiscoveredProxies:](self, "addTrustedNetworkDiscoveredProxies:", *(void *)(*((void *)&v51 + 1) + 8 * kk), (void)v51);
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v51 objects:v83 count:16];
    }
    while (v48);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_versiouint64_t n = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unint64_t)disableUntil
{
  return self->_disableUntil;
}

- (NSPPrivacyProxyAuthenticationInfo)authInfo
{
  return self->_authInfo;
}

- (void)setAuthInfo:(id)a3
{
}

- (NSMutableArray)policyTierMaps
{
  return self->_policyTierMaps;
}

- (void)setPolicyTierMaps:(id)a3
{
}

- (NSMutableArray)proxies
{
  return self->_proxies;
}

- (void)setProxies:(id)a3
{
}

- (NSMutableArray)pathWeights
{
  return self->_pathWeights;
}

- (void)setPathWeights:(id)a3
{
}

- (NSMutableArray)resolvers
{
  return self->_resolvers;
}

- (void)setResolvers:(id)a3
{
}

- (unsigned)maxTokenNum
{
  return self->_maxTokenNum;
}

- (void)setMaxTokenNum:(unsigned int)a3
{
  self->_maxTokenNuuint64_t m = a3;
}

- (NSMutableArray)fallbackPathWeights
{
  return self->_fallbackPathWeights;
}

- (void)setFallbackPathWeights:(id)a3
{
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
}

- (NSPPrivacyProxyResolverInfo)bootstrapResolver
{
  return self->_bootstrapResolver;
}

- (void)setBootstrapResolver:(id)a3
{
}

- (NSString)dnsProbe
{
  return self->_dnsProbe;
}

- (void)setDnsProbe:(id)a3
{
}

- (NSMutableArray)obliviousConfigs
{
  return self->_obliviousConfigs;
}

- (void)setObliviousConfigs:(id)a3
{
}

- (unsigned)preferredPathEnabledPercentage
{
  return self->_preferredPathEnabledPercentage;
}

- (NSMutableArray)proxiedContentMaps
{
  return self->_proxiedContentMaps;
}

- (void)setProxiedContentMaps:(id)a3
{
}

- (NSMutableArray)trustedNetworkDiscoveredProxies
{
  return self->_trustedNetworkDiscoveredProxies;
}

- (void)setTrustedNetworkDiscoveredProxies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedNetworkDiscoveredProxies, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_regionId, 0);
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_proxiedContentMaps, 0);
  objc_storeStrong((id *)&self->_policyTierMaps, 0);
  objc_storeStrong((id *)&self->_pathWeights, 0);
  objc_storeStrong((id *)&self->_obliviousConfigs, 0);
  objc_storeStrong((id *)&self->_fallbackPathWeights, 0);
  objc_storeStrong((id *)&self->_dnsProbe, 0);
  objc_storeStrong((id *)&self->_bootstrapResolver, 0);
  objc_storeStrong((id *)&self->_authInfo, 0);
}

@end