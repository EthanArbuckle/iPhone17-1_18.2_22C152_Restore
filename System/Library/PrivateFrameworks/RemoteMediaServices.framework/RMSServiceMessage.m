@interface RMSServiceMessage
- (BOOL)hasDisplayName;
- (BOOL)hasHomeSharingGroupKey;
- (BOOL)hasHostName;
- (BOOL)hasNetworkName;
- (BOOL)hasPort;
- (BOOL)hasServiceDiscoverySource;
- (BOOL)hasServiceFlags;
- (BOOL)hasServiceType;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)displayName;
- (NSString)homeSharingGroupKey;
- (NSString)hostName;
- (NSString)networkName;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)port;
- (int)serviceDiscoverySource;
- (int)serviceFlags;
- (int)serviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasPort:(BOOL)a3;
- (void)setHasServiceDiscoverySource:(BOOL)a3;
- (void)setHasServiceFlags:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setHomeSharingGroupKey:(id)a3;
- (void)setHostName:(id)a3;
- (void)setNetworkName:(id)a3;
- (void)setPort:(int)a3;
- (void)setServiceDiscoverySource:(int)a3;
- (void)setServiceFlags:(int)a3;
- (void)setServiceType:(int)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RMSServiceMessage

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

- (void)setServiceFlags:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serviceFlags = a3;
}

- (void)setHasServiceFlags:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceFlags
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasHomeSharingGroupKey
{
  return self->_homeSharingGroupKey != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RMSServiceMessage;
  v4 = [(RMSServiceMessage *)&v8 description];
  v5 = [(RMSServiceMessage *)self dictionaryRepresentation];
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
    v13 = [NSNumber numberWithInt:self->_port];
    [v4 setObject:v13 forKey:@"port"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  v14 = [NSNumber numberWithInt:self->_serviceType];
  [v4 setObject:v14 forKey:@"serviceType"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  v15 = [NSNumber numberWithInt:self->_serviceDiscoverySource];
  [v4 setObject:v15 forKey:@"serviceDiscoverySource"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithInt:self->_serviceFlags];
    [v4 setObject:v9 forKey:@"serviceFlags"];
  }
LABEL_12:
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey) {
    [v4 setObject:homeSharingGroupKey forKey:@"homeSharingGroupKey"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v4 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return RMSServiceMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
      goto LABEL_21;
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
LABEL_21:
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
  if (self->_uniqueIdentifier)
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
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_serviceType;
  *((unsigned char *)v4 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)v4 + 11) = self->_serviceDiscoverySource;
  *((unsigned char *)v4 + 64) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 12) = self->_serviceFlags;
    *((unsigned char *)v4 + 64) |= 4u;
  }
LABEL_12:
  if (self->_homeSharingGroupKey)
  {
    objc_msgSend(v6, "setHomeSharingGroupKey:");
    id v4 = v6;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v6, "setUniqueIdentifier:");
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
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 44) = self->_serviceDiscoverySource;
      *(unsigned char *)(v5 + 64) |= 2u;
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
  *(unsigned char *)(v5 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 48) = self->_serviceFlags;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
LABEL_6:
  uint64_t v13 = [(NSString *)self->_homeSharingGroupKey copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  uint64_t v15 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:")) {
      goto LABEL_32;
    }
  }
  networkName = self->_networkName;
  if ((unint64_t)networkName | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](networkName, "isEqual:")) {
      goto LABEL_32;
    }
  }
  hostName = self->_hostName;
  if ((unint64_t)hostName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](hostName, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_port != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_32:
    char v10 = 0;
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0 || self->_serviceType != *((_DWORD *)v4 + 13)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_serviceDiscoverySource != *((_DWORD *)v4 + 11)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_serviceFlags != *((_DWORD *)v4 + 12)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_32;
  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if ((unint64_t)homeSharingGroupKey | *((void *)v4 + 2)
    && !-[NSString isEqual:](homeSharingGroupKey, "isEqual:"))
  {
    goto LABEL_32;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 7)) {
    char v10 = -[NSString isEqual:](uniqueIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_33:

  return v10;
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
      goto LABEL_10;
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
  uint64_t v9 = 2654435761 * self->_serviceFlags;
LABEL_10:
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v11 = v7 ^ v8 ^ v9 ^ [(NSString *)self->_homeSharingGroupKey hash];
  return v10 ^ v11 ^ [(NSString *)self->_uniqueIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[RMSServiceMessage setDisplayName:](self, "setDisplayName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[RMSServiceMessage setNetworkName:](self, "setNetworkName:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[RMSServiceMessage setHostName:](self, "setHostName:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_port = v4[10];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v4[16] & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_serviceType = v4[13];
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_serviceDiscoverySource = v4[11];
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[16] & 4) != 0)
  {
LABEL_11:
    self->_serviceFlags = v4[12];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v4 + 2))
  {
    -[RMSServiceMessage setHomeSharingGroupKey:](self, "setHomeSharingGroupKey:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[RMSServiceMessage setUniqueIdentifier:](self, "setUniqueIdentifier:");
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

- (int)serviceFlags
{
  return self->_serviceFlags;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end