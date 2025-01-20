@interface AWDCoreRoutineLMPRequestedInstance
- (BOOL)hasConfidence;
- (BOOL)hasEventId;
- (BOOL)hasOccurrences;
- (BOOL)hasReason;
- (BOOL)hasSuggested;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)suggested;
- (NSString)eventId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)confidence;
- (int)occurrences;
- (int)reason;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setEventId:(id)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasOccurrences:(BOOL)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setHasSuggested:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setOccurrences:(int)a3;
- (void)setReason:(int)a3;
- (void)setSuggested:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPRequestedInstance

- (void)dealloc
{
  [(AWDCoreRoutineLMPRequestedInstance *)self setEventId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPRequestedInstance;
  [(AWDCoreRoutineLMPRequestedInstance *)&v3 dealloc];
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

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)setSuggested:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_suggested = a3;
}

- (void)setHasSuggested:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuggested
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOccurrences:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_occurrences = a3;
}

- (void)setHasOccurrences:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOccurrences
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReason
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPRequestedInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPRequestedInstance description](&v3, sel_description), -[AWDCoreRoutineLMPRequestedInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  eventId = self->_eventId;
  if (eventId) {
    [v3 setObject:eventId forKey:@"eventId"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_suggested] forKey:@"suggested"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      [v3 setObject:[NSNumber numberWithInt:self->_occurrences] forKey:@"occurrences"];
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v3;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_confidence] forKey:@"confidence"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if ((has & 8) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_reason] forKey:@"reason"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPRequestedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_eventId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
LABEL_12:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_12;
  }
LABEL_8:
  if ((has & 8) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_eventId) {
    [a3 setEventId:];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)a3 + 40) = self->_suggested;
    *((unsigned char *)a3 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 4) = self->_confidence;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  *((_DWORD *)a3 + 8) = self->_occurrences;
  *((unsigned char *)a3 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_9:
  *((_DWORD *)a3 + 9) = self->_reason;
  *((unsigned char *)a3 + 44) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_eventId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_suggested;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 32) = self->_occurrences;
      *(unsigned char *)(v6 + 44) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_confidence;
  *(unsigned char *)(v6 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 36) = self->_reason;
    *(unsigned char *)(v6 + 44) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)a3 + 44))
  {
    goto LABEL_32;
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((void *)a3 + 3))
  {
    int v5 = -[NSString isEqual:](eventId, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 0x10) != 0) {
      goto LABEL_32;
    }
    goto LABEL_18;
  }
  if ((*((unsigned char *)a3 + 44) & 0x10) == 0) {
    goto LABEL_32;
  }
  if (self->_suggested)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_32;
    }
    goto LABEL_18;
  }
  if (*((unsigned char *)a3 + 40))
  {
LABEL_32:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 4)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_occurrences != *((_DWORD *)a3 + 8)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_reason != *((_DWORD *)a3 + 9)) {
      goto LABEL_32;
    }
    LOBYTE(v5) = 1;
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
  NSUInteger v4 = [(NSString *)self->_eventId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_suggested;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_confidence;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_occurrences;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_reason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDCoreRoutineLMPRequestedInstance setEventId:](self, "setEventId:");
  }
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_suggested = *((unsigned char *)a3 + 40);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_confidence = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_13:
  self->_occurrences = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 44) & 8) == 0) {
    return;
  }
LABEL_9:
  self->_reason = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (BOOL)suggested
{
  return self->_suggested;
}

- (int)confidence
{
  return self->_confidence;
}

- (int)occurrences
{
  return self->_occurrences;
}

- (int)reason
{
  return self->_reason;
}

@end