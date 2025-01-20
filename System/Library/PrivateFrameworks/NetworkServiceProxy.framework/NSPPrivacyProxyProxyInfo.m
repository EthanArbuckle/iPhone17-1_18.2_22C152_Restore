@interface NSPPrivacyProxyProxyInfo
+ (Class)allowedNextHopsType;
+ (Class)bootstrapAddressesType;
+ (Class)preferredPathPatternsType;
+ (Class)proxyKeyInfoType;
- (BOOL)fallbackSupportsUDPProxying;
- (BOOL)hasAlgorithm;
- (BOOL)hasFallbackSupportsUDPProxying;
- (BOOL)hasPreferredPathConfigUri;
- (BOOL)hasProxyVersion;
- (BOOL)hasSupportsFallback;
- (BOOL)hasSupportsResumption;
- (BOOL)hasTcpProxyFqdn;
- (BOOL)hasTokenChallenge;
- (BOOL)hasVendor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsFallback;
- (BOOL)supportsResumption;
- (NSData)tokenChallenge;
- (NSData)tokenKeyInfo;
- (NSMutableArray)allowedNextHops;
- (NSMutableArray)bootstrapAddresses;
- (NSMutableArray)preferredPathPatterns;
- (NSMutableArray)proxyKeyInfos;
- (NSString)preferredPathConfigUri;
- (NSString)proxyURL;
- (NSString)proxyVersion;
- (NSString)tcpProxyFqdn;
- (NSString)vendor;
- (id)algorithmAsString:(int)a3;
- (id)allowedNextHopsAtIndex:(unint64_t)a3;
- (id)bootstrapAddressesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preferredPathPatternsAtIndex:(unint64_t)a3;
- (id)proxyHopAsString:(int)a3;
- (id)proxyKeyInfoAtIndex:(unint64_t)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsProxyHop:(id)a3;
- (int)algorithm;
- (int)proxyHop;
- (unint64_t)allowedNextHopsCount;
- (unint64_t)bootstrapAddressesCount;
- (unint64_t)hash;
- (unint64_t)preferredPathPatternsCount;
- (unint64_t)proxyKeyInfosCount;
- (void)addAllowedNextHops:(id)a3;
- (void)addBootstrapAddresses:(id)a3;
- (void)addPreferredPathPatterns:(id)a3;
- (void)addProxyKeyInfo:(id)a3;
- (void)clearAllowedNextHops;
- (void)clearBootstrapAddresses;
- (void)clearPreferredPathPatterns;
- (void)clearProxyKeyInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setAllowedNextHops:(id)a3;
- (void)setBootstrapAddresses:(id)a3;
- (void)setFallbackSupportsUDPProxying:(BOOL)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasFallbackSupportsUDPProxying:(BOOL)a3;
- (void)setHasSupportsFallback:(BOOL)a3;
- (void)setHasSupportsResumption:(BOOL)a3;
- (void)setPreferredPathConfigUri:(id)a3;
- (void)setPreferredPathPatterns:(id)a3;
- (void)setProxyHop:(int)a3;
- (void)setProxyKeyInfos:(id)a3;
- (void)setProxyURL:(id)a3;
- (void)setProxyVersion:(id)a3;
- (void)setSupportsFallback:(BOOL)a3;
- (void)setSupportsResumption:(BOOL)a3;
- (void)setTcpProxyFqdn:(id)a3;
- (void)setTokenChallenge:(id)a3;
- (void)setTokenKeyInfo:(id)a3;
- (void)setVendor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyProxyInfo

- (id)proxyHopAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5A3B3B0[a3];
  }
  return v3;
}

- (int)StringAsProxyHop:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INGRESS_ONLY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EGRESS_ONLY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANY"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearProxyKeyInfos
{
}

- (void)addProxyKeyInfo:(id)a3
{
  id v4 = a3;
  proxyKeyInfos = self->_proxyKeyInfos;
  id v8 = v4;
  if (!proxyKeyInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_proxyKeyInfos;
    self->_proxyKeyInfos = v6;

    id v4 = v8;
    proxyKeyInfos = self->_proxyKeyInfos;
  }
  [(NSMutableArray *)proxyKeyInfos addObject:v4];
}

- (unint64_t)proxyKeyInfosCount
{
  return [(NSMutableArray *)self->_proxyKeyInfos count];
}

