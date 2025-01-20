@interface AWDIDSClientProcessReceivedMessage
- (BOOL)hasDeltaTime;
- (BOOL)hasPayloadSize;
- (BOOL)hasPriority;
- (BOOL)hasQos;
- (BOOL)hasService;
- (BOOL)hasThreadPriority;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deltaTime;
- (unint64_t)hash;
- (unint64_t)payloadSize;
- (unint64_t)priority;
- (unint64_t)qos;
- (unint64_t)threadPriority;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeltaTime:(unint64_t)a3;
- (void)setHasDeltaTime:(BOOL)a3;
- (void)setHasPayloadSize:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasQos:(BOOL)a3;
- (void)setHasThreadPriority:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPayloadSize:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setQos:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setThreadPriority:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIDSClientProcessReceivedMessage

- (void)dealloc
{
  [(AWDIDSClientProcessReceivedMessage *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSClientProcessReceivedMessage;
  [(AWDIDSClientProcessReceivedMessage *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setPayloadSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_payloadSize = a3;
}

- (void)setHasPayloadSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPayloadSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setQos:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_qos = a3;
}

- (void)setHasQos:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasQos
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setThreadPriority:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_threadPriority = a3;
}

- (void)setHasThreadPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasThreadPriority
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDeltaTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deltaTime = a3;
}

- (void)setHasDeltaTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeltaTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPriority:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPriority
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIDSClientProcessReceivedMessage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIDSClientProcessReceivedMessage description](&v3, sel_description), -[AWDIDSClientProcessReceivedMessage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_payloadSize] forKey:@"payloadSize"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_qos] forKey:@"qos"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_15:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_deltaTime] forKey:@"deltaTime"];
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_threadPriority] forKey:@"threadPriority"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_15;
  }
LABEL_9:
  if ((has & 4) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_priority] forKey:@"priority"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIDSClientProcessReceivedMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_14;
  }
LABEL_9:
  if ((has & 4) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((void *)a3 + 6) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 0x20u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_payloadSize;
    *((unsigned char *)a3 + 64) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 4) = self->_qos;
  *((unsigned char *)a3 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)a3 + 5) = self->_threadPriority;
  *((unsigned char *)a3 + 64) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  *((void *)a3 + 1) = self->_deltaTime;
  *((unsigned char *)a3 + 64) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_10:
  *((void *)a3 + 3) = self->_priority;
  *((unsigned char *)a3 + 64) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 0x20u;
  }

  *(void *)(v6 + 56) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_payloadSize;
    *(unsigned char *)(v6 + 64) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 32) = self->_qos;
  *(unsigned char *)(v6 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(void *)(v6 + 8) = self->_deltaTime;
    *(unsigned char *)(v6 + 64) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(void *)(v6 + 40) = self->_threadPriority;
  *(unsigned char *)(v6 + 64) |= 0x10u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 4) != 0)
  {
LABEL_8:
    *(void *)(v6 + 24) = self->_priority;
    *(unsigned char *)(v6 + 64) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x20) == 0 || self->_timestamp != *((void *)a3 + 6)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
    {
LABEL_34:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 7))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_payloadSize != *((void *)a3 + 2)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 8) == 0 || self->_qos != *((void *)a3 + 4)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 8) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 0x10) == 0 || self->_threadPriority != *((void *)a3 + 5)) {
        goto LABEL_34;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_deltaTime != *((void *)a3 + 1)) {
        goto LABEL_34;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_34;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 64) & 4) == 0;
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 4) == 0 || self->_priority != *((void *)a3 + 3)) {
        goto LABEL_34;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_payloadSize;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      unint64_t v6 = 2654435761u * self->_qos;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    unint64_t v7 = 2654435761u * self->_threadPriority;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_8;
    }
LABEL_13:
    unint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_deltaTime;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  unint64_t v9 = 2654435761u * self->_priority;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 64) & 0x20) != 0)
  {
    self->_timestamp = *((void *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)a3 + 7)) {
    -[AWDIDSClientProcessReceivedMessage setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_payloadSize = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 64);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 64) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_qos = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_threadPriority = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_15:
  self->_deltaTime = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 64) & 4) == 0) {
    return;
  }
LABEL_10:
  self->_priority = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (unint64_t)payloadSize
{
  return self->_payloadSize;
}

- (unint64_t)qos
{
  return self->_qos;
}

- (unint64_t)threadPriority
{
  return self->_threadPriority;
}

- (unint64_t)deltaTime
{
  return self->_deltaTime;
}

- (unint64_t)priority
{
  return self->_priority;
}

@end