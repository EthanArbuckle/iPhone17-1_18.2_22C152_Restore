@interface AWDCompanionSyncReceiveEvent
- (BOOL)hasDuration;
- (BOOL)hasProcessingTime;
- (BOOL)hasSequenceNumber;
- (BOOL)hasService;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)service;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)processingTime;
- (unint64_t)sequenceNumber;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasProcessingTime:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProcessingTime:(unint64_t)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCompanionSyncReceiveEvent

- (void)dealloc
{
  [(AWDCompanionSyncReceiveEvent *)self setService:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncReceiveEvent;
  [(AWDCompanionSyncReceiveEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)setProcessingTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_processingTime = a3;
}

- (void)setHasProcessingTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProcessingTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCompanionSyncReceiveEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCompanionSyncReceiveEvent description](&v3, sel_description), -[AWDCompanionSyncReceiveEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  service = self->_service;
  if (service) {
    [v3 setObject:service forKey:@"service"];
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sequenceNumber] forKey:@"sequence_number"];
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_7:
  if ((has & 2) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_processingTime] forKey:@"processingTime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCompanionSyncReceiveEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_service) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_10:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if (has) {
    goto LABEL_10;
  }
LABEL_7:
  if ((has & 2) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 8u;
  }
  if (self->_service) {
    [a3 setService:];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_sequenceNumber;
    *((unsigned char *)a3 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((void *)a3 + 1) = self->_duration;
  *((unsigned char *)a3 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return;
  }
LABEL_8:
  *((void *)a3 + 2) = self->_processingTime;
  *((unsigned char *)a3 + 48) |= 2u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 8u;
  }

  *(void *)(v6 + 40) = [(NSString *)self->_service copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(void *)(v6 + 8) = self->_duration;
    *(unsigned char *)(v6 + 48) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(void *)(v6 + 24) = self->_sequenceNumber;
  *(unsigned char *)(v6 + 48) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *(void *)(v6 + 16) = self->_processingTime;
    *(unsigned char *)(v6 + 48) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 8) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    service = self->_service;
    if ((unint64_t)service | *((void *)a3 + 5))
    {
      int v5 = -[NSString isEqual:](service, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_sequenceNumber != *((void *)a3 + 3)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 48) & 4) != 0)
    {
      goto LABEL_24;
    }
    if (has)
    {
      if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_24;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 2) == 0;
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_processingTime != *((void *)a3 + 2)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_service hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_9:
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    unint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  unint64_t v5 = 2654435761u * self->_sequenceNumber;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_duration;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_processingTime;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 48) & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)a3 + 5)) {
    -[AWDCompanionSyncReceiveEvent setService:](self, "setService:");
  }
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 4) != 0)
  {
    self->_sequenceNumber = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        return;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_duration = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 48) & 2) == 0) {
    return;
  }
LABEL_8:
  self->_processingTime = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
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

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)processingTime
{
  return self->_processingTime;
}

@end