@interface NTPBExternalAnalyticsConfig
+ (Class)proxyHostNamesType;
+ (Class)queryParameterConfigType;
+ (Class)vpnProfileNamesType;
- (BOOL)hasAnalyticsBaseUrl;
- (BOOL)hasAnalyticsId;
- (BOOL)hasEventQueryParameterName;
- (BOOL)hasUsesProxyProfile;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usesProxyProfile;
- (NSMutableArray)proxyHostNames;
- (NSMutableArray)queryParameterConfigs;
- (NSMutableArray)vpnProfileNames;
- (NSString)analyticsBaseUrl;
- (NSString)analyticsId;
- (NSString)eventQueryParameterName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)proxyHostNamesAtIndex:(unint64_t)a3;
- (id)queryParameterConfigAtIndex:(unint64_t)a3;
- (id)vpnProfileNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)proxyHostNamesCount;
- (unint64_t)queryParameterConfigsCount;
- (unint64_t)vpnProfileNamesCount;
- (void)addProxyHostNames:(id)a3;
- (void)addQueryParameterConfig:(id)a3;
- (void)addVpnProfileNames:(id)a3;
- (void)clearProxyHostNames;
- (void)clearQueryParameterConfigs;
- (void)clearVpnProfileNames;
- (void)mergeFrom:(id)a3;
- (void)setAnalyticsBaseUrl:(id)a3;
- (void)setAnalyticsId:(id)a3;
- (void)setEventQueryParameterName:(id)a3;
- (void)setHasUsesProxyProfile:(BOOL)a3;
- (void)setProxyHostNames:(id)a3;
- (void)setQueryParameterConfigs:(id)a3;
- (void)setUsesProxyProfile:(BOOL)a3;
- (void)setVpnProfileNames:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBExternalAnalyticsConfig

- (BOOL)hasAnalyticsBaseUrl
{
  return self->_analyticsBaseUrl != 0;
}

- (BOOL)hasAnalyticsId
{
  return self->_analyticsId != 0;
}

- (BOOL)hasEventQueryParameterName
{
  return self->_eventQueryParameterName != 0;
}

- (void)clearQueryParameterConfigs
{
}

- (void)addQueryParameterConfig:(id)a3
{
  id v4 = a3;
  queryParameterConfigs = self->_queryParameterConfigs;
  id v8 = v4;
  if (!queryParameterConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_queryParameterConfigs;
    self->_queryParameterConfigs = v6;

    id v4 = v8;
    queryParameterConfigs = self->_queryParameterConfigs;
  }
  [(NSMutableArray *)queryParameterConfigs addObject:v4];
}

- (unint64_t)queryParameterConfigsCount
{
  return [(NSMutableArray *)self->_queryParameterConfigs count];
}

- (id)queryParameterConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_queryParameterConfigs objectAtIndex:a3];
}

+ (Class)queryParameterConfigType
{
  return (Class)objc_opt_class();
}

- (void)setUsesProxyProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_usesProxyProfile = a3;
}

- (void)setHasUsesProxyProfile:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsesProxyProfile
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearProxyHostNames
{
}

- (void)addProxyHostNames:(id)a3
{
  id v4 = a3;
  proxyHostNames = self->_proxyHostNames;
  id v8 = v4;
  if (!proxyHostNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_proxyHostNames;
    self->_proxyHostNames = v6;

    id v4 = v8;
    proxyHostNames = self->_proxyHostNames;
  }
  [(NSMutableArray *)proxyHostNames addObject:v4];
}

- (unint64_t)proxyHostNamesCount
{
  return [(NSMutableArray *)self->_proxyHostNames count];
}

- (id)proxyHostNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_proxyHostNames objectAtIndex:a3];
}

+ (Class)proxyHostNamesType
{
  return (Class)objc_opt_class();
}

- (void)clearVpnProfileNames
{
}

- (void)addVpnProfileNames:(id)a3
{
  id v4 = a3;
  vpnProfileNames = self->_vpnProfileNames;
  id v8 = v4;
  if (!vpnProfileNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_vpnProfileNames;
    self->_vpnProfileNames = v6;

    id v4 = v8;
    vpnProfileNames = self->_vpnProfileNames;
  }
  [(NSMutableArray *)vpnProfileNames addObject:v4];
}

- (unint64_t)vpnProfileNamesCount
{
  return [(NSMutableArray *)self->_vpnProfileNames count];
}

- (id)vpnProfileNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_vpnProfileNames objectAtIndex:a3];
}

