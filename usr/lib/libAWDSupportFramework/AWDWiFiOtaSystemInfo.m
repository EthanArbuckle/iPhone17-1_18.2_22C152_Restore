@interface AWDWiFiOtaSystemInfo
- (BOOL)hasBeaconInfo;
- (BOOL)hasBssid;
- (BOOL)hasChannel;
- (BOOL)hasChannelWidth;
- (BOOL)hasLocale;
- (BOOL)hasLocaleSource;
- (BOOL)hasSsid;
- (BOOL)hasTimestamp;
- (BOOL)hasWpsConfigMethods;
- (BOOL)hasWpsDeviceNameData;
- (BOOL)hasWpsDeviceNameElement;
- (BOOL)hasWpsManufacturerElement;
- (BOOL)hasWpsModelName;
- (BOOL)hasWpsModelNumber;
- (BOOL)hasWpsPrimaryDeviceTypeCategory;
- (BOOL)hasWpsPrimaryDeviceTypeSubCategory;
- (BOOL)hasWpsResponseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)beaconInfo;
- (NSString)bssid;
- (NSString)locale;
- (NSString)localeSource;
- (NSString)ssid;
- (NSString)wpsConfigMethods;
- (NSString)wpsDeviceNameData;
- (NSString)wpsDeviceNameElement;
- (NSString)wpsManufacturerElement;
- (NSString)wpsModelName;
- (NSString)wpsModelNumber;
- (NSString)wpsPrimaryDeviceTypeCategory;
- (NSString)wpsPrimaryDeviceTypeSubCategory;
- (NSString)wpsResponseType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)channel;
- (unsigned)channelWidth;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBeaconInfo:(id)a3;
- (void)setBssid:(id)a3;
- (void)setChannel:(unsigned int)a3;
- (void)setChannelWidth:(unsigned int)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasChannelWidth:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setLocaleSource:(id)a3;
- (void)setSsid:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWpsConfigMethods:(id)a3;
- (void)setWpsDeviceNameData:(id)a3;
- (void)setWpsDeviceNameElement:(id)a3;
- (void)setWpsManufacturerElement:(id)a3;
- (void)setWpsModelName:(id)a3;
- (void)setWpsModelNumber:(id)a3;
- (void)setWpsPrimaryDeviceTypeCategory:(id)a3;
- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3;
- (void)setWpsResponseType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiOtaSystemInfo

