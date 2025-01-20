@interface AWDCoreRoutineStateModelConfidence
- (BOOL)hasConfidence;
- (BOOL)hasImpossibleTransitions;
- (BOOL)hasNearbyLocations;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)confidence;
- (unsigned)impossibleTransitions;
- (unsigned)nearbyLocations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(unsigned int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasImpossibleTransitions:(BOOL)a3;
- (void)setHasNearbyLocations:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setImpossibleTransitions:(unsigned int)a3;
- (void)setNearbyLocations:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineStateModelConfidence

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

- (void)setImpossibleTransitions:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_impossibleTransitions = a3;
}

- (void)setHasImpossibleTransitions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasImpossibleTransitions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNearbyLocations:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_nearbyLocations = a3;
}

- (void)setHasNearbyLocations:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNearbyLocations
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConfidence:(unsigned int)a3
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineStateModelConfidence;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineStateModelConfidence description](&v3, sel_description), -[AWDCoreRoutineStateModelConfidence dictionaryRepresentation](self, "dictionaryRepresentation")];
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
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nearbyLocations] forKey:@"nearbyLocations"];
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return v3;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_impossibleTransitions] forKey:@"impossibleTransitions"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_confidence] forKey:@"confidence"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineStateModelConfidenceReadFrom((uint64_t)self, (uint64_t)a3);
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
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_8;
  }
LABEL_4:
  if ((has & 8) == 0) {
    return;
  }
LABEL_9:

  PBDataWriterWriteUint32Field();
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
  *((_DWORD *)a3 + 5) = self->_impossibleTransitions;
  *((unsigned char *)a3 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return;
    }
LABEL_9:
    *((_DWORD *)a3 + 6) = self->_nearbyLocations;
    *((unsigned char *)a3 + 28) |= 8u;
    return;
  }
LABEL_8:
  *((_DWORD *)a3 + 4) = self->_confidence;
  *((unsigned char *)a3 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    goto LABEL_9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
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
  *((_DWORD *)result + 5) = self->_impossibleTransitions;
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
  *((_DWORD *)result + 4) = self->_confidence;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 6) = self->_nearbyLocations;
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
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_impossibleTransitions != *((_DWORD *)a3 + 5)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_21;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_confidence != *((_DWORD *)a3 + 4)) {
        goto LABEL_21;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_21;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 8) == 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_nearbyLocations != *((_DWORD *)a3 + 6)) {
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_impossibleTransitions;
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
  uint64_t v4 = 2654435761 * self->_confidence;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_nearbyLocations;
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
  self->_impossibleTransitions = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      return;
    }
LABEL_9:
    self->_nearbyLocations = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 8u;
    return;
  }
LABEL_8:
  self->_confidence = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 28) & 8) != 0) {
    goto LABEL_9;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)impossibleTransitions
{
  return self->_impossibleTransitions;
}

- (unsigned)nearbyLocations
{
  return self->_nearbyLocations;
}

- (unsigned)confidence
{
  return self->_confidence;
}

@end