- (id)proxyKeyInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proxyKeyInfos objectAtIndex:a3];
}

+ (Class)proxyKeyInfoType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsFallback:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsFallback = a3;
}

- (void)setHasSupportsFallback:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsFallback
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasVendor
{
  return self->_vendor != 0;
}

- (BOOL)hasTcpProxyFqdn
{
  return self->_tcpProxyFqdn != 0;
}

- (BOOL)hasPreferredPathConfigUri
{
  return self->_preferredPathConfigUri != 0;
}

- (BOOL)hasProxyVersion
{
  return self->_proxyVersion != 0;
}

- (void)setSupportsResumption:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsResumption = a3;
}

- (void)setHasSupportsResumption:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsResumption
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearBootstrapAddresses
{
}

- (void)addBootstrapAddresses:(id)a3
{
  id v4 = a3;
  bootstrapAddresses = self->_bootstrapAddresses;
  id v8 = v4;
  if (!bootstrapAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_bootstrapAddresses;
    self->_bootstrapAddresses = v6;

    id v4 = v8;
    bootstrapAddresses = self->_bootstrapAddresses;
  }
  [(NSMutableArray *)bootstrapAddresses addObject:v4];
}

- (unint64_t)bootstrapAddressesCount
{
  return [(NSMutableArray *)self->_bootstrapAddresses count];
}

- (id)bootstrapAddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bootstrapAddresses objectAtIndex:a3];
}

+ (Class)bootstrapAddressesType
{
  return (Class)objc_opt_class();
}

- (void)clearAllowedNextHops
{
}

- (void)addAllowedNextHops:(id)a3
{
  id v4 = a3;
  allowedNextHops = self->_allowedNextHops;
  id v8 = v4;
  if (!allowedNextHops)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_allowedNextHops;
    self->_allowedNextHops = v6;

    id v4 = v8;
    allowedNextHops = self->_allowedNextHops;
  }
  [(NSMutableArray *)allowedNextHops addObject:v4];
}

- (unint64_t)allowedNextHopsCount
{
  return [(NSMutableArray *)self->_allowedNextHops count];
}

- (id)allowedNextHopsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_allowedNextHops objectAtIndex:a3];
}

+ (Class)allowedNextHopsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTokenChallenge
{
  return self->_tokenChallenge != 0;
}

- (void)clearPreferredPathPatterns
{
}

- (void)addPreferredPathPatterns:(id)a3
{
  id v4 = a3;
  preferredPathPatterns = self->_preferredPathPatterns;
  id v8 = v4;
  if (!preferredPathPatterns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_preferredPathPatterns;
    self->_preferredPathPatterns = v6;

    id v4 = v8;
    preferredPathPatterns = self->_preferredPathPatterns;
  }
  [(NSMutableArray *)preferredPathPatterns addObject:v4];
}

- (unint64_t)preferredPathPatternsCount
{
  return [(NSMutableArray *)self->_preferredPathPatterns count];
}

- (id)preferredPathPatternsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preferredPathPatterns objectAtIndex:a3];
}

+ (Class)preferredPathPatternsType
{
  return (Class)objc_opt_class();
}

- (void)setFallbackSupportsUDPProxying:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fallbackSupportsUDPProxying = a3;
}

