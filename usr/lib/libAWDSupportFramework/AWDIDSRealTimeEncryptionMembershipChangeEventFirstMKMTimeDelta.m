@interface AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta
- (BOOL)hasActiveParticipantBucket;
- (BOOL)hasServiceName;
- (BOOL)hasTimeDelta;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)serviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)timeDelta;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)activeParticipantBucket;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActiveParticipantBucket:(unsigned int)a3;
- (void)setHasActiveParticipantBucket:(BOOL)a3;
- (void)setHasTimeDelta:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setServiceName:(id)a3;
- (void)setTimeDelta:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta

- (void)dealloc
{
  [(AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta *)self setServiceName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta;
  [(AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasServiceName
{
  return self->_serviceName != 0;
}

- (void)setActiveParticipantBucket:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_activeParticipantBucket = a3;
}

- (void)setHasActiveParticipantBucket:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasActiveParticipantBucket
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimeDelta:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeDelta = a3;
}

- (void)setHasTimeDelta:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeDelta
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta description](&v3, sel_description), -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  serviceName = self->_serviceName;
  if (serviceName) {
    [v3 setObject:serviceName forKey:@"serviceName"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_activeParticipantBucket] forKey:@"activeParticipantBucket"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithLongLong:self->_timeDelta] forKey:@"timeDelta"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDeltaReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_serviceName) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 2u;
  }
  if (self->_serviceName) {
    [a3 setServiceName:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_activeParticipantBucket;
    *((unsigned char *)a3 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_timeDelta;
    *((unsigned char *)a3 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 2u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_serviceName copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_activeParticipantBucket;
    *(unsigned char *)(v6 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v6 + 8) = self->_timeDelta;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
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
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_activeParticipantBucket != *((_DWORD *)a3 + 6)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 1) == 0;
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timeDelta != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_serviceName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_activeParticipantBucket;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_timeDelta;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 40) & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDIDSRealTimeEncryptionMembershipChangeEventFirstMKMTimeDelta setServiceName:](self, "setServiceName:");
  }
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_activeParticipantBucket = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if (v5)
  {
    self->_timeDelta = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (unsigned)activeParticipantBucket
{
  return self->_activeParticipantBucket;
}

- (int64_t)timeDelta
{
  return self->_timeDelta;
}

@end