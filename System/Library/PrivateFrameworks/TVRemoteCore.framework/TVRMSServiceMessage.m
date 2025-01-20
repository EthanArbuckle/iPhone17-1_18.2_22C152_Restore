@interface TVRMSServiceMessage
- (BOOL)hasDisplayName;
- (BOOL)hasHomeSharingGroupKey;
- (BOOL)hasHostName;
- (BOOL)hasNetworkName;
- (BOOL)hasPort;
- (BOOL)hasServiceDiscoverySource;
- (BOOL)hasServiceLegacyFlags;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)displayName;
- (NSString)homeSharingGroupKey;
- (NSString)hostName;
- (NSString)networkName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)port;
- (int)serviceDiscoverySource;
- (int)serviceLegacyFlags;
- (int)serviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasPort:(BOOL)a3;
- (void)setHasServiceDiscoverySource:(BOOL)a3;
- (void)setHasServiceLegacyFlags:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setHomeSharingGroupKey:(id)a3;
- (void)setHostName:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceDiscoverySource:(int)a3;
- (void)setServiceLegacyFlags:(int)a3;
- (void)setServiceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSServiceMessage

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasNetworkName
{
  return self->_networkName != 0;
}

- (BOOL)hasHostName
{
  return self->_hostName != 0;
}

- (void)setPort:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_port = a3;
}

- (void)setHasPort:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPort
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasServiceType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setServiceDiscoverySource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serviceDiscoverySource = a3;
}

- (void)setHasServiceDiscoverySource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServiceDiscoverySource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServiceLegacyFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serviceLegacyFlags = a3;
}

- (void)setHasServiceLegacyFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceLegacyFlags
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasHomeSharingGroupKey
{
  return self->_homeSharingGroupKey != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSServiceMessage;
  v4 = [(TVRMSServiceMessage *)&v8 description];
  v5 = [(TVRMSServiceMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKey:@"displayName"];
  }
  networkName = self->_networkName;
  if (networkName) {
    [v4 setObject:networkName forKey:@"networkName"];
  }
  hostName = self->_hostName;
  if (hostName) {
    [v4 setObject:hostName forKey:@"hostName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v12 = [NSNumber numberWithInt:self->_port];
    [v4 setObject:v12 forKey:@"port"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithInt:self->_serviceType];
  [v4 setObject:v13 forKey:@"serviceType"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  v14 = [NSNumber numberWithInt:self->_serviceDiscoverySource];
  [v4 setObject:v14 forKey:@"serviceDiscoverySource"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithInt:self->_serviceLegacyFlags];
    [v4 setObject:v9 forKey:@"serviceLegacyFlags"];
  }
LABEL_12:
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey) {
    [v4 setObject:homeSharingGroupKey forKey:@"homeSharingGroupKey"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_hostName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_12:
  if (self->_homeSharingGroupKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_displayName)
  {
    objc_msgSend(v4, "setDisplayName:");
    id v4 = v6;
  }
  if (self->_networkName)
  {
    objc_msgSend(v6, "setNetworkName:");
    id v4 = v6;
  }
  if (self->_hostName)
  {
    objc_msgSend(v6, "setHostName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 10) = self->_port;
    *((unsigned char *)v4 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_serviceType;
  *((unsigned char *)v4 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  *((_DWORD *)v4 + 11) = self->_serviceDiscoverySource;
  *((unsigned char *)v4 + 56) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 12) = self->_serviceLegacyFlags;
    *((unsigned char *)v4 + 56) |= 4u;
  }
LABEL_12:
  if (self->_homeSharingGroupKey)
  {
    objc_msgSend(v6, "setHomeSharingGroupKey:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_displayName copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSString *)self->_networkName copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_hostName copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 40) = self->_port;
    *(unsigned char *)(v5 + 56) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 44) = self->_serviceDiscoverySource;
      *(unsigned char *)(v5 + 56) |= 2u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_serviceType;
  *(unsigned char *)(v5 + 56) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 48) = self->_serviceLegacyFlags;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
LABEL_6:
  uint64_t v13 = [(NSString *)self->_homeSharingGroupKey copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  networkName = self->_networkName;
  if ((unint64_t)networkName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](networkName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  hostName = self->_hostName;
  if ((unint64_t)hostName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostName, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_port != *((_DWORD *)v4 + 10)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_30:
    char v9 = 0;
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 8) == 0 || self->_serviceType != *((_DWORD *)v4 + 13)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 8) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_serviceDiscoverySource != *((_DWORD *)v4 + 11)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_serviceLegacyFlags != *((_DWORD *)v4 + 12)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_30;
  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if ((unint64_t)homeSharingGroupKey | *((void *)v4 + 2)) {
    char v9 = -[NSString isEqual:](homeSharingGroupKey, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_31:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  NSUInteger v4 = [(NSString *)self->_networkName hash];
  NSUInteger v5 = [(NSString *)self->_hostName hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_port;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_serviceType;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_homeSharingGroupKey hash];
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_serviceDiscoverySource;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_serviceLegacyFlags;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ [(NSString *)self->_homeSharingGroupKey hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[TVRMSServiceMessage setDisplayName:](self, "setDisplayName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[TVRMSServiceMessage setNetworkName:](self, "setNetworkName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[TVRMSServiceMessage setHostName:](self, "setHostName:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if (v5)
  {
    self->_port = v4[10];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_19;
    }
  }
  else if ((v4[14] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_serviceType = v4[13];
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_19:
  self->_serviceDiscoverySource = v4[11];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[14] & 4) != 0)
  {
LABEL_11:
    self->_serviceLegacyFlags = v4[12];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 2))
  {
    -[TVRMSServiceMessage setHomeSharingGroupKey:](self, "setHomeSharingGroupKey:");
    NSUInteger v4 = v6;
  }
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
}

- (int)port
{
  return self->_port;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (int)serviceDiscoverySource
{
  return self->_serviceDiscoverySource;
}

- (int)serviceLegacyFlags
{
  return self->_serviceLegacyFlags;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end