- (void)setHasFallbackSupportsUDPProxying:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFallbackSupportsUDPProxying
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)algorithm
{
  if (*(unsigned char *)&self->_has) {
    return self->_algorithm;
  }
  else {
    return 0;
  }
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_algorithm = a3;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5A3B3D0[a3];
  }
  return v3;
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NOT_SET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"P384"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"X25519"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyProxyInfo;
  int v4 = [(NSPPrivacyProxyProxyInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyProxyInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t proxyHop = self->_proxyHop;
  if (proxyHop >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_proxyHop);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5A3B3B0[proxyHop];
  }
  [v3 setObject:v5 forKey:@"proxyHop"];

  proxyURL = self->_proxyURL;
  if (proxyURL) {
    [v3 setObject:proxyURL forKey:@"proxyURL"];
  }
  proxyKeyInfos = self->_proxyKeyInfos;
  if (proxyKeyInfos) {
    [v3 setObject:proxyKeyInfos forKey:@"proxyKeyInfo"];
  }
  tokenKeyInfo = self->_tokenKeyInfo;
  if (tokenKeyInfo) {
    [v3 setObject:tokenKeyInfo forKey:@"tokenKeyInfo"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_supportsFallback];
    [v3 setObject:v9 forKey:@"supportsFallback"];
  }
  vendor = self->_vendor;
  if (vendor) {
    [v3 setObject:vendor forKey:@"vendor"];
  }
  tcpProxyFqdn = self->_tcpProxyFqdn;
  if (tcpProxyFqdn) {
    [v3 setObject:tcpProxyFqdn forKey:@"tcpProxyFqdn"];
  }
  preferredPathConfigUri = self->_preferredPathConfigUri;
  if (preferredPathConfigUri) {
    [v3 setObject:preferredPathConfigUri forKey:@"preferredPathConfigUri"];
  }
  proxyVersion = self->_proxyVersion;
  if (proxyVersion) {
    [v3 setObject:proxyVersion forKey:@"proxyVersion"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_supportsResumption];
    [v3 setObject:v14 forKey:@"supportsResumption"];
  }
  bootstrapAddresses = self->_bootstrapAddresses;
  if (bootstrapAddresses) {
    [v3 setObject:bootstrapAddresses forKey:@"bootstrapAddresses"];
  }
  allowedNextHops = self->_allowedNextHops;
  if (allowedNextHops) {
    [v3 setObject:allowedNextHops forKey:@"allowedNextHops"];
  }
  tokenChallenge = self->_tokenChallenge;
  if (tokenChallenge) {
    [v3 setObject:tokenChallenge forKey:@"tokenChallenge"];
  }
  preferredPathPatterns = self->_preferredPathPatterns;
  if (preferredPathPatterns) {
    [v3 setObject:preferredPathPatterns forKey:@"preferredPathPatterns"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_fallbackSupportsUDPProxying];
    [v3 setObject:v20 forKey:@"fallbackSupportsUDPProxying"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A3B3D0[algorithm];
    }
    [v3 setObject:v22 forKey:@"algorithm"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxyInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_proxyURL) {
    __assert_rtn("-[NSPPrivacyProxyProxyInfo writeTo:]", "NSPPrivacyProxyProxyInfo.m", 451, "nil != self->_proxyURL");
  }
  PBDataWriterWriteStringField();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v5 = self->_proxyKeyInfos;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  if (!self->_tokenKeyInfo) {
    __assert_rtn("-[NSPPrivacyProxyProxyInfo writeTo:]", "NSPPrivacyProxyProxyInfo.m", 463, "nil != self->_tokenKeyInfo");
  }
  PBDataWriterWriteDataField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_vendor) {
    PBDataWriterWriteStringField();
  }
  if (self->_tcpProxyFqdn) {
    PBDataWriterWriteStringField();
  }
  if (self->_preferredPathConfigUri) {
    PBDataWriterWriteStringField();
  }
  if (self->_proxyVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v10 = self->_bootstrapAddresses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v15 = self->_allowedNextHops;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  if (self->_tokenChallenge) {
    PBDataWriterWriteDataField();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v20 = self->_preferredPathPatterns;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v22);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[12] = self->_proxyHop;
  id v22 = v4;
  [v4 setProxyURL:self->_proxyURL];
  if ([(NSPPrivacyProxyProxyInfo *)self proxyKeyInfosCount])
  {
    [v22 clearProxyKeyInfos];
    unint64_t v5 = [(NSPPrivacyProxyProxyInfo *)self proxyKeyInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyProxyInfo *)self proxyKeyInfoAtIndex:i];
        [v22 addProxyKeyInfo:v8];
      }
    }
  }
  [v22 setTokenKeyInfo:self->_tokenKeyInfo];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v22 + 113) = self->_supportsFallback;
    *((unsigned char *)v22 + 116) |= 4u;
  }
  if (self->_vendor) {
    objc_msgSend(v22, "setVendor:");
  }
  if (self->_tcpProxyFqdn) {
    objc_msgSend(v22, "setTcpProxyFqdn:");
  }
  if (self->_preferredPathConfigUri) {
    objc_msgSend(v22, "setPreferredPathConfigUri:");
  }
  if (self->_proxyVersion) {
    objc_msgSend(v22, "setProxyVersion:");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v22 + 114) = self->_supportsResumption;
    *((unsigned char *)v22 + 116) |= 8u;
  }
  if ([(NSPPrivacyProxyProxyInfo *)self bootstrapAddressesCount])
  {
    [v22 clearBootstrapAddresses];
    unint64_t v9 = [(NSPPrivacyProxyProxyInfo *)self bootstrapAddressesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(NSPPrivacyProxyProxyInfo *)self bootstrapAddressesAtIndex:j];
        [v22 addBootstrapAddresses:v12];
      }
    }
  }
  if ([(NSPPrivacyProxyProxyInfo *)self allowedNextHopsCount])
  {
    [v22 clearAllowedNextHops];
    unint64_t v13 = [(NSPPrivacyProxyProxyInfo *)self allowedNextHopsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(NSPPrivacyProxyProxyInfo *)self allowedNextHopsAtIndex:k];
        [v22 addAllowedNextHops:v16];
      }
    }
  }
  if (self->_tokenChallenge) {
    objc_msgSend(v22, "setTokenChallenge:");
  }
  if ([(NSPPrivacyProxyProxyInfo *)self preferredPathPatternsCount])
  {
    [v22 clearPreferredPathPatterns];
    unint64_t v17 = [(NSPPrivacyProxyProxyInfo *)self preferredPathPatternsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(NSPPrivacyProxyProxyInfo *)self preferredPathPatternsAtIndex:m];
        [v22 addPreferredPathPatterns:v20];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v22 + 112) = self->_fallbackSupportsUDPProxying;
    *((unsigned char *)v22 + 116) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v22 + 2) = self->_algorithm;
    *((unsigned char *)v22 + 116) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_proxyHop;
  uint64_t v6 = [(NSString *)self->_proxyURL copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v8 = self->_proxyKeyInfos;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v59 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addProxyKeyInfo:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSData *)self->_tokenKeyInfo copyWithZone:a3];
  v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 113) = self->_supportsFallback;
    *(unsigned char *)(v5 + 116) |= 4u;
  }
  uint64_t v16 = [(NSString *)self->_vendor copyWithZone:a3];
  unint64_t v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_tcpProxyFqdn copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  uint64_t v20 = [(NSString *)self->_preferredPathConfigUri copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  uint64_t v22 = [(NSString *)self->_proxyVersion copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 114) = self->_supportsResumption;
    *(unsigned char *)(v5 + 116) |= 8u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v24 = self->_bootstrapAddresses;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v55 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addBootstrapAddresses:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v26);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v30 = self->_allowedNextHops;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v50 objects:v63 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v51 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addAllowedNextHops:v35];
      }
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v50 objects:v63 count:16];
    }
    while (v32);
  }

  uint64_t v36 = [(NSData *)self->_tokenChallenge copyWithZone:a3];
  long long v37 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v36;

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v38 = self->_preferredPathPatterns;
  uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v46 objects:v62 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v47;
    do
    {
      for (uint64_t m = 0; m != v40; ++m)
      {
        if (*(void *)v47 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * m), "copyWithZone:", a3, (void)v46);
        [(id)v5 addPreferredPathPatterns:v43];
      }
      uint64_t v40 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v46 objects:v62 count:16];
    }
    while (v40);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 112) = self->_fallbackSupportsUDPProxying;
    *(unsigned char *)(v5 + 116) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_algorithm;
    *(unsigned char *)(v5 + 116) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_53;
  }
  if (self->_proxyHop != *((_DWORD *)v4 + 12)) {
    goto LABEL_53;
  }
  proxyURL = self->_proxyURL;
  if ((unint64_t)proxyURL | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](proxyURL, "isEqual:")) {
      goto LABEL_53;
    }
  }
  proxyKeyInfos = self->_proxyKeyInfos;
  if ((unint64_t)proxyKeyInfos | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](proxyKeyInfos, "isEqual:")) {
      goto LABEL_53;
    }
  }
  tokenKeyInfo = self->_tokenKeyInfo;
  if ((unint64_t)tokenKeyInfo | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](tokenKeyInfo, "isEqual:")) {
      goto LABEL_53;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0) {
      goto LABEL_53;
    }
    if (self->_supportsFallback)
    {
      if (!*((unsigned char *)v4 + 113)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 113))
    {
      goto LABEL_53;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_53;
  }
  vendor = self->_vendor;
  if ((unint64_t)vendor | *((void *)v4 + 13) && !-[NSString isEqual:](vendor, "isEqual:")) {
    goto LABEL_53;
  }
  tcpProxyFqdn = self->_tcpProxyFqdn;
  if ((unint64_t)tcpProxyFqdn | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](tcpProxyFqdn, "isEqual:")) {
      goto LABEL_53;
    }
  }
  preferredPathConfigUruint64_t i = self->_preferredPathConfigUri;
  if ((unint64_t)preferredPathConfigUri | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](preferredPathConfigUri, "isEqual:")) {
      goto LABEL_53;
    }
  }
  proxyVersion = self->_proxyVersion;
  if ((unint64_t)proxyVersion | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](proxyVersion, "isEqual:")) {
      goto LABEL_53;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) == 0) {
      goto LABEL_53;
    }
    if (self->_supportsResumption)
    {
      if (!*((unsigned char *)v4 + 114)) {
        goto LABEL_53;
      }
    }
    else if (*((unsigned char *)v4 + 114))
    {
      goto LABEL_53;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    goto LABEL_53;
  }
  bootstrapAddresses = self->_bootstrapAddresses;
  if ((unint64_t)bootstrapAddresses | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](bootstrapAddresses, "isEqual:"))
  {
    goto LABEL_53;
  }
  allowedNextHops = self->_allowedNextHops;
  if ((unint64_t)allowedNextHops | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](allowedNextHops, "isEqual:")) {
      goto LABEL_53;
    }
  }
  tokenChallenge = self->_tokenChallenge;
  if ((unint64_t)tokenChallenge | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](tokenChallenge, "isEqual:")) {
      goto LABEL_53;
    }
  }
  preferredPathPatterns = self->_preferredPathPatterns;
  if ((unint64_t)preferredPathPatterns | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](preferredPathPatterns, "isEqual:")) {
      goto LABEL_53;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) != 0)
    {
      if (self->_fallbackSupportsUDPProxying)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_53;
        }
        goto LABEL_49;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_49;
      }
    }
