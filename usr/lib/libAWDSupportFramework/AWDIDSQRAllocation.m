@interface AWDIDSQRAllocation
- (BOOL)hasDuration;
- (BOOL)hasHasRecipientAccepted;
- (BOOL)hasPayloadSize;
- (BOOL)hasResult;
- (BOOL)hasService;
- (BOOL)hasTimestamp;
- (BOOL)hasTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (NSString)topic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)hasRecipientAccepted;
- (unsigned)payloadSize;
- (unsigned)result;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasHasRecipientAccepted:(BOOL)a3;
- (void)setHasPayloadSize:(BOOL)a3;
- (void)setHasRecipientAccepted:(unsigned int)a3;
- (void)setHasResult:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPayloadSize:(unsigned int)a3;
- (void)setResult:(unsigned int)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSQRAllocation

- (void)dealloc
{
  [(AWDIDSQRAllocation *)self setTopic:0];
  [(AWDIDSQRAllocation *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQRAllocation;
  [(AWDIDSQRAllocation *)&v3 dealloc];
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

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResult:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_result = a3;
}

- (void)setHasResult:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasResult
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasRecipientAccepted:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hasRecipientAccepted = a3;
}

- (void)setHasHasRecipientAccepted:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasRecipientAccepted
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPayloadSize:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasTopic
{
  return self->_topic != 0;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSQRAllocation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSQRAllocation description](&v3, sel_description), -[AWDIDSQRAllocation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_result] forKey:@"result"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_hasRecipientAccepted] forKey:@"hasRecipientAccepted"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_payloadSize] forKey:@"payloadSize"];
LABEL_7:
  topic = self->_topic;
  if (topic) {
    [v3 setObject:topic forKey:@"topic"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSQRAllocationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_topic) {
    PBDataWriterWriteStringField();
  }
  if (self->_service)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_duration;
  *((unsigned char *)a3 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 8) = self->_result;
  *((unsigned char *)a3 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  *((_DWORD *)a3 + 6) = self->_hasRecipientAccepted;
  *((unsigned char *)a3 + 56) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 7) = self->_payloadSize;
    *((unsigned char *)a3 + 56) |= 8u;
  }
LABEL_7:
  if (self->_topic) {
    [a3 setTopic:];
  }
  if (self->_service)
  {
    [a3 setService:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_duration;
  *(unsigned char *)(v5 + 56) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v5 + 24) = self->_hasRecipientAccepted;
    *(unsigned char *)(v5 + 56) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 32) = self->_result;
  *(unsigned char *)(v5 + 56) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 28) = self->_payloadSize;
    *(unsigned char *)(v5 + 56) |= 8u;
  }
LABEL_7:

  *(void *)(v6 + 48) = [(NSString *)self->_topic copyWithZone:a3];
  *(void *)(v6 + 40) = [(NSString *)self->_service copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
LABEL_31:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 0x10) == 0 || self->_result != *((_DWORD *)a3 + 8)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 0x10) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_hasRecipientAccepted != *((_DWORD *)a3 + 6)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 4) != 0)
    {
      goto LABEL_31;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 8) == 0 || self->_payloadSize != *((_DWORD *)a3 + 7)) {
        goto LABEL_31;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 8) != 0)
    {
      goto LABEL_31;
    }
    topic = self->_topic;
    if (!((unint64_t)topic | *((void *)a3 + 6)) || (int v5 = -[NSString isEqual:](topic, "isEqual:")) != 0)
    {
      service = self->_service;
      if ((unint64_t)service | *((void *)a3 + 5))
      {
        LOBYTE(v5) = -[NSString isEqual:](service, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_duration;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_result;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_hasRecipientAccepted;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_payloadSize;
LABEL_12:
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_topic hash];
  return v8 ^ [(NSString *)self->_service hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_result = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  self->_hasRecipientAccepted = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 56) & 8) != 0)
  {
LABEL_6:
    self->_payloadSize = *((_DWORD *)a3 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
  if (*((void *)a3 + 6)) {
    -[AWDIDSQRAllocation setTopic:](self, "setTopic:");
  }
  if (*((void *)a3 + 5))
  {
    -[AWDIDSQRAllocation setService:](self, "setService:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unsigned)result
{
  return self->_result;
}

- (unsigned)hasRecipientAccepted
{
  return self->_hasRecipientAccepted;
}

- (unsigned)payloadSize
{
  return self->_payloadSize;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

@end