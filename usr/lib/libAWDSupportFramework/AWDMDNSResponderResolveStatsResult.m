@interface AWDMDNSResponderResolveStatsResult
- (BOOL)hasCount;
- (BOOL)hasData;
- (BOOL)hasServerID;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)count;
- (unsigned)serverID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCount:(unsigned int)a3;
- (void)setData:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasServerID:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setServerID:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMDNSResponderResolveStatsResult

- (void)dealloc
{
  [(AWDMDNSResponderResolveStatsResult *)self setData:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsResult;
  [(AWDMDNSResponderResolveStatsResult *)&v3 dealloc];
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9AA0[a3];
  }
}

- (int)StringAsType:(id)a3
{
  if ([a3 isEqualToString:@"IPv4Addr"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"IPv6Addr"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"NegA"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"NegAAAA"]) {
    return 3;
  }
  return 0;
}

- (void)setCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
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

- (BOOL)hasData
{
  return self->_data != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderResolveStatsResult;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMDNSResponderResolveStatsResult description](&v3, sel_description), -[AWDMDNSResponderResolveStatsResult dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4) {
      v6 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    }
    else {
      v6 = off_2641B9AA0[type];
    }
    [v3 setObject:v6 forKey:@"type"];
    char has = (char)self->_has;
  }
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_count] forKey:@"count"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_serverID] forKey:@"serverID"];
  }
  data = self->_data;
  if (data) {
    [v3 setObject:data forKey:@"data"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderResolveStatsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_data)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 7) = self->_type;
    *((unsigned char *)a3 + 32) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 2) = self->_count;
  *((unsigned char *)a3 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 6) = self->_serverID;
    *((unsigned char *)a3 + 32) |= 2u;
  }
LABEL_5:
  data = self->_data;
  if (data) {
    [a3 setData:data];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 32) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 28) = self->_type;
  *(unsigned char *)(v5 + 32) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_serverID;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
LABEL_5:

  v6[2] = [(NSData *)self->_data copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 4) == 0 || self->_type != *((_DWORD *)a3 + 7)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_count != *((_DWORD *)a3 + 2)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 32) & 2) == 0 || self->_serverID != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 32) & 2) != 0)
    {
      goto LABEL_19;
    }
    data = self->_data;
    if ((unint64_t)data | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSData isEqual:](data, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSData *)self->_data hash];
  }
  uint64_t v2 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_count;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_serverID;
  return v3 ^ v2 ^ v4 ^ [(NSData *)self->_data hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 32);
  if ((v3 & 4) != 0)
  {
    self->_uint64_t type = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 32) & 2) != 0)
  {
LABEL_4:
    self->_serverID = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)a3 + 2)) {
    -[AWDMDNSResponderResolveStatsResult setData:](self, "setData:");
  }
}

- (unsigned)count
{
  return self->_count;
}

- (unsigned)serverID
{
  return self->_serverID;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

@end