LABEL_53:
    BOOL v16 = 0;
    goto LABEL_54;
  }
  if ((*((unsigned char *)v4 + 116) & 2) != 0) {
    goto LABEL_53;
  }
LABEL_49:
  BOOL v16 = (*((unsigned char *)v4 + 116) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 2)) {
      goto LABEL_53;
    }
    BOOL v16 = 1;
  }
LABEL_54:

  return v16;
}

- (unint64_t)hash
{
  uint64_t proxyHop = self->_proxyHop;
  NSUInteger v18 = [(NSString *)self->_proxyURL hash];
  uint64_t v17 = [(NSMutableArray *)self->_proxyKeyInfos hash];
  uint64_t v16 = [(NSData *)self->_tokenKeyInfo hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_supportsFallback;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v14 = [(NSString *)self->_vendor hash];
  NSUInteger v3 = [(NSString *)self->_tcpProxyFqdn hash];
  NSUInteger v4 = [(NSString *)self->_preferredPathConfigUri hash];
  NSUInteger v5 = [(NSString *)self->_proxyVersion hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v6 = 2654435761 * self->_supportsResumption;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_bootstrapAddresses hash];
  uint64_t v8 = [(NSMutableArray *)self->_allowedNextHops hash];
  uint64_t v9 = [(NSData *)self->_tokenChallenge hash];
  uint64_t v10 = [(NSMutableArray *)self->_preferredPathPatterns hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_fallbackSupportsUDPProxying;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v12 = 0;
    return v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ (2654435761 * proxyHop) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v12 = 2654435761 * self->_algorithm;
  return v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ (2654435761 * proxyHop) ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_uint64_t proxyHop = *((_DWORD *)v4 + 12);
  if (*((void *)v4 + 8)) {
    -[NSPPrivacyProxyProxyInfo setProxyURL:](self, "setProxyURL:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSPPrivacyProxyProxyInfo *)self addProxyKeyInfo:*(void *)(*((void *)&v38 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 12)) {
    -[NSPPrivacyProxyProxyInfo setTokenKeyInfo:](self, "setTokenKeyInfo:");
  }
  if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    self->_supportsFallbacuint64_t k = *((unsigned char *)v4 + 113);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 13)) {
    -[NSPPrivacyProxyProxyInfo setVendor:](self, "setVendor:");
  }
  if (*((void *)v4 + 10)) {
    -[NSPPrivacyProxyProxyInfo setTcpProxyFqdn:](self, "setTcpProxyFqdn:");
  }
  if (*((void *)v4 + 4)) {
    -[NSPPrivacyProxyProxyInfo setPreferredPathConfigUri:](self, "setPreferredPathConfigUri:");
  }
  if (*((void *)v4 + 9)) {
    -[NSPPrivacyProxyProxyInfo setProxyVersion:](self, "setProxyVersion:");
  }
  if ((*((unsigned char *)v4 + 116) & 8) != 0)
  {
    self->_supportsResumption = *((unsigned char *)v4 + 114);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NSPPrivacyProxyProxyInfo *)self addBootstrapAddresses:*(void *)(*((void *)&v34 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = *((id *)v4 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NSPPrivacyProxyProxyInfo *)self addAllowedNextHops:*(void *)(*((void *)&v30 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }

  if (*((void *)v4 + 11)) {
    -[NSPPrivacyProxyProxyInfo setTokenChallenge:](self, "setTokenChallenge:");
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = *((id *)v4 + 5);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        -[NSPPrivacyProxyProxyInfo addPreferredPathPatterns:](self, "addPreferredPathPatterns:", *(void *)(*((void *)&v26 + 1) + 8 * m), (void)v26);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v22);
  }

  char v25 = *((unsigned char *)v4 + 116);
  if ((v25 & 2) != 0)
  {
    self->_fallbackSupportsUDPProxying = *((unsigned char *)v4 + 112);
    *(unsigned char *)&self->_has |= 2u;
    char v25 = *((unsigned char *)v4 + 116);
  }
  if (v25)
  {
    self->_uint64_t algorithm = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)proxyHop
{
  return self->_proxyHop;
}

- (void)setProxyHop:(int)a3
{
  self->_uint64_t proxyHop = a3;
}

- (NSString)proxyURL
{
  return self->_proxyURL;
}

- (void)setProxyURL:(id)a3
{
}

- (NSMutableArray)proxyKeyInfos
{
  return self->_proxyKeyInfos;
}

- (void)setProxyKeyInfos:(id)a3
{
}

- (NSData)tokenKeyInfo
{
  return self->_tokenKeyInfo;
}

- (void)setTokenKeyInfo:(id)a3
{
}

- (BOOL)supportsFallback
{
  return self->_supportsFallback;
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setVendor:(id)a3
{
}

- (NSString)tcpProxyFqdn
{
  return self->_tcpProxyFqdn;
}

- (void)setTcpProxyFqdn:(id)a3
{
}

- (NSString)preferredPathConfigUri
{
  return self->_preferredPathConfigUri;
}

- (void)setPreferredPathConfigUri:(id)a3
{
}

- (NSString)proxyVersion
{
  return self->_proxyVersion;
}

- (void)setProxyVersion:(id)a3
{
}

- (BOOL)supportsResumption
{
  return self->_supportsResumption;
}

- (NSMutableArray)bootstrapAddresses
{
  return self->_bootstrapAddresses;
}

- (void)setBootstrapAddresses:(id)a3
{
}

- (NSMutableArray)allowedNextHops
{
  return self->_allowedNextHops;
}

- (void)setAllowedNextHops:(id)a3
{
}

- (NSData)tokenChallenge
{
  return self->_tokenChallenge;
}

- (void)setTokenChallenge:(id)a3
{
}

- (NSMutableArray)preferredPathPatterns
{
  return self->_preferredPathPatterns;
}

- (void)setPreferredPathPatterns:(id)a3
{
}

- (BOOL)fallbackSupportsUDPProxying
{
  return self->_fallbackSupportsUDPProxying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_tokenKeyInfo, 0);
  objc_storeStrong((id *)&self->_tokenChallenge, 0);
  objc_storeStrong((id *)&self->_tcpProxyFqdn, 0);
  objc_storeStrong((id *)&self->_proxyVersion, 0);
  objc_storeStrong((id *)&self->_proxyURL, 0);
  objc_storeStrong((id *)&self->_proxyKeyInfos, 0);
  objc_storeStrong((id *)&self->_preferredPathPatterns, 0);
  objc_storeStrong((id *)&self->_preferredPathConfigUri, 0);
  objc_storeStrong((id *)&self->_bootstrapAddresses, 0);
  objc_storeStrong((id *)&self->_allowedNextHops, 0);
}

@end