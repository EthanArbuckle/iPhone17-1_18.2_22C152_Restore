@interface AWDCoreRoutineModelLearnedNonGeocodeableEvents
- (BOOL)hasLearnedNongeocodableEvents;
- (BOOL)hasNongeocodableEvents;
- (BOOL)hasTimestamp;
- (BOOL)hasUnlearnedNongeocodableEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)learnedNongeocodableEvents;
- (int)nongeocodableEvents;
- (int)unlearnedNongeocodableEvents;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLearnedNongeocodableEvents:(BOOL)a3;
- (void)setHasNongeocodableEvents:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUnlearnedNongeocodableEvents:(BOOL)a3;
- (void)setLearnedNongeocodableEvents:(int)a3;
- (void)setNongeocodableEvents:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUnlearnedNongeocodableEvents:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineModelLearnedNonGeocodeableEvents

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

- (void)setUnlearnedNongeocodableEvents:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_unlearnedNongeocodableEvents = a3;
}

- (void)setHasUnlearnedNongeocodableEvents:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUnlearnedNongeocodableEvents
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setLearnedNongeocodableEvents:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_learnedNongeocodableEvents = a3;
}

- (void)setHasLearnedNongeocodableEvents:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLearnedNongeocodableEvents
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNongeocodableEvents:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nongeocodableEvents = a3;
}

- (void)setHasNongeocodableEvents:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNongeocodableEvents
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelLearnedNonGeocodeableEvents;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineModelLearnedNonGeocodeableEvents description](&v3, sel_description), -[AWDCoreRoutineModelLearnedNonGeocodeableEvents dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithInt:self->_learnedNongeocodableEvents] forKey:@"learned_nongeocodable_events"];
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_unlearnedNongeocodableEvents] forKey:@"unlearned_nongeocodable_events"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_nongeocodableEvents] forKey:@"nongeocodable_events"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelLearnedNonGeocodeableEventsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteInt32Field();
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 2) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_unlearnedNongeocodableEvents;
  *((unsigned char *)a3 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 4) = self->_learnedNongeocodableEvents;
    *((unsigned char *)a3 + 28) |= 2u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 5) = self->_nongeocodableEvents;
  *((unsigned char *)a3 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_unlearnedNongeocodableEvents;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 5) = self->_nongeocodableEvents;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 4) = self->_learnedNongeocodableEvents;
  *((unsigned char *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_unlearnedNongeocodableEvents != *((_DWORD *)a3 + 6)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_nongeocodableEvents != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_learnedNongeocodableEvents != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
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
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_unlearnedNongeocodableEvents;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_nongeocodableEvents;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_learnedNongeocodableEvents;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_unlearnedNongeocodableEvents = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_9:
    self->_learnedNongeocodableEvents = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_8:
  self->_nongeocodableEvents = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 28) & 2) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)unlearnedNongeocodableEvents
{
  return self->_unlearnedNongeocodableEvents;
}

- (int)learnedNongeocodableEvents
{
  return self->_learnedNongeocodableEvents;
}

- (int)nongeocodableEvents
{
  return self->_nongeocodableEvents;
}

@end