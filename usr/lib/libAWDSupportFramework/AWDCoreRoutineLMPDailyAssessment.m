@interface AWDCoreRoutineLMPDailyAssessment
- (BOOL)hasDailyEvents;
- (BOOL)hasEventsWithLMPLocation;
- (BOOL)hasEventsWithLocation;
- (BOOL)hasEventsWithMaybeLocation;
- (BOOL)hasTimestamp;
- (BOOL)hasVisitLMPLocation;
- (BOOL)hasVisitLocation;
- (BOOL)hasVisitMaybeLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)dailyEvents;
- (int)eventsWithLMPLocation;
- (int)eventsWithLocation;
- (int)eventsWithMaybeLocation;
- (int)visitLMPLocation;
- (int)visitLocation;
- (int)visitMaybeLocation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDailyEvents:(int)a3;
- (void)setEventsWithLMPLocation:(int)a3;
- (void)setEventsWithLocation:(int)a3;
- (void)setEventsWithMaybeLocation:(int)a3;
- (void)setHasDailyEvents:(BOOL)a3;
- (void)setHasEventsWithLMPLocation:(BOOL)a3;
- (void)setHasEventsWithLocation:(BOOL)a3;
- (void)setHasEventsWithMaybeLocation:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVisitLMPLocation:(BOOL)a3;
- (void)setHasVisitLocation:(BOOL)a3;
- (void)setHasVisitMaybeLocation:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVisitLMPLocation:(int)a3;
- (void)setVisitLocation:(int)a3;
- (void)setVisitMaybeLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLMPDailyAssessment

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

- (void)setDailyEvents:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dailyEvents = a3;
}

- (void)setHasDailyEvents:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDailyEvents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEventsWithLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_eventsWithLocation = a3;
}

- (void)setHasEventsWithLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasEventsWithLocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEventsWithMaybeLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_eventsWithMaybeLocation = a3;
}

- (void)setHasEventsWithMaybeLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEventsWithMaybeLocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEventsWithLMPLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_eventsWithLMPLocation = a3;
}

- (void)setHasEventsWithLMPLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEventsWithLMPLocation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setVisitLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_visitLocation = a3;
}

- (void)setHasVisitLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasVisitLocation
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setVisitMaybeLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_visitMaybeLocation = a3;
}

- (void)setHasVisitMaybeLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasVisitMaybeLocation
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setVisitLMPLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_visitLMPLocation = a3;
}

- (void)setHasVisitLMPLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVisitLMPLocation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLMPDailyAssessment;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLMPDailyAssessment description](&v3, sel_description), -[AWDCoreRoutineLMPDailyAssessment dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_dailyEvents] forKey:@"dailyEvents"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 setObject:[NSNumber numberWithInt:self->_eventsWithLocation] forKey:@"eventsWithLocation"];
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 setObject:[NSNumber numberWithInt:self->_eventsWithMaybeLocation] forKey:@"eventsWithMaybeLocation"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithInt:self->_eventsWithLMPLocation] forKey:@"eventsWithLMPLocation"];
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    [v3 setObject:[NSNumber numberWithInt:self->_visitMaybeLocation] forKey:@"visitMaybeLocation"];
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return v3;
    }
    goto LABEL_9;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithInt:self->_visitLocation] forKey:@"visitLocation"];
  char has = (char)self->_has;
  if (has < 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 0x20) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_visitLMPLocation] forKey:@"visitLMPLocation"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLMPDailyAssessmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if (has < 0) {
    goto LABEL_16;
  }
LABEL_8:
  if ((has & 0x20) == 0) {
    return;
  }
LABEL_17:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_dailyEvents;
  *((unsigned char *)a3 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)a3 + 6) = self->_eventsWithLocation;
  *((unsigned char *)a3 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)a3 + 7) = self->_eventsWithMaybeLocation;
  *((unsigned char *)a3 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 5) = self->_eventsWithLMPLocation;
  *((unsigned char *)a3 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)a3 + 9) = self->_visitLocation;
  *((unsigned char *)a3 + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      return;
    }
LABEL_17:
    *((_DWORD *)a3 + 8) = self->_visitLMPLocation;
    *((unsigned char *)a3 + 44) |= 0x20u;
    return;
  }
LABEL_16:
  *((_DWORD *)a3 + 10) = self->_visitMaybeLocation;
  *((unsigned char *)a3 + 44) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    goto LABEL_17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_dailyEvents;
  *((unsigned char *)result + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 6) = self->_eventsWithLocation;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 7) = self->_eventsWithMaybeLocation;
  *((unsigned char *)result + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 5) = self->_eventsWithLMPLocation;
  *((unsigned char *)result + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_visitLocation;
  *((unsigned char *)result + 44) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 10) = self->_visitMaybeLocation;
  *((unsigned char *)result + 44) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 8) = self->_visitLMPLocation;
  *((unsigned char *)result + 44) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_dailyEvents != *((_DWORD *)a3 + 4)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_eventsWithLocation != *((_DWORD *)a3 + 6)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x10) == 0 || self->_eventsWithMaybeLocation != *((_DWORD *)a3 + 7)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x10) != 0)
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_eventsWithLMPLocation != *((_DWORD *)a3 + 5)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x40) == 0 || self->_visitLocation != *((_DWORD *)a3 + 9)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x40) != 0)
    {
      goto LABEL_40;
    }
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x80) == 0 || self->_visitMaybeLocation != *((_DWORD *)a3 + 10)) {
        goto LABEL_40;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 0x80) != 0)
    {
LABEL_40:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 0x20) == 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 0x20) == 0 || self->_visitLMPLocation != *((_DWORD *)a3 + 8)) {
        goto LABEL_40;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_dailyEvents;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_eventsWithLocation;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_eventsWithMaybeLocation;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_eventsWithLMPLocation;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_visitLocation;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_visitMaybeLocation;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_visitLMPLocation;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 44);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 44);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_dailyEvents = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_eventsWithLocation = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_eventsWithMaybeLocation = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_eventsWithLMPLocation = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_visitLocation = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x20) == 0) {
      return;
    }
LABEL_17:
    self->_visitLMPLocation = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 0x20u;
    return;
  }
LABEL_16:
  self->_visitMaybeLocation = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)a3 + 44) & 0x20) != 0) {
    goto LABEL_17;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)dailyEvents
{
  return self->_dailyEvents;
}

- (int)eventsWithLocation
{
  return self->_eventsWithLocation;
}

- (int)eventsWithMaybeLocation
{
  return self->_eventsWithMaybeLocation;
}

- (int)eventsWithLMPLocation
{
  return self->_eventsWithLMPLocation;
}

- (int)visitLocation
{
  return self->_visitLocation;
}

- (int)visitMaybeLocation
{
  return self->_visitMaybeLocation;
}

- (int)visitLMPLocation
{
  return self->_visitLMPLocation;
}

@end