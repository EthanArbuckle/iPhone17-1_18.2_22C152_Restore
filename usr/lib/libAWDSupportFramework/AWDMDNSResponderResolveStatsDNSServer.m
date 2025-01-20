@interface AWDMDNSResponderResolveStatsDNSServer
- (BOOL)hasAddress;
- (BOOL)hasNetworkType;
- (BOOL)hasServerID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)address;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkTypeAsString:(int)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)networkType;
- (unint64_t)hash;
- (unsigned)serverID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAddress:(id)a3;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasServerID:(BOOL)a3;
- (void)setNetworkType:(int)a3;
- (void)setServerID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMDNSResponderResolveStatsDNSServer

- (void)dealloc
{
  [(AWDMDNSResponderResolveStatsDNSServer *)self setAddress:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsDNSServer;
  [(AWDMDNSResponderResolveStatsDNSServer *)&v3 dealloc];
}

- (BOOL)hasAddress
{
  return self->_address != 0;
}

- (int)networkType
{
  if (*(unsigned char *)&self->_has) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (!a3) {
    return @"NonCellular";
  }
  if (a3 == 1) {
    return @"Cellular";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsNetworkType:(id)a3
{
  if ([a3 isEqualToString:@"NonCellular"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"Cellular"];
  }
}

- (void)setServerID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_serverID = a3;
}

- (void)setHasServerID:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasServerID
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsDNSServer;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMDNSResponderResolveStatsDNSServer description](&v3, sel_description), -[AWDMDNSResponderResolveStatsDNSServer dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  address = self->_address;
  if (address) {
    [v3 setObject:address forKey:@"address"];
  }
  char has = (char)self->_has;
  if (has)
  {
    int networkType = self->_networkType;
    if (networkType)
    {
      if (networkType == 1) {
        v8 = @"Cellular";
      }
      else {
        v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_networkType];
      }
    }
    else
    {
      v8 = @"NonCellular";
    }
    [v4 setObject:v8 forKey:@"networkType"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v4 setObject:[NSNumber numberWithUnsignedInt:self->_serverID] forKey:@"serverID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderResolveStatsDNSServerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_address) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_address) {
    [a3 setAddress:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 4) = self->_networkType;
    *((unsigned char *)a3 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_serverID;
    *((unsigned char *)a3 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];

  *(void *)(v5 + 8) = [(NSData *)self->_address copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_networkType;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_serverID;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    address = self->_address;
    if (!((unint64_t)address | *((void *)a3 + 1)) || (int v5 = -[NSData isEqual:](address, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_networkType != *((_DWORD *)a3 + 4)) {
          goto LABEL_13;
        }
      }
      else if (*((unsigned char *)a3 + 24))
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 2) == 0;
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 24) & 2) == 0 || self->_serverID != *((_DWORD *)a3 + 5)) {
          goto LABEL_13;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_address hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_networkType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_serverID;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[AWDMDNSResponderResolveStatsDNSServer setAddress:](self, "setAddress:");
  }
  char v5 = *((unsigned char *)a3 + 24);
  if (v5)
  {
    self->_int networkType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_serverID = *((_DWORD *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (unsigned)serverID
{
  return self->_serverID;
}

@end