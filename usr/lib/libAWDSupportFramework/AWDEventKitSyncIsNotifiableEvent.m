@interface AWDEventKitSyncIsNotifiableEvent
- (BOOL)hasDeltaProcessingTime;
- (BOOL)hasDeltaTransitTime;
- (BOOL)hasReason;
- (BOOL)hasTimestamp;
- (BOOL)hasWillTriggerNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)willTriggerNotification;
- (NSString)reason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)deltaProcessingTime;
- (unint64_t)deltaTransitTime;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeltaProcessingTime:(unint64_t)a3;
- (void)setDeltaTransitTime:(unint64_t)a3;
- (void)setHasDeltaProcessingTime:(BOOL)a3;
- (void)setHasDeltaTransitTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWillTriggerNotification:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWillTriggerNotification:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDEventKitSyncIsNotifiableEvent

- (void)dealloc
{
  [(AWDEventKitSyncIsNotifiableEvent *)self setReason:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDEventKitSyncIsNotifiableEvent;
  [(AWDEventKitSyncIsNotifiableEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDeltaTransitTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deltaTransitTime = a3;
}

- (void)setHasDeltaTransitTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeltaTransitTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeltaProcessingTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deltaProcessingTime = a3;
}

- (void)setHasDeltaProcessingTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeltaProcessingTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWillTriggerNotification:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_willTriggerNotification = a3;
}

- (void)setHasWillTriggerNotification:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWillTriggerNotification
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDEventKitSyncIsNotifiableEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDEventKitSyncIsNotifiableEvent description](&v3, sel_description), -[AWDEventKitSyncIsNotifiableEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_deltaTransitTime] forKey:@"deltaTransitTime"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_deltaProcessingTime] forKey:@"deltaProcessingTime"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_willTriggerNotification] forKey:@"willTriggerNotification"];
LABEL_6:
  reason = self->_reason;
  if (reason) {
    [v3 setObject:reason forKey:@"reason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDEventKitSyncIsNotifiableEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_deltaTransitTime;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  *((void *)a3 + 1) = self->_deltaProcessingTime;
  *((unsigned char *)a3 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((unsigned char *)a3 + 40) = self->_willTriggerNotification;
    *((unsigned char *)a3 + 44) |= 8u;
  }
LABEL_6:
  reason = self->_reason;
  if (reason) {
    [a3 setReason:reason];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_deltaProcessingTime;
      *(unsigned char *)(v5 + 44) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_deltaTransitTime;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 40) = self->_willTriggerNotification;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
LABEL_6:

  v6[4] = [(NSString *)self->_reason copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_deltaTransitTime != *((void *)a3 + 2)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_deltaProcessingTime != *((void *)a3 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)a3 + 44))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 8) == 0) {
      goto LABEL_27;
    }
LABEL_21:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 44) & 8) == 0) {
    goto LABEL_21;
  }
  if (self->_willTriggerNotification)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_21;
    }
    goto LABEL_27;
  }
  if (*((unsigned char *)a3 + 40)) {
    goto LABEL_21;
  }
LABEL_27:
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)a3 + 4))
  {
    LOBYTE(v5) = -[NSString isEqual:](reason, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_deltaTransitTime;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_reason hash];
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_deltaProcessingTime;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_willTriggerNotification;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSString *)self->_reason hash];
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_deltaTransitTime = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  self->_deltaProcessingTime = *((void *)a3 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 44) & 8) != 0)
  {
LABEL_5:
    self->_willTriggerNotification = *((unsigned char *)a3 + 40);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  if (*((void *)a3 + 4)) {
    -[AWDEventKitSyncIsNotifiableEvent setReason:](self, "setReason:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)deltaTransitTime
{
  return self->_deltaTransitTime;
}

- (unint64_t)deltaProcessingTime
{
  return self->_deltaProcessingTime;
}

- (BOOL)willTriggerNotification
{
  return self->_willTriggerNotification;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

@end