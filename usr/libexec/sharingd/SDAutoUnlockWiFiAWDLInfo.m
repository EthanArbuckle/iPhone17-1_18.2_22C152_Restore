@interface SDAutoUnlockWiFiAWDLInfo
- (BOOL)hasChannelFlags;
- (BOOL)hasDiscoveryMetric;
- (BOOL)hasExtraInfoData;
- (BOOL)hasMacAddress;
- (BOOL)hasMasterChannel;
- (BOOL)hasPreferredChannel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)extraInfoData;
- (NSData)macAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)channelFlags;
- (unsigned)discoveryMetric;
- (unsigned)masterChannel;
- (unsigned)preferredChannel;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelFlags:(unsigned int)a3;
- (void)setDiscoveryMetric:(unsigned int)a3;
- (void)setExtraInfoData:(id)a3;
- (void)setHasChannelFlags:(BOOL)a3;
- (void)setHasDiscoveryMetric:(BOOL)a3;
- (void)setHasMasterChannel:(BOOL)a3;
- (void)setHasPreferredChannel:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setMasterChannel:(unsigned int)a3;
- (void)setPreferredChannel:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SDAutoUnlockWiFiAWDLInfo

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (void)setDiscoveryMetric:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_discoveryMetric = a3;
}

- (void)setHasDiscoveryMetric:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDiscoveryMetric
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMasterChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_masterChannel = a3;
}

- (void)setHasMasterChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMasterChannel
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreferredChannel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_preferredChannel = a3;
}

- (void)setHasPreferredChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setChannelFlags:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelFlags = a3;
}

- (void)setHasChannelFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExtraInfoData
{
  return self->_extraInfoData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDAutoUnlockWiFiAWDLInfo;
  char v3 = [(SDAutoUnlockWiFiAWDLInfo *)&v7 description];
  v4 = [(SDAutoUnlockWiFiAWDLInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  macAddress = self->_macAddress;
  if (macAddress) {
    [v3 setObject:macAddress forKey:@"macAddress"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = +[NSNumber numberWithUnsignedInt:self->_discoveryMetric];
    [v4 setObject:v10 forKey:@"discoveryMetric"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_masterChannel];
  [v4 setObject:v11 forKey:@"masterChannel"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v12 = +[NSNumber numberWithUnsignedInt:self->_preferredChannel];
  [v4 setObject:v12 forKey:@"preferredChannel"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    objc_super v7 = +[NSNumber numberWithUnsignedInt:self->_channelFlags];
    [v4 setObject:v7 forKey:@"channelFlags"];
  }
LABEL_8:
  extraInfoData = self->_extraInfoData;
  if (extraInfoData) {
    [v4 setObject:extraInfoData forKey:@"extraInfoData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SDAutoUnlockWiFiAWDLInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macAddress)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_8:
  if (self->_extraInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macAddress)
  {
    [v4 setMacAddress:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_discoveryMetric;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 8) = self->_masterChannel;
  *((unsigned char *)v4 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 9) = self->_preferredChannel;
  *((unsigned char *)v4 + 40) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    *((_DWORD *)v4 + 2) = self->_channelFlags;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_8:
  if (self->_extraInfoData)
  {
    [v6 setExtraInfoData:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSData *)self->_macAddress copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_discoveryMetric;
    *((unsigned char *)v5 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *((_DWORD *)v5 + 9) = self->_preferredChannel;
      *((unsigned char *)v5 + 40) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_masterChannel;
  *((unsigned char *)v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    *((_DWORD *)v5 + 2) = self->_channelFlags;
    *((unsigned char *)v5 + 40) |= 1u;
  }
LABEL_6:
  id v9 = [(NSData *)self->_extraInfoData copyWithZone:a3];
  v10 = (void *)v5[2];
  v5[2] = v9;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](macAddress, "isEqual:")) {
      goto LABEL_26;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_discoveryMetric != *((_DWORD *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_26:
    unsigned __int8 v7 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_masterChannel != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_preferredChannel != *((_DWORD *)v4 + 9)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_channelFlags != *((_DWORD *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_26;
  }
  extraInfoData = self->_extraInfoData;
  if ((unint64_t)extraInfoData | *((void *)v4 + 2)) {
    unsigned __int8 v7 = -[NSData isEqual:](extraInfoData, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_macAddress hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_discoveryMetric;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_masterChannel;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)[(NSData *)self->_extraInfoData hash];
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_preferredChannel;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_channelFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ (unint64_t)[(NSData *)self->_extraInfoData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (unsigned int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[SDAutoUnlockWiFiAWDLInfo setMacAddress:](self, "setMacAddress:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_discoveryMetric = v4[3];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((v4[10] & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_masterChannel = v4[8];
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_preferredChannel = v4[9];
  *(unsigned char *)&self->_has |= 8u;
  if (v4[10])
  {
LABEL_7:
    self->_channelFlags = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
  if (*((void *)v4 + 2))
  {
    -[SDAutoUnlockWiFiAWDLInfo setExtraInfoData:](self, "setExtraInfoData:");
    uint64_t v4 = v6;
  }
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
}

- (unsigned)discoveryMetric
{
  return self->_discoveryMetric;
}

- (unsigned)masterChannel
{
  return self->_masterChannel;
}

- (unsigned)preferredChannel
{
  return self->_preferredChannel;
}

- (unsigned)channelFlags
{
  return self->_channelFlags;
}

- (NSData)extraInfoData
{
  return self->_extraInfoData;
}

- (void)setExtraInfoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macAddress, 0);

  objc_storeStrong((id *)&self->_extraInfoData, 0);
}

@end