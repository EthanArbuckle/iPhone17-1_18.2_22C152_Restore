@interface APPBConfigurationResponse
+ (Class)theConfigurationType;
- (BOOL)hasBannerProxyType;
- (BOOL)hasConfigVersion;
- (BOOL)hasResourceConnectProxyURL;
- (BOOL)hasResourceProxyURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)theConfigurations;
- (NSString)configVersion;
- (NSString)resourceConnectProxyURL;
- (NSString)resourceProxyURL;
- (id)bannerProxyTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)theConfigurationAtIndex:(unint64_t)a3;
- (int)StringAsBannerProxyType:(id)a3;
- (int)bannerProxyType;
- (unint64_t)hash;
- (unint64_t)theConfigurationsCount;
- (void)addTheConfiguration:(id)a3;
- (void)clearTheConfigurations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBannerProxyType:(int)a3;
- (void)setConfigVersion:(id)a3;
- (void)setHasBannerProxyType:(BOOL)a3;
- (void)setResourceConnectProxyURL:(id)a3;
- (void)setResourceProxyURL:(id)a3;
- (void)setTheConfigurations:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBConfigurationResponse

- (void)clearTheConfigurations
{
}

- (void)addTheConfiguration:(id)a3
{
  id v4 = a3;
  theConfigurations = self->_theConfigurations;
  id v8 = v4;
  if (!theConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_theConfigurations;
    self->_theConfigurations = v6;

    id v4 = v8;
    theConfigurations = self->_theConfigurations;
  }
  [(NSMutableArray *)theConfigurations addObject:v4];
}

- (unint64_t)theConfigurationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_theConfigurations count];
}

- (id)theConfigurationAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_theConfigurations objectAtIndex:a3];
}

+ (Class)theConfigurationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasResourceProxyURL
{
  return self->_resourceProxyURL != 0;
}

- (BOOL)hasResourceConnectProxyURL
{
  return self->_resourceConnectProxyURL != 0;
}

- (int)bannerProxyType
{
  if (*(unsigned char *)&self->_has) {
    return self->_bannerProxyType;
  }
  else {
    return 0;
  }
}

- (void)setBannerProxyType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bannerProxyType = a3;
}

- (void)setHasBannerProxyType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBannerProxyType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)bannerProxyTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"Connect";
    }
    else
    {
      id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    id v4 = @"Legacy";
  }
  return v4;
}

- (int)StringAsBannerProxyType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Legacy"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Connect"];
  }

  return v4;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBConfigurationResponse;
  id v3 = [(APPBConfigurationResponse *)&v7 description];
  int v4 = [(APPBConfigurationResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_theConfigurations count])
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_theConfigurations, "count")];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v5 = self->_theConfigurations;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"theConfiguration"];
  }
  resourceProxyURL = self->_resourceProxyURL;
  if (resourceProxyURL) {
    [v3 setObject:resourceProxyURL forKey:@"resourceProxyURL"];
  }
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if (resourceConnectProxyURL) {
    [v3 setObject:resourceConnectProxyURL forKey:@"resourceConnectProxyURL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int bannerProxyType = self->_bannerProxyType;
    if (bannerProxyType)
    {
      if (bannerProxyType == 1)
      {
        v14 = @"Connect";
      }
      else
      {
        v14 = +[NSString stringWithFormat:@"(unknown: %i)", self->_bannerProxyType];
      }
    }
    else
    {
      v14 = @"Legacy";
    }
    [v3 setObject:v14 forKey:@"bannerProxyType"];
  }
  configVersion = self->_configVersion;
  if (configVersion) {
    [v3 setObject:configVersion forKey:@"configVersion"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBConfigurationResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_theConfigurations;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_resourceProxyURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_resourceConnectProxyURL) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_configVersion) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(APPBConfigurationResponse *)self theConfigurationsCount])
  {
    [v9 clearTheConfigurations];
    unint64_t v4 = [(APPBConfigurationResponse *)self theConfigurationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(APPBConfigurationResponse *)self theConfigurationAtIndex:i];
        [v9 addTheConfiguration:v7];
      }
    }
  }
  if (self->_resourceProxyURL) {
    [v9 setResourceProxyURL:];
  }
  uint64_t v8 = v9;
  if (self->_resourceConnectProxyURL)
  {
    [v9 setResourceConnectProxyURL:];
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[2] = self->_bannerProxyType;
    *((unsigned char *)v8 + 48) |= 1u;
  }
  if (self->_configVersion)
  {
    [v9 setConfigVersion:];
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = self->_theConfigurations;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addTheConfiguration:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v12 = [(NSString *)self->_resourceProxyURL copyWithZone:a3];
  long long v13 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v12;

  id v14 = [(NSString *)self->_resourceConnectProxyURL copyWithZone:a3];
  v15 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_bannerProxyType;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v16 = -[NSString copyWithZone:](self->_configVersion, "copyWithZone:", a3, (void)v19);
  long long v17 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  theConfigurations = self->_theConfigurations;
  if ((unint64_t)theConfigurations | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](theConfigurations, "isEqual:")) {
      goto LABEL_15;
    }
  }
  resourceProxyURL = self->_resourceProxyURL;
  if ((unint64_t)resourceProxyURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](resourceProxyURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  resourceConnectProxyURL = self->_resourceConnectProxyURL;
  if ((unint64_t)resourceConnectProxyURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](resourceConnectProxyURL, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_bannerProxyType != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((void *)v4 + 2)) {
    unsigned __int8 v9 = -[NSString isEqual:](configVersion, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_theConfigurations hash];
  NSUInteger v4 = [(NSString *)self->_resourceProxyURL hash];
  NSUInteger v5 = [(NSString *)self->_resourceConnectProxyURL hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_bannerProxyType;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_configVersion hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[APPBConfigurationResponse addTheConfiguration:](self, "addTheConfiguration:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 5)) {
    -[APPBConfigurationResponse setResourceProxyURL:](self, "setResourceProxyURL:");
  }
  if (*((void *)v4 + 4)) {
    -[APPBConfigurationResponse setResourceConnectProxyURL:](self, "setResourceConnectProxyURL:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_int bannerProxyType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[APPBConfigurationResponse setConfigVersion:](self, "setConfigVersion:");
  }
}

- (NSMutableArray)theConfigurations
{
  return self->_theConfigurations;
}

- (void)setTheConfigurations:(id)a3
{
}

- (NSString)resourceProxyURL
{
  return self->_resourceProxyURL;
}

- (void)setResourceProxyURL:(id)a3
{
}

- (NSString)resourceConnectProxyURL
{
  return self->_resourceConnectProxyURL;
}

- (void)setResourceConnectProxyURL:(id)a3
{
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProxyURL, 0);
  objc_storeStrong((id *)&self->_resourceConnectProxyURL, 0);
  objc_storeStrong((id *)&self->_theConfigurations, 0);

  objc_storeStrong((id *)&self->_configVersion, 0);
}

@end