+ (Class)vpnProfileNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBExternalAnalyticsConfig;
  id v4 = [(NTPBExternalAnalyticsConfig *)&v8 description];
  v5 = [(NTPBExternalAnalyticsConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  analyticsBaseUrl = self->_analyticsBaseUrl;
  if (analyticsBaseUrl) {
    [v3 setObject:analyticsBaseUrl forKey:@"analytics_base_url"];
  }
  analyticsId = self->_analyticsId;
  if (analyticsId) {
    [v4 setObject:analyticsId forKey:@"analytics_id"];
  }
  eventQueryParameterName = self->_eventQueryParameterName;
  if (eventQueryParameterName) {
    [v4 setObject:eventQueryParameterName forKey:@"event_query_parameter_name"];
  }
  if ([(NSMutableArray *)self->_queryParameterConfigs count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_queryParameterConfigs, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v9 = self->_queryParameterConfigs;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"query_parameter_config"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = [NSNumber numberWithBool:self->_usesProxyProfile];
    [v4 setObject:v15 forKey:@"uses_proxy_profile"];
  }
  proxyHostNames = self->_proxyHostNames;
  if (proxyHostNames) {
    [v4 setObject:proxyHostNames forKey:@"proxy_host_names"];
  }
  vpnProfileNames = self->_vpnProfileNames;
  if (vpnProfileNames) {
    [v4 setObject:vpnProfileNames forKey:@"vpn_profile_names"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBExternalAnalyticsConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_analyticsBaseUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_analyticsId) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventQueryParameterName) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_queryParameterConfigs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_proxyHostNames;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_vpnProfileNames;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_analyticsBaseUrl copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_analyticsId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_eventQueryParameterName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v12 = self->_queryParameterConfigs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addQueryParameterConfig:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 56) = self->_usesProxyProfile;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v18 = self->_proxyHostNames;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * v22) copyWithZone:a3];
        [(id)v5 addProxyHostNames:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v20);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v24 = self->_vpnProfileNames;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v32;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v28), "copyWithZone:", a3, (void)v31);
        [(id)v5 addVpnProfileNames:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v26);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  analyticsBaseUrl = self->_analyticsBaseUrl;
  if ((unint64_t)analyticsBaseUrl | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](analyticsBaseUrl, "isEqual:")) {
      goto LABEL_22;
    }
  }
  analyticsId = self->_analyticsId;
  if ((unint64_t)analyticsId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](analyticsId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  eventQueryParameterName = self->_eventQueryParameterName;
  if ((unint64_t)eventQueryParameterName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](eventQueryParameterName, "isEqual:")) {
      goto LABEL_22;
    }
  }
  queryParameterConfigs = self->_queryParameterConfigs;
  if ((unint64_t)queryParameterConfigs | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](queryParameterConfigs, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 60))
    {
      if (self->_usesProxyProfile)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    char v11 = 0;
    goto LABEL_23;
  }
  if (*((unsigned char *)v4 + 60)) {
    goto LABEL_22;
  }
LABEL_18:
  proxyHostNames = self->_proxyHostNames;
  if ((unint64_t)proxyHostNames | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](proxyHostNames, "isEqual:"))
  {
    goto LABEL_22;
  }
  vpnProfileNames = self->_vpnProfileNames;
  if ((unint64_t)vpnProfileNames | *((void *)v4 + 6)) {
    char v11 = -[NSMutableArray isEqual:](vpnProfileNames, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_23:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_analyticsBaseUrl hash];
  NSUInteger v4 = [(NSString *)self->_analyticsId hash];
  NSUInteger v5 = [(NSString *)self->_eventQueryParameterName hash];
  uint64_t v6 = [(NSMutableArray *)self->_queryParameterConfigs hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_usesProxyProfile;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v9 = v7 ^ [(NSMutableArray *)self->_proxyHostNames hash];
  return v8 ^ v9 ^ [(NSMutableArray *)self->_vpnProfileNames hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[NTPBExternalAnalyticsConfig setAnalyticsBaseUrl:](self, "setAnalyticsBaseUrl:");
  }
  if (*((void *)v4 + 2)) {
    -[NTPBExternalAnalyticsConfig setAnalyticsId:](self, "setAnalyticsId:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBExternalAnalyticsConfig setEventQueryParameterName:](self, "setEventQueryParameterName:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBExternalAnalyticsConfig *)self addQueryParameterConfig:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 60))
  {
    self->_usesProxyProfile = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NTPBExternalAnalyticsConfig *)self addProxyHostNames:*(void *)(*((void *)&v24 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = *((id *)v4 + 6);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        -[NTPBExternalAnalyticsConfig addVpnProfileNames:](self, "addVpnProfileNames:", *(void *)(*((void *)&v20 + 1) + 8 * k), (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }
}

- (NSString)analyticsBaseUrl
{
  return self->_analyticsBaseUrl;
}

- (void)setAnalyticsBaseUrl:(id)a3
{
}

- (NSString)analyticsId
{
  return self->_analyticsId;
}

- (void)setAnalyticsId:(id)a3
{
}

- (NSString)eventQueryParameterName
{
  return self->_eventQueryParameterName;
}

- (void)setEventQueryParameterName:(id)a3
{
}

- (NSMutableArray)queryParameterConfigs
{
  return self->_queryParameterConfigs;
}

- (void)setQueryParameterConfigs:(id)a3
{
}

- (BOOL)usesProxyProfile
{
  return self->_usesProxyProfile;
}

- (NSMutableArray)proxyHostNames
{
  return self->_proxyHostNames;
}

- (void)setProxyHostNames:(id)a3
{
}

- (NSMutableArray)vpnProfileNames
{
  return self->_vpnProfileNames;
}

- (void)setVpnProfileNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vpnProfileNames, 0);
  objc_storeStrong((id *)&self->_queryParameterConfigs, 0);
  objc_storeStrong((id *)&self->_proxyHostNames, 0);
  objc_storeStrong((id *)&self->_eventQueryParameterName, 0);
  objc_storeStrong((id *)&self->_analyticsId, 0);

  objc_storeStrong((id *)&self->_analyticsBaseUrl, 0);
}

@end