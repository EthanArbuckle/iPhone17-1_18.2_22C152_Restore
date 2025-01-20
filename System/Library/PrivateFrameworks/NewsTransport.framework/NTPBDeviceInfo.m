@interface NTPBDeviceInfo
+ (Class)devicePreferredLanguageType;
- (BOOL)hasDeviceAppBundleId;
- (BOOL)hasDeviceAppVersion;
- (BOOL)hasDeviceDigestMode;
- (BOOL)hasDeviceDstOffset;
- (BOOL)hasDeviceOsVersion;
- (BOOL)hasDevicePushToken;
- (BOOL)hasDeviceTimezone;
- (BOOL)hasDeviceTokenEnv;
- (BOOL)hasDeviceType;
- (BOOL)hasDeviceUtcOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)devicePreferredLanguages;
- (NSString)deviceAppBundleId;
- (NSString)deviceAppVersion;
- (NSString)deviceOsVersion;
- (NSString)devicePushToken;
- (NSString)deviceTimezone;
- (NSString)deviceType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)devicePreferredLanguageAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)deviceDigestMode;
- (int)deviceTokenEnv;
- (int64_t)deviceDstOffset;
- (int64_t)deviceUtcOffset;
- (unint64_t)devicePreferredLanguagesCount;
- (unint64_t)hash;
- (void)addDevicePreferredLanguage:(id)a3;
- (void)clearDevicePreferredLanguages;
- (void)mergeFrom:(id)a3;
- (void)setDeviceAppBundleId:(id)a3;
- (void)setDeviceAppVersion:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceDstOffset:(int64_t)a3;
- (void)setDeviceOsVersion:(id)a3;
- (void)setDevicePreferredLanguages:(id)a3;
- (void)setDevicePushToken:(id)a3;
- (void)setDeviceTimezone:(id)a3;
- (void)setDeviceTokenEnv:(int)a3;
- (void)setDeviceType:(id)a3;
- (void)setDeviceUtcOffset:(int64_t)a3;
- (void)setHasDeviceDigestMode:(BOOL)a3;
- (void)setHasDeviceDstOffset:(BOOL)a3;
- (void)setHasDeviceTokenEnv:(BOOL)a3;
- (void)setHasDeviceUtcOffset:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBDeviceInfo

- (BOOL)hasDevicePushToken
{
  return self->_devicePushToken != 0;
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (BOOL)hasDeviceTimezone
{
  return self->_deviceTimezone != 0;
}

- (int)deviceTokenEnv
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_deviceTokenEnv;
  }
  else {
    return 0;
  }
}

- (void)setDeviceTokenEnv:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deviceTokenEnv = a3;
}

- (void)setHasDeviceTokenEnv:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeviceTokenEnv
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearDevicePreferredLanguages
{
}

- (void)addDevicePreferredLanguage:(id)a3
{
  id v4 = a3;
  devicePreferredLanguages = self->_devicePreferredLanguages;
  id v8 = v4;
  if (!devicePreferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_devicePreferredLanguages;
    self->_devicePreferredLanguages = v6;

    id v4 = v8;
    devicePreferredLanguages = self->_devicePreferredLanguages;
  }
  [(NSMutableArray *)devicePreferredLanguages addObject:v4];
}

- (unint64_t)devicePreferredLanguagesCount
{
  return [(NSMutableArray *)self->_devicePreferredLanguages count];
}

- (id)devicePreferredLanguageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_devicePreferredLanguages objectAtIndex:a3];
}

+ (Class)devicePreferredLanguageType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceOsVersion
{
  return self->_deviceOsVersion != 0;
}

- (void)setDeviceUtcOffset:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deviceUtcOffset = a3;
}

- (void)setHasDeviceUtcOffset:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeviceUtcOffset
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeviceDstOffset:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deviceDstOffset = a3;
}

- (void)setHasDeviceDstOffset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceDstOffset
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDeviceAppVersion
{
  return self->_deviceAppVersion != 0;
}

- (BOOL)hasDeviceAppBundleId
{
  return self->_deviceAppBundleId != 0;
}

- (int)deviceDigestMode
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_deviceDigestMode;
  }
  else {
    return 0;
  }
}

- (void)setDeviceDigestMode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deviceDigestMode = a3;
}

