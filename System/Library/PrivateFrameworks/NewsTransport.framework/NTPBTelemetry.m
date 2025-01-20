@interface NTPBTelemetry
+ (Class)networkEventGroupsType;
- (BOOL)hasAppBuild;
- (BOOL)hasAppBuildNumber;
- (BOOL)hasAppVersion;
- (BOOL)hasCarrier;
- (BOOL)hasContentEnvironment;
- (BOOL)hasCountryCode;
- (BOOL)hasDeviceModel;
- (BOOL)hasDevicePlatform;
- (BOOL)hasLanguageCode;
- (BOOL)hasMobileCountryCode;
- (BOOL)hasMobileNetworkCode;
- (BOOL)hasOsCountryCode;
- (BOOL)hasOsInstallVariant;
- (BOOL)hasOsVersion;
- (BOOL)hasUserId;
- (BOOL)hasUserStorefrontId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)networkEventGroups;
- (NSString)appBuildNumber;
- (NSString)appVersion;
- (NSString)carrier;
- (NSString)countryCode;
- (NSString)deviceModel;
- (NSString)devicePlatform;
- (NSString)languageCode;
- (NSString)mobileCountryCode;
- (NSString)mobileNetworkCode;
- (NSString)osCountryCode;
- (NSString)osVersion;
- (NSString)userId;
- (NSString)userStorefrontId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkEventGroupsAtIndex:(unint64_t)a3;
- (id)osInstallVariantAsString:(int)a3;
- (int)StringAsOsInstallVariant:(id)a3;
- (int)contentEnvironment;
- (int)osInstallVariant;
- (int64_t)appBuild;
- (unint64_t)hash;
- (unint64_t)networkEventGroupsCount;
- (void)addNetworkEventGroups:(id)a3;
- (void)clearNetworkEventGroups;
- (void)mergeFrom:(id)a3;
- (void)setAppBuild:(int64_t)a3;
- (void)setAppBuildNumber:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setCarrier:(id)a3;
- (void)setContentEnvironment:(int)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDevicePlatform:(id)a3;
- (void)setHasAppBuild:(BOOL)a3;
- (void)setHasContentEnvironment:(BOOL)a3;
- (void)setHasOsInstallVariant:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setMobileCountryCode:(id)a3;
- (void)setMobileNetworkCode:(id)a3;
- (void)setNetworkEventGroups:(id)a3;
- (void)setOsCountryCode:(id)a3;
- (void)setOsInstallVariant:(int)a3;
- (void)setOsVersion:(id)a3;
- (void)setUserId:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTelemetry

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDevicePlatform
{
  return self->_devicePlatform != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setAppBuild:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_appBuild = a3;
}

- (void)setHasAppBuild:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppBuild
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCarrier
{
  return self->_carrier != 0;
}

- (BOOL)hasMobileCountryCode
{
  return self->_mobileCountryCode != 0;
}

- (BOOL)hasMobileNetworkCode
{
  return self->_mobileNetworkCode != 0;
}

- (BOOL)hasOsCountryCode
{
  return self->_osCountryCode != 0;
}

- (int)osInstallVariant
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_osInstallVariant;
  }
  else {
    return 0;
  }
}

- (void)setOsInstallVariant:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_osInstallVariant = a3;
}

- (void)setHasOsInstallVariant:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOsInstallVariant
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)osInstallVariantAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444ED80[a3];
  }

  return v3;
}

- (int)StringAsOsInstallVariant:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_OS_INSTALL_VARIANT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERNAL_OS_INSTALL_VARIANT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_OS_INSTALL_VARIANT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)contentEnvironment
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_contentEnvironment;
  }
  else {
    return 0;
  }
}

- (void)setContentEnvironment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contentEnvironment = a3;
}

- (void)setHasContentEnvironment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentEnvironment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)clearNetworkEventGroups
{
}

- (void)addNetworkEventGroups:(id)a3
{
  id v4 = a3;
  networkEventGroups = self->_networkEventGroups;
  id v8 = v4;
  if (!networkEventGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_networkEventGroups;
    self->_networkEventGroups = v6;

    id v4 = v8;
    networkEventGroups = self->_networkEventGroups;
  }
  [(NSMutableArray *)networkEventGroups addObject:v4];
}

- (unint64_t)networkEventGroupsCount
{
  return [(NSMutableArray *)self->_networkEventGroups count];
}

- (id)networkEventGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networkEventGroups objectAtIndex:a3];
}

