@interface AWDIDSSessionStarted
- (BOOL)hasClientType;
- (BOOL)hasGuid;
- (BOOL)hasServiceName;
- (BOOL)hasSessionProtocolVersionNumber;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)clientType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)sessionProtocolVersionNumber;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientType:(int)a3;
- (void)setGuid:(id)a3;
- (void)setHasClientType:(BOOL)a3;
- (void)setHasSessionProtocolVersionNumber:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setSessionProtocolVersionNumber:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSSessionStarted

- (void)dealloc
{
  [(AWDIDSSessionStarted *)self setGuid:0];
  [(AWDIDSSessionStarted *)self setServiceName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionStarted;
  [(AWDIDSSessionStarted *)&v3 dealloc];
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

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (void)setSessionProtocolVersionNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionProtocolVersionNumber = a3;
}

- (void)setHasSessionProtocolVersionNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSessionProtocolVersionNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setClientType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasClientType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSSessionStarted;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSSessionStarted description](&v3, sel_description), -[AWDIDSSessionStarted dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sessionProtocolVersionNumber] forKey:@"sessionProtocolVersionNumber"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithInt:self->_clientType] forKey:@"clientType"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSSessionStartedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_guid) {
    [a3 setGuid:];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_sessionProtocolVersionNumber;
    *((unsigned char *)a3 + 44) |= 4u;
  }
  if (self->_serviceName) {
    [a3 setServiceName:];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_clientType;
    *((unsigned char *)a3 + 44) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_guid copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_sessionProtocolVersionNumber;
    *(unsigned char *)(v6 + 44) |= 4u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_serviceName copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_clientType;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    guid = self->_guid;
    if ((unint64_t)guid | *((void *)a3 + 3))
    {
      int v5 = -[NSString isEqual:](guid, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_sessionProtocolVersionNumber != *((_DWORD *)a3 + 10)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_22;
    }
    serviceName = self->_serviceName;
    if ((unint64_t)serviceName | *((void *)a3 + 4))
    {
      int v5 = -[NSString isEqual:](serviceName, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_clientType != *((_DWORD *)a3 + 4)) {
        goto LABEL_22;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_guid hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v5 = 2654435761 * self->_sessionProtocolVersionNumber;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_serviceName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_clientType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDIDSSessionStarted setGuid:](self, "setGuid:");
  }
  if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
    self->_sessionProtocolVersionNumber = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDIDSSessionStarted setServiceName:](self, "setServiceName:");
  }
  if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    self->_clientType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unsigned)sessionProtocolVersionNumber
{
  return self->_sessionProtocolVersionNumber;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (int)clientType
{
  return self->_clientType;
}

@end