- (void)setHasDeviceDigestMode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeviceDigestMode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBDeviceInfo;
  id v4 = [(NTPBDeviceInfo *)&v8 description];
  v5 = [(NTPBDeviceInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  devicePushToken = self->_devicePushToken;
  if (devicePushToken) {
    [v3 setObject:devicePushToken forKey:@"device_push_token"];
  }
  deviceType = self->_deviceType;
  if (deviceType) {
    [v4 setObject:deviceType forKey:@"device_type"];
  }
  deviceTimezone = self->_deviceTimezone;
  if (deviceTimezone) {
    [v4 setObject:deviceTimezone forKey:@"device_timezone"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_deviceTokenEnv];
    [v4 setObject:v8 forKey:@"device_token_env"];
  }
  devicePreferredLanguages = self->_devicePreferredLanguages;
  if (devicePreferredLanguages) {
    [v4 setObject:devicePreferredLanguages forKey:@"device_preferred_language"];
  }
  deviceOsVersion = self->_deviceOsVersion;
  if (deviceOsVersion) {
    [v4 setObject:deviceOsVersion forKey:@"device_os_version"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_deviceUtcOffset];
    [v4 setObject:v12 forKey:@"device_utc_offset"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = [NSNumber numberWithLongLong:self->_deviceDstOffset];
    [v4 setObject:v13 forKey:@"device_dst_offset"];
  }
  deviceAppVersion = self->_deviceAppVersion;
  if (deviceAppVersion) {
    [v4 setObject:deviceAppVersion forKey:@"device_app_version"];
  }
  deviceAppBundleId = self->_deviceAppBundleId;
  if (deviceAppBundleId) {
    [v4 setObject:deviceAppBundleId forKey:@"device_app_bundle_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v16 = [NSNumber numberWithInt:self->_deviceDigestMode];
    [v4 setObject:v16 forKey:@"device_digest_mode"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDeviceInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_devicePushToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceTimezone) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_devicePreferredLanguages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_deviceOsVersion) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_deviceAppVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceAppBundleId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_devicePushToken copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_deviceType copyWithZone:a3];
  v9 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v8;

  uint64_t v10 = [(NSString *)self->_deviceTimezone copyWithZone:a3];
  long long v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_deviceTokenEnv;
    *(unsigned char *)(v5 + 96) |= 8u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v12 = self->_devicePreferredLanguages;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "copyWithZone:", a3, (void)v26);
        [(id)v5 addDevicePreferredLanguage:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_deviceOsVersion copyWithZone:a3];
  v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_deviceUtcOffset;
    *(unsigned char *)(v5 + 96) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_deviceDstOffset;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  uint64_t v21 = -[NSString copyWithZone:](self->_deviceAppVersion, "copyWithZone:", a3, (void)v26);
  v22 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v21;

  uint64_t v23 = [(NSString *)self->_deviceAppBundleId copyWithZone:a3];
  v24 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v23;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_deviceDigestMode;
    *(unsigned char *)(v5 + 96) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  devicePushToken = self->_devicePushToken;
  if ((unint64_t)devicePushToken | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](devicePushToken, "isEqual:")) {
      goto LABEL_35;
    }
  }
  deviceType = self->_deviceType;
  if ((unint64_t)deviceType | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceType, "isEqual:")) {
      goto LABEL_35;
    }
  }
  deviceTimezone = self->_deviceTimezone;
  if ((unint64_t)deviceTimezone | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](deviceTimezone, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 8) == 0 || self->_deviceTokenEnv != *((_DWORD *)v4 + 20)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