+ (Class)networkEventGroupsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBuildNumber
{
  return self->_appBuildNumber != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTelemetry;
  id v4 = [(NTPBTelemetry *)&v8 description];
  v5 = [(NTPBTelemetry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  devicePlatform = self->_devicePlatform;
  if (devicePlatform) {
    [v4 setObject:devicePlatform forKey:@"device_platform"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v4 setObject:osVersion forKey:@"os_version"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v4 setObject:appVersion forKey:@"app_version"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithLongLong:self->_appBuild];
    [v4 setObject:v9 forKey:@"app_build"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v4 setObject:countryCode forKey:@"country_code"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v4 setObject:languageCode forKey:@"language_code"];
  }
  carrier = self->_carrier;
  if (carrier) {
    [v4 setObject:carrier forKey:@"carrier"];
  }
  mobileCountryCode = self->_mobileCountryCode;
  if (mobileCountryCode) {
    [v4 setObject:mobileCountryCode forKey:@"mobile_country_code"];
  }
  mobileNetworkCode = self->_mobileNetworkCode;
  if (mobileNetworkCode) {
    [v4 setObject:mobileNetworkCode forKey:@"mobile_network_code"];
  }
  osCountryCode = self->_osCountryCode;
  if (osCountryCode) {
    [v4 setObject:osCountryCode forKey:@"os_country_code"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t osInstallVariant = self->_osInstallVariant;
    if (osInstallVariant >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_osInstallVariant);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_26444ED80[osInstallVariant];
    }
    [v4 setObject:v18 forKey:@"os_install_variant"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v19 = [NSNumber numberWithInt:self->_contentEnvironment];
    [v4 setObject:v19 forKey:@"content_environment"];
  }
  userId = self->_userId;
  if (userId) {
    [v4 setObject:userId forKey:@"user_id"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v4 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  if ([(NSMutableArray *)self->_networkEventGroups count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_networkEventGroups, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v23 = self->_networkEventGroups;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v25);
    }

    [v4 setObject:v22 forKey:@"network_event_groups"];
  }
  appBuildNumber = self->_appBuildNumber;
  if (appBuildNumber) {
    [v4 setObject:appBuildNumber forKey:@"app_build_number"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTelemetryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_devicePlatform) {
    PBDataWriterWriteStringField();
  }
  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrier) {
    PBDataWriterWriteStringField();
  }
  if (self->_mobileCountryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_mobileNetworkCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_osCountryCode) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userStorefrontId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_networkEventGroups;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_appBuildNumber) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceModel copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  uint64_t v8 = [(NSString *)self->_devicePlatform copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_osVersion copyWithZone:a3];
  long long v11 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v10;

  uint64_t v12 = [(NSString *)self->_appVersion copyWithZone:a3];
  long long v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_appBuild;
    *(unsigned char *)(v5 + 144) |= 1u;
  }
  uint64_t v14 = [(NSString *)self->_countryCode copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_languageCode copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  uint64_t v18 = [(NSString *)self->_carrier copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  uint64_t v20 = [(NSString *)self->_mobileCountryCode copyWithZone:a3];
  v21 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v20;

  uint64_t v22 = [(NSString *)self->_mobileNetworkCode copyWithZone:a3];
  v23 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v22;

  uint64_t v24 = [(NSString *)self->_osCountryCode copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v24;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_osInstallVariant;
    *(unsigned char *)(v5 + 144) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_contentEnvironment;
    *(unsigned char *)(v5 + 144) |= 2u;
  }
  uint64_t v27 = [(NSString *)self->_userId copyWithZone:a3];
  v28 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v27;

  uint64_t v29 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  v30 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v29;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v31 = self->_networkEventGroups;
  uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (void)v40);
        [(id)v5 addNetworkEventGroups:v36];
      }
      uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v33);
  }

  uint64_t v37 = [(NSString *)self->_appBuildNumber copyWithZone:a3];
  v38 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v37;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_45;
    }
  }
  devicePlatform = self->_devicePlatform;
  if ((unint64_t)devicePlatform | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](devicePlatform, "isEqual:")) {
      goto LABEL_45;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_45;
    }
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 144) & 1) == 0 || self->_appBuild != *((void *)v4 + 1)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
LABEL_45:
    char v19 = 0;
    goto LABEL_46;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 6)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_45;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_45;
    }
  }
  carrier = self->_carrier;
  if ((unint64_t)carrier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](carrier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  mobileCountryCode = self->_mobileCountryCode;
  if ((unint64_t)mobileCountryCode | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](mobileCountryCode, "isEqual:")) {
      goto LABEL_45;
    }
  }
  mobileNetworkCode = self->_mobileNetworkCode;
  if ((unint64_t)mobileNetworkCode | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](mobileNetworkCode, "isEqual:")) {
      goto LABEL_45;
    }
  }
  osCountryCode = self->_osCountryCode;
  if ((unint64_t)osCountryCode | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](osCountryCode, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 4) == 0 || self->_osInstallVariant != *((_DWORD *)v4 + 28)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 2) == 0 || self->_contentEnvironment != *((_DWORD *)v4 + 10)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 2) != 0)
  {
    goto LABEL_45;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 16) && !-[NSString isEqual:](userId, "isEqual:")) {
    goto LABEL_45;
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:")) {
      goto LABEL_45;
    }
  }
  networkEventGroups = self->_networkEventGroups;
  if ((unint64_t)networkEventGroups | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](networkEventGroups, "isEqual:")) {
      goto LABEL_45;
    }
  }
  appBuildNumber = self->_appBuildNumber;
  if ((unint64_t)appBuildNumber | *((void *)v4 + 2)) {
    char v19 = -[NSString isEqual:](appBuildNumber, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_46:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v20 = [(NSString *)self->_deviceModel hash];
  NSUInteger v19 = [(NSString *)self->_devicePlatform hash];
  NSUInteger v18 = [(NSString *)self->_osVersion hash];
  NSUInteger v3 = [(NSString *)self->_appVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_appBuild;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_countryCode hash];
  NSUInteger v6 = [(NSString *)self->_languageCode hash];
  NSUInteger v7 = [(NSString *)self->_carrier hash];
  NSUInteger v8 = [(NSString *)self->_mobileCountryCode hash];
  NSUInteger v9 = [(NSString *)self->_mobileNetworkCode hash];
  NSUInteger v10 = [(NSString *)self->_osCountryCode hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_osInstallVariant;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = 2654435761 * self->_contentEnvironment;
LABEL_9:
  NSUInteger v13 = v19 ^ v20 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v14 = v11 ^ v12 ^ [(NSString *)self->_userId hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_userStorefrontId hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_networkEventGroups hash];
  return v13 ^ v16 ^ [(NSString *)self->_appBuildNumber hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[NTPBTelemetry setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v4 + 8)) {
    -[NTPBTelemetry setDevicePlatform:](self, "setDevicePlatform:");
  }
  if (*((void *)v4 + 15)) {
    -[NTPBTelemetry setOsVersion:](self, "setOsVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBTelemetry setAppVersion:](self, "setAppVersion:");
  }
  if (*((unsigned char *)v4 + 144))
  {
    self->_appBuild = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 6)) {
    -[NTPBTelemetry setCountryCode:](self, "setCountryCode:");
  }
  if (*((void *)v4 + 9)) {
    -[NTPBTelemetry setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v4 + 4)) {
    -[NTPBTelemetry setCarrier:](self, "setCarrier:");
  }
  if (*((void *)v4 + 10)) {
    -[NTPBTelemetry setMobileCountryCode:](self, "setMobileCountryCode:");
  }
  if (*((void *)v4 + 11)) {
    -[NTPBTelemetry setMobileNetworkCode:](self, "setMobileNetworkCode:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBTelemetry setOsCountryCode:](self, "setOsCountryCode:");
  }
  char v5 = *((unsigned char *)v4 + 144);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t osInstallVariant = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 144);
  }
  if ((v5 & 2) != 0)
  {
    self->_contentEnvironment = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 16)) {
    -[NTPBTelemetry setUserId:](self, "setUserId:");
  }
  if (*((void *)v4 + 17)) {
    -[NTPBTelemetry setUserStorefrontId:](self, "setUserStorefrontId:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 12);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBTelemetry addNetworkEventGroups:](self, "addNetworkEventGroups:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (*((void *)v4 + 2)) {
    -[NTPBTelemetry setAppBuildNumber:](self, "setAppBuildNumber:");
  }
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (void)setDevicePlatform:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (int64_t)appBuild
{
  return self->_appBuild;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
}

- (NSString)mobileCountryCode
{
  return self->_mobileCountryCode;
}

- (void)setMobileCountryCode:(id)a3
{
}

- (NSString)mobileNetworkCode
{
  return self->_mobileNetworkCode;
}

- (void)setMobileNetworkCode:(id)a3
{
}

- (NSString)osCountryCode
{
  return self->_osCountryCode;
}

- (void)setOsCountryCode:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (NSMutableArray)networkEventGroups
{
  return self->_networkEventGroups;
}

- (void)setNetworkEventGroups:(id)a3
{
}

- (NSString)appBuildNumber
{
  return self->_appBuildNumber;
}

- (void)setAppBuildNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_osCountryCode, 0);
  objc_storeStrong((id *)&self->_networkEventGroups, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);

  objc_storeStrong((id *)&self->_appBuildNumber, 0);
}

@end