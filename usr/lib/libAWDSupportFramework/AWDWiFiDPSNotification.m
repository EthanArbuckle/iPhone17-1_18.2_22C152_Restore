@interface AWDWiFiDPSNotification
- (BOOL)facetimeCallInProgress;
- (BOOL)hasFacetimeCallInProgress;
- (BOOL)hasProblemAC;
- (BOOL)hasSymptom;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)symptomAsString:(int)a3;
- (int)StringAsSymptom:(id)a3;
- (int)symptom;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)problemAC;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFacetimeCallInProgress:(BOOL)a3;
- (void)setHasFacetimeCallInProgress:(BOOL)a3;
- (void)setHasProblemAC:(BOOL)a3;
- (void)setHasSymptom:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProblemAC:(unsigned int)a3;
- (void)setSymptom:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiDPSNotification

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

- (int)symptom
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_symptom;
  }
  else {
    return 0;
  }
}

- (void)setSymptom:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_symptom = a3;
}

- (void)setHasSymptom:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSymptom
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)symptomAsString:(int)a3
{
  if (a3 >= 5) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA2D0[a3];
  }
}

- (int)StringAsSymptom:(id)a3
{
  if ([a3 isEqualToString:@"kDriverDetectedStall"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kDriverDetectedSlow"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kUserToggleOff"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kUserToggleOn"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kSymptomsdTrigger"]) {
    return 4;
  }
  return 0;
}

- (void)setProblemAC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_problemAC = a3;
}

- (void)setHasProblemAC:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProblemAC
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFacetimeCallInProgress:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_facetimeCallInProgress = a3;
}

- (void)setHasFacetimeCallInProgress:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFacetimeCallInProgress
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSNotification;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSNotification description](&v3, sel_description), -[AWDWiFiDPSNotification dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_problemAC] forKey:@"problemAC"];
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t symptom = self->_symptom;
  if (symptom >= 5) {
    v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_symptom];
  }
  else {
    v7 = off_2641BA2D0[symptom];
  }
  [v3 setObject:v7 forKey:@"symptom"];
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_4:
  if ((has & 8) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_facetimeCallInProgress] forKey:@"facetimeCallInProgress"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_8:
      PBDataWriterWriteUint32Field();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 8) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_symptom;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return;
    }
LABEL_9:
    *((unsigned char *)a3 + 24) = self->_facetimeCallInProgress;
    *((unsigned char *)a3 + 28) |= 8u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 4) = self->_problemAC;
  *((unsigned char *)a3 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_symptom;
  *((unsigned char *)result + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 4) = self->_problemAC;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((unsigned char *)result + 24) = self->_facetimeCallInProgress;
  *((unsigned char *)result + 28) |= 8u;
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
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_symptom != *((_DWORD *)a3 + 5)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_19;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_problemAC != *((_DWORD *)a3 + 4)) {
        goto LABEL_19;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0)
      {
LABEL_19:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_facetimeCallInProgress)
      {
        if (!*((unsigned char *)a3 + 24)) {
          goto LABEL_19;
        }
      }
      else if (*((unsigned char *)a3 + 24))
      {
        goto LABEL_19;
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_symptom;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
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
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_problemAC;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_facetimeCallInProgress;
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
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t symptom = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_9:
    self->_facetimeCallInProgress = *((unsigned char *)a3 + 24);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_8:
  self->_problemAC = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)problemAC
{
  return self->_problemAC;
}

- (BOOL)facetimeCallInProgress
{
  return self->_facetimeCallInProgress;
}

@end