- (void)dealloc
{
  [(AWDWiFiOtaSystemInfo *)self setBeaconInfo:0];
  [(AWDWiFiOtaSystemInfo *)self setSsid:0];
  [(AWDWiFiOtaSystemInfo *)self setBssid:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsResponseType:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsManufacturerElement:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsModelName:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsModelNumber:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsPrimaryDeviceTypeCategory:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsPrimaryDeviceTypeSubCategory:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsDeviceNameElement:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsDeviceNameData:0];
  [(AWDWiFiOtaSystemInfo *)self setWpsConfigMethods:0];
  [(AWDWiFiOtaSystemInfo *)self setLocale:0];
  [(AWDWiFiOtaSystemInfo *)self setLocaleSource:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiOtaSystemInfo;
  [(AWDWiFiOtaSystemInfo *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBeaconInfo
{
  return self->_beaconInfo != 0;
}

- (BOOL)hasSsid
{
  return self->_ssid != 0;
}

- (BOOL)hasBssid
{
  return self->_bssid != 0;
}

- (BOOL)hasWpsResponseType
{
  return self->_wpsResponseType != 0;
}

- (BOOL)hasWpsManufacturerElement
{
  return self->_wpsManufacturerElement != 0;
}

- (BOOL)hasWpsModelName
{
  return self->_wpsModelName != 0;
}

- (BOOL)hasWpsModelNumber
{
  return self->_wpsModelNumber != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory != 0;
}

- (BOOL)hasWpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory != 0;
}

- (BOOL)hasWpsDeviceNameElement
{
  return self->_wpsDeviceNameElement != 0;
}

- (BOOL)hasWpsDeviceNameData
{
  return self->_wpsDeviceNameData != 0;
}

- (BOOL)hasWpsConfigMethods
{
  return self->_wpsConfigMethods != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasLocaleSource
{
  return self->_localeSource != 0;
}

- (void)setChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChannelWidth:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_channelWidth = a3;
}

- (void)setHasChannelWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChannelWidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiOtaSystemInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiOtaSystemInfo description](&v3, sel_description), -[AWDWiFiOtaSystemInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  beaconInfo = self->_beaconInfo;
  if (beaconInfo) {
    [v3 setObject:beaconInfo forKey:@"beaconInfo"];
  }
  ssid = self->_ssid;
  if (ssid) {
    [v3 setObject:ssid forKey:@"ssid"];
  }
  bssid = self->_bssid;
  if (bssid) {
    [v3 setObject:bssid forKey:@"bssid"];
  }
  wpsResponseType = self->_wpsResponseType;
  if (wpsResponseType) {
    [v3 setObject:wpsResponseType forKey:@"wpsResponseType"];
  }
  wpsManufacturerElement = self->_wpsManufacturerElement;
  if (wpsManufacturerElement) {
    [v3 setObject:wpsManufacturerElement forKey:@"wpsManufacturerElement"];
  }
  wpsModelName = self->_wpsModelName;
  if (wpsModelName) {
    [v3 setObject:wpsModelName forKey:@"wpsModelName"];
  }
  wpsModelNumber = self->_wpsModelNumber;
  if (wpsModelNumber) {
    [v3 setObject:wpsModelNumber forKey:@"wpsModelNumber"];
  }
  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
  if (wpsPrimaryDeviceTypeCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeCategory forKey:@"wpsPrimaryDeviceTypeCategory"];
  }
  wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
  if (wpsPrimaryDeviceTypeSubCategory) {
    [v3 setObject:wpsPrimaryDeviceTypeSubCategory forKey:@"wpsPrimaryDeviceTypeSubCategory"];
  }
  wpsDeviceNameElement = self->_wpsDeviceNameElement;
  if (wpsDeviceNameElement) {
    [v3 setObject:wpsDeviceNameElement forKey:@"wpsDeviceNameElement"];
  }
  wpsDeviceNameData = self->_wpsDeviceNameData;
  if (wpsDeviceNameData) {
    [v3 setObject:wpsDeviceNameData forKey:@"wpsDeviceNameData"];
  }
  wpsConfigMethods = self->_wpsConfigMethods;
  if (wpsConfigMethods) {
    [v3 setObject:wpsConfigMethods forKey:@"wpsConfigMethods"];
  }
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  localeSource = self->_localeSource;
  if (localeSource) {
    [v3 setObject:localeSource forKey:@"localeSource"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channel] forKey:@"channel"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_channelWidth] forKey:@"channelWidth"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiOtaSystemInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_beaconInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_ssid) {
    PBDataWriterWriteStringField();
  }
  if (self->_bssid) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsResponseType) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsManufacturerElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelName) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsModelNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameElement) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsDeviceNameData) {
    PBDataWriterWriteStringField();
  }
  if (self->_wpsConfigMethods) {
    PBDataWriterWriteStringField();
  }
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  if (self->_localeSource) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 136) |= 1u;
  }
  if (self->_beaconInfo) {
    [a3 setBeaconInfo:];
  }
  if (self->_ssid) {
    [a3 setSsid:];
  }
  if (self->_bssid) {
    [a3 setBssid:];
  }
  if (self->_wpsResponseType) {
    [a3 setWpsResponseType:];
  }
  if (self->_wpsManufacturerElement) {
    [a3 setWpsManufacturerElement:];
  }
  if (self->_wpsModelName) {
    [a3 setWpsModelName:];
  }
  if (self->_wpsModelNumber) {
    [a3 setWpsModelNumber:];
  }
  if (self->_wpsPrimaryDeviceTypeCategory) {
    [a3 setWpsPrimaryDeviceTypeCategory:];
  }
  if (self->_wpsPrimaryDeviceTypeSubCategory) {
    [a3 setWpsPrimaryDeviceTypeSubCategory:];
  }
  if (self->_wpsDeviceNameElement) {
    [a3 setWpsDeviceNameElement:];
  }
  if (self->_wpsDeviceNameData) {
    [a3 setWpsDeviceNameData:];
  }
  if (self->_wpsConfigMethods) {
    [a3 setWpsConfigMethods:];
  }
  if (self->_locale) {
    [a3 setLocale:];
  }
  if (self->_localeSource) {
    [a3 setLocaleSource:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_channel;
    *((unsigned char *)a3 + 136) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_channelWidth;
    *((unsigned char *)a3 + 136) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 136) |= 1u;
  }

  *(void *)(v6 + 16) = [(NSData *)self->_beaconInfo copyWithZone:a3];
  *(void *)(v6 + 56) = [(NSString *)self->_ssid copyWithZone:a3];

  *(void *)(v6 + 24) = [(NSString *)self->_bssid copyWithZone:a3];
  *(void *)(v6 + 128) = [(NSString *)self->_wpsResponseType copyWithZone:a3];

  *(void *)(v6 + 88) = [(NSString *)self->_wpsManufacturerElement copyWithZone:a3];
  *(void *)(v6 + 96) = [(NSString *)self->_wpsModelName copyWithZone:a3];

  *(void *)(v6 + 104) = [(NSString *)self->_wpsModelNumber copyWithZone:a3];
  *(void *)(v6 + 112) = [(NSString *)self->_wpsPrimaryDeviceTypeCategory copyWithZone:a3];

  *(void *)(v6 + 120) = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory copyWithZone:a3];
  *(void *)(v6 + 80) = [(NSString *)self->_wpsDeviceNameElement copyWithZone:a3];

  *(void *)(v6 + 72) = [(NSString *)self->_wpsDeviceNameData copyWithZone:a3];
  *(void *)(v6 + 64) = [(NSString *)self->_wpsConfigMethods copyWithZone:a3];

  *(void *)(v6 + 40) = [(NSString *)self->_locale copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_localeSource copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_channel;
    *(unsigned char *)(v6 + 136) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_channelWidth;
    *(unsigned char *)(v6 + 136) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 136) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)a3 + 136))
    {
LABEL_44:
      LOBYTE(v5) = 0;
      return v5;
    }
    beaconInfo = self->_beaconInfo;
    if (!((unint64_t)beaconInfo | *((void *)a3 + 2)) || (int v5 = -[NSData isEqual:](beaconInfo, "isEqual:")) != 0)
    {
      ssid = self->_ssid;
      if (!((unint64_t)ssid | *((void *)a3 + 7)) || (int v5 = -[NSString isEqual:](ssid, "isEqual:")) != 0)
      {
        bssid = self->_bssid;
        if (!((unint64_t)bssid | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](bssid, "isEqual:")) != 0)
        {
          wpsResponseType = self->_wpsResponseType;
          if (!((unint64_t)wpsResponseType | *((void *)a3 + 16))
            || (int v5 = -[NSString isEqual:](wpsResponseType, "isEqual:")) != 0)
          {
            wpsManufacturerElement = self->_wpsManufacturerElement;
            if (!((unint64_t)wpsManufacturerElement | *((void *)a3 + 11))
              || (int v5 = -[NSString isEqual:](wpsManufacturerElement, "isEqual:")) != 0)
            {
              wpsModelName = self->_wpsModelName;
              if (!((unint64_t)wpsModelName | *((void *)a3 + 12))
                || (int v5 = -[NSString isEqual:](wpsModelName, "isEqual:")) != 0)
              {
                wpsModelNumber = self->_wpsModelNumber;
                if (!((unint64_t)wpsModelNumber | *((void *)a3 + 13))
                  || (int v5 = -[NSString isEqual:](wpsModelNumber, "isEqual:")) != 0)
                {
                  wpsPrimaryDeviceTypeCategory = self->_wpsPrimaryDeviceTypeCategory;
                  if (!((unint64_t)wpsPrimaryDeviceTypeCategory | *((void *)a3 + 14))
                    || (int v5 = -[NSString isEqual:](wpsPrimaryDeviceTypeCategory, "isEqual:")) != 0)
                  {
                    wpsPrimaryDeviceTypeSubCategory = self->_wpsPrimaryDeviceTypeSubCategory;
                    if (!((unint64_t)wpsPrimaryDeviceTypeSubCategory | *((void *)a3 + 15))
                      || (int v5 = -[NSString isEqual:](wpsPrimaryDeviceTypeSubCategory, "isEqual:")) != 0)
                    {
                      wpsDeviceNameElement = self->_wpsDeviceNameElement;
                      if (!((unint64_t)wpsDeviceNameElement | *((void *)a3 + 10))
                        || (int v5 = -[NSString isEqual:](wpsDeviceNameElement, "isEqual:")) != 0)
                      {
                        wpsDeviceNameData = self->_wpsDeviceNameData;
                        if (!((unint64_t)wpsDeviceNameData | *((void *)a3 + 9))
                          || (int v5 = -[NSString isEqual:](wpsDeviceNameData, "isEqual:")) != 0)
                        {
                          wpsConfigMethods = self->_wpsConfigMethods;
                          if (!((unint64_t)wpsConfigMethods | *((void *)a3 + 8))
                            || (int v5 = -[NSString isEqual:](wpsConfigMethods, "isEqual:")) != 0)
                          {
                            locale = self->_locale;
                            if (!((unint64_t)locale | *((void *)a3 + 5))
                              || (int v5 = -[NSString isEqual:](locale, "isEqual:")) != 0)
                            {
                              localeSource = self->_localeSource;
                              if (!((unint64_t)localeSource | *((void *)a3 + 6))
                                || (int v5 = -[NSString isEqual:](localeSource, "isEqual:")) != 0)
                              {
                                if ((*(unsigned char *)&self->_has & 2) != 0)
                                {
                                  if ((*((unsigned char *)a3 + 136) & 2) == 0 || self->_channel != *((_DWORD *)a3 + 8)) {
                                    goto LABEL_44;
                                  }
                                }
                                else if ((*((unsigned char *)a3 + 136) & 2) != 0)
                                {
                                  goto LABEL_44;
                                }
                                LOBYTE(v5) = (*((unsigned char *)a3 + 136) & 4) == 0;
                                if ((*(unsigned char *)&self->_has & 4) != 0)
                                {
                                  if ((*((unsigned char *)a3 + 136) & 4) == 0 || self->_channelWidth != *((_DWORD *)a3 + 9)) {
                                    goto LABEL_44;
                                  }
                                  LOBYTE(v5) = 1;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v20 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v20 = 0;
  }
  uint64_t v19 = [(NSData *)self->_beaconInfo hash];
  NSUInteger v18 = [(NSString *)self->_ssid hash];
  NSUInteger v17 = [(NSString *)self->_bssid hash];
  NSUInteger v16 = [(NSString *)self->_wpsResponseType hash];
  NSUInteger v15 = [(NSString *)self->_wpsManufacturerElement hash];
  NSUInteger v3 = [(NSString *)self->_wpsModelName hash];
  NSUInteger v4 = [(NSString *)self->_wpsModelNumber hash];
  NSUInteger v5 = [(NSString *)self->_wpsPrimaryDeviceTypeCategory hash];
  NSUInteger v6 = [(NSString *)self->_wpsPrimaryDeviceTypeSubCategory hash];
  NSUInteger v7 = [(NSString *)self->_wpsDeviceNameElement hash];
  NSUInteger v8 = [(NSString *)self->_wpsDeviceNameData hash];
  NSUInteger v9 = [(NSString *)self->_wpsConfigMethods hash];
  NSUInteger v10 = [(NSString *)self->_locale hash];
  NSUInteger v11 = [(NSString *)self->_localeSource hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v12 = 2654435761 * self->_channel;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v13 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v13 = 2654435761 * self->_channelWidth;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 136))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[AWDWiFiOtaSystemInfo setBeaconInfo:](self, "setBeaconInfo:");
  }
  if (*((void *)a3 + 7)) {
    -[AWDWiFiOtaSystemInfo setSsid:](self, "setSsid:");
  }
  if (*((void *)a3 + 3)) {
    -[AWDWiFiOtaSystemInfo setBssid:](self, "setBssid:");
  }
  if (*((void *)a3 + 16)) {
    -[AWDWiFiOtaSystemInfo setWpsResponseType:](self, "setWpsResponseType:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDWiFiOtaSystemInfo setWpsManufacturerElement:](self, "setWpsManufacturerElement:");
  }
  if (*((void *)a3 + 12)) {
    -[AWDWiFiOtaSystemInfo setWpsModelName:](self, "setWpsModelName:");
  }
  if (*((void *)a3 + 13)) {
    -[AWDWiFiOtaSystemInfo setWpsModelNumber:](self, "setWpsModelNumber:");
  }
  if (*((void *)a3 + 14)) {
    -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeCategory:](self, "setWpsPrimaryDeviceTypeCategory:");
  }
  if (*((void *)a3 + 15)) {
    -[AWDWiFiOtaSystemInfo setWpsPrimaryDeviceTypeSubCategory:](self, "setWpsPrimaryDeviceTypeSubCategory:");
  }
  if (*((void *)a3 + 10)) {
    -[AWDWiFiOtaSystemInfo setWpsDeviceNameElement:](self, "setWpsDeviceNameElement:");
  }
  if (*((void *)a3 + 9)) {
    -[AWDWiFiOtaSystemInfo setWpsDeviceNameData:](self, "setWpsDeviceNameData:");
  }
  if (*((void *)a3 + 8)) {
    -[AWDWiFiOtaSystemInfo setWpsConfigMethods:](self, "setWpsConfigMethods:");
  }
  if (*((void *)a3 + 5)) {
    -[AWDWiFiOtaSystemInfo setLocale:](self, "setLocale:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDWiFiOtaSystemInfo setLocaleSource:](self, "setLocaleSource:");
  }
  char v5 = *((unsigned char *)a3 + 136);
  if ((v5 & 2) != 0)
  {
    self->_channel = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 136);
  }
  if ((v5 & 4) != 0)
  {
    self->_channelWidth = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSData)beaconInfo
{
  return self->_beaconInfo;
}

- (void)setBeaconInfo:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)wpsResponseType
{
  return self->_wpsResponseType;
}

- (void)setWpsResponseType:(id)a3
{
}

- (NSString)wpsManufacturerElement
{
  return self->_wpsManufacturerElement;
}

- (void)setWpsManufacturerElement:(id)a3
{
}

- (NSString)wpsModelName
{
  return self->_wpsModelName;
}

- (void)setWpsModelName:(id)a3
{
}

- (NSString)wpsModelNumber
{
  return self->_wpsModelNumber;
}

- (void)setWpsModelNumber:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeCategory
{
  return self->_wpsPrimaryDeviceTypeCategory;
}

- (void)setWpsPrimaryDeviceTypeCategory:(id)a3
{
}

- (NSString)wpsPrimaryDeviceTypeSubCategory
{
  return self->_wpsPrimaryDeviceTypeSubCategory;
}

- (void)setWpsPrimaryDeviceTypeSubCategory:(id)a3
{
}

- (NSString)wpsDeviceNameElement
{
  return self->_wpsDeviceNameElement;
}

- (void)setWpsDeviceNameElement:(id)a3
{
}

- (NSString)wpsDeviceNameData
{
  return self->_wpsDeviceNameData;
}

- (void)setWpsDeviceNameData:(id)a3
{
}

- (NSString)wpsConfigMethods
{
  return self->_wpsConfigMethods;
}

- (void)setWpsConfigMethods:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (unsigned)channelWidth
{
  return self->_channelWidth;
}

@end