LABEL_35:
    BOOL v12 = 0;
    goto LABEL_36;
  }
  devicePreferredLanguages = self->_devicePreferredLanguages;
  if ((unint64_t)devicePreferredLanguages | *((void *)v4 + 7)
    && !-[NSMutableArray isEqual:](devicePreferredLanguages, "isEqual:"))
  {
    goto LABEL_35;
  }
  deviceOsVersion = self->_deviceOsVersion;
  if ((unint64_t)deviceOsVersion | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](deviceOsVersion, "isEqual:")) {
      goto LABEL_35;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 2) == 0 || self->_deviceUtcOffset != *((void *)v4 + 2)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 96) & 2) != 0)
  {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 96) & 1) == 0 || self->_deviceDstOffset != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 96))
  {
    goto LABEL_35;
  }
  deviceAppVersion = self->_deviceAppVersion;
  if ((unint64_t)deviceAppVersion | *((void *)v4 + 4)
    && !-[NSString isEqual:](deviceAppVersion, "isEqual:"))
  {
    goto LABEL_35;
  }
  deviceAppBundleId = self->_deviceAppBundleId;
  if ((unint64_t)deviceAppBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceAppBundleId, "isEqual:")) {
      goto LABEL_35;
    }
  }
  BOOL v12 = (*((unsigned char *)v4 + 96) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 96) & 4) == 0 || self->_deviceDigestMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_35;
    }
    BOOL v12 = 1;
  }
LABEL_36:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v14 = [(NSString *)self->_devicePushToken hash];
  NSUInteger v13 = [(NSString *)self->_deviceType hash];
  NSUInteger v3 = [(NSString *)self->_deviceTimezone hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_deviceTokenEnv;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_devicePreferredLanguages hash];
  NSUInteger v6 = [(NSString *)self->_deviceOsVersion hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_deviceUtcOffset;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_deviceDstOffset;
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  NSUInteger v9 = [(NSString *)self->_deviceAppVersion hash];
  NSUInteger v10 = [(NSString *)self->_deviceAppBundleId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_deviceDigestMode;
  }
  else {
    uint64_t v11 = 0;
  }
  return v13 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 8)) {
    -[NTPBDeviceInfo setDevicePushToken:](self, "setDevicePushToken:");
  }
  if (*((void *)v4 + 11)) {
    -[NTPBDeviceInfo setDeviceType:](self, "setDeviceType:");
  }
  if (*((void *)v4 + 9)) {
    -[NTPBDeviceInfo setDeviceTimezone:](self, "setDeviceTimezone:");
  }
  if ((*((unsigned char *)v4 + 96) & 8) != 0)
  {
    self->_deviceTokenEnv = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *((id *)v4 + 7);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NTPBDeviceInfo addDevicePreferredLanguage:](self, "addDevicePreferredLanguage:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 6)) {
    -[NTPBDeviceInfo setDeviceOsVersion:](self, "setDeviceOsVersion:");
  }
  char v10 = *((unsigned char *)v4 + 96);
  if ((v10 & 2) != 0)
  {
    self->_deviceUtcOffset = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)v4 + 96);
  }
  if (v10)
  {
    self->_deviceDstOffset = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4)) {
    -[NTPBDeviceInfo setDeviceAppVersion:](self, "setDeviceAppVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[NTPBDeviceInfo setDeviceAppBundleId:](self, "setDeviceAppBundleId:");
  }
  if ((*((unsigned char *)v4 + 96) & 4) != 0)
  {
    self->_deviceDigestMode = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)devicePushToken
{
  return self->_devicePushToken;
}

- (void)setDevicePushToken:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceTimezone
{
  return self->_deviceTimezone;
}

- (void)setDeviceTimezone:(id)a3
{
}

- (NSMutableArray)devicePreferredLanguages
{
  return self->_devicePreferredLanguages;
}

- (void)setDevicePreferredLanguages:(id)a3
{
}

- (NSString)deviceOsVersion
{
  return self->_deviceOsVersion;
}

- (void)setDeviceOsVersion:(id)a3
{
}

- (int64_t)deviceUtcOffset
{
  return self->_deviceUtcOffset;
}

- (int64_t)deviceDstOffset
{
  return self->_deviceDstOffset;
}

- (NSString)deviceAppVersion
{
  return self->_deviceAppVersion;
}

- (void)setDeviceAppVersion:(id)a3
{
}

- (NSString)deviceAppBundleId
{
  return self->_deviceAppBundleId;
}

- (void)setDeviceAppBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceTimezone, 0);
  objc_storeStrong((id *)&self->_devicePushToken, 0);
  objc_storeStrong((id *)&self->_devicePreferredLanguages, 0);
  objc_storeStrong((id *)&self->_deviceOsVersion, 0);
  objc_storeStrong((id *)&self->_deviceAppVersion, 0);

  objc_storeStrong((id *)&self->_deviceAppBundleId, 